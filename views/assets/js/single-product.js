// Función para actualizar la información del producto en la interfaz de usuario
async function actualizarInformacionProducto() {
  // Obtener el ID del producto de la URL
  const auxArray = window.location.href.split('/');
  const idProducto = auxArray[auxArray.length - 1];

  // Obtener los elementos HTML donde deseas mostrar la información del producto
  const nombreElement = document.querySelector('.single-product-content h3');
  const descripcionElement = document.querySelector('.single-product-content p');
  const cantidadElement = document.querySelector('.single-product-form input[type="number"]');
  const precioElement = document.querySelector('.price');
  const cartBtnElement = document.querySelector('.cart-btn');
  const stockInfoElement = document.querySelector('.stock-info');
  const stockCountElement = document.querySelector('.stock-count');
  const errorMessageElement = document.querySelector('.error-message');

  // Verificar si los elementos existen antes de intentar actualizarlos
  if (nombreElement && descripcionElement && cantidadElement && precioElement && cartBtnElement && stockCountElement && stockInfoElement && errorMessageElement) {
    // Agregar un evento de escucha al evento 'input'
    cantidadElement.addEventListener('input', function () {
      // Verificar si el valor es menor que cero o igual a cero
      if (cantidadElement.value < 0 || cantidadElement.value.trim() === "") {
        cantidadElement.value = 0; // Establecer el valor en cero

        // Mostrar el mensaje de error
        errorMessageElement.style.display = 'block';
        errorMessageElement.textContent = 'Este valor no es válido';
      } else {
        // Ocultar el mensaje de error si el valor es válido
        errorMessageElement.style.display = 'none';
      }
    });

    // Agregar un evento de clic al enlace (botón)
    cartBtnElement.addEventListener('click', function (event) {
      // Prevenir el comportamiento predeterminado del enlace (evitar la recarga de la página)
      event.preventDefault();

      // Verificar si el valor del campo de cantidad es menor que cero o igual a cero
      if (cantidadElement.value < 0 || cantidadElement.value.trim() === "") {
        // Mostrar el mensaje de error
        errorMessageElement.style.display = 'block';
        errorMessageElement.textContent = 'Este valor no es válido';
      } else {
        // Obtener la cantidad ingresada y el stock disponible
        const cantidadIngresada = parseInt(cantidadElement.value);
        const stockDisponible = parseInt(stockCountElement.textContent);

        // Verificar si la cantidad ingresada supera el stock disponible
        if (cantidadIngresada > stockDisponible) {
          errorMessageElement.style.display = 'block';
          errorMessageElement.textContent = 'Este valor rebasa la cantidad disponible en stock';
        } else {
          // Ocultar el mensaje de error si el valor es válido
          errorMessageElement.style.display = 'none';

          // Obtener el ID del producto
          const auxArray = window.location.href.split('/');
          const idProducto = parseInt(auxArray[auxArray.length - 1], 10);

          // Aquí puedes colocar la lógica para procesar el clic del botón y agregar al carrito
          agregarAlCarrito(idProducto, cantidadIngresada);

          // Puedes redirigir al usuario o mostrar un mensaje de éxito
          console.log("Producto agregado al carrito. Cantidad:", cantidadIngresada);
        }
      }
    });

    // Obtener la información del producto según el ID de la URL
    const producto = await obtenerInformacionProducto(idProducto);

    // Actualizar el contenido de los elementos con la información del producto
    if (producto) {
      nombreElement.textContent = producto.nombre;
      descripcionElement.textContent = producto.descripcion;

      // Verificar si el producto es cotizable
      if (producto.esCotizable === 1) {
        // Si es cotizable, ocultar el input de cantidad, el precio y cambiar el texto del botón
        precioElement.style.display = 'none';
        cantidadElement.style.display = 'none';
        stockInfoElement.style.display = 'none';
        stockCountElement.style.display = 'none';
        cartBtnElement.textContent = 'Solicitar Cotización';
      } else {
        // Si no es cotizable, mostrar el input de precio y restaurar el texto del botón
        precioElement.textContent = "$" + producto.precio;
        cantidadElement.style.display = 'block';
        stockInfoElement.style.display = 'block';
        stockCountElement.textContent = producto.stock;
        cartBtnElement.textContent = 'Agregar al Carrito';
      }
    } else {
      // Manejar el caso en que no se pueda obtener la información del producto
      console.log("No se pudo obtener la información del producto");
    }
  }
}

// Función para obtener la información de un producto según su ID
async function obtenerInformacionProducto(idProducto) {
  const options = {
    method: 'GET',
  };

  try {
    // Realizar la solicitud al servidor para obtener un producto específico
    const response = await fetch(`/products/${idProducto}`, options);

    // Verificar si la respuesta es exitosa
    if (!response.ok) {
      throw new Error('No se pudo obtener la información del producto');
    }

    // Convertir la respuesta a JSON
    const producto = await response.json();

    // Devolver la información del producto
    return producto;
  } catch (error) {
    console.log("Error en la conexión o al obtener la información del producto", error);
    return null;
  }
}

function agregarAlCarrito(idProducto, cantidad) {
  const urlRaiz = window.location.protocol
                + "//"
                + window.location.host;
                console.log(urlRaiz);
  
  const datos = {
    idProducto: idProducto,
    cantidad: cantidad
    // ...otros datos que puedan ser necesarios
  };
  console.log(datos);
  // Resto del código para realizar la solicitud AJAX
  console.log("Enviando datos al servidor:", JSON.stringify(datos));
  fetch('/addCart', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(datos),
  })
  .then(response => {if (!response.ok) {
    throw new Error('La solicitud no fue exitosa');
  }
  return response.json();
})


.then(data => {
    if (data.success) {
        alert('Agregado al carrito');
        //window.location.replace(urlRaiz + '/products/ver/'+ idProducto); // Redirecciona al mismo producto detalle
    } else {
        alert('Agregado exitoso, pero ocurrió un error inesperado.');
        console.log(data.details);
    }
})
.catch(error => {
    console.error("Error en la solicitud:", error);
    //console.error(error);
}); 
}

// Llamar a la función para actualizar la información del producto
actualizarInformacionProducto();


