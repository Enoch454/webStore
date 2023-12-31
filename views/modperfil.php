<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">


	<!-- title -->
	<title>Registro</title>

	<!-- fotito -->
	<link rel="shortcut icon" type="image/png" href="assets/img/pasteles.png">

	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	<!-- fontawesome -->
	<link rel="stylesheet" href="assets/css/all.min.css">
	<!-- bootstrap -->
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
	<!-- owl carousel -->
	<link rel="stylesheet" href="assets/css/owl.carousel.css">
	<!-- magnific popup -->
	<link rel="stylesheet" href="assets/css/magnific-popup.css">
	<!-- animate css -->
	<link rel="stylesheet" href="assets/css/animate.css">
	<!-- mean menu css -->
	<link rel="stylesheet" href="assets/css/meanmenu.min.css">
	<!-- main style -->
	<link rel="stylesheet" href="assets/css/main.css">
	<!-- responsive -->
	<link rel="stylesheet" href="assets/css/responsive.css">

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
								<img src="assets/img/logo.png" alt="">
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
										<a class="mobile-hide search-bar-icon" href="search.php"><i class="fas fa-search"></i></a>
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
						<p>Gran variedad de postres recien hechos</p>
						<h1>¡Modificar Perfil!</h1>
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
						<h2>¿No tienes una cuenta? ¡Crea una!</h2>
						<p>Con una cuenta podrás comprar, vender y encontrar los postres que mas te gusten!</p>
					</div>

					<div class="row">
						<div class="small-12 medium-2 large-2 columns">
						  <div class="square">
							<img class="profile-pic" src="https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg">
					 
						  </div>
						  <div class="p-image">
							<i class="fa fa-camera upload-button"></i>
							 <input class="file-upload" type="file" accept="image/*"/>
						  </div>
					   </div>
					   <script src="uploadpic.js"></script>
					 </div> 
					
					 &nbsp;&nbsp;&nbsp;&nbsp;

			
					  

				 	<div id="form_status"></div>
					<div class="contact-form">
						<form type="POST" id="dessert-contact" onSubmit="return valid_datas( this );">
							<p>
								<input class="formulario" type="text" placeholder="Nombre" name="Nombre" id="Nombre">
							</p>
							<p><input class="formulario" type="text" placeholder="Apellido Paterno" name="ApPaterno" id="ApPaterno"></p>
							<p><input class="formulario" type="text" placeholder="Apellido Materno" name="ApMaterno" id="ApMaterno"></p>	
							<p><input class="formulario" type="text" placeholder="Fecha Nacimiento" name="Fecha" id="Fecha"></p>
							<p><input class="formulario" type="email" placeholder="Email" name="email" id="email"></p>
							<p><input class="formulario" type="text" placeholder="Telefono" name="Telefono" id="Telefono"></p>
							<p><input class="formulario" type="text" placeholder="Username" name="Username" id="subject"></p>
							<p><input class="formulario" type="password" placeholder="Contraseña" name="Contraseña" id="pass"></p>	
							<p><input class="formulario" type="password" placeholder="Repite tu contraseña" name="Contraseña2" id="pass2">
							</p>

							<p><input type="submit" value="Crear!"></p>
						</form>
						

					</div>
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
					<img src="assets/img/mishi.jpg" alt="">
				</div>
			</div>
		</div>
	</div>
	<!-- end footer -->
	
	<!-- jquery -->
	<script src="assets/js/jquery-1.11.3.min.js"></script>
	<!-- bootstrap -->
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<!-- count down -->
	<script src="assets/js/jquery.countdown.js"></script>
	<!-- isotope -->
	<script src="assets/js/jquery.isotope-3.0.6.min.js"></script>
	<!-- waypoints -->
	<script src="assets/js/waypoints.js"></script>
	<!-- owl carousel -->
	<script src="assets/js/owl.carousel.min.js"></script>
	<!-- magnific popup -->
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<!-- mean menu -->
	<script src="assets/js/jquery.meanmenu.min.js"></script>
	<!-- sticker js -->
	<script src="assets/js/sticker.js"></script>
	<!-- form validation js -->
	<script src="assets/js/form-validate.js"></script>
	<!-- main js -->
	<script src="assets/js/main.js"></script>

	<script src="assets/js/uploadpic.js"></script>
	
</body>
</html>