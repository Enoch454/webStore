let carritoData;
let cantidadesValidas = false;

async function requestCheckOut(){
    //alert('simon, si jala'
    const dataRequest = {
        productos: carritoData
    };
    const options = {
        method: 'POST',
        body: JSON.stringify(dataRequest)
    }
    await fetch('/cart/updateCantidades', options).
    catch(e => {
        console.log("error en checkout")
    })
    .then(res => res.json())
    .then(dataRes => {
        //redireccionamiento
        location.html = dataRes.redirectUrl;
    });
      
        
    
}

// Función para cargar dinámicamente los productos del carrito en la tabla
async function cargarProductosEnCarrito() {
    const options = {
        method: 'GET',
    }

    // Realizar la solicitud al servidor para obtener los productos en espera
    const response = await fetch('/cart/verCart', options)
    .catch(e => {
        console.log("Error en la conexión");
    })
    .then(res => res.json())
    .then(dataRes => {
        console.log(dataRes);
        carritoData = dataRes.productosEnCarrito; // Accede directamente a productosEnCarrito
        mostrarTotal(carritoData);
        consultarStock(carritoData);

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

const mostrarTotal = (data) => {
    // calcular el total
    let total = 0;
    console.log(data);
    data.forEach(element => {
        let subtotal = element.precio * element.cantidad;
        console.log(element.nombre, subtotal);
        total += subtotal;
    });
    console.log(total);
    // mostrarlo en pantallaa
    const precioTotalHTML = $('#precioTotal');
    precioTotalHTML.html('$'+total);
};

const actualizarCantidad = (idProducto, newCantidad) => {
    carritoData.forEach((element) => {
        if (element.idProducto == idProducto) {
            element.cantidad = newCantidad;
        }
    })
}

const consultarStock = async (data) => {
    let dataRequest = {
        productos: data
    };
    const options = {
        method: 'POST',
        body: JSON.stringify(dataRequest)
    };
    await fetch('/cart/query-stock', options)
    .catch(e => {
        console.log("Error en la conexión");
    })
    .then(res => res.json())
    .then(dataRes => {
        console.log(dataRes);
        cantidadesValidas = dataRes.success;
        if(!dataRes.success){
            alert("Stock insuficiente para el producto: " + dataRes.Nombre);
        }
    });

};

// Llamar a la función para cargar los productos del carrito al cargar la página
$(document).ready(function() {
    cargarProductosEnCarrito();
    
    // Agregar evento de escucha al input de tipo número
    $('#cartTableBody').on('input', '.product-quantity input[type="number"]', function() {
        const idProducto = $(this).closest('tr').find('.product-remove a').attr('href');
        const nuevaCantidad = $(this).val();

        console.log(idProducto, nuevaCantidad);

        // Actualizar la cantidad en carritoData
        actualizarCantidad(idProducto, nuevaCantidad);
        console.log(carritoData);

        // Consultar stock
        consultarStock(carritoData);
        mostrarTotal(carritoData);


        // Volver a cargar los productos del carrito
        //cargarProductosEnCarrito();
    });

    $('#btn-requestCheckOut').click(function(){
        if(cantidadesValidas){
            requestCheckOut();
        }else{
            alert("Cantidades de productos no validas");
        }
        
    });
});

