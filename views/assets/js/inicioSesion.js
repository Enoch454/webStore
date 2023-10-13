function valid_datas(f) {
    var valid = true;
    var userRegex = /^[A-Za-z0-9]{3,}$/; // Expresión regular para usuarios con letras y números (mínimo 3 caracteres)

    var userField = document.getElementById("user");
    var contraField = document.getElementById("contra");

    if (userField.value === '') {
        showError(userField, 'Por favor, ingrese un usuario.');
        valid = false;
    } else if (!userRegex.test(userField.value)) {
        showError(userField, 'El usuario debe contener al menos 3 caracteres y solo puede contener letras y números.');
        valid = false;
    } else {
        clearError(userField);
    }

    if (contraField.value === '') {
        showError(contraField, 'Por favor, ingrese una contraseña.');
        valid = false;
    } else {
        clearError(contraField);
    }

    if (valid) {
        // Resto del código para enviar el formulario o realizar otras acciones
        alert('Inicio de sesión exitoso. ¡Bienvenido!');
    }

	return false;

    // Resto del código para enviar el formulario o realizar otras acciones
}

function showError(field, errorMessage) {
    field.style.border = '1px solid red';
    field.classList.add('invalid');
    var errorSpan = document.createElement('span');
    errorSpan.className = 'error-message';
    errorSpan.innerHTML = errorMessage;
    field.parentNode.appendChild(errorSpan);
}

function clearError(field) {
    field.style.border = '';
    field.classList.remove('invalid');
    var errorSpan = field.parentNode.querySelector('.error-message');
    if (errorSpan) {
        field.parentNode.removeChild(errorSpan);
    }
    // Puedes personalizar aquí el código para eliminar el mensaje de error si lo deseas
}
