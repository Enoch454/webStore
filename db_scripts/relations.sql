USE webStore_db;

-- Usuarios_Roles
ALTER TABLE `Usuario_Rol`
ADD `idUsuario` INT ,
ADD `idRol` INT ;

Alter table Usuarios
Add `esActivo` BIT;

ALTER TABLE Usuario_Rol
ADD FOREIGN KEY (idRol)
REFERENCES Roles (idRol);

ALTER TABLE Usuario_Rol
ADD FOREIGN KEY (idUsuario)
REFERENCES Usuarios (idUsuario);

-- Usuarios
ALTER TABLE `Usuarios`
ADD `idPersona` INT ;

ALTER TABLE Usuarios
ADD FOREIGN KEY (idPersona)
REFERENCES Personas (idPersona);

-- Personas
ALTER TABLE `Personas`
ADD `idDomicilio` INT ;

ALTER TABLE Personas
ADD FOREIGN KEY (idDomicilio)
REFERENCES Domicilios (idDomicilio);

-- SuperAdmins
ALTER TABLE `SuperAdmins`
ADD `idUsuario` INT ;

ALTER TABLE SuperAdmins
ADD FOREIGN KEY (idUsuario)
REFERENCES Usuarios (idUsuario);

-- Admins
ALTER TABLE `Admins`
ADD `idUsuario` INT ;

ALTER TABLE Admins
ADD FOREIGN KEY (idUsuario)
REFERENCES Usuarios (idUsuario);

-- Compradores
ALTER TABLE Compradores
ADD idUsuario INT ;

ALTER TABLE Compradores
ADD FOREIGN KEY (idUsuario)
REFERENCES Usuarios (idUsuario);

-- Vendedores
ALTER TABLE Vendedores
ADD idUsuario INT ;

ALTER TABLE Vendedores
ADD FOREIGN KEY (idUsuario)
REFERENCES Usuarios (idUsuario);

-- Productos
ALTER TABLE Productos
ADD idVendedor INT ,
ADD idAdmin INT ,
ADD idCarritoCompra INT ;

ALTER TABLE Productos
ADD FOREIGN KEY (idVendedor)
REFERENCES Vendedores (idVendedor);

ALTER TABLE Productos
ADD FOREIGN KEY (idAdmin)
REFERENCES Admins (idAdmin);

ALTER TABLE Productos
ADD FOREIGN KEY (idCarritoCompra)
REFERENCES CarritoCompras (idCarritoCompra);

-- Carrito_Producto
ALTER TABLE Carrito_Producto
ADD idCarritoCompra INT ,
ADD idProducto INT ;

ALTER TABLE Carrito_Producto
ADD FOREIGN KEY (idCarritoCompra)
REFERENCES CarritoCompras (idCarritoCompra);

ALTER TABLE Carrito_Producto
ADD FOREIGN KEY (idProducto)
REFERENCES Productos (idProducto);

-- Lista_Producto
ALTER TABLE Lista_Producto
ADD idLista INT ,
ADD idProducto INT ;

ALTER TABLE Lista_Producto
ADD FOREIGN KEY (idLista)
REFERENCES Listas (idLista);

ALTER TABLE Lista_Producto
ADD FOREIGN KEY (idProducto)
REFERENCES Productos (idProducto);

-- Categoria_Producto
ALTER TABLE Categoria_Producto
ADD idCategoria INT ,
ADD idProducto INT ;

ALTER TABLE Categoria_Producto
ADD FOREIGN KEY (idCategoria)
REFERENCES Categorias (idCategoria);

ALTER TABLE Categoria_Producto
ADD FOREIGN KEY (idProducto)
REFERENCES Productos (idProducto);

-- Categorias
ALTER TABLE Categorias
ADD idVendedor INT ;

ALTER TABLE Categorias
ADD FOREIGN KEY (idVendedor)
REFERENCES Vendedores (idVendedor);

-- Listas
ALTER TABLE Listas
ADD idComprador INT ;

ALTER TABLE Listas
ADD FOREIGN KEY (idComprador)
REFERENCES Compradores (idComprador);

-- Cotizaciones
ALTER TABLE Cotizaciones
ADD idCarritoCompra INT ,
ADD idLista INT ,
ADD idProducto INT ;

ALTER TABLE Cotizaciones
ADD FOREIGN KEY (idCarritoCompra)
REFERENCES CarritoCompras (idCarritoCompra);

ALTER TABLE Cotizaciones
ADD FOREIGN KEY (idLista)
REFERENCES Listas (idLista);

ALTER TABLE Cotizaciones
ADD FOREIGN KEY (idProducto)
REFERENCES Productos (idProducto);

-- CarritoCompras
ALTER TABLE CarritoCompras
ADD idComprador INT ;

ALTER TABLE CarritoCompras
ADD FOREIGN KEY (idComprador)
REFERENCES Compradores (idComprador);

-- OrdenesCompra
ALTER TABLE OrdenesCompra
ADD idComprador INT ,
ADD idMetodoPago INT ;

ALTER TABLE OrdenesCompra
ADD FOREIGN KEY (idComprador)
REFERENCES Compradores (idComprador);

ALTER TABLE OrdenesCompra
ADD FOREIGN KEY (idMetodoPago)
REFERENCES MetodosPago (idMetodoPago);

-- DetallesOrdenCompra
ALTER TABLE DetallesOrdenCompra
ADD idOrdenCompra INT ,
ADD idProducto INT ;

ALTER TABLE DetallesOrdenCompra
ADD FOREIGN KEY (idOrdenCompra)
REFERENCES OrdenesCompra (idOrdenCompra);

ALTER TABLE DetallesOrdenCompra
ADD FOREIGN KEY (idProducto)
REFERENCES Productos (idProducto);

-- Pagos
ALTER TABLE Pagos
ADD idOrdenCompra INT ;

ALTER TABLE Pagos
ADD FOREIGN KEY (idOrdenCompra)
REFERENCES OrdenesCompra (idOrdenCompra);

-- Valoraciones
ALTER TABLE Valoraciones
ADD idDetalleOC INT ;

ALTER TABLE Valoraciones
ADD FOREIGN KEY (idDetalleOC)
REFERENCES DetallesOrdenCompra (idDetalleOC);

-- ProdMultimedias
ALTER TABLE ProdMultimedias
ADD idProducto INT ;

ALTER TABLE ProdMultimedias
ADD FOREIGN KEY (idProducto)
REFERENCES Productos (idProducto);

-- Especificaciones
ALTER TABLE Especificaciones
ADD idProducto INT ;

ALTER TABLE Especificaciones
ADD FOREIGN KEY (idProducto)
REFERENCES Productos (idProducto);

-- RespuestasEspec
ALTER TABLE RespuestasEspec
ADD idCotizacion INT ,
ADD idEspec INT ;

ALTER TABLE RespuestasEspec
ADD FOREIGN KEY (idCotizacion)
REFERENCES Cotizaciones (idCotizacion);

ALTER TABLE RespuestasEspec
ADD FOREIGN KEY (idEspec)
REFERENCES Especificaciones (idEspec);




