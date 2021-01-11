# Laravel TEST

Backend project made with Laravel 8 using API features.

## Habilidades y elementos a evaluar:
1. Desarrollo de una API Rest
2. Aplicar especificaciones de desarrollo de API’s (JSON:API, OPEN API)
3. Buenas prácticas bajo el lenguaje que se esté desarrollando
4. Autenticación
5. Se deberá usar JWT u OAuth 2.0
6. Proceso de login con campos email y password.
7. Proceso de registro con campos nombre, teléfono, username, fecha de nacimiento, email y
password. Deberá validar que el email y username sean únicos.
8. Deberá tener validación de tipo de campo, por ejemplo, teléfono sólo deberá aceptar números.
9. Recuperación de contraseña, mediante un link de recuperación al email de usuario, el link deberá
vencer luego de 15 minutos.

## 3. Creación de CRUD’s (Usuarios, Productos)
1. CRUD de lista de usuarios registrados.
2 CRUD de productos, los campos de cada producto son: SKU, nombre, cantidad, precio,
descripción e imagen, siendo nombre, cantidad y precio campos obligatorios.
3. Cada listado deberá contener paginación.
4. Se deberá crear un buscador de productos, este deberá ser case insensitive, se podrá buscar por
nombre y por SKU.

## 4. Link de colección de endpoints en Postman
1. Incluir documentación respectiva
2. Manejo de respuestas HTTP

# How to test endpoints
1. Use POSTMAN documentation link:  https://documenter.getpostman.com/view/531434/TVzPmyoB
2. Use login to get and set JWT token before using other endpoints

# How to install project locally
1. Clone repository from GIT: https://github.com/takamirodriguez/test-takami.git
2. Generate a new .env file with your setting.
3. Use php artisan jwt:secret to generate a new key.
4. You can run migrations and seeders or import the MySQL Dump file "test_db.sql" from root directory.
5. Use PHP artisan serve
6. Connect POSTMAN to your local URL (Postman collection file is in root directory "API.postman_collection.json") 

