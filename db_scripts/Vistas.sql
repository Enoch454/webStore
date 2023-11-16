select * from Productos; -- 1 Aprobado, 2 En espera, 3 Rechazado
select * from vendedores;

-- Crear la vista productosEspera_admin
CREATE VIEW vw_productosEspera_admin AS
SELECT
    p.idProducto,
    p.Nombre,
    p.Descripcion,
    p.esCotizable,
    p.Precio,
    p.Stock,
    u.userName AS Vendedor
FROM
    productos p
JOIN
    vendedores v ON p.idVendedor = v.idVendedor
JOIN
    usuarios u ON v.idUsuario = u.idUsuario
WHERE
    p.Status = 2;
    
    select*from vw_productosEspera_admin;
    
    
    
-- Crear la vista vendedoresEspera_admin
CREATE VIEW vw_vendedoresEspera_admin AS
SELECT
    v.idVendedor,
    u.userName AS Usuario,
    CONCAT(p.Nombre, ' ', p.ApellidoPat, ' ', COALESCE(p.ApellidoMat, '')) AS NombreCompleto
FROM
    vendedores v
JOIN
    usuarios u ON v.idUsuario = u.idUsuario
JOIN
    personas p ON u.idPersona = p.idPersona
WHERE
    v.Status = 2;    
    
    
select*from vw_vendedoresEspera_admin;

-- Crear la vista de ver los vendedores aprobados
CREATE VIEW vw_vendedoresAprobados_admin AS
SELECT
    v.idVendedor,
    u.userName AS Usuario,
    CONCAT(p.Nombre, ' ', p.ApellidoPat, ' ', COALESCE(p.ApellidoMat, '')) AS NombreCompleto
FROM
    vendedores v
JOIN
    usuarios u ON v.idUsuario = u.idUsuario
JOIN
    personas p ON u.idPersona = p.idPersona
WHERE
    v.Status = 1;

select* from vw_vendedoresAprobados_admin;

-- Crear la vista de ver productos aprobados
CREATE VIEW vw_productosAprobados_admin AS
SELECT
    p.idProducto,
    p.Nombre AS NombreProducto,
    p.Descripcion,
    p.esCotizable,
    p.Precio,
    p.Stock,
    u.userName AS UsuarioVendedor
FROM
    productos p
JOIN
    vendedores v ON p.idVendedor = v.idVendedor
JOIN
    usuarios u ON v.idUsuario = u.idUsuario
WHERE
    p.Status = 1;
    
    select * from vw_productosAprobados_admin;
    
    
    -- Rechazados
    
-- Crear la vista de ver los vendedores rechazados
CREATE VIEW vw_vendedoresRechazados_admin AS
SELECT
    v.idVendedor,
    u.userName AS Usuario,
    CONCAT(p.Nombre, ' ', p.ApellidoPat, ' ', COALESCE(p.ApellidoMat, '')) AS NombreCompleto
FROM
    vendedores v
JOIN
    usuarios u ON v.idUsuario = u.idUsuario
JOIN
    personas p ON u.idPersona = p.idPersona
WHERE
    v.Status = 3;

select* from vw_vendedoresRechazados_admin;

-- Crear la vista de ver productos rechazados
CREATE VIEW vw_productosRechazados_admin AS
SELECT
    p.idProducto,
    p.Nombre AS NombreProducto,
    p.Descripcion,
    p.esCotizable,
    p.Precio,
    p.Stock,
    u.userName AS UsuarioVendedor
FROM
    productos p
JOIN
    vendedores v ON p.idVendedor = v.idVendedor
JOIN
    usuarios u ON v.idUsuario = u.idUsuario
WHERE
    p.Status = 3;
    
    select * from vw_productosRechazados_admin;    

-- Crear vista de consultar todas las ventas
CREATE VIEW vw_consultaVentas_admin AS
SELECT
    d.idProducto,
    p.Nombre AS NombreProducto,
    SUM(d.Cantidad) AS CantidadTotal,
    SUM(d.Subtotal) AS SubtotalTotal
FROM
    detallesordencompra d
JOIN
    productos p ON d.idProducto = p.idProducto
GROUP BY
    d.idProducto;


-- Crear la vista top 10 de más vendidoos
CREATE VIEW vw_top10Productos_home AS
SELECT
    d.idProducto,
    p.Nombre AS NombreProducto,
    SUM(d.Cantidad) AS CantidadTotalVendida
FROM
    detallesordencompra d
JOIN
    productos p ON d.idProducto = p.idProducto
GROUP BY
    d.idProducto
ORDER BY
    CantidadTotalVendida DESC
LIMIT 10;
