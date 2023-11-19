async function requestTodosLosProductos() {
    const options = {
        method: 'GET',
    }

    let productosData;

    // Realizar la solicitud al servidor para obtener los productos
    const response = await fetch('/allShop', options)
        .catch(e => {
            console.log("Error en la conexión");
        })
        .then(res => res.json())
        .then(dataRes => {
            console.log(dataRes)
            productosData = dataRes.dataAllProd;
        });

    // Obtener el contenedor donde se mostrarán los productos 
    const allProductosContainer = $('#allProducts');

    // Limpiar el contenido existente en el contenedor
    allProductosContainer.empty();

    // Verificar si hay productos 
    if (Object.keys(productosData).length === 0) {
        allProductosContainer.append('<p>No hay productos por mostrar</p>');
    } else {
        // Iterar sobre los productos aprobados y agregarlos al contenedor
        for (const key in productosData) {
            if (productosData.hasOwnProperty(key)) {
                const producto = productosData[key];

                // Verificar si el producto es cotizable
                let precioHTML, cotizableHTML;
                if (producto.esCotizable == 1) {
                    precioHTML = '<p class="product-price"><span>Insertar Categoría</span> Por cotización </p>';
                    cotizableHTML = '<a href="cart.php" class="cart-btn"><i class="fas fa-shopping-cart"></i> Pedir cotizacion</a>';
                } else {
                    precioHTML = `<p class="product-price"><span>Insertar Categoría</span>$ ${producto.Precio} </p>`;
                    cotizableHTML = `<a href="cart.php" class="cart-btn"><i class="fas fa-shopping-cart"></i> Agregar al Carrito</a>`;
                }

                const productoHTML = `
                <div class="col-lg-4 col-md-6 text-center fresa">
                <div class="single-product-item">
                    <div class="product-image">
                        <a href="/products/ver/${producto.idProducto}"><img src="./views/assets/img/products/cupcake.png" alt=""></a>
                    </div>
                    <h3>${producto.Nombre}</h3>
                    <span class="author"><i class="fas fa-user"></i>${producto.userName}</span>
                    ${precioHTML}
                    ${cotizableHTML}
                </div>
            </div>
                `;

                allProductosContainer.append(productoHTML);
            }
        }
    }

    console.log("Productos cargados. Verifica si este mensaje aparece en la consola.");
}


$(document).ready(function(){
    requestTodosLosProductos();

});