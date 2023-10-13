// Obtener elementos del formulario
var nombreInput = document.getElementById('nombre');
var emailInput = document.getElementById('email');
var direccionInput = document.getElementById('direccion'); // Agregado
var telefonoInput = document.getElementById('telefono');

// Obtener elementos para mostrar errores
var errorNombre = document.getElementById('errorNombre');
var errorEmail = document.getElementById('errorEmail');
var errorDireccion = document.getElementById('errorDireccion'); // Agregado
var errorTelefono = document.getElementById('errorTelefono');

// Expresiones regulares para validación
var nombreRegex = /^[a-zA-ZáéíóúÁÉÍÓÚ\s]+$/;
var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

// Función para validar nombre en tiempo real
nombreInput.addEventListener('input', function () {
    var nombre = nombreInput.value;
    if (!nombreRegex.test(nombre)) {
        errorNombre.textContent = 'El nombre solo debe contener letras y espacios.';
    } else {
        errorNombre.textContent = '';
    }
    validarCampos();
});

// Función para validar correo en tiempo real
emailInput.addEventListener('input', function () {
    var email = emailInput.value;
    if (!emailRegex.test(email)) {
        errorEmail.textContent = 'Ingresa un correo electrónico válido.';
    } else {
        errorEmail.textContent = '';
    }
    validarCampos();
});

// Función para validar dirección en tiempo real (Agregado)
direccionInput.addEventListener('input', function () {
    var direccion = direccionInput.value;
    if (direccion.trim() === '') {
        errorDireccion.textContent = 'La dirección no puede estar vacía.';
    } else {
        errorDireccion.textContent = '';
    }
    validarCampos();
});

// Función para validar teléfono en tiempo real
telefonoInput.addEventListener('input', function () {
    var telefono = telefonoInput.value;
    if (!/^\d{10}$/.test(telefono)) {
        errorTelefono.textContent = 'El teléfono debe contener 10 dígitos numéricos.';
    } else {
        errorTelefono.textContent = '';
    }
    validarCampos();
});

// Función para validar campos antes de enviar el formulario
function validarCampos() {
    var nombre = nombreInput.value.trim();
    var email = emailInput.value.trim();
    var direccion = direccionInput.value.trim();
    var telefono = telefonoInput.value.trim();

    if (nombre === '' || email === '' || direccion === '' || telefono === '') {
        document.getElementById('mensajeError').textContent = 'Por favor, completa correctamente los datos de su dirección antes de confirmar el pago.';
    } else {
        document.getElementById('mensajeError').textContent = '';
    }
}

// Obtener el enlace "Pagar Ahora" por su ID
var payNowLink = document.getElementById('payNowLink');

// Agregar un event listener para escuchar el clic en el enlace
payNowLink.addEventListener('click', function (event) {
    // Prevenir el comportamiento predeterminado del enlace (navegar a una página)
    event.preventDefault();

    // Obtener los elementos del formulario por sus IDs y establecer sus valores en blanco
    nombreInput.value = '';
    emailInput.value = '';
    direccionInput.value = '';
    telefonoInput.value = '';
    document.getElementById('mensajeError').textContent = ''; // Limpiar mensaje de error

    // Otras acciones que desees realizar después de hacer clic en "Pagar Ahora"
    // ...
});
