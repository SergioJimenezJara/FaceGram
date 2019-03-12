$('select').on('change', function() {
    alert( this.value );

    if($("#tipoPublicacion").val())==1{
        $("#comentario").show();
        $("#custom-file").hide();
    } else {
        $("#comentario").hide();
        $("#custom-file").show();
    }
});