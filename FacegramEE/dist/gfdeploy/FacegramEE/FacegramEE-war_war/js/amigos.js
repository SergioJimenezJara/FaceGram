function mostrarAmigos(text){
    // mostramos todos los amigos
    $("#amigos").children().show();
    
    // Si hay algo escrito
    if(text!=""){
        // iteramos por ellos
        $('#amigos').find('.friendName').each(function(i) { 
            // Si no es lo que buscamos, lo coultamos
            
            if($(this).text().toLocaleLowerCase().indexOf(text.toLowerCase()) < 0){
                $("#amigos").children().eq(i).hide();
            }
        });
    }    
}

function mostrarDesconocidos(text){
    // mostramos todos los amigos
    $("#desconocidos").children().show();
    
    // Si hay algo escrito
    if(text!=""){
        // iteramos por ellos
        $('#desconocidos').find('.friendName').each(function(i) { 
            // Si no es lo que buscamos, lo coultamos
            
            if($(this).text().toLocaleLowerCase().indexOf(text.toLowerCase()) < 0){
                $("#desconocidos").children().eq(i).hide();
            }
        });
    }    
}