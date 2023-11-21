<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

	<!-- title -->
	<title>Check Out</title>
	<script src="https://www.paypal.com/sdk/js?client-id=ASJRV66GQ90rNcUL1pj_ZYcB6-v6-mJAbKaaH7MR22ekzjWiiRUKTbR5z5vXmA9IPGZBYXLOw7p267fS&currency=MXN" ></script>

	<!-- fotito -->
	<link rel="shortcut icon" type="image/png" href="./views/assets/img/pasteles.png">

	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	<!-- fontawesome -->
	<link rel="stylesheet" href="./views/assets/css/all.min.css">
	<!-- bootstrap -->
	<link rel="stylesheet" href="./views/assets/bootstrap/css/bootstrap.min.css">
	<!-- owl carousel -->
	<link rel="stylesheet" href="./views/assets/css/owl.carousel.css">
	<!-- magnific popup -->
	<link rel="stylesheet" href="./views/assets/css/magnific-popup.css">
	<!-- animate css -->
	<link rel="stylesheet" href="./views/assets/css/animate.css">
	<!-- mean menu css -->
	<link rel="stylesheet" href="./views/assets/css/meanmenu.min.css">
	<!-- main style -->
	<link rel="stylesheet" href="./views/assets/css/main.css">
	<!-- responsive -->
	<link rel="stylesheet" href="./views/assets/css/responsive.css">

	<script>
		const totalCheckOut = <?php if($_SESSION['TotalCheckOut']){ echo $_SESSION['TotalCheckOut']; }?>;
		console.log(totalCheckOut);
	</script>

</head>
<body>
	
	<!--PreLoader-->
    <div class="loader">
        <div class="loader-inner">
            <div class="circle"></div>
        </div>
    </div>
    <!--PreLoader Ends-->
	
	<!-- header -->
	<div class="top-header-area" id="sticker">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-sm-12 text-center">
					<div class="main-menu-wrap">
						<!-- logo -->
						<div class="site-logo">
							<a href="index.php">
								<img src="./views/assets/img/logo.png" alt="">
							</a>
						</div>
						<!-- logo -->

					<!-- menu start -->
					<nav class="main-menu">
						<ul>
							<li class="current-list-item"><a href="#">Home</a>
								<ul class="sub-menu">
									<li><a href="index.php">Home</a></li>
							
								</ul>
							</li>
						
							<li><a href="#">Pages</a>
								<ul class="sub-menu">
									
									<li><a href="cart.php">Carrito</a></li>
									<li><a href="checkout.php">Check Out</a></li>
									<li><a href="shop.php">Tienda</a></li>
									
								</ul>
							</li>
							<li><a href="account.php">Perfil</a>
								<ul class="sub-menu">
									<li><a href="account.php">Perfil</a></li>
									<li><a href="posts.php">Posts</a></li>
									<li><a href="wishlist.php">Wishlist</a></li>
								</ul>
							</li>
							<li><a href="about.php">Nosotros</a></li>
							<li><a href="shop.php">Shop</a>
								<ul class="sub-menu">
									<li><a href="shop.php">Shop</a></li>
									<li><a href="checkout.php">Check Out</a></li>
									<li><a href="single-product.php">Single Product</a></li>
									<li><a href="cart.php">Carrito</a></li>
								</ul>
							</li>
							<li>
								<div class="header-icons">
									<a class="shopping-cart" href="cart.php"><i class="fas fa-shopping-cart"></i></a>
									<a class="mobile-hide search-bar-icon" href="#"><i class="fas fa-search"></i></a>
								</div>
							</li>
						</ul>
					</nav>
					<a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
					<div class="mobile-menu"></div>
					<!-- menu end -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end header -->

	<!-- busqueda -->
	<div class="search-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<span class="close-btn"><i class="fas fa-window-close"></i></span>
					<div class="search-bar">
						<div class="search-bar-tablecell">
							<h3>Buscas algo especifico?</h3>
							<input type="text" placeholder="Que buscas?">
							<button type="submit">Buscar <i class="fas fa-search"></i></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- busqyeda -->

	
	<!-- breadcrumb-section -->
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						<p>Postres recien hechos y deliciosos</p>
						<h1>Check Out</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- check out section -->
	<div class="checkout-section mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="checkout-accordion-wrap">
						<div class="accordion" id="accordionExample">
						  
						  <div class="card single-accordion">
						    <div class="card-header" id="headingThree">
						      <h5 class="mb-0">
						        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
						          Metodo de Pago 
						        </button>
						      </h5>
						    </div>
						    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
						      <div class="card-body">
						        <div class="card-details">
									<div class="checkout">
										<div class="payment-methods">
										  <div id="paypal-button-container">
												
												<script>
													paypal.Buttons({
														style:{
															color: 'blue',
															shape: 'pill',
															label: 'pay'
														},

														createOrder: function(data, actions){
															return actions.order.create({
																purchase_units:[{
																	amount: {
																		value: totalCheckOut
																	}
																}]
															});
														},

														onApprove: function(data, actions){
															actions.order.capture().then(function (detalles){
																	console.log(detalles);
															});
														},

														onCancel: function(data){
															alert("Pago Cancelado")
														}
													}).render('#paypal-button-container');
												</script>
										  </div>
										  
										</div>
										
										<br>
										<div class="mb-3" id="paypalEmailField" style="display: none;">
											<label for="paypalEmail" class="formulario">Correo de PayPal:</label>
											<input type="text" class="formulario" id="paypalEmail" name="paypalEmail">
											<span id="paypalEmailError" style="display: none; color: red;">Por favor, ingresa un correo de PayPal válido.</span>
										</div>
					
										
										
									  </div>
						        </div>
						      </div>
						    </div>
						  </div>
						</div>

					</div>
				</div>

				<div class="col-lg-4">
					<div class="order-details-wrap">
						<table class="order-details">
							<thead>
								<tr>
									<th>Detalles de su pedidio</th>
									<th>Precio</th>
								</tr>
							</thead>
							<tbody class="order-details-body">
								<tr>
									<td>Producto</td>
									<td>Total</td>
								</tr>
								<tr>
									<td>Pastel</td>
									<td>$85.00</td>
								</tr>
								<tr>
									<td>Galleta</td>
									<td>$70.00</td>
								</tr>
								<tr>
									<td>Limon</td>
									<td>$35.00</td>
								</tr>
							</tbody>
							<tbody class="checkout-details">
								<tr>
									<td>Subtotal</td>
									<td>$190</td>
								</tr>
								<tr>
									<td>Envio</td>
									<td>$50</td>
								</tr>
								<tr>
									<td>Total</td>
									<td>$240</td>
								</tr>
							</tbody>
						</table>
						<a href="#" class="boxed-btn" id="payNowLink">Pagar Ahora</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end check out section -->

	<!-- logo carousel -->
	<div class="logo-carousel-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="logo-carousel-inner">
						<div class="single-logo-item">
							<img src="./views/assets/img/4001495.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="./views/assets/img/awww.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="./views/assets/img/pastelito.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="./views/assets/img/cap.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="./views/assets/img/pasteles.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end logo carousel -->

