<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <title>Memel's Pet</title>
</head>
<body>
    <div class="container">
        <h1 class="text-center text-secondary mt-3">Memel's Pet</h1>
        <div class="row col-md-12 justify-content-center mt-5">
            <div class="col-md-6">
                <div class="card text-center" style="width: 18rem;">
                    <img class="card-img-top" src="..." alt="Card image cap">
                    <div class="card-body">
                    <h5 class="card-title font-weight-bold">Controle de clientes</h5>
                    <p class="card-text">Area personalizada para controle de dados de clientes.</p>
                    </div>
                    <ul class="list-group list-group-flush">
                    <li class="list-group-item">Aqui você pode: </li>
                    <li class="list-group-item">
                        <form method="get" action="/relatorio/cliente" class="mx-auto">
                        <label for="btnRelatorioCliente" class="p-1 bg-secondary">
                            <span class="text-light ml-3">Gerar Relatorio</span>
                            <button class="btn btn-light" name="btnRelatorioCliente">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16">
                                        <path fill-rule="evenodd" d="M7.47 10.78a.75.75 0 001.06 0l3.75-3.75a.75.75 0 00-1.06-1.06L8.75 8.44V1.75a.75.75 0 00-1.5 0v6.69L4.78 5.97a.75.75 0 00-1.06 1.06l3.75 3.75zM3.75 13a.75.75 0 000 1.5h8.5a.75.75 0 000-1.5h-8.5z"></path>
                                    </svg>
                            </button>
                        </label>
                        </form>
                    </li>
                    <li class="list-group-item">
                        Importação de clientes:
                    </li>
                    <li class="list-group-item">
                        <form action="/relatorio/cliente" method="post" enctype="multipart/form-data">
                            @csrf
                            <input type="file" class="custom-file-input" name="arquivoCsv" id="arquivoCsv">
                            <label for="arquivoCsv" class="custom-file-label">Procure seu anexo</label>

                            <div class="row justify-content-center">
                                <button class="btn btn-warning mx-auto" title="Enviar">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="20" height="20">
                                        <path fill-rule="evenodd" d="M8.53 1.22a.75.75 0 00-1.06 0L3.72 4.97a.75.75 0 001.06 1.06l2.47-2.47v6.69a.75.75 0 001.5 0V3.56l2.47 2.47a.75.75 0 101.06-1.06L8.53 1.22zM3.75 13a.75.75 0 000 1.5h8.5a.75.75 0 000-1.5h-8.5z"></path>
                                    </svg>
                                </button>
                            </div>
                        </form>
                    </li>
                    </ul>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card text-center" style="width: 18rem;">
                    <img class="card-img-top" src="..." alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title font-weight-bold">Controle de animais</h5>
                      <p class="card-text">Area personalizada para controle de dados dos animais.</p>
                    </div>
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item">Aqui você pode: </li>
                      <li class="list-group-item">
                        <form method="get" action="/relatorio/animal" class="mx-auto">
                           <label for="btnRelatorioCliente" class="p-1 bg-secondary">
                               <span class="text-light ml-3">Gerar Relatorio</span>
                               <button class="btn btn-light" name="btnRelatorioCliente">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16">
                                        <path fill-rule="evenodd" d="M7.47 10.78a.75.75 0 001.06 0l3.75-3.75a.75.75 0 00-1.06-1.06L8.75 8.44V1.75a.75.75 0 00-1.5 0v6.69L4.78 5.97a.75.75 0 00-1.06 1.06l3.75 3.75zM3.75 13a.75.75 0 000 1.5h8.5a.75.75 0 000-1.5h-8.5z"></path>
                                    </svg>
                               </button>
                           </label>
                        </form>
                      </li>
                      <li class="list-group-item">
                        Importação de animais:
                      </li>
                      <li class="list-group-item">
                        <form action="/relatorio/animal" method="post" enctype="multipart/form-data">
                            @csrf
                            <input type="file" class="custom-file-input" name="arquivoCsvAnimais" id="arquivoCsvAnimais">
                            <label for="arquivoCsvAnimais" class="custom-file-label">Procure seu anexo</label>

                            <div class="row justify-content-center">

                                <button class="btn btn-warning mx-auto" title="Enviar">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="20" height="20">
                                        <path fill-rule="evenodd" d="M8.53 1.22a.75.75 0 00-1.06 0L3.72 4.97a.75.75 0 001.06 1.06l2.47-2.47v6.69a.75.75 0 001.5 0V3.56l2.47 2.47a.75.75 0 101.06-1.06L8.53 1.22zM3.75 13a.75.75 0 000 1.5h8.5a.75.75 0 000-1.5h-8.5z"></path>
                                    </svg>
                                </button>
                            </div>
                        </form>
                      </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
