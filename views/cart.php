<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

	<!-- title -->
	<title>Carrito</title>

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
						<p>Postres recien hechos y delicioso</p>
						<h1>Carrito</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- cart -->
	<div class="cart-section mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-12">
					<div class="cart-table-wrap">
						<table class="cart-table">
							<thead class="cart-table-head">
								<tr class="table-head-row">
									<th class="product-remove"></th>
									<th class="product-image">Producto</th>
									<th class="product-name">Nombre</th>
									<th class="product-price">Precio unitario</th>
									<th class="product-quantity">Cantidad</th>
									<th class="product-total">Total</th>
								</tr>
							</thead>
							<tbody>
								<tr class="table-body-row">
									<td class="product-remove"><a href="#"><i class="far fa-window-close"></i></a></td>
									<td class="product-image"><img src="./views/assets/img/products/Cupcake.png" alt=""></td>
									<td class="product-name">Fresa</td>
									<td class="product-price">$85</td>
									<td class="product-quantity"><input type="number" placeholder="1"></td>
									<td class="product-total">1</td>
								</tr>
								<tr class="table-body-row">
									<td class="product-remove"><a href="#"><i class="far fa-window-close"></i></a></td>
									<td class="product-image"><img src="./views/assets/img/products/cocholate.png" alt=""></td>
									<td class="product-name">Chocolate Cream</td>
									<td class="product-price">$70</td>
									<td class="product-quantity"><input type="number" placeholder="1"></td>
									<td class="product-total">1</td>
								</tr>
								<tr class="table-body-row">
									<td class="product-remove"><a href="#"><i class="far fa-window-close"></i></a></td>
									<td class="product-image"><img src="./views/assets/img/products/galleta_chocolate.png" alt=""></td>
									<td class="product-name">Chocolate Chip Cookie</td>
									<td class="product-price">$35</td>
									<td class="product-quantity"><input type="number" placeholder="1"></td>
									<td class="product-total">1</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div class="col-lg-4">
					<div class="total-section">
						<table class="total-table">
							<thead class="total-table-head">
								<tr class="table-total-row">
									<th>Total</th>
									<th>Price</th>
								</tr>
							</thead>
							<tbody>
								<tr class="total-data">
									<td><strong>Subtotal: </strong></td>
									<td>$500</td>
								</tr>
								<tr class="total-data">
									<td><strong>IVA: </strong></td>
									<td>$45</td>
								</tr>
								<tr class="total-data">
									<td><strong>Total: </strong></td>
									<td>$545</td>
								</tr>
							</tbody>
						</table>
						<div class="cart-buttons">
							<a href="checkout.php" class="boxed-btn black">Check Out</a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- end cart -->

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

</body>
</html>