function mostrarCampos(opcion) {
    var cardFields = document.getElementById('cardFields');
    var paypalEmailField = document.getElementById('paypalEmailField');

    if (opcion === 'paypal') {
        cardFields.style.display = 'none';
        paypalEmailField.style.display = 'block';
    } else {
        cardFields.style.display = 'block';
        paypalEmailField.style.display = 'none';
    }
}

function validarTarjeta() {
    var cardNumber = document.getElementById('cardNumber').value;
    var cardNumberError = document.getElementById('cardNumberError');

    if (cardNumber.length !== 16 || isNaN(cardNumber)) {
        cardNumberError.style.display = 'block';
        return false;
    } else {
        cardNumberError.style.display = 'none';
        return true;
    }
}

function validarCVV() {
    var cvv = document.getElementById('cvv').value;
    var cvvError = document.getElementById('cvvError');

    if (cvv.length !== 3 || isNaN(cvv)) {
        cvvError.style.display = 'block';
        return false;
    } else {
        cvvError.style.display = 'none';
        return true;
    }
}

function validarCorreoPaypal() {
    var paypalEmail = document.getElementById('paypalEmail').value;
    var paypalEmailError = document.getElementById('paypalEmailError');
    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

    if (!emailPattern.test(paypalEmail)) {
        paypalEmailError.style.display = 'block';
        return false;
    } else {
        paypalEmailError.style.display = 'none';
        return true;
    }
}

function confirmarPago() {
    // Obtener los valores de los campos de tarjeta y correo de PayPal
    var cardNumberValue = document.getElementById('cardNumber').value;
    var cvvValue = document.getElementById('cvv').value;
    var cardNameValue = document.getElementById('cardName').value;
    var paypalEmailValue = document.getElementById('paypalEmail').value;

    // Verificar si los campos están vacíos
    if (
        (cardNumberValue === '' || cvvValue === '' || cardNameValue === '') &&
        (paypalEmailValue === '')
    ) {
        alert('Por favor, completa todos los campos antes de confirmar el pago.');
        return;
    }

    var metodoPago = document.querySelector('input[name="payment"]:checked').value;

    if (metodoPago === 'visa' || metodoPago === 'mastercard') {
        if (validarTarjeta() && validarCVV()) {
            alert('¡Pago con tarjeta confirmado! Gracias por tu compra.');

            // Restablecer campos de tarjeta
            document.getElementById('cardNumber').value = '';
            document.getElementById('cvv').value = '';
            document.getElementById('cardName').value = '';
        } else {
            alert('Por favor, completa correctamente los campos de tarjeta antes de confirmar el pago.');
        }
    } else if (metodoPago === 'paypal') {
        if (validarCorreoPaypal()) {
            alert('¡Pago con PayPal confirmado! Gracias por tu compra.');

            // Restablecer campo de correo de PayPal
            document.getElementById('paypalEmail').value = '';
        } else {
            alert('Por favor, completa correctamente el correo de PayPal antes de confirmar el pago.');
        }
    }
}

// Agregar eventos onchange para validar en tiempo real
document.getElementById('cardNumber').onchange = validarTarjeta;
document.getElementById('cvv').onchange = validarCVV;
document.getElementById('paypalEmail').onchange = validarCorreoPaypal;

// Agregar evento onclick al enlace "Pagar Ahora"
document.getElementById('payNowLink').addEventListener('click', function(event) {
    event.preventDefault(); // Evita que el enlace realice su acción predeterminada (navegar a otra página).
    confirmarPago(); // Ejecuta la función de confirmar pago.
});
