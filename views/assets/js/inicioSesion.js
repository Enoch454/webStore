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

        // Aquí puedes agregar el código para enviar los datos al servidor
        var userData = {
            userName: userField.value,
            contrasena: contraField.value,
            token: 'FsWga4&@f6aw' // Incluye el token si es necesario
        };

        fetch('../controllers/login.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(userData)
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // Procesa la respuesta exitosa (por ejemplo, redirección, mostrar un mensaje, etc.)
                    if (data.msg === 'Bienvenido') {
                        // Muestra el mensaje solo si el mensaje es "Bienvenido"
                        alert(data.msg);
                        if (data.redirect) {
                            window.location.href = data.redirect;
                        }
                    }
                } else {
                    // Procesa la respuesta en caso de error (por ejemplo, mostrar un mensaje de error)
                    alert('Error: ' + data.msg);
                }
            })
            .catch(error => {
                // Procesa errores en la solicitud
                console.error('Error en la solicitud:', error);
            });
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
