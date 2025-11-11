# Diesel Caruso - Sistema de Gestión de Taller Mecánico

# Base de datos

El proyecto incluye una base de datos SQL completa con registros de ejemplo. La base de datos tallermecanico contiene las siguientes tablas:

### Cliente: 
Almacena la información de los clientes del taller incluyendo nombre, teléfono y email. Contiene 15 clientes de ejemplo.

### Vehiculo: 
Registra los vehículos de los clientes con patente, marca, modelo y relación con el cliente propietario. Cada patente es única. Incluye 15 vehículos de ejemplo.

### Empleado: 
Guarda los datos del personal del taller con nombre y rol (Recepcionista, Mecánico, Administrativo, Jefe de Taller). Contiene 15 empleados de ejemplo.

### Turno: 
Gestiona las citas programadas con información del cliente, vehículo, fecha, hora, motivo y estado (Pendiente, Confirmado, Cancelado, Atendido). Incluye 15 turnos de ejemplo.

### IngresoTaller: 
Registra cada vez que un vehículo ingresa al taller, con fechas de entrada y salida, motivo del ingreso, trabajos realizados y empleado asignado. Contiene 15 ingresos de ejemplo.

### TrabajoRealizado: 
Detalla los trabajos específicos realizados en cada ingreso al taller, incluyendo descripción, costo y empleado que lo ejecutó. Incluye 15 trabajos de ejemplo.

La base de datos está completamente normalizada con relaciones entre tablas mediante claves foráneas, garantizando la integridad referencial de los datos.

# Pagina WEB

## Descripción del Proyecto

Sistema web para **Diesel Caruso**, taller mecánico especializado en motores diesel con más de 50 años de experiencia. Permite a los clientes solicitar turnos online y a los administradores gestionar las reservas.

## Tecnologías

HTML5, CSS y JavaScript

## Secciones de la Página

**Inicio:** Banner principal con información del taller, tres características destacadas (Experiencia, Rapidez, Confianza) y galería de imágenes animada.

**Servicios:** Lista de todos los servicios ofrecidos (cambio de aceite, reparación de motor, sistema de inyección, diagnóstico, mantenimiento, turbos, frenos, suspensión) con galería de fotos.

**Solicitar Turno:** Formulario para reservar turnos con campos para nombre, teléfono, email, fecha, horario (9:00-17:00), tipo de servicio y descripción del problema.

**Iniciar Sesión:** Acceso al sistema para clientes y administradores mediante email, contraseña y selección de tipo de usuario.

**Panel Admin:** Tabla con todos los turnos solicitados mostrando datos del cliente, fecha, hora, servicio y estado. Permite cambiar el estado de cada turno entre pendiente, confirmado y cancelado.

## Credenciales de Administrador

| Email | Contraseña |
|-------|------------|
| ramiromagallaness@gmail.com | Ramiro123 |
| nachotv.25@gmail.com | Nacho123 |
| vitopeluso1@gmail.com | Vito123 |

## Uso del Sistema

**Clientes:** Navegar por el sitio, ver servicios disponibles, completar el formulario de turnos y esperar confirmación del taller.

**Administradores:** Iniciar sesión, acceder al panel admin, revisar turnos solicitados y actualizar estados según corresponda.

## Estados de Turnos

**Pendiente:** Turno solicitado esperando confirmación.

**Confirmado:** Turno aprobado y agendado.

**Cancelado:** Turno no se realizará.

## Notas

Los turnos se solicitan entre las 9:00 y 17:00 horas. Todos los campos del formulario son obligatorios. Los cambios de estado se aplican automáticamente. El diseño es responsive y funciona en todos los dispositivos.

**Diesel Caruso** - Taller Mecánico Especializado en Motores Diesel

© 2025 Todos los derechos reservados
