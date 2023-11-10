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

async function requestProductos() {
    //try {
        const options = {
            method: 'POST',
        }
        
        let productosData;
        
        // Realizar la solicitud al servidor para obtener los productos
        const response = await fetch('/profile/verProductos', options)
            .catch(e => {
                console.log("Error en la conexion");
            })
            .then(res => res.json())
            .then(dataRes => {
                console.log(dataRes)
                productosData = dataRes.data;
            });
        //console.log(response);
        //if(!response.ok){
        //    throw new Error('Error al consultar productos');
        //}

        
        

        // Obtener el contenedor donde se mostrarán los productos
        const productContainer = $('#product-container');

        // Limpiar el contenido existente en el contenedor
        productContainer.empty();

        // Verificar si hay productos
        if (Object.keys(productosData).length === 0) {
            productContainer.append('<p>No hay productos disponibles</p>');
        } else {
            // Iterar sobre las propiedades del objeto y agregarlos al contenedor
            for (const key in productosData) {
                if (productosData.hasOwnProperty(key)) {
                    const producto = productosData[key];
                    const productHTML = `
                        <div class="col-lg-4 col-md-6">
                            <div class="single-latest-news">
                                <h3>${producto.nombre}</h3>
                                <p class="excerpt">${producto.descripcion}</p>
                                <p class="price">Precio: $${producto.precio}</p>
                                <!-- Puedes agregar más detalles aquí según sea necesario -->

                                <div class="rating">
                                    ${getStarRatingHTML(producto.rating)}
                                </div>
                            </div>
                        </div>
                    `;

                    productContainer.append(productHTML);
                    console.log(productosData);
                }
            }
        }

        console.log("Productos cargados. Verifica si este mensaje aparece en la consola.");

        
    //} catch (error) {
    //    console.log(error);
    //}
}


function getStarRatingHTML(rating) {
    let starHTML = '';

    for (let i = 1; i <= 5; i++) {
        const starClass = (i <= rating) ? 'fas' : 'far';
        starHTML += `<i class="${starClass} fa-star"></i>`;
    }

    return starHTML;
}


document.addEventListener('DOMContentLoaded', function() {
    // Tu código JavaScript aquí
    requestProductos();
    console.log("Document ready");
});

$('#btn-upgradeVendedor').click(function(){
    requestUpgradeVendedor();
});