

// Función para realizar una solicitud POST y actualizar el estado del producto
async function actualizarEstadoProducto(idProducto, status) {
    try {
        const options = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                idProducto: idProducto,
                status: status,
            }),
        };
        console.log(JSON.stringify({ idProducto: idProducto, status: status }));

        const response = await fetch('/profile/statusChange', options);

        if (!response.ok) {
            throw new Error('Error al actualizar el estado del producto');
        }

        try {
            const data = await response.json();
            console.log(data);

            // Agrega un pequeño retraso antes de redirigir
            setTimeout(() => {
                alert('Se actualizó el estado del producto');
                window.location.href = '/profile';
            }, 500); // Puedes ajustar el tiempo de espera según sea necesario
        } catch (error) {
            console.error('Error al analizar la respuesta JSON', error);
        }
    } catch (error) {
        console.log(error);
    }
}



async function requestVendedoresRechazados(){
    const options = {
        method: 'GET',
    }

    let vendedorData;

    // Realizar la solicitud al servidor para obtener los vendedores rechazados
    const response = await fetch('/sellersReject', options)
        .catch(e => {
            console.log("Error en la conexión");
        })
        .then(res => res.json())
        .then(dataRes => {
            //console.log(dataRes)
            vendedorData = dataRes.dataRecha_Ven;
        });

    // Obtener el contenedor donde se mostrarán los vendedores
    const rechaVendedoresContainer = $('#rechazadosVendedores');

    // Limpiar el contenido existente en el contenedor
    rechaVendedoresContainer.empty();

    // Verificar si hay vendedores rechazados
    if (Object.keys(vendedorData).length === 0) {
        rechaVendedoresContainer.append('<p>No hay vendedores rechazados</p>');
    } else {
        // Iterar sobre los vendedores rechazados y agregarlos al contenedor
        for (const key in vendedorData) {
            if(vendedorData.hasOwnProperty(key)){
                const vendedor = vendedorData[key];
                const nombreCompleto = `${vendedor.Nombre} ${vendedor.ApellidoPat} ${vendedor.ApellidoMat}`;

                const vendedorHTML = `
                <div class="col-lg-4 col-md-6">
                    <div class="single-latest-news">
                        <p class="blog-meta">
                            <span class="author"><i class="fas fa-user"></i> ${vendedor.userName}</span>
                            <span class="date"><i class="fas fa-calendar"></i></span>
                        </p>
                        <span>Nombre: ${nombreCompleto}</span>
                        
                        <p></p>
                    </div>
                </div>
            `;

            rechaVendedoresContainer.append(vendedorHTML);

            }  
        }
    }

    //console.log("Vendedores rechazados cargados. Verifica si este mensaje aparece en la consola.");


}

async function requestVendedoresAprobados(){
    const options = {
        method: 'GET',
    }

    let vendedorData;

    // Realizar la solicitud al servidor para obtener los vendedores aprobados
    const response = await fetch('/sellersApprove', options)
        .catch(e => {
            console.log("Error en la conexión");
        })
        .then(res => res.json())
        .then(dataRes => {
            //console.log(dataRes)
            vendedorData = dataRes.dataAprob_Ven;
        });

    // Obtener el contenedor donde se mostrarán los vendedores
    const aprobVendedoresContainer = $('#aprobadosVendedores');

    // Limpiar el contenido existente en el contenedor
    aprobVendedoresContainer.empty();

    // Verificar si hay vendedores aprobados
    if (Object.keys(vendedorData).length === 0) {
        aprobVendedoresContainer.append('<p>No hay vendedores aprobados</p>');
    } else {
        // Iterar sobre los vendedores aprobados y agregarlos al contenedor
        for (const key in vendedorData) {
            if(vendedorData.hasOwnProperty(key)){
                const vendedor = vendedorData[key];
                const nombreCompleto = `${vendedor.Nombre} ${vendedor.ApellidoPat} ${vendedor.ApellidoMat}`;

                const vendedorHTML = `
                <div class="col-lg-4 col-md-6">
                    <div class="single-latest-news">
                        <p class="blog-meta">
                            <span class="author"><i class="fas fa-user"></i> ${vendedor.userName}</span>
                            <span class="date"><i class="fas fa-calendar"></i></span>
                        </p>
                        <span>Nombre: ${nombreCompleto}</span>
                        
                        <p></p>
                    </div>
                </div>
            `;

            aprobVendedoresContainer.append(vendedorHTML);

            }  
        }
    }

    //console.log("Vendedores aprobados cargados. Verifica si este mensaje aparece en la consola.");

}

