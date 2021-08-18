<?php

namespace App\Http\Controllers;

use App\Models\Animais;
use App\Models\Animal;
use App\Models\Cliente;
use App\Models\Contatos;
use App\Models\Especies;
use App\Models\Pessoas;
use App\Models\Racas;
use Illuminate\Http\Request;
use League\Csv\Reader;
use League\Csv\Writer;

class CsvController extends Controller
{

    public function getRelatorioCliente()
    {

        $this->gerarRelatorioCompleto(Cliente::all(), [
            'Id',
            'Nome',
            'Telefone1',
            'Telefone2',
            'Email'
        ]);
    }

    public function getRelatorioAnimal()
    {
        $this->gerarRelatorioCompleto(Animal::all(), [
            'Id',
            'IdCliente',
            'Nome',
            'Raca',
            'Especie',
            'HistoricoClinico',
            'Nascimento'
        ]);
    }

    private function gerarRelatorioCompleto($dados, $colunas)
    {
        $dados = json_decode($dados);
        $csv   = Writer::createFromString();
        $csv->insertOne($colunas);

        foreach($dados as $campos) {
            $linha = [];

            foreach ($campos as $campo)
                $linha[] = $campo;

            $csv->insertOne($linha);
        }

        $idUnico = uniqid();
        $csv->output("relatorio_{$idUnico}.csv");
    }

    public function setClientes(Request $request)
    {
        $csv = Reader::createFromPath($request->file('arquivoCsv')->getPathname())->setHeaderOffset(0);

        foreach ($csv as $data) {

            Pessoas::create($this->formatToCreate($data));

            $contatos = [
                $data['Telefone1'],
                $data['Telefone2'],
                $data['Email'],
            ];

            $tipoContato = [
                'celular',
                'fixo',
                'email'
            ];

            $countContato = 0;

            foreach ($contatos as $contato) {
                $tbContatos = new Contatos();
                $tbContatos->pessoa_id    = $data['Id'];
                $tbContatos->tipo         = $tipoContato[$countContato++];
                $tbContatos->contato      = $contato;

                if (in_array($tbContatos->tipo, ['celular', 'fixo'])){
                    $nonoDigito = ($tbContatos->tipo == 'celular' && preg_match('/^(\(?\d{2}\)?\s?)(\d{4})\-?(\d{4})$/', $contato)) ? 9 : '';
                    $contato    = preg_replace('/^(\(?\d{2}\)?)\s?(\d{4,5})\-?(\d{4})$/', "$1 $2-$3", $contato);
                    $tbContatos->contato = preg_replace('/^(\d{2})\s?(\d{4,5})\-?(\d{4})$/', "($1) {$nonoDigito}$2-$3", $contato);

                    $tbContatos->save();
                    continue;
                }

                if (filter_var($contato, FILTER_VALIDATE_EMAIL)) $tbContatos->save();
            }
        }

        return redirect('/');
    }

    public function setAnimais(Request $request)
    {
        $csv = Reader::createFromPath($request->file('arquivoCsvAnimais')->getPathname())->setHeaderOffset(0);

        foreach ($csv as $data) {

            $especies      = new Especies;
            $especieAnimal = function($especie) use($especies) {
                return $especies->where('nome', $especie)->first();
            };

            $especie = $especieAnimal($data['Especie']);

            if (is_null($especie)) {
                $especies->nome = $data['Especie'];
                $especies->save();
                $especie = $especieAnimal($data['Especie']);
            }

            $racas       = new Racas;
            $racasAnimal = function($raca) use($racas) {
                return $racas->where('nome', $raca)->first();
            };

            $raca = $racasAnimal($data['Raca']);

            if (is_null($raca)) {
                $racas->nome       = $data['Raca'];
                $racas->especie_id = $especie->id;
                $racas->save();
                $raca = $racasAnimal($data['Raca']);
            }

            if (!is_null(Pessoas::firstWhere('id', $data['IdCliente']))) {
                $animais = new Animais;
                $animais->pessoa_id  = $data['IdCliente'];
                $animais->especie_id = $especie->id;
                $animais->raca_id    = $raca->id;
                $animais->nome       = $data['Nome'];
                $animais->nascimento = date('Y-m-d', strtotime($data['Nascimento']));
                $animais->save();
            }
        }

        return redirect('/');
    }

    private function formatToCreate($data)
    {
        return json_decode(strtolower(json_encode($data)), true);
    }
}
