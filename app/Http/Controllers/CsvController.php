<?php

namespace App\Http\Controllers;

use App\Models\Animal;
use App\Models\Cliente;
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
            'Raca',
            'Nome',
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

    public function setRelatorioCliente(Request $request)
    {
        $csv = Reader::createFromPath($request->file('arquivoCsv')->getPathname())->setHeaderOffset(0);

        foreach ($csv as $data) {
           Cliente::create($data);
        }

        return view('home');
    }
}