async function requestVendedoresEspera(){

        const options = {
            method: 'GET',
        }
    
        let vendedorData;
    
        // Realizar la solicitud al servidor para obtener los vendedores en espera
        const response = await fetch('/sellersWait', options)
            .catch(e => {
                console.log("Error en la conexión");
            })
            .then(res => res.json())
            .then(dataRes => {
                //console.log(dataRes)
                vendedorData = dataRes.dataEspera_Ven;
            });
    
        // Obtener el contenedor donde se mostrarán los vendedores
        const esperaVendedoresContainer = $('#esperaVendedores');
    
        // Limpiar el contenido existente en el contenedor
        esperaVendedoresContainer.empty();
    
        // Verificar si hay vendedores en espera
        if (Object.keys(vendedorData).length === 0) {
            esperaVendedoresContainer.append('<p>No hay vendedores en espera de aprobación</p>');
        } else {
            // Iterar sobre los vendedores en espera y agregarlos al contenedor
            for (const key in vendedorData) {
                if(vendedorData.hasOwnProperty(key)){
                    const vendedor = vendedorData[key];
                    const nombreCompleto = `${vendedor.Nombre} ${vendedor.ApellidoPat} ${vendedor.ApellidoMat}`;

                    const vendedorHTML = `
                    <div class="col-lg-4 col-md-6">
                        <div class="single-latest-news">
                            <p class="blog-meta">
                                <span class="author"><i class="fas fa-user"></i> ${vendedor.userName}</span>
                                <span class="date"><i class="fas fa-calendar"></i></span>
                            </p>
                            <span>Nombre: ${nombreCompleto}</span>
                            
                            <p></p>
                            
                            <div class="button-container">
                                <div class="circle-button approve" id="btnAprobar${vendedor.idVendedor}" style="background-color: #4CAF50;"></div>
                                <div class="circle-button reject" id="btnRechazar${vendedor.idVendedor}" style="background-color: #FF5733;"></div>
                            </div>
                        </div>
                    </div>
                `;
    
                esperaVendedoresContainer.append(vendedorHTML);
    
                // Agregar eventos o lógica específica para cada vendedor si es necesario
                // Puedes usar los IDs de los botones para identificar y manejar eventos específicos
                $(`#btnAprobar${vendedor.idVendedor}`).click(function() {
                    // Lógica para aprobar el producto con ID producto.idProducto
                    console.log(`Aprobar vendedor con ID ${vendedor.idVendedor}`);
                });
    
                $(`#btnRechazar${vendedor.idVendedor}`).click(function() {
                    // Lógica para rechazar el producto con ID producto.idProducto
                    console.log(`Rechazar vendedor con ID ${vendedor.idVendedor}`);
                });
    
                }  
            }
        }
    
        //console.log("Vendedores en espera cargados. Verifica si este mensaje aparece en la consola.");
    
}

async function requestProductosRechazados(){
    const options = {
        method: 'GET',
    }

    let productosData;

    // Realizar la solicitud al servidor para obtener los productos rechazados
    const response = await fetch('/productsReject', options)
        .catch(e => {
            console.log("Error en la conexión");
        })
        .then(res => res.json())
        .then(dataRes => {
            //console.log(dataRes)
            productosData = dataRes.dataRecha;
        });

    // Obtener el contenedor donde se mostrarán los productos rechazados
    const rechaProductosContainer = $('#rechazadosProductos');

    // Limpiar el contenido existente en el contenedor
    rechaProductosContainer.empty();

    // Verificar si hay productos rechazados
    if (Object.keys(productosData).length === 0) {
        rechaProductosContainer.append('<p>No hay productos rechazados</p>');
    } else {
        // Iterar sobre los productos rechazados y agregarlos al contenedor
        for (const key in productosData) {
            if (productosData.hasOwnProperty(key)) {
                const producto = productosData[key];

                // Verificar si el producto es cotizable
                let precioHTML, cotizableHTML;
                if (producto.esCotizable == 1) {
                    precioHTML = '<span class="money">Por Cotización</span>';
                    cotizableHTML = '';
                } else {
                    precioHTML = `<span class="money">Precio: $${producto.Precio}</span>`;
                    cotizableHTML = `<span class="cotizable">Stock Disponible: ${producto.Stock}</span>`;
                }

                const productoHTML = `
                    <div class="col-lg-4 col-md-6">
                        <div class="single-latest-news">
                            <img src="" alt="">
                            <span>Producto: ${producto.Nombre}</span>
                            <p class="blog-meta">
                                <span class="author"><i class="fas fa-user"></i>${producto.userName}</span>
                                ${precioHTML}
                            </p>
                            <p> Descripcion: ${producto.Descripcion} </p>
                            ${cotizableHTML}
                        </div>
                    </div>
                `;

                rechaProductosContainer.append(productoHTML);
            }
        }
    }

    //console.log("Productos rechazados cargados. Verifica si este mensaje aparece en la consola.");

}


