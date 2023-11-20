

// Función para cargar dinámicamente los productos del carrito en la tabla
async function cargarProductosEnCarrito() {
    const options = {
        method: 'GET',
    }

    let carritoData;

    // Realizar la solicitud al servidor para obtener los productos en espera
    const response = await fetch('/cart/verCart', options)
    .catch(e => {
        console.log("Error en la conexión");
    })
    .then(res => res.json())
    .then(dataRes => {
        console.log(dataRes);
        carritoData = dataRes.productosEnCarrito; // Accede directamente a productosEnCarrito
    });

    // Obtener el contenedor donde se mostrarán los productos
    const cartTableBody = $('#cartTableBody');

    // Limpiar el contenido existente en el contenedor
    cartTableBody.empty();
    console.log("Carrito Data:", carritoData);
    // Verificar si hay productos en espera
    if (!carritoData || carritoData.length === 0) {
        cartTableBody.append('<p>No hay productos en el carrito</p>');
    } else {
        // Iterar sobre los productos en espera y agregarlos al contenedor
        for (const carrito of carritoData) {
            const carritoHTML =  `
                <tr class="table-body-row">
                    <!-- Aquí debes generar las celdas con la información del producto -->
                    <td class="product-remove"><a href="${carrito.idProducto}"><i class="far fa-window-close"></i></a></td>
                    <td class="product-image"><img src="./views/assets/img/products/Cupcake.png" alt=""></td>
                    <td class="product-name">${carrito.nombre}</td>
                    <td class="product-price">$${carrito.precio}</td>
                    <td class="product-quantity"><input type="number" value="${carrito.cantidad}" placeholder="1"></td>
                </tr>
            `;

            cartTableBody.append(carritoHTML);

            

              
        }
    }
}

// Llamar a la función para cargar los productos del carrito al cargar la página
$(document).ready(function() {
    cargarProductosEnCarrito();
});

