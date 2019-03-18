<%-- 
    Document   : createruser_form
    Created on : 15-mar-2019, 16:24:23
    Author     : julio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<title>Create User</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/createuser_form.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <script language="JavaScript" type="text/JavaScript">
          function comprobarClave(formu) {	
            var email = formu.email.value
            var formato = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            var v_email = formato.test(email);
 
		if(v_email != true){
			alert('Email no válido');
			return false;
	
		}else{
                    if (formu.password.value==formu.confirmpassword.value) { 
                        return true 
                    }else{
                         alert('las contraseñas no son iguales'); 
                    return false 
                    }
                }
            }
        </script>
    </head>
    <body>
            
        <div class="container register-form">
            <div class="form">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card my-5">
                    <h5 class="card-title text-center">Create User</h5>
                    <form name="formulario" class="form-signin"  method="post" action="registro" onSubmit="return comprobarClave('password','confirmpassword'")>

                        <div class="form-group">
                            <input type="text" id="inputUsername" class="form-control" name="username" placeholder="Your name" required autofocus>
                        </div>
                        <div class="form-group">
                             <input type="text" id="inputEmail" class="form-control" name="email" placeholder="Email address" required autofocus>
                        </div>
                        <div class="form-group">
                             <input type="text" id="inputPassword" class="form-control" name="password" placeholder="Password" required autofocus>
                        </div>
                        <div class="form-group">
                             <input type="text" id="inputEmail" class="form-control" name="confirmpassword" placeholder="Confirm Password" required autofocus>
                        </div>
                        
                        <button class="btn btn-lg btn-primary btn-block text-uppercase" value="Comprobar"  onclick="return(comprobarClave(this.form)); MM_validateForm()" type="submit"> Submit </button>
                       
                    </form>
                </div>
            </div>
            </div>
        </div>
      
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    </body>
</html>