async function requestProductosAprobados() {
    const options = {
        method: 'GET',
    }

    let productosData;

    // Realizar la solicitud al servidor para obtener los productos aprobados
    const response = await fetch('/productsApprove', options)
        .catch(e => {
            console.log("Error en la conexión");
        })
        .then(res => res.json())
        .then(dataRes => {
            //console.log(dataRes)
            productosData = dataRes.dataAprob;
        });

    // Obtener el contenedor donde se mostrarán los productos aprobados
    const aprobProductosContainer = $('#aprobadosProductos');

    // Limpiar el contenido existente en el contenedor
    aprobProductosContainer.empty();

    // Verificar si hay productos aprobados
    if (Object.keys(productosData).length === 0) {
        aprobProductosContainer.append('<p>No hay productos aprobados</p>');
    } else {
        // Iterar sobre los productos aprobados y agregarlos al contenedor
        for (const key in productosData) {
            if (productosData.hasOwnProperty(key)) {
                const producto = productosData[key];

                // Verificar si el producto es cotizable
                let precioHTML, cotizableHTML;
                if (producto.esCotizable == 1) {
                    precioHTML = '<span class="money">Por Cotización</span>';
                    cotizableHTML = '';
                } else {
                    precioHTML = `<span class="money">Precio: $${producto.Precio}</span>`;
                    cotizableHTML = `<span class="cotizable">Stock Disponible: ${producto.Stock}</span>`;
                }

                const productoHTML = `
                    <div class="col-lg-4 col-md-6">
                        <div class="single-latest-news">
                            <img src="" alt="">
                            <span>Producto: ${producto.Nombre}</span>
                            <p class="blog-meta">
                                <span class="author"><i class="fas fa-user"></i>${producto.userName}</span>
                                ${precioHTML}
                            </p>
                            <p> Descripcion: ${producto.Descripcion} </p>
                            ${cotizableHTML}
                        </div>
                    </div>
                `;

                aprobProductosContainer.append(productoHTML);
            }
        }
    }

    //console.log("Productos aprobados cargados. Verifica si este mensaje aparece en la consola.");
}


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
            //console.log(dataRes)
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
                const idProducto = parseInt($(this).attr('id').replace('btnAprobar', ''), 10);
                actualizarEstadoProducto(idProducto, 1); // 1 para aprobado
                console.log(`Aprobar producto con ID ${producto.idProducto}`);
            });

            $(`#btnRechazar${producto.idProducto}`).click(function() {
                // Lógica para rechazar el producto con ID producto.idProducto
                const idProducto = parseInt($(this).attr('id').replace('btnRechazar', ''), 10);
                actualizarEstadoProducto(idProducto, 3); // 3 para rechazado
                console.log(`Rechazar producto con ID ${producto.idProducto}`);
            });

            }  
        }
    }

    //console.log("Productos en espera cargados. Verifica si este mensaje aparece en la consola.");
}

// Llama a la función para cargar los productos en espera cuando la página cargue
$(document).ready(function() {
    requestProductosEspera();
    requestProductosAprobados();
    requestProductosRechazados();
    requestVendedoresEspera();
    requestVendedoresAprobados();
    requestVendedoresRechazados();
});
