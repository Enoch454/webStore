<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	

	<!-- title -->
	<title>Perfil</title>

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
						<p>¡Bienvenidx!</p>
						<h1>Perfil</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->


	<div class="container padding-bottom-3x mb-2">
		<div class="row">
			<div class="col-lg-4">
				<aside class="user-info-wrapper">
					<div class="user-cover" style="background-image: url(https://bootdey.com/img/Content/bg1.jpg);">
						
					</div>
					<div class="user-info">
						<div class="user-avatar">
							<a class="edit-avatar" href="#"></a><img src="assets/img/avaters/meek.jpg" alt="User"></div>
						<div class="user-data">
							<h4>Hatsune Miku</h4><span>Joined Oct 25, 2023</span>
						</div>
					</div>
				</aside>
				<nav class="list-group">
					<a class="list-group-item with-badge" href="productoVendedor.php"><i class=" fa fa-th"></i>Orderenes<span class="badge badge-primary badge-pill">6</span></a>
					<a class="list-group-item" href="account.php"><i class="fa fa-user"></i>Perfil</a>
					<a class="list-group-item" href="moderar.php"><i class="fa fa-map"></i>Administrar</a>
					<a class="list-group-item with-badge active" href="#"><i class="fa fa-tag"></i>Ventas<span class="badge badge-primary badge-pill">3</span></a>
					<a class="list-group-item with-badge" href="wishlist.php"><i class="fa fa-heart"></i>Wishlist<span class="badge badge-primary badge-pill">4</span></a>
				</nav>
			</div>
			<div class="col-lg-8">
				<div class="padding-top-2x mt-2 hidden-lg-up"></div>
				<!-- Wishlist Table-->
				<div class="table-responsive wishlist-table margin-bottom-none">
					<table class="table">
						<thead>
							<tr>
								<th>Productos</th>
								<th class="text-center"><a class="btn btn-sm btn-outline-danger" href="#">Limpiar table</a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div class="product-item">
										<a class="product-thumb" href="#"><img src="https://www.bootdey.com/image/220x180/FF0000/000000" alt="Product"></a>
										<div class="product-info">
											<h4 class="product-title"><a href="#">Pan de Elote</a></h4>
											<div class="text-lg text-medium text-muted">$43.90</div>
											<div>Disponibilidad:
												<div class="d-inline text-success">En Stock</div>
											</div>
											<div class="text-lg text-medium text-muted">2 en existencia</div>

											<div class="post-stars">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star-o"></i>
												
											</div>
										</div>
									</div>
								</td>
								<td class="text-center"><a class="remove-from-cart" href="#" data-toggle="tooltip" title="" data-original-title="Remove item"><i class="icon-cross"></i></a></td>
							</tr>
							<tr>
								<td>
									<div class="product-item">
										<a class="product-thumb" href="#"><img src="https://www.bootdey.com/image/220x180/87CEFA/000000" alt="Product"></a>
										<div class="product-info">
											<h4 class="product-title"><a href="#">Galletas Decoradas</a></h4>
											<div class="text-lg text-medium text-muted">$100.70</div>
											<div>Disponibilidad:
												<div class="d-inline text-warning">2 - 3 Semanas</div>
											</div>
											<div class="text-lg text-medium text-muted">0 en existencia</div>
											<div class="post-stars">
												
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star-o"></i>
												
											</div>
										</div>
									</div>
								</td>
								<td class="text-center"><a class="remove-from-cart" href="#" data-toggle="tooltip" title="" data-original-title="Remove item"><i class="icon-cross"></i></a></td>
							</tr>
							<tr>
								<td>
									<div class="product-item">
										<a class="product-thumb" href="#"><img src="https://www.bootdey.com/image/220x180/483D8B/000000" alt="Product"></a>
										<div class="product-info">
											<h4 class="product-title"><a href="#">Pastel de Frutas</a></h4>
											<div class="text-lg text-medium text-muted">$200.00</div>
											<div>Disponibilidad:
												<div class="d-inline text-success">En Stock</div>
											</div>
											<div class="text-lg text-medium text-muted">5 en existencia</div>
											<div class="post-stars">
												
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star-o"></i>
												
											</div>
										</div>
									</div>
								</td>
								<td class="text-center"><a class="remove-from-cart" href="#" data-toggle="tooltip" title="" data-original-title="Remove item"><i class="icon-cross"></i></a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<hr class="mb-4">
				
			</div>
		</div>
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
							<img src="assets/img/4001495.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="assets/img/awww.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="assets/img/pastelito.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="assets/img/cap.png" alt="">
						</div>
						<div class="single-logo-item">
							<img src="assets/img/pasteles.png" alt="">
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
	<!-- main js -->
	<script src="assets/js/main.js"></script>

	

</body>
</html>