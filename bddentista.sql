-- Script de creación de base de datos para Clínica Dental: bddentista
-- Generado para gestión integral de pacientes, citas, clínica y finanzas.

CREATE DATABASE IF NOT EXISTS bddentista;
USE bddentista;

-- 1. Módulo de Personas: Paciente
CREATE TABLE Paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    sexo ENUM('M', 'F', 'Otro'),
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion TEXT,
    curp VARCHAR(18) UNIQUE,
    grupo_sanguineo VARCHAR(5),
    alergias TEXT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Módulo de Personas: Dentista
CREATE TABLE Dentista (
    id_dentista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    cedula_profesional VARCHAR(50) UNIQUE NOT NULL,
    especialidad VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100),
    horario_disponibilidad TEXT
);

-- 3. Módulo de Citas y Atención: Cita
CREATE TABLE Cita (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_dentista INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    duracion_estimada INT COMMENT 'Duración en minutos',
    motivo TEXT,
    estado ENUM('Programada', 'Cancelada', 'Completada') DEFAULT 'Programada',
    notas TEXT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_dentista) REFERENCES Dentista(id_dentista)
);

-- 4. Módulo de Citas y Atención: Consulta
CREATE TABLE Consulta (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    id_cita INT UNIQUE,
    id_paciente INT NOT NULL,
    id_dentista INT NOT NULL,
    fecha DATE NOT NULL,
    diagnostico TEXT,
    observaciones TEXT,
    proxima_cita_sugerida DATE,
    FOREIGN KEY (id_cita) REFERENCES Cita(id_cita),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_dentista) REFERENCES Dentista(id_dentista)
);

-- 5. Módulo Clínico: Historia Clinica
CREATE TABLE Historia_Clinica (
    id_historia INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT UNIQUE NOT NULL,
    fecha_apertura TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    antecedentes_medicos TEXT,
    medicamentos_actuales TEXT,
    habitos TEXT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);

-- 6. Módulo Clínico: Tratamiento (Catálogo)
CREATE TABLE Tratamiento (
    id_tratamiento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    categoria VARCHAR(100),
    duracion_estimada_dias INT,
    costo_base DECIMAL(10, 2) NOT NULL
);

-- 7. Módulo Clínico: Tratamiento_Paciente (Plan de tratamiento)
CREATE TABLE Tratamiento_Paciente (
    id_tp INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_tratamiento INT NOT NULL,
    id_dentista INT NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado ENUM('Pendiente', 'En Proceso', 'Finalizado', 'Suspendido'),
    observaciones TEXT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_tratamiento) REFERENCES Tratamiento(id_tratamiento),
    FOREIGN KEY (id_dentista) REFERENCES Dentista(id_dentista)
);

-- 8. Módulo de Recetas: Receta
CREATE TABLE Receta (
    id_receta INT AUTO_INCREMENT PRIMARY KEY,
    id_consulta INT NOT NULL,
    id_paciente INT NOT NULL,
    id_dentista INT NOT NULL,
    fecha DATE NOT NULL,
    observaciones TEXT,
    FOREIGN KEY (id_consulta) REFERENCES Consulta(id_consulta),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_dentista) REFERENCES Dentista(id_dentista)
);

-- 9. Módulo Financiero: Factura
CREATE TABLE Factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    subtotal DECIMAL(10, 2) NOT NULL,
    descuento DECIMAL(10, 2) DEFAULT 0.00,
    impuestos DECIMAL(10, 2) NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    estado ENUM('Pagada', 'Pendiente', 'Anulada') DEFAULT 'Pendiente',
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);

-- 10. Módulo de Inventario: Producto
CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    categoria VARCHAR(100),
    unidad_medida VARCHAR(50),
    stock_actual INT DEFAULT 0,
    stock_minimo INT DEFAULT 5,
    proveedor VARCHAR(150)
);
