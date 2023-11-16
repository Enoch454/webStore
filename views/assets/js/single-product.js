

  
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
    
    // Verificar si los elementos existen antes de intentar actualizarlos
    if (nombreElement && descripcionElement && cantidadElement && precioElement && cartBtnElement && stockCountElement && stockInfoElement) {
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
          stockCountElement.style.display ='none';
          cartBtnElement.textContent = 'Solicitar Cotización';
        } else {
          // Si no es cotizable, mostrar el input de precio y restaurar el texto del botón
          console.log(producto.precio);
            precioElement.textContent = "$"+ producto.precio;
            cantidadElement.style.display = 'block'; // Puedes usar 'block' o 'inline-block' según el estilo que necesites
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
  
  // Resto del código ...
  
  // Llamar a la función para actualizar la información del producto
  actualizarInformacionProducto();
  
  
  // Resto del código ...
  
  // Llamar a la función para actualizar la información del producto
  actualizarInformacionProducto();
  

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
      return null; // Puedes devolver null u algún valor predeterminado en caso de error
    }
  }
  
  // Llamar a la función para actualizar la información del producto
  actualizarInformacionProducto();
  