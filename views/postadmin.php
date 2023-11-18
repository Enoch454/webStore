<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	

	<!-- title -->
	<title>Admin Home</title>

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

	<!--

		
	-->
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
                                <li><a href="/logout">Cerrar Sesion</a>
                                </li>
                            </ul>	
						</nav>
						<a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
						<div class="mobile-menu"></div>
						<!-- Smenu end -->
						
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
						
						<h1>Sección Administrador</h1>
						<h5>Las solicitudes estarán en espera hasta ser aprobadas o rechazados</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->
	
	<!-- single article section -->
	
	<div class="mt-150 mb-150">
		<div class="container">
		<h1>Productos</h1>
			<div class="row">
			<p><h2>Solicitudes de aprobacion</h2></p>
				<div id = "esperaProductos" class="row">
				
				
				</div>
			</div>

			<p><h2>Productos aprobados</h2></p>
		<div class="row">
				<div id = "aprobadosProductos" class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single-latest-news">
							<img src="" alt="">
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i> Nombre Usuario</span>
								<span class ="money"><i class= "fa-money"></i> Precio: </span>
							</p>
							<p> Descripcion: Esto es para la descripcion del producto como ejemplo para la vista </p>
							<span class ="cotizable"></span>
					</div>
				</div>
				
			</div>

		</div>

		<p><h2>Productos rechazados</h2></p>
			<div class="row">
			
				<div id = "rechazadosProductos" class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single-latest-news">
							<img src="" alt="">
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i> Nombre Usuario</span>
								<span class ="money"><i class= "fa-money"></i> Precio: </span>
							</p>
							<p> Descripcion: Esto es para la descripcion del producto rechazado como ejemplo para la vista </p>
							<span class ="cotizable"></span>
					</div>
				</div>
				</div>

			</div>



			<h1>Vendedores</h1>
			<p><h2>Solicitudes de aprobacion</h2></p>
			<div class="row">
				<div id = "esperaVendedores" class="row">
				
				</div>

				
					
				

			</div>


			<div class="row">
			<p><h2>Vendedores aprobados</h2></p>
				<div id = "aprobadosVendedores" class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single-latest-news">
							<img src="/views/assets/img/products/pastellll.jpg" alt="">
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i> Nombre Usuario</span>
								<span class="date"><i class="fas fa-calendar"></i> Septiembre 8, 2023</span>
							</p>
							<p>Compra mi pastel !!! Los doctores dicen que los pateles multiplican tu vida x20 por eso hay que comprar!!!!!! </p>
							
						</div>
				</div>
				
				<div class="col-lg-4 col-md-6">
						<div class="single-latest-news">
							<img src="/views/assets/img/products/pastellll.jpg" alt="">
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i> Nombre Usuario</span>
								<span class="date"><i class="fas fa-calendar"></i> Septiembre 8, 2023</span>
							</p>
							<p>Compra mi pastel !!! Los doctores dicen que los pateles multiplican tu vida x20 por eso hay que comprar!!!!!! </p>
							
						</div>
					</div>
				</div>

			</div>

			<div class="row">
			<p><h2>Vendedores rechazados</h2></p>
				<div id = "rechazadosVendedores" class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single-latest-news">
							<img src="/views/assets/img/products/pastellll.jpg" alt="">
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i> Nombre Usuario</span>
								<span class="date"><i class="fas fa-calendar"></i> Septiembre 8, 2023</span>
							</p>
							<p>Compra mi pastel !!! Los doctores dicen que los pateles multiplican tu vida x20 por eso hay que comprar!!!!!! </p>
							
						</div>
				</div>
				
				<div class="col-lg-4 col-md-6">
						<div class="single-latest-news">
							<img src="/views/assets/img/products/pastellll.jpg" alt="">
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i> Nombre Usuario</span>
								<span class="date"><i class="fas fa-calendar"></i> Septiembre 8, 2023</span>
							</p>
							<p>Compra mi pastel !!! Los doctores dicen que los pateles multiplican tu vida x20 por eso hay que comprar!!!!!! </p>
							
						</div>
					</div>
				</div>

			</div>

			<!--

				<div class="col-lg-4">
					<div class="sidebar-section">
						<div class="recent-posts">
							<h4>Posts recientes del Usuario</h4>
							<ul>
								<li><a>Pastel de vainilla bueno bonito</a></li>
							<<li><a href="single-news.php">A man's worth has its season, like tomato.</a></li>
								<li><a href="single-news.html">Good thoughts bear good fresh juicy fruit.</a></li>
								<li><a href="single-news.html">Fall in love with the fresh orange</a></li>
								<li><a href="single-news.html">Why the berries always look delecious</a></li> 	
							</ul>
						</div>
						<div class="archive-posts">
							<h4>Archive Posts</h4>
							<ul>
								<li><a href="single-news.html">JAN 2019 (5)</a></li>
								<li><a href="single-news.html">FEB 2019 (3)</a></li>
								<li><a href="single-news.html">MAY 2019 (4)</a></li>
								<li><a href="single-news.html">SEP 2019 (4)</a></li>
								<li><a href="single-news.html">DEC 2019 (3)</a></li>
							</ul>
						</div>
						
						<div class="tag-section">
							<h4>Filtros</h4>
							<ul>
								<li><a >Pastel</a></li>
								<li><a >Chocolate</a></li>
								<li><a >Postre</a></li>
								<li><a >Fresa</a></li>
								<li><a >Mora</a></li>
								<li><a >Cookie</a></li>
							</ul>
						</div>
					</div>
				</div>
			-->
				
			</div>
		</div>
	</div>
	<!-- end single article section -->

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
	<!-- Post Admin js-->
	<script src= "/views/assets/js/postAdmin.js"></script>
	<!-- main js -->
	<script src="/views/assets/js/main.js"></script>

</body>
</html>