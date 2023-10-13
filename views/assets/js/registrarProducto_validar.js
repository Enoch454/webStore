document.addEventListener('DOMContentLoaded', function () {
    var form = document.getElementById('dessert-contact');
    var nameField = document.getElementById('name');
    var stockField = document.getElementById('stock');
    var precioField = document.getElementById('precio');
    var messageField = document.getElementById('message');
    var submitButton = document.getElementById('submitButton');
    var cotizableCheckbox = document.querySelector('input[name="cotizable"]');

    var nameError = document.getElementById('name-error');
    var stockError = document.getElementById('stock-error');
    var precioError = document.getElementById('precio-error');
    var messageError = document.getElementById('message-error');

    // Función para actualizar los campos de Stock y Precio y habilitar/deshabilitar al marcar/desmarcar el checkbox
    cotizableCheckbox.addEventListener('change', function () {
        if (cotizableCheckbox.checked) {
            stockField.value = '0';
            precioField.value = '0';
            stockField.disabled = true;
            precioField.disabled = true;
        } else {
            stockField.value = '';
            precioField.value = '';
            stockField.disabled = false;
            precioField.disabled = false;
        }
    });

    submitButton.addEventListener('click', function (event) {
        var hasErrors = false;

        // Validar el campo de nombre (solo letras y números)
        if (!/^[a-zA-Z0-9\s]+$/.test(nameField.value)) {
            nameError.style.display = 'block';
            nameField.style.border = '1px solid red';
            nameError.textContent = 'Por favor, ingrese solo letras y números.';
            hasErrors = true;
        } else {
            nameError.style.display = 'none';
            nameField.style.border = '1px solid #ccc';
        }

        // Validar el campo de stock (solo números)
        if (!/^\d+$/.test(stockField.value) && !cotizableCheckbox.checked) {
            stockError.style.display = 'block';
            stockField.style.border = '1px solid red';
            stockError.textContent = 'Por favor, ingrese solo números.';
            hasErrors = true;
        } else {
            stockError.style.display = 'none';
            stockField.style.border = '1px solid #ccc';
        }

        // Validar el campo de precio (solo números, con opción a decimales)
        if (!/^\d+(\.\d{1,2})?$/.test(precioField.value) && !cotizableCheckbox.checked) {
            precioError.style.display = 'block';
            precioField.style.border = '1px solid red';
            precioError.textContent = 'Por favor, ingrese solo números.';
            hasErrors = true;
        } else {
            precioError.style.display = 'none';
            precioField.style.border = '1px solid #ccc';
        }

        // Validar el campo de mensaje (no puede estar vacío)
        if (messageField.value.trim() === '') {
            messageError.style.display = 'block';
            messageField.style.border = '1px solid red';
            messageError.textContent = 'Por favor, ingrese un mensaje.';
            hasErrors = true;
        } else {
            messageError.style.display = 'none';
            messageField.style.border = '1px solid #ccc';
        }

        if (hasErrors) {
            event.preventDefault();
        } else {
            alert('Producto enviado para ser aprobado por un administrador. Por favor, espere la confirmación.');
        }
    });
});
