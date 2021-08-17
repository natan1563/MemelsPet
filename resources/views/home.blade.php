<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <title>Memel's Pet</title>
</head>
<body>
    <div class="container">
        <h1 class="text-center text-secondary mt-3">Memel's Pet</h1>

        <div class="row col-md-12 text-center mt-3">
            <form action="/relatorio/cliente" method="post" enctype="multipart/form-data">
                @csrf
                <input type="file" name="arquivoCsv" id="arquivoCsv">
                <button class="btn btn-success">Enviar Relatório</button>
            </form>
        </div>

        <div class="row col-md-12 mt-5">
            <form method="get" action="/relatorio/cliente">
                <input type="submit" class="btn btn-info text-light m-3" value="Relatorio cliente">
            </form>

            <form action="/relatorio/animal" method="get">
                <input type="submit" class="btn btn-secondary text-light m-3" value="Relatorio animais">
            </form>
        </div>
    </div>
</body>
</html>
