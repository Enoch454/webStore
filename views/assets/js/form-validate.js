

$(document).ready(function() {
    // Establecer el radio button de "Masculino" como predeterminado
    $('input[name="Genero"][value="Masculino"]').prop('checked', true);
    
    // Asignar la función valid_datas al evento submit del formulario
    $('#form_status').submit(valid_datas);

    // Agregar evento click para los elementos de radio
    // Dentro del evento click para los elementos de radio
    $('#masculino, #femenino').click(function() {
    const genero = $(this).val();
    $('#Genero').val(genero);
    $('#generoSeleccionado').text(genero);
    });

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
        //alert('¡Bienvenido!');
        
        // Combina los datos en un solo objeto
        const userData = {
           
                "Nombre": f.Nombre.value,
                "ApPaterno": f.ApPaterno.value,
                "ApMaterno": f.ApMaterno.value,
                "email": f.email.value,
                "Telefono": f.Telefono.value,
                "FechaNac": f.FechaNac.value,
                //"Femenino" o "Masculino"
                "Genero": $('#Genero').val().substring(0,1),
                "Username": f.Username.value,
                "Contraseña": f.Contraseña.value,
            
        };

        // Realiza una solicitud fetch para enviar los datos al servidor
        console.log(userData);
        const urlRaiz = window.location.protocol
            + "//"
            + window.location.host;
        console.log(urlRaiz);

        fetch(urlRaiz + "/signup", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(userData)
        })
        .then(response => {if (!response.ok) {
            throw new Error('La solicitud no fue exitosa');
          }
          return response.json();
        })
        //.then(data => console.log(data));
        .then(data => {
            if (data.success) {
                alert('Registro exitoso. ¡Bienvenido!');
                window.location.replace(urlRaiz + '/login'); // Redirecciona a inicioses.php
            } else {
                alert('Registro exitoso, pero ocurrió un error inesperado.');
                console.log(data.details);
            }
        })
        .catch(error => {
            console.error("Error en la solicitud:");
            console.error(error);
        });
        
    
    }

    return false;
}

function notice(f) {
    jQuery('#dessert-contact').find('input').css('border', 'none');
    f.style.border = '1px solid red';
    f.focus();
}


