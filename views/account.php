<?php
session_start();

$nombre = isset($_SESSION["Nombre"]) ? $_SESSION["Nombre"] : "";
$apellido = isset($_SESSION["ApellidoPat"]) ? $_SESSION["ApellidoPat"] : "";
$email = isset($_SESSION["email"]) ? $_SESSION["email"] : "";
$userName = isset($_SESSION["userName"]) ? $_SESSION["userName"] :"";
$fechaIngreso = isset($_SESSION["fechaIngreso"]) ? $_SESSION["fechaIngreso"] :"";
$idVendedor = isset($_SESSION["idVendedor"]) ? $_SESSION["idVendedor"] :"";
//$productos = isset($_SESSION["productos"]) ? $_SESSION["productos"] :"";
// Resto de tu código HTML...
?>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	

	<!-- title -->
	<title>Perfil</title>

	<!-- fotito -->
	<link rel="shortcut icon" type="image/png" href="/views/assets/img/pasteles.png">

	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet" type="text/css">
	<!-- fontawesome -->
	<link rel="stylesheet" href="/views/assets/css/all.min.css" type="text/css">
	<!-- bootstrap -->
	<link rel="stylesheet" href="/views/assets/bootstrap/css/bootstrap.min.css">
	<!-- owl carousel -->
	<link rel="stylesheet" href="/views/assets/css/owl.carousel.css">
	<!-- magnific popup -->
	<link rel="stylesheet" href="/views/assets/css/magnific-popup.css">
	<!-- animate css -->
	<link rel="stylesheet" href="/views/assets/css/animate.css">
	<!-- mean menu css -->
	<link rel="stylesheet" href="/views/assets/css/meanmenu.min.css">
	<!-- main style -->
	<link rel="stylesheet" href="/views/assets/css/main.css" type="text/css">
	<!-- responsive -->
	<link rel="stylesheet" href="/views/assets/css/responsive.css">

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
								<img src="/views/assets/img/logo.png" alt="">
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
						<p>¡Bienvenidx!</p>
						<h1>Perfil</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<div class="container bootstrap snippets bootdeys">
		<div class="row" id="user-profile">
			<div class="col-lg-3 col-md-4 col-sm-4">
				<div class="main-box clearfix">
					<h2> <?php echo $userName; ?> </h2>
					<?php
						// Si el usuario es un vendedor, entonces se muestra la sig insignia
						if(isset($_SESSION["idVendedor"]) && intval($idVendedor) > -1){
					?>
					<div class="profile-status">
						<i class="fa fa-check-circle"></i> Vendedor Verificado
					</div>
					<?php
						}
					?>
					<img src="/views/assets/img/avaters/meek.jpg" alt="" class="profile-img img-responsive center-block">
					<div class="profile-label">
						<span class="label label-danger">Admin</span>
					</div>
	
					<div class="profile-stars">
						<i class="fa fa-star"></i>
						<i class="fa fa-star"></i>
						<i class="fa fa-star"></i>
						<i class="fa fa-star"></i>
						<i class="fa fa-star-o"></i>
						
					</div>
	
					<div class="profile-since">
						Miembro desde: <?php echo $fechaIngreso; ?>
					</div>
	
					<div class="profile-details">
						<ul class="fa-ul">
							<li><i class="fa-li fa fa-truck"></i>Ventas: <span>50</span></li>
							<li><i class="fa-li fa fa-comment"></i>Posts: <span>100</span></li>
							<li><i class="fa-li fa fa-tasks"></i>Productos: <span>25</span></li>
						</ul>
					</div>
	
				
				</div>
			</div>


			<div class="col-lg-9 col-md-8 col-sm-8">
				<div class="main-box clearfix">
					<div class="profile-header">
						<h3><span>Info de Usuario</span></h3>
						<a href="modperfil.php" class="btn btn-primary edit-profile">
							<i class="fa fa-pencil-square fa-lg"></i> Editar perfil
						</a>
					</div>
					
	
					<div class="row profile-user-info">
						<div class="col-sm-8">
							<div class="profile-user-details clearfix">
								<div class="profile-user-details-label">
									Nombre
								</div>
								<div class="profile-user-details-value">
            					<?php echo $nombre; ?>
        						</div>
							</div>
							<div class="profile-user-details clearfix">
								<div class="profile-user-details-label">
									Apellido 
								</div>
								<div class="profile-user-details-value">
								<?php echo $apellido; ?>
								</div>
							</div>
							</div>
							<div class="profile-user-details clearfix">
								<div class="profile-user-details-label">
									Email
								</div>
								<div class="profile-user-details-value">
								<?php echo $email; ?>
								</div>
							</div>
						
						</div>

	<div class="account-buttons">
	
		<a href="domicilio.php" class="boxed-btn">Agregar Domicilio</a>
		<a href="actualizardom.php" class="boxed-btn">Actualizar Domicilio</a>
		<a href="crearPost.php" class="boxed-btn">Nuevo Post</a>
		<a href="moderarventas.php" class="boxed-btn">Perfil Avanzado</a>
		<?php
		// Si el usuario es un vendedor, entonces no se muestra el siguiente botón
		if(!isset($_SESSION["idVendedor"]) || intval($idVendedor) == -1){
		?>
		<a id="btn-upgradeVendedor" class="boxed-btn">Quiero ser vendedor!!!</a>
		<?php
		}
		?>
	</div>

