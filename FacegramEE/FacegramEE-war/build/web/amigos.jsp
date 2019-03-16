<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="css/amigos_css.css">
        <script type="text/javascript" src="js/amigos.js"></script>


        <title>Hello, world!</title>
        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
            <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">FaceGram</a>

            <form class="form-inline">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>

        </nav>

        <div class="container-fluid">
            <div class="row">
                <nav class="col-md-2 d-none d-md-block bg-light sidebar fixed-top" style="margin-top: 40px">


                    <svg style="margin-top: 20px" width="100%" height="225"  preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><rect width="100%" height="100%" fill="#55595c" /></svg>
                    <div class="card bg-light mb-3" style="max-width: 18rem;">
                        <div class="card-header" align="center">${usuario.usuario}</div>



                        <div class="sidebar-sticky" >
                            <ul class="nav flex-column" style="margin-top: 20px">
                                <li class="nav-item">
                                    <a class="nav-link active" href="index">
                                        <span data-feather="home"></span>
                                        Incio <span class="sr-only">(current)</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="publicaciones">
                                        <span data-feather="file"></span>
                                        Mis Publicaciones
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="amigos">
                                        <span data-feather="shopping-cart"></span>
                                        Amigos
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <span data-feather="users"></span>
                                        Mis Grupos de Amigos
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <span data-feather="bar-chart-2"></span>
                                        Chats
                                    </a>
                                </li>
                            </ul>

                            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">

                                <a class="d-flex align-items-center text-muted" href="#">
                                    <span data-feather="plus-circle"></span>
                                </a>
                            </h6>
                        </div>
                    </div>
                </nav>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <!--<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">-->
                    <div class="album py-5 bg-light">
                        <div class="container">

                            <div class="buscador d-flex justify-content-center">
                                <div class="col-lg-6 col-lg-offset-4 ">
                                    <input type="search" id="search" onchange="mostrarAmigos(this.value)" value="" class="form-control" placeholder="Buscar amigo..">   
                                    <!-- https://bootsnipp.com/snippets/93XX  BUSCADOR COMPLETO-->
                                </div>
                            </div>
                            <p style="color:red;">${error}</p>
                            <div class="row" id="amigos">

                                <c:forEach items="${amigos}" var="amigo">
                                    <div class="col-md-4 parentTop mydivouter">
                                        <div class="card mb-4 shadow-sm ">
                                            <form  action="borrarAmigo?idConocido=${amigo.idUsuario}" method="post">
                                                <input type="submit" class=" text-center mybuttonoverlap btn btn-info" value="Borrar amigo"/>
                                            </form>
                                            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><image xlink:href="" height="255" width="100%"/></svg>
                                            <div class="card-body ">
                                                <p class="card-text friendName">${amigo.usuario}</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>

                        </div>
                        <div class="buscador d-flex justify-content-center">
                            <div class="col-lg-6 col-lg-offset-4 ">
                                <p class="text-center">Busca nuevos amigos</p>
                                <input type="search" id="search" onchange="mostrarDesconocidos(this.value)" value="" class="form-control" placeholder="Buscar amigo..">   
                            </div>
                        </div>
                        <div class="row" id="desconocidos">

                            <c:forEach items="${desconocidos}" var="desconocido">
                                <div class="col-md-4 parentTop mydivouter">
                                    <div class="card mb-4 shadow-sm">
                                        <form  action="anadirAmigo?idDesconocido=${desconocido.idUsuario}" method="post">
                                            <input type="submit" class=" text-center mybuttonoverlap btn btn-info" value="Añadir amigo"/>
                                        </form>
                                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><image xlink:href="" height="255" width="100%"/></svg>
                                        <div class="card-body ">
                                            <p class="card-text friendName">${desconocido.usuario}</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                    <!--</div>-->



                    <footer class="container">
                        <p class="float-right"><a href="#">Back to top</a></p>
                        <p>&copy; 2017-2018 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
                    </footer>
                </main>
            </div>
        </div>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>