$( document ).ready(function() {
    var amigos = ["chino", "el primo del chino", " el hijo del chino", " chino 2" , "japones", "rumano"];
    //var amigos = ["juan"];
    var elm = 
            '<div class="col-md-4 parentTop">'+
                '<div class="card mb-4 shadow-sm">'+
                    '<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><image xlink:href="" height="255" width="100%"/></svg>'+
                    '<div class="card-body ">'+
                        '<p class="card-text friendName">Nombre del amigo</p>'+
                    '</div>'+
                 '</div>'+  
            '</div>';   

    for(var i=0; i<amigos.length; i++){
        // Añadimos la tarjeta de amigo a la lista de amigos
        $(elm).appendTo("#amigos"); 

        // Añadimos a la tarjeta creada el nombre del amigo
        $( ".friendName" ).last().text(amigos[i]);

        // Le añadimos la foto
        var img = "http://i1.sndcdn.com/avatars-000403867065-5g5khr-original.jpg"
        $( "image" ).last().attr("href", img);

    }
});

function mostrarAmigos(text){
    // mostramos todos los amigos
    $("#amigos").children().show();
    
    // Si hay algo escrito
    if(text!=""){
        // iteramos por ellos
        $('#amigos').find('.friendName').each(function(i) { 
            // Si no es lo que buscamos, lo coultamos
            
            if($(this).text().toLocaleLowerCase()   .indexOf(text.toLowerCase()) < 0){
                $("#amigos").children().eq(i).hide();
            }
        });
    }    
}