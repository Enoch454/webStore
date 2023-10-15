$(document).ready(function() {
    // Establecer el radio button de "Masculino" como predeterminado
    $('input[name="Genero"][value="Masculino"]').prop('checked', true);
    
    // Asignar la función valid_datas al evento submit del formulario
    $('#form_status').submit(valid_datas);
});


function valid_datas(f) {
    var valid = true;
    var nameRegex = /^[A-Za-záéíóúÁÉÍÓÚñÑüÜ\s]+$/; // Expresión regular para nombres con letras y acentos
    var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/; // Expresión regular para correos electrónicos
    var phoneRegex = /^\d{10}$/; // Expresión regular para números de teléfono de 10 dígitos
    var usernameRegex = /^[A-Za-z0-9]{3,}$/; // Expresión regular para usuarios con letras y números (mínimo 3 caracteres)
    var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&_\-])[A-Za-z\d@$!%*?&_\-\s]{8,}$/; // Expresión regular para contraseñas

    if (f.Nombre.value == '' || !nameRegex.test(f.Nombre.value)) {
        jQuery('#form_status').html('<span class="wrong">Por favor, ingrese un nombre válido.</span>');
        notice(f.Nombre);
        valid = false;
    } else if (f.ApPaterno.value == '' || !nameRegex.test(f.ApPaterno.value)) {
        jQuery('#form_status').html('<span class="wrong">Por favor, ingrese un apellido paterno válido.</span>');
        notice(f.ApPaterno);
        valid = false;
    } else if (f.ApMaterno.value == '' || !nameRegex.test(f.ApMaterno.value)) {
        jQuery('#form_status').html('<span class="wrong">Por favor, ingrese un apellido materno válido.</span>');
        notice(f.ApMaterno);
        valid = false;
    } else if (f.email.value == '' || !emailRegex.test(f.email.value)) {
        jQuery('#form_status').html('<span class="wrong">Por favor, ingrese un correo electrónico válido.</span>');
        notice(f.email);
        valid = false;
    } else if (f.Telefono.value == '' || !phoneRegex.test(f.Telefono.value)) {
        jQuery('#form_status').html('<span class="wrong">Por favor, ingrese un número de teléfono válido (10 dígitos).</span>');
        notice(f.Telefono);
        valid = false;
    } else if (f.Username.value == '' || !usernameRegex.test(f.Username.value)) {
        jQuery('#form_status').html('<span class="wrong">El usuario debe contener al menos 3 caracteres y solo puede contener letras y números.</span>');
        notice(f.Username);
        valid = false;
    } else if (f.Contraseña.value == '' || !passwordRegex.test(f.Contraseña.value)) {
        jQuery('#form_status').html('<span class="wrong">La contraseña debe tener al menos 8 caracteres y contener al menos una mayúscula, una minúscula, un número y un carácter especial (_ - @ $ ! % * ? &).</span>');
        notice(f.Contraseña);
        valid = false;
    } else if (f.Contraseña.value !== f.Contraseña2.value) {
        jQuery('#form_status').html('<span class="wrong">Las contraseñas no coinciden.</span>');
        notice(f.Contraseña);
        valid = false;
    }  else if (f.FechaNac.value == '') {
        // Validar si la fecha de nacimiento está en blanco
        jQuery('#form_status').html('<span class="wrong">Por favor, ingrese una fecha de nacimiento.</span>');
        notice(f.FechaNac);
        valid = false;
    }

    
        if (valid) {
            alert('Registro exitoso. ¡Bienvenido!');
            const userData = {
                "username": f.Username.value,
                "password": f.Contraseña.value,
                "email": f.email.value,
                // Agrega más propiedades aquí según sea necesario
            };
        
            // Crear una instancia de Usuario
            const usuario = new Usuario(
                userData.username,
                userData.password,
                userData.email
                // Puedes agregar más propiedades según sea necesario
            );
        
            // Insertar el usuario en la base de datos
            fetch("registroApi.php", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(userData)
            })
            .then(response => response.json())
            .then(data => {
                alert('Registro exitoso. ¡Bienvenido!');
            })
            .catch(error => {
                console.error("Error en la solicitud:", error);
            });
        }
    

    return false;
}

function notice(f) {
    jQuery('#dessert-contact').find('input').css('border', 'none');
    f.style.border = '1px solid red';
    f.focus();
}