<!-- footer -->
<div class="footer-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6">
				<div class="footer-box about-widget">
					<h2 class="widget-title">Sobre Nosotros</h2>
					<p>Somos una pagina web que busca vender postres por que a todos les gustan los postres uhh compren uwu.</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="footer-box get-in-touch">
					<h2 class="widget-title">Contactanos!</h2>
					<ul>
						<li>+00 num de telefono ooo</li>
						<li>emailpastel@gmail.com</li>
					</ul>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="footer-box pages">
					<h2 class="widget-title">Paginas
					</h2>
					<ul>
						<li><a href="index.php">Home</a></li>
						<li><a href="about.php">Nosotros</a></li>
						<li><a href="shop.php">tienda</a></li>
					
						<li><a href="registro.php">Registrate</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<img src="./views/assets/img/mishi.jpg" alt="">
			</div>
		</div>
	</div>
</div>
<!-- end footer -->
	
	<!-- jquery -->
	<script src="./views/assets/js/jquery-1.11.3.min.js"></script>
	<!-- bootstrap -->
	<script src="./views/assets/bootstrap/js/bootstrap.min.js"></script>
	<!-- count down -->
	<script src="./views/assets/js/jquery.countdown.js"></script>
	<!-- isotope -->
	<script src="./views/assets/js/jquery.isotope-3.0.6.min.js"></script>
	<!-- waypoints -->
	<script src="./views/assets/js/waypoints.js"></script>
	<!-- owl carousel -->
	<script src="./views/assets/js/owl.carousel.min.js"></script>
	<!-- magnific popup -->
	<script src="./views/assets/js/jquery.magnific-popup.min.js"></script>
	<!-- mean menu -->
	<script src="./views/assets/js/jquery.meanmenu.min.js"></script>
	<!-- sticker js -->
	<script src="./views/assets/js/sticker.js"></script>
	<!-- main js -->
	<script src="./views/assets/js/main.js"></script>
	<!--Validaciones de los metodos de pago-->
	<script src="./views/assets/js/metodoPago.js"></script>
	<!--Validaciones de los datos de direccion
	<script src="./views/assets/js/validarDatosDireccion.js"></script>
	-->
	<!--Paypal 
	<script src="https://www.paypal.com/sdk/js?client-id=ASJRV66GQ90rNcUL1pj_ZYcB6-v6-mJAbKaaH7MR22ekzjWiiRUKTbR5z5vXmA9IPGZBYXLOw7p267fS&currency=MXN" ></script>
-->
</body>
</html>