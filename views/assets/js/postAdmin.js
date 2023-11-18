async function requestProductosEspera() {
    const options = {
        method: 'GET',
    }

    let productosData;

    // Realizar la solicitud al servidor para obtener los productos en espera
    const response = await fetch('/productsWait', options)
        .catch(e => {
            console.log("Error en la conexión");
        })
        .then(res => res.json())
        .then(dataRes => {
            console.log(dataRes)
            productosData = dataRes.data;
        });

    // Obtener el contenedor donde se mostrarán los productos
    const esperaProductosContainer = $('#esperaProductos');

    // Limpiar el contenido existente en el contenedor
    esperaProductosContainer.empty();

    // Verificar si hay productos en espera
    if (Object.keys(productosData).length === 0) {
        esperaProductosContainer.append('<p>No hay productos en espera de aprobación</p>');
    } else {
        // Iterar sobre los productos en espera y agregarlos al contenedor
        for (const key in productosData) {
            if(productosData.hasOwnProperty(key)){
                const producto = productosData[key];
                const productoHTML = `
                <div class="col-lg-4 col-md-6">
                    <div class="single-latest-news">
                        <img src="" alt="">
                        <p class="blog-meta">
                            <span class="author"><i class="fas fa-user"></i> ${producto.userName}</span>
                            <span class="date"><i class="fas fa-calendar"></i></span>
                        </p>
                        <span>Producto: ${producto.Nombre}</span>
                        <p>${producto.Descripcion}</p>
                        <div class="button-container">
                            <div class="circle-button approve" id="btnAprobar${producto.idProducto}" style="background-color: #4CAF50;"></div>
                            <div class="circle-button reject" id="btnRechazar${producto.idProducto}" style="background-color: #FF5733;"></div>
                        </div>
                    </div>
                </div>
            `;

            esperaProductosContainer.append(productoHTML);

            // Agregar eventos o lógica específica para cada producto si es necesario
            // Puedes usar los IDs de los botones para identificar y manejar eventos específicos
            $(`#btnAprobar${producto.idProducto}`).click(function() {
                // Lógica para aprobar el producto con ID producto.idProducto
                console.log(`Aprobar producto con ID ${producto.idProducto}`);
            });

            $(`#btnRechazar${producto.idProducto}`).click(function() {
                // Lógica para rechazar el producto con ID producto.idProducto
                console.log(`Rechazar producto con ID ${producto.idProducto}`);
            });

            }  
        }
    }

    console.log("Productos en espera cargados. Verifica si este mensaje aparece en la consola.");
}

// Llama a la función para cargar los productos en espera cuando la página cargue
$(document).ready(function() {
    requestProductosEspera();
});
