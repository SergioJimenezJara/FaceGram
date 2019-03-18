<%-- 
    Document   : publicaciones
    Created on : 13-mar-2019, 16:29:46
    Author     : julio
--%>
<%@taglib prefix="" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link rel="stylesheet" href="css/publicaciones_css.css">
        <script type="text/javascript" src="js/publiaciones.js" ></script>
        <title>FaceGram</title>
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
                        <div class="card-header" align="center">${usuario.usuario} ee</div>



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
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <div class="album py-5 bg-light">


                            <div class="container">
                                <div class="publicaciones">
                                    <form method="post" action="servletPost" enctype="multipart/form-data">
                                        Choose a file: <input type="file" name="servletPost" />
                                        <input type="submit" value="Upload" />
                                    </form>
                                </div>

                                <div class="col" align=center>

                                    <c:forEach items="${posts}" var="post">
                                        <div class="col" align=center>

                                            <div class="col-md-8">
                                                <div class="card mb-4 shadow-sm">

                                                    <img align="middle" src="https://previews.dropbox.com/p/thumb/AAUhzbbpKzMaJuVUezOLgVQ8y-B94fpqJUQrc01ygWfqrge7_17eLOZNkao4lh3D1Nlf79y4ZZreWhl3rV-rKauZ4lCZjjZJLbnbfLUi2KYVNSaD1tAOlLDb6KhOv_V15Hki93T1ElGmfLEPIZHTRVzJKyhJKXpomqUG_tFcxckOFBuBv6eWLteblSgfy5NwV9ZZl2DHLy0ZR992Zmeiy1m-YP4zyntxQDiR7Fk6hBwl3wjt5rF6uDyo7ZlpQ8FtD8Y6ieH5nPr-1AjMHgez_vXFIpZsLvS2Clyt-6kcr5hl0g/p.jpeg?size_mode=5"></img>

                                                    <div class="card-body">
                                                        <p class="card-text">${post.titulo}</p>
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <div class="btn-group">
                                                                <button type="button" class="btn btn-danger btn-sm">Like</button>
                                                                <button type="button" class="btn btn-primary btn-sm">Comentar</button>
                                                            </div>
                                                            <small class="text-muted">${usuario.usuario}</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </c:forEach>



                                </div>
                            </div>
                        </div>
                    </div>

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
        <script src="puclicaciones.js"></script>
    </body>
</body>
</html>
