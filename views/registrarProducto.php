<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">


	<!-- title -->
	<title>Registrar Producto</title>

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
										<li><a href="shop.php">Shop</a></li>
										
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
						
						<h1>Registra tu producto</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- contact form -->
	<div class="contact-from-section mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mb-5 mb-lg-0">
					<div class="form-title">
						<h2>Registra tu producto</h2>
						<p>Al registrar un producto, deberás esperar a que sea aprobado por un administrador</p>
					</div>
				 	<div id="form_status"></div>
					<div class="contact-form">
					<form  type= "POST" id="dessert-contact" onSubmit="return valid_datas( this );" method="POST" action="<?php echo $urlRaiz?>/controllers/product.php" enctype="multipart/form-data">
							<p>
								<input type="text" placeholder="Name" name="name" id="name">
								<p id="name-error" style="display: none; color: red;">Por favor, ingrese el nombre.</p>
								
							</p>

							<p>
								
								<input class="cotizable" type="checkbox" name="cotizable" >¿Es cotizable?
    							

							</p>
							<p>
								<input type="text" placeholder="Stock" name="stock" id="stock">
								<p id="stock-error" style="display: none; color: red;">Por favor, ingrese el stock.</p>
								
							</p>

							<p>
								<input type="text" placeholder="Precio" name="precio" id="precio">
								<p id="precio-error" style="display: none; color: red;">Por favor, ingrese el precio.</p>

							</p>

							
							
							
							<p><textarea name="message" id="message" cols="30" rows="10" placeholder="Descripcion"></textarea></p>

							
							<p id="message-error" style="display: none; color: red;">Por favor, ingrese la descripcion.</p>
							<input type="hidden" name="token" value="FsWga4&@f6aw" />
							<!--<p><input type="submit" value="Adjuntar Imagen"></p>-->
							<p><button type="button" id="submitButton">Submit</button></p>
						</form>
					</div>
				</div>
				<div class="col-lg-4">
					
				</div>
			</div>
		</div>
	</div>
	<!-- end contact form -->


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
						<li><a href="shop.php">Tienda</a></li>
						
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
	<!-- form validation js -->
	<script src="./views/assets/js/registrarProducto_validar.js"></script>
	<!-- main js -->
	<script src="./views/assets/js/main.js"></script>
	
</body>
</html>