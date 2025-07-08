# FLUTTER---JOHN-MICHAEL-VASQUEZ-PRADA
FICHA 2925960
TRABAJO API + CRUD DE TABLAS DE MI PROYECTO

-- Tabla de categorías
CREATE TABLE categoria (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre_categoria VARCHAR(255) NOT NULL,
  descripcion_categoria VARCHAR(255) NOT NULL
);

-- Tabla de subcategorías
CREATE TABLE subcategoria (
  id_subcategoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre_subcategoria VARCHAR(255),
  descripcion_subcategoria VARCHAR(255) NOT NULL,
  id_categoria INT NOT NULL,
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

-- 🗂 Categorías y Subcategorías
INSERT INTO categoria (nombre_categoria, descripcion_categoria) VALUES
('Computadoras', 'Equipos de cómputo y accesorios'),
('Periféricos', 'Dispositivos externos como teclados y ratones'),
('Componentes de Hardware', 'Partes internas de una PC'),
('Sillas Gamer', 'Sillas ergonómicas para gaming'),
('Accesorios', 'Fundas, soportes y cables para PC'),
('Software', 'Licencias de software y antivirus'),
('Redes', 'Equipos para conexión a Internet'),
('Impresoras', 'Dispositivos de impresión y escaneo'),
('Almacenamiento', 'Discos duros y unidades flash'),
('Monitores', 'Pantallas para computadoras de alta resolución');

INSERT INTO subcategoria (nombre_subcategoria, descripcion_subcategoria, id_categoria) VALUES
('Laptops', 'Computadoras portátiles', 1),
('PCs de Escritorio', 'Computadoras de alto rendimiento', 1),
('Teclados', 'Teclados mecánicos y ergonómicos', 2),
('Ratones', 'Ratones ópticos y láser', 2),
('Memoria RAM', 'Módulos de memoria de alto rendimiento', 3),
('Procesadores', 'CPUs de última generación', 3),
('Sillas ergonómicas', 'Sillas con ajuste lumbar y reclinables', 4),
('Cables HDMI', 'Cables para transmisión de video', 5),
('Antivirus', 'Software de seguridad informática', 6),
('Routers WiFi', 'Dispositivos de conexión inalámbrica', 7);
