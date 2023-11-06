// una vez que se de click en el boton con el id #btn-upgradeVendedor
// se ejecutara un request ajax para actualizar el tipo de usuario
// a vendedor
$('#btn-upgradeVendedor').click(function(){
    $.ajax({
        url: '/account/upgradeVendedor',
        type: 'POST',
        dataType: 'json',
        success: function(data){
            if(data.status == 'success'){
                alert('Se actualizo el tipo de usuario a vendedor');
                window.location.reload();
            }else{
                alert('Ocurrio un error al actualizar el tipo de usuario');
            }
        }
    });
});