</div>
			
	<!-- publicaciones -->
	<div class="latest-news mt-150 mb-150">
		<div class="container">
			<h2>Posts del Usuario</h2>
			<div class="row">
				
				<div class="col-lg-4 col-md-6">
					<div class="single-latest-news">
						
						<a href="single-news.php"><div class="latest-news-bg news-bg-1"></div></a>
						<div class="news-text-box">
							<h3><a href="single-news.php">compra pasteles!!!!!!</a></h3>
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i> Admin</span>
								<span class="date"><i class="fas fa-calendar"></i> Septiembre 8, 2023</span>
							</p>
							<div class="post-stars">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star-o"></i>
								
							</div>
							<p class="excerpt">los pasteles te hacen vivir mas años es enserio creeme</p>
							<a href="posts.php" class="read-more-btn">Leer más <i class="fas fa-angle-right"></i></a>
						</div>
					</div>
				</div>
			</div>
			<a href="productoVendedor.php" class="boxed-btn">Todos mis Posts</a>
		</div>
	</div>

<!-- fin de posts-->

	<!--Mis compras-->
	<div class="latest-news mt-150 mb-150">
		<div class="container">
			<h2>Mis compras</h2>
			<div class="row">
				
				<div class="col-lg-4 col-md-6">
					<div class="single-latest-news">
						
						<a href="single-news.php"><div class="latest-news-bg news-bg-1"></div></a>
						<div class="news-text-box">
							<h3><a href="single-news.php">Galletas corazón</a></h3>
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i> juan1234</span>
								<span class="date"><i class="fas fa-calendar"></i> Septiembre 8, 2023</span>
							</p>
							<div class="post-stars">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star-o"></i>
								
							</div>
							<p class="excerpt">Galletas organicas sujetas bajo cotizacion del cliente ya sea mayoreo o menudeo</p>
							<a href="single-product.php" class="read-more-btn">Leer más <i class="fas fa-angle-right"></i></a>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6">
					<div class="single-latest-news">
						
						<a href="single-news.php"><div class="latest-news-bg news-bg-1"></div></a>
						<div class="news-text-box">
							<h3><a href="single-news.php">Pastel de fresa</a></h3>
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i> lola567</span>
								<span class="date"><i class="fas fa-calendar"></i> Septiembre 8, 2023</span>
							</p>
							<div class="post-stars">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star-o"></i>
								
							</div>
							<p class="excerpt">Pastel redondo rosa con relleno de chocolate y pan marmoleado</p>
							<a href="posts.php" class="read-more-btn">Leer más <i class="fas fa-angle-right"></i></a>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6">
					<div class="single-latest-news">
						
						<a href="single-news.php"><div class="latest-news-bg news-bg-1"></div></a>
						<div class="news-text-box">
							<h3><a href="single-news.php">Macarrones</a></h3>
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i> Mis pastelitos</span>
								<span class="date"><i class="fas fa-calendar"></i> Septiembre 8, 2023</span>
							</p>
							<div class="post-stars">
								<i class="fa fa-star"></i>
						
								<i class="fa fa-star-o"></i>
								
							</div>
							<p class="excerpt">Paquetes de 6 piezas con 6 colores diferentes</p>
							<a href="posts.php" class="read-more-btn">Leer más <i class="fas fa-angle-right"></i></a>
						</div>
					</div>
				</div>
				
				<a href="miscompras.php" class="boxed-btn">Todas mis Compras</a>

			</div>
		</div>
		
	

	</div>
	<!-- fin de mis compras-->

	<!--Mis productos-->
	<?php
	// Si el usuario es un vendedor, entonces mostramos sus productos
	if(isset($_SESSION["idVendedor"]) && intval($idVendedor) > 0){
	?>
	<div class="latest-news mt-150 mb-150">
		<div class="container">
			<h2>Mis Productos</h2>
			<div id="product-container"  class="row">
			

			
			</div>
			<a href="productoVendedor.php" class="boxed-btn">Todos mis Productos</a>
		</div>
	</div>
	<?php
	}
	?>
	

</div>
	<!-- fin de mis productos-->


	<!--Finaliza publicaciones -->

	<!-- logo carousel -->
	<div class="logo-carousel-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="logo-carousel-inner">
						<div class="single-logo-item">
							<img src="/views/assets/img/4001495.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="/views/assets/img/awww.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="/views/assets/img/pastelito.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="/views/assets/img/cap.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="/views/assets/img/pasteles.png" alt="">
						</div>
					</div>
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
				<img src="/views/assets/img/mishi.jpg" alt="">
			</div>
		</div>
	</div>
</div>
<!-- end footer -->
	
	<!-- jquery -->
	<script src="/views/assets/js/jquery-1.11.3.min.js"></script>
	<!-- bootstrap -->
	<script src="/views/assets/bootstrap/js/bootstrap.min.js"></script>
	<!-- count down -->
	<script src="/views/assets/js/jquery.countdown.js"></script>
	<!-- isotope -->
	<script src="/views/assets/js/jquery.isotope-3.0.6.min.js"></script>
	<!-- waypoints -->
	<script src="/views/assets/js/waypoints.js"></script>
	<!-- owl carousel -->
	<script src="/views/assets/js/owl.carousel.min.js"></script>
	<!-- magnific popup -->
	<script src="/views/assets/js/jquery.magnific-popup.min.js"></script>
	<!-- mean menu -->
	<script src="/views/assets/js/jquery.meanmenu.min.js"></script>
	<!-- sticker js -->
	<script src="/views/assets/js/sticker.js"></script>
	<!-- main js -->
	<script src="/views/assets/js/main.js"></script>
	<!-- script account.js -->
	<script src="/views/assets/js/account.js"></script>

	

</body>
</html>