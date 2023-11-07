// una vez que se de click en el boton con el id #btn-upgradeVendedor
// se ejecutara un request para actualizar el tipo de usuario
// a vendedor
async function requestUpgradeVendedor(){
    try {
        const options = {
            method: 'POST',
        }
        const response = await fetch('/profile/upgradeVendedor', options);
        if(!response.ok){
            throw new Error('Error al actualizar el tipo de usuario');
        }else{
            alert('Se actualizo el tipo de usuario');
            window.location.href = '/profile';
        }
        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.log(error);
    }
}

$('#btn-upgradeVendedor').click(function(){
    requestUpgradeVendedor();
});