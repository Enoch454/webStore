<?php 
	//$idProducto = isset($_GET["id"]) ? $_GET["idProducto"] :"";
	//echo $productoId;
?>



<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	

	<!-- title -->
	<title>ProductoDetalle</title>

	<!-- fotito -->
	<link rel="shortcut icon" type="image/png" href="/views/assets/img/pasteles.png">

	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	<!-- fontawesome -->
	<link rel="stylesheet" href="/views/assets/css/all.min.css">
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
	<link rel="stylesheet" href="/views/assets/css/main.css">
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

								<li> <a href="/logout">Cerrar Sesion</a></li>

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
						<p>Detalles del producto</p>
						<h1>Single Product</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- single product -->
	<div class="single-product mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<div class="single-product-img">
						<img src="/views/assets/img/products/chocolate.png" alt="">
					</div>
				</div>
				<div class="col-md-7">
					<div class="single-product-content">
						<h3>Cupcake de Chocolate</h3>
						<p>Un delicioso cupcake con pan de chocolate y un betun de chocolate en crema hecho con ingredientes 100% organicos</p>
						<p class="single-product-pricing"></p>
						<span class="price">$50</span>
						<div class="single-product-form">
							<form action="index.php">
								<input type="number" placeholder="0">
								<span class="error-message" style="color: red; display: none;">Este valor no es válido</span>
							</form>
							<p class="stock-info"><strong>Stock disponible:</strong> <span class="stock-count">10</span></p>
							<a href="" class="cart-btn"><i class="fas fa-shopping-cart"></i> Agregar al Carrito</a>
							<p><strong>Categorias: </strong>Chocolate, Organic</p>
						</div>
						<h4>Compartir:</h4>
						<ul class="product-share">
							<li><a href=""><i class="fab fa-facebook-f"></i></a></li>
							<li><a href=""><i class="fab fa-twitter"></i></a></li>
							<li><a href=""><i class="fab fa-google-plus-g"></i></a></li>
							<li><a href=""><i class="fab fa-linkedin"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


	
	<!-- end single product -->


	<!-- more products -->
	<div class="more-products mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="section-title">	
						<h3><span class="orange-text">Productos</span> Similares</h3>
						<p>Algunos productos que te podrian interesar</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="single-product.php"><img src="/views/assets/img/products/chocolate_galleta.png" alt=""></a>
						</div>
						<h3>Chocolate Cookie</h3>
						<p class="product-price"><span>Per Kg</span> 85$ </p>
						<a href="cart.php" class="cart-btn"><i class="fas fa-shopping-cart"></i> Agregar al carrito</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="single-product.php"><img src="/views/assets/img/products/galleta_chocolate.png" alt=""></a>
						</div>
						<h3>Chocolate Chip Cookie</h3>
						<p class="product-price"><span>Per Kg</span> 70$ </p>
						<a href="cart.php" class="cart-btn"><i class="fas fa-shopping-cart"></i> Agregar al carrito</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="single-product.php"><img src="/views/assets/img/products/cocholate.png" alt=""></a>
						</div>
						<h3>Peanut Chocolate Cupcake</h3>
						<p class="product-price"><span>Per Kg</span> 35$ </p>
						<a href="cart.php" class="cart-btn"><i class="fas fa-shopping-cart"></i> Agregar al carrito</a>
					</div>
				</div>
			</div>
		</div>

<!--Seccion de comentarios-->
<div class="mt-150 mb-150">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="single-article-section">
					<div class="single-article-text">
						<div class="comments-list-wrap">
							<h3 class="comment-count-title">Deja tu opinion sobre este producto</h3>
							<h3 class="comment-count-title">3 Comentarios</h3>
							<div class="comment-list">
								<div class="single-comment-body">
									<div class="comment-user-avater">
										<img src="/views/assets/img/avaters/chopper.jpg" alt="">
									</div>
									<div class="comment-text-body">
										<h4>Tony Tony Chopper <span class="comment-date">Septiembre 10, 2023</span> <a href="#">Responder</a></h4>
										<p>Yo soy doctor y puedo confirmar que si es verdad, me gustan mucho los pasteles</p>
									</div>
								</div>
								<div class="single-comment-body child">
									<div class="comment-user-avater">
										<img src="/views/assets/img/avaters/luffy.jpg" alt="">
									</div>
									<div class="comment-text-body">
										<h4>ReyPirata123 <span class="comment-date">Septiembre 10, 2023</span> <a href="#">Responder</a></h4>
										<p> holaaaaaaa</p>
									</div>
								</div>
								<div class="single-comment-body">
									<div class="comment-user-avater">
										<img src="/views/assets/img/avaters/gatiyo.jpg" alt="">
									</div>
									<div class="comment-text-body">
										<h4>Pepe Rito <span class="comment-date">Septiembre 10, 2023</span> <a href="#">Responder</a></h4>
										<p>ami me gustan mucho los pastels</p>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="comment-template">
						<h4>Deja un comentario!</h4>
						<p>Unete a la conversacion!</p>
						<form action="single-product.php">
							<p>
								<input type="text" placeholder="Tu Nombre">
								<input type="email" placeholder="Tu Email">
							</p>
							<p><textarea name="comment" id="comment" cols="30" rows="10" placeholder="Tu comentario"></textarea></p>
							<p><input type="submit" value="Submit"></p>
						</form>
					</div>
				</div>
			</div>
		</div>
		
	<!--chat -->
 
<div class="container">
	<div class="row">
		<div class="col-md-5">
			<div class="panel panel-primary">
				<div class="panel-heading" id="accordion">
					<span class="glyphicon glyphicon-comment"></span> Mensaje Directo
					<div class="btn-group pull-right">
						<a type="button" class="btn btn-default btn-xs" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
							<span class="glyphicon glyphicon-chevron-down"></span>
						</a>
					</div>
				</div>
			<div class="panel-collapse collapse" id="collapseOne">
				<div class="panel-body">
					<ul class="chat">
						<li class="left clearfix"><span class="chat-img pull-left">
							<img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" />
						</span>
							<div class="chat-body clearfix">
								<div class="header">
									<strong class="primary-font">Pepe Rito</strong> <small class="pull-right text-muted">
										<span class="glyphicon glyphicon-time"></span>Hace 12 mins</small>
								</div>
								<p>
									Hola quiero comprar un pastel personalizado uwu
								</p>
							</div>
						</li>
						<li class="right clearfix"><span class="chat-img pull-right">
							<img src="/views/assets/img/avaters/meek.jpg" alt="User Avatar" class="img-circle" width="50" height="50"  />
						</span>
							<div class="chat-body clearfix">
								<div class="header">
									<small class=" text-muted"><span class="glyphicon glyphicon-time"></span>Hace 13 mins</small>
									<strong class="pull-right primary-font">Hatsune Miku</strong>
								</div>
								<p>
									Hola 
								</p>
							</div>
						</li>
						<li class="left clearfix"><span class="chat-img pull-left">
							<img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" />
						</span>
							<div class="chat-body clearfix">
								<div class="header">
									<strong class="primary-font">Pepe Rito</strong> <small class="pull-right text-muted">
										<span class="glyphicon glyphicon-time"></span>hace 14 mins</small>
								</div>
								<p>
									que sea de vainilla para 10 personas y con relleno de chocolate
								</p>
							</div>
						</li>
						<li class="right clearfix"><span class="chat-img pull-right">
							<img src="/views/assets/img/avaters/meek.jpg" alt="User Avatar" class="img-circle" width="70" height="70"  />
						</span>
							<div class="chat-body clearfix">
								<div class="header">
									<small class=" text-muted"><span class="glyphicon glyphicon-time"></span>Hace 15 mins</small>
									<strong class="pull-right primary-font">Hatsune Miku </strong>
								</div>
								<p>
									oki uwu
									 serian 300 pesos
								</p>
							</div>
						</li>
					</ul>
				</div>
				<div class="panel-footer">
					<div class="input-group">
						<input id="btn-input" type="text" class="form-control input-sm" placeholder="..." />
						<span class="input-group-btn">
							<button class="btn btn-warning btn-sm" id="btn-chat">
								Enviar</button>
						</span>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>

	</div>
</div>


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
							<li><a href="shop.php">Tienda</a></li>
						
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
	<!-- single-product.js -->
	<script src="/views/assets/js/single-product.js"></script>
	

</body>
</html>