CREATE DATABASE Banca_Digi2
USE Banca_Digi2

--CREAR LA TABLA CLIENTES
CREATE TABLE Clientes(
   ClienteID           VARCHAR(50) NOT NULL PRIMARY KEY
  ,Nombre_completo     VARCHAR(50) NOT NULL
  ,Ciudad              VARCHAR(50) NOT NULL
  ,Direccion           VARCHAR(255) NOT NULL
  ,Telefono            VARCHAR(15) NOT NULL
  ,Email               VARCHAR(100) NOT NULL
  ,Genero              VARCHAR(100) NOT NULL
  ,Fecha_nacimiento    DATE  NOT NULL
  ,Tipo_identificacion VARCHAR(100) NOT NULL
  ,Num_identificacion  INTEGER  NOT NULL
  ,Estado              VARCHAR(20) NOT NULL
);

SELECT * FROM Clientes

--CREAR LA TABLA CUENTAS
CREATE TABLE Cuentas(
    NumCuenta BIGINT PRIMARY KEY NOT NULL,
    ClienteID VARCHAR(50) NOT NULL,
    Tipo_cuenta VARCHAR(20) NOT NULL,
    Fecha_apertura DATE NOT NULL,
    Saldo FLOAT,
    Limite_credito FLOAT NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

SELECT * FROM Cuentas
--DROP TABLE IF EXISTS Cuentas;

--CREAR LA TABLA MORA
CREATE TABLE Mora(
MoraID VARCHAR(50) PRIMARY KEY NOT NULL,
NumCuenta BIGINT NOT NULL,
ClienteID VARCHAR(50) NOT NULL,
Monto_pendiente FLOAT NOT NULL,
Dias_mora INT NOT NULL,
Fecha_actualizacion DATE,
FOREIGN KEY (NumCuenta) REFERENCES Cuentas(NumCuenta),
FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

SELECT * FROM Mora

--CREAR LA TABLA PRODUCTOS
CREATE TABLE Productos(
ProductoID VARCHAR(50) PRIMARY KEY NOT NULL,
Tipo_producto VARCHAR(50) NOT NULL,
NumCuenta BIGINT NOT NULL,
Monto FLOAT NOT NULL,
Tasa_interes FLOAT,
Fecha_concesion DATE,
Estado_producto VARCHAR(20) NOT NULL,
FOREIGN KEY (NumCuenta) REFERENCES Cuentas(NumCuenta)
);

SELECT * FROM Productos

--CREAR LA TABLA TRANSACCIONES
CREATE TABLE Transacciones(
TransaccionID VARCHAR(50) PRIMARY KEY NOT NULL,
Fecha_transaccion DATE,
Monto_transaccion FLOAT NOT NULL,
Estado VARCHAR(50) NOT NULL,
NumCuenta BIGINT NOT NULL,
TipoPago VARCHAR(50) NOT NULL,
Descripcion TEXT,
FOREIGN KEY (NumCuenta) REFERENCES Cuentas(NumCuenta)
);

SELECT * FROM Transacciones

--DROP TABLE IF EXISTS Transacciones;
