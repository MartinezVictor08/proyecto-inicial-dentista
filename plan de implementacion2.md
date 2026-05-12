# 📘 PLAN MAESTRO DE IMPLEMENTACIÓN MEJORADO — PLATAFORMA CLÍNICA “DENTISTA”

# Arquitectura Empresarial Escalable con Flutter + Firebase

### Enfoque: Arquitectura Limpia + Diseño Modular + Patrón Repositorio

### UI/UX: Azul Menta Profesional

### Gestión Global de Estado: Provider

---

# 📦 DEPENDENCIAS PRINCIPALES (`pubspec.yaml`)

## Firebase

* firebase_core
* cloud_firestore
* firebase_auth
* firebase_storage
* firebase_messaging
* firebase_analytics
* cloud_functions

---

## Gestión de Estado

* provider

---

## UI/UX

* google_fonts
* flutter_svg
* lottie
* cached_network_image
* shimmer
* font_awesome_flutter

---

## Seguridad

* flutter_secure_storage
* local_auth

---

## Utilidades

* intl
* uuid
* go_router
* equatable
* image_picker
* table_calendar

---

# 🎯 OBJETIVO GENERAL DEL PROYECTO

La plataforma **Dentista** será un ecosistema clínico multiplataforma diseñado para clínicas dentales modernas, permitiendo:

* Gestión de pacientes
* Agenda médica inteligente
* Odontograma interactivo
* Expedientes clínicos digitales
* Facturación y pagos
* Control de inventario
* Gestión de personal médico
* Seguridad de datos clínicos sensibles
* Escalabilidad empresarial

La solución estará desarrollada con:

* Flutter (Frontend Multiplataforma)
* Firebase (Backend Serverless)
* Arquitectura Limpia
* Reglas de Seguridad Firebase
* Diseño UX clínico premium
* Provider para gestión global de estado

---

# 🏗️ ARQUITECTURA GENERAL DEL SISTEMA

La aplicación utilizará una arquitectura empresarial basada en separación estricta de responsabilidades.

## Capas Arquitectónicas

| Capa         | Responsabilidad                             |
| ------------ | ------------------------------------------- |
| Presentación | Pantallas, widgets, navegación y UX         |
| Aplicación   | Casos de uso y lógica de negocio            |
| Dominio      | Entidades puras y contratos                 |
| Datos        | Firebase, APIs y almacenamiento             |
| Núcleo       | Utilidades globales, constantes y seguridad |

---

# 📦 ESTRUCTURA COMPLETA DE CARPETAS

# 📁 `/lib`

```text
lib/
│
├── main.dart
├── app.dart
│
├── core/
│   ├── config/
│   │   ├── firebase_config.dart
│   │   ├── theme_config.dart
│   │   ├── routes_config.dart
│   │   └── env_config.dart
│   │
│   ├── constants/
│   │   ├── colores_app.dart
│   │   ├── tamanos_app.dart
│   │   ├── textos_app.dart
│   │   ├── colecciones_firestore.dart
│   │   └── iconos_app.dart
│   │
│   ├── errors/
│   │   ├── excepciones.dart
│   │   ├── fallos.dart
│   │   └── manejador_errores.dart
│   │
│   ├── network/
│   │   ├── verificador_internet.dart
│   │   └── conectividad_firebase.dart
│   │
│   ├── security/
│   │   ├── servicio_encriptacion.dart
│   │   ├── almacenamiento_seguro.dart
│   │   └── guardia_roles.dart
│   │
│   ├── services/
│   │   ├── servicio_notificaciones.dart
│   │   ├── almacenamiento_local.dart
│   │   ├── servicio_biometrico.dart
│   │   └── servicio_analiticas.dart
│   │
│   ├── utils/
│   │   ├── validadores.dart
│   │   ├── formateador_fecha.dart
│   │   ├── formateador_moneda.dart
│   │   ├── extensiones.dart
│   │   └── helpers.dart
│   │
│   └── widgets/
│       ├── loaders/
│       ├── dialogs/
│       ├── snackbars/
│       ├── cards/
│       └── buttons/
│
├── features/
│
│   ├── autenticacion/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── models/
│   │   │   ├── repositories/
│   │   │   └── services/
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   │
│   │   └── presentation/
│   │       ├── screens/
│   │       ├── widgets/
│   │       ├── controllers/
│   │       └── providers/
│
│   ├── pacientes/
│   ├── doctores/
│   ├── citas/
│   ├── odontograma/
│   ├── tratamientos/
│   ├── recetas/
│   ├── facturas/
│   ├── pagos/
│   ├── inventario/
│   ├── empleados/
│   ├── reportes/
│   ├── notificaciones/
│   └── dashboard/
│
├── providers/
│   ├── auth_provider.dart
│   ├── citas_provider.dart
│   ├── pacientes_provider.dart
│   ├── doctores_provider.dart
│   ├── pagos_provider.dart
│   ├── inventario_provider.dart
│   ├── odontograma_provider.dart
│   └── notificaciones_provider.dart
│
├── services/
│   ├── servicio_auth_firebase.dart
│   ├── servicio_firestore.dart
│   ├── servicio_storage.dart
│   ├── servicio_notificaciones.dart
│   └── servicio_analiticas.dart
│
├── widgets/
│   ├── botones/
│   ├── tarjetas/
│   ├── formularios/
│   ├── dialogs/
│   ├── inputs/
│   └── loaders/
│
├── utils/
│   ├── constantes.dart
│   ├── validadores.dart
│   ├── formateadores.dart
│   ├── temas.dart
│   └── rutas.dart
│
├── shared/
│   ├── componentes/
│   ├── layouts/
│   ├── animaciones/
│   ├── temas/
│   └── responsive/
│
└── firebase/
    ├── reglas_firestore/
    ├── indices_firestore/
    ├── funciones_cloud/
    └── reglas_storage/
```

---

# 🚀 FASE 1 — CONFIGURACIÓN DE INFRAESTRUCTURA

# Objetivo

Preparar el ecosistema técnico completo para garantizar:

* Seguridad
* Escalabilidad
* Integración estable
* Ambientes de desarrollo y producción

---

# 🔥 CONFIGURACIÓN FIREBASE CLI Y FIRECONSOLE

## Instalación Firebase CLI

```bash id="oq8e74"
npm install -g firebase-tools
```

---

## Login Firebase

```bash id="kgq9m8"
firebase login
```

---

## Logout Firebase

```bash id="cgjwfw"
firebase logout
```

---

## Ver proyectos Firebase

```bash id="jv25bg"
firebase projects:list
```

---

# Proyecto Firebase

## Nombre del Proyecto

```text id="1js1g8"
bdtallermecanico
```

---

# Configuración Android Firebase

## Nombre del paquete

```text id="wdjnv0"
com.example.tallermecanico
```

---

## Pasos

### 1. Registrar Aplicación Android

En Firebase Console:

```text id="m36lws"
Agregar App → Android
```

---

### 2. Descargar Archivo

```text id="7l8i9o"
google-services.json
```

Mover a:

```text id="ylu0eg"
android/app/google-services.json
```

---

### 3. Configuración Gradle (Proyecto)

Archivo:

```text id="2lbv9o"
android/build.gradle
```

Agregar:

```text id="vd6j0s"
classpath 'com.google.gms:google-services:4.3.15'
```

---

### 4. Configuración Gradle (Aplicación)

Archivo:

```text id="jlwm5d"
android/app/build.gradle
```

Agregar:

```text id="q55l4x"
apply plugin: 'com.google.gms.google-services'
```

---

### 5. SHA-1 y SHA-256

Obtener con:

```bash id="4g5hqf"
keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore
```

---

# 1.1 Configuración Firebase

## Authentication

Se habilitará:

* Correo y contraseña
* Recuperación de contraseña
* Verificación de correo
* Opcional:

  * Inicio con Google
  * Inicio con Apple

---

## Firestore Database

La base de datos se inicializará en:

* Modo producción
* Reglas seguras desde el inicio
* Índices optimizados

---

## Firebase Storage

Será utilizado para:

* Fotos de doctores
* Radiografías
* Documentos PDF
* Recetas médicas
* Tickets digitales

---

## Cloud Functions

Se utilizarán para:

* Automatización de pagos
* Generación de facturas
* Notificaciones
* Procesamiento de inventario
* Triggers clínicos

---

# 📊 FASE 2 — MODELO DE DATOS DETALLADO

# 👤 MÓDULO PERSONAS

# Colección: `Pacientes`

| Campo            | Tipo de dato |
| ---------------- | ------------ |
| id               | String       |
| nombre           | String       |
| apellidos        | String       |
| fecha_nacimiento | Timestamp    |
| sexo             | String       |
| telefono         | String       |
| email            | String       |
| curp             | String       |
| grupo_sanguineo  | String       |
| alergias         | String       |

---

# Colección: `Dentista`

| Campo              | Tipo de dato |
| ------------------ | ------------ |
| id                 | String       |
| nombre             | String       |
| apellidos          | String       |
| cedula_profesional | String       |
| especialidad       | String       |
| telefono           | String       |

---

# Colección: `Empleado`

| Campo              | Tipo de dato |
| ------------------ | ------------ |
| id                 | String       |
| nombre             | String       |
| rui                | String       |
| telefono           | String       |
| fecha_contratacion | Timestamp    |

---

# 🦷 MÓDULO CLÍNICO

# Colección: `Historia_Clinica`

| Campo          | Tipo de dato |
| -------------- | ------------ |
| id_historia    | String       |
| id_paciente    | String       |
| fecha_apertura | Timestamp    |
| antecedentes   | String       |
| medicamentos   | String       |

---

# Colección: `Odontograma`

| Campo          | Tipo de dato |
| -------------- | ------------ |
| id_odontograma | String       |
| id_historia    | String       |
| fecha          | Timestamp    |
| observaciones  | String       |

---

# Colección: `Diente`

| Campo          | Tipo de dato |
| -------------- | ------------ |
| id_diente      | String       |
| id_odontograma | String       |
| numero_pieza   | int          |
| estado         | String       |
| observacion    | String       |

---

# 📅 MÓDULO CITAS

# Colección: `Cita`

| Campo       | Tipo de dato |
| ----------- | ------------ |
| id_cita     | String       |
| id_paciente | String       |
| id_dentista | String       |
| fecha_hora  | Timestamp    |
| estado      | String       |
| motivo      | String       |

---

# Colección: `Consulta`

| Campo         | Tipo de dato |
| ------------- | ------------ |
| id_consulta   | String       |
| id_cita       | String       |
| id_dentista   | String       |
| id_paciente   | String       |
| fecha         | Timestamp    |
| diagnostico   | String       |
| observaciones | String       |

---

# Colección: `Tratamiento_Paciente`

| Campo          | Tipo de dato |
| -------------- | ------------ |
| id             | String       |
| id_paciente    | String       |
| id_tratamiento | String       |
| id_dentista    | String       |
| fecha_inicio   | Timestamp    |
| fecha_fin      | Timestamp    |
| estado         | String       |

---

# 💊 MÓDULO PRESCRIPCIONES

# Colección: `Receta`

| Campo         | Tipo de dato |
| ------------- | ------------ |
| id_receta     | String       |
| id_consulta   | String       |
| id_paciente   | String       |
| id_dentista   | String       |
| fecha         | Timestamp    |
| observaciones | String       |

---

# Colección: `Receta_Detalle`

| Campo       | Tipo de dato |
| ----------- | ------------ |
| id          | String       |
| id_receta   | String       |
| medicamento | String       |
| dosis       | String       |
| frecuencia  | String       |
| duracion    | String       |

---

# 💳 MÓDULO FINANCIERO

# Colección: `Factura`

| Campo       | Tipo de dato |
| ----------- | ------------ |
| id_factura  | String       |
| id_paciente | String       |
| fecha       | Timestamp    |
| subtotal    | double       |
| descuento   | double       |
| total       | double       |
| estado      | String       |

---

# Colección: `Pago`

| Campo       | Tipo de dato |
| ----------- | ------------ |
| id_pago     | String       |
| id_factura  | String       |
| fecha       | Timestamp    |
| monto       | double       |
| metodo_pago | String       |
| referencia  | String       |

---

# 📦 MÓDULO INVENTARIO

# Colección: `Producto`

| Campo         | Tipo de dato |
| ------------- | ------------ |
| id_producto   | String       |
| nombre        | String       |
| categoria     | String       |
| unidad_medida | String       |
| stock_actual  | int          |
| stock_minimo  | int          |
| proveedor     | String       |

---

# Colección: `Movimiento_Inventario`

| Campo         | Tipo de dato |
| ------------- | ------------ |
| id_movimiento | String       |
| id_producto   | String       |
| tipo          | String       |
| cantidad      | int          |
| fecha         | Timestamp    |
| motivo        | String       |

---

# 🔐 FASE 3 — LÓGICA DE USUARIOS Y SEGURIDAD

# Roles del Sistema

| Rol           | Permisos                 |
| ------------- | ------------------------ |
| Paciente      | Ver citas e historial    |
| Dentista      | Consultas y odontogramas |
| Administrador | Acceso completo          |

---

# Flujo de Acceso

## Paciente

```text id="k8u7e7"
Login → Dashboard Paciente → Citas → Historial → Pagos
```

---

## Dentista

```text id="b95fsq"
Login → Dashboard Dentista → Agenda → Consultas → Odontograma
```

---

## Administrador

```text id="9kxnl6"
Login → Dashboard Admin → Inventario → Finanzas → Empleados
```

---

# Seguridad Firestore

## Restricciones

| Usuario       | Acceso              |
| ------------- | ------------------- |
| Paciente      | Solo su información |
| Dentista      | Pacientes asignados |
| Administrador | Acceso global       |

---

# 📱 FASE 4 — FLUJO DE PANTALLAS

# 1. Inicio

Dashboard con:

* Próximas citas
* Pagos pendientes
* Historial reciente
* Tratamientos

---

# 2. Pantalla Doctores

Incluye:

* Foto
* Especialidad
* Experiencia
* Horarios

Al seleccionar:

```text id="5c7iv2"
Perfil del Doctor
```

Mostrar:

* Historial
* Pacientes atendidos
* Disponibilidad

---

# 3. Pantalla Servicios

Mostrar:

| Elemento    |
| ----------- |
| Nombre      |
| Descripción |
| Precio      |
| Duración    |

Botón:

```text id="klmls9"
Agendar
```

---

# 4. Flujo Citas y Pago

## Paso 1

Seleccionar horario.

---

## Paso 2

Formulario de cita.

---

## Paso 3

Pantalla de pago:

* Método
* Monto
* Referencia

---

## Paso 4

Confirmación:

* Ticket digital
* Código QR
* Resumen

---

# 5. Historial

Lista cronológica:

* Consultas
* Pagos
* Tratamientos
* Recetas

---

# 🦷 FASE 5 — ODONTOGRAMA INTERACTIVO

# Objetivo

Sistema visual dental interactivo.

---

# Componentes Técnicos

| Herramienta       | Uso              |
| ----------------- | ---------------- |
| SVG               | Mapa dental      |
| InteractiveViewer | Zoom             |
| CustomPainter     | Pintado dinámico |

---

# Estados Visuales

| Estado      | Color |
| ----------- | ----- |
| Sano        | Verde |
| Caries      | Rojo  |
| Tratamiento | Azul  |
| Ausente     | Gris  |

---

# 📈 FASE 6 — GESTIÓN DE ESTADO CON PROVIDER

# Arquitectura Provider

## Providers Principales

| Provider           | Función              |
| ------------------ | -------------------- |
| AuthProvider       | Login y sesión       |
| CitasProvider      | Gestión de citas     |
| PagosProvider      | Pagos                |
| DoctoresProvider   | Información doctores |
| InventarioProvider | Inventario           |
| PacientesProvider  | Pacientes            |

---

# Flujo de Estado

```text id="s6owbo"
UI → Provider → Servicio → Firebase
```

---

# Beneficios

* Centralización lógica
* UI reactiva
* Reutilización
* Escalabilidad

---

# 🚀 FASE 7 — OPTIMIZACIÓN Y ESCALABILIDAD

# Firestore

## Estrategias

* Índices compuestos
* Consultas paginadas
* Caché offline
* Lazy loading

---

# Flutter

## Optimización

* Widgets reutilizables
* Renderizado eficiente
* Carga diferida
* Compresión de imágenes

---

# 🧪 FASE 8 — TESTING Y QA

# Testing

| Tipo             | Objetivo       |
| ---------------- | -------------- |
| Unit Test        | Lógica         |
| Widget Test      | UI             |
| Integration Test | Flujo completo |

---

# 🚀 FASE 9 — DESPLIEGUE

# Ambientes

| Ambiente   | Uso             |
| ---------- | --------------- |
| Desarrollo | Desarrollo      |
| Staging    | QA              |
| Producción | Usuarios reales |

---

# CI/CD

Automatización:

* Builds Android
* Builds iOS
* Deploy Firebase Hosting
* Pruebas automáticas

---

# 🧠 CONCLUSIÓN ARQUITECTÓNICA

La plataforma “Dentista” queda diseñada como:

* Sistema clínico empresarial
* Arquitectura escalable
* Aplicación segura
* Ecosistema odontológico moderno
* Plataforma preparada para crecimiento real

La combinación de:

* Flutter
* Firebase
* Firestore
* Provider
* Arquitectura Limpia
* UI Azul Menta

permite construir una solución odontológica profesional comparable con software clínico premium internacional.

# 🎨 FASE 10 — SISTEMA DE COLORES Y DISEÑO VISUAL “MINT BLUE”

# Objetivo

Diseñar una identidad visual profesional enfocada en transmitir:

* Higiene clínica
* Confianza médica
* Tecnología moderna
* Claridad visual
* Experiencia premium

La interfaz deberá mantener una apariencia limpia, elegante y minimalista, optimizada para:

* Mobile
* Tablet
* Desktop
* Web

---

# 🟦 PALETA DE COLORES PRINCIPAL

## Colores Base del Sistema

| Elemento         | Color         | Código HEX |
| ---------------- | ------------- | ---------- |
| Primario         | Mint Blue     | #4FD1C5    |
| Secundario       | Soft Mint     | #81E6D9    |
| Accent           | Teal          | #319795    |
| Fondo Principal  | White Blue    | #F7FAFC    |
| Fondo Secundario | Ice White     | #EDF2F7    |
| Error            | Coral Red     | #F56565    |
| Éxito            | Emerald Green | #48BB78    |
| Advertencia      | Soft Orange   | #ED8936    |
| Texto Principal  | Dark Slate    | #1A202C    |
| Texto Secundario | Gray Blue     | #4A5568    |
| Bordes           | Soft Gray     | #CBD5E0    |

---

# 🎯 APLICACIÓN DE COLORES EN LA INTERFAZ

## Barra Superior (AppBar)

| Elemento | Color     |
| -------- | --------- |
| Fondo    | Mint Blue |
| Texto    | Blanco    |
| Íconos   | Blanco    |

---

## Botones

### Botón Primario

| Propiedad | Color     |
| --------- | --------- |
| Fondo     | Mint Blue |
| Texto     | Blanco    |
| Hover     | Teal      |

---

### Botón Secundario

| Propiedad | Color     |
| --------- | --------- |
| Fondo     | Blanco    |
| Borde     | Mint Blue |
| Texto     | Mint Blue |

---

## Inputs y Formularios

| Elemento     | Color     |
| ------------ | --------- |
| Fondo        | Blanco    |
| Borde Activo | Mint Blue |
| Placeholder  | Gray Blue |
| Error        | Coral Red |

---

# 🦷 COLORES DEL ODONTOGRAMA

## Estados Dentales

| Estado      | Color   | HEX     |
| ----------- | ------- | ------- |
| Diente sano | Verde   | #48BB78 |
| Caries      | Rojo    | #F56565 |
| Tratamiento | Azul    | #4299E1 |
| Ausente     | Gris    | #A0AEC0 |
| Implante    | Morado  | #9F7AEA |
| Corona      | Dorado  | #D69E2E |
| Endodoncia  | Naranja | #ED8936 |

---

# 📊 COLORES PARA DASHBOARDS Y REPORTES

## Dashboard Administrativo

| Métrica         | Color         |
| --------------- | ------------- |
| Ingresos        | Emerald Green |
| Gastos          | Coral Red     |
| Citas           | Mint Blue     |
| Inventario Bajo | Soft Orange   |

---

## Gráficas

| Tipo             | Color     |
| ---------------- | --------- |
| Línea principal  | Mint Blue |
| Línea secundaria | Teal      |
| Barras positivas | Verde     |
| Barras negativas | Rojo      |

---

# 🧠 PSICOLOGÍA DEL COLOR

## Mint Blue

Transmite:

* Limpieza
* Salud
* Tecnología
* Profesionalismo
* Calma

Ideal para sistemas médicos y odontológicos.

---

## Teal

Representa:

* Precisión
* Seguridad
* Innovación

Usado para acciones importantes y navegación.

---

## White Blue

Genera:

* Sensación clínica
* Claridad
* Espacios limpios
* Menos fatiga visual

---

# ✨ EFECTOS VISUALES Y ESTILO UI

# Sombras

## Tarjetas

| Propiedad | Valor       |
| --------- | ----------- |
| Blur      | 12          |
| Opacidad  | 0.08        |
| Color     | Negro suave |

---

# Bordes

| Elemento | Radio |
| -------- | ----- |
| Inputs   | 14px  |
| Botones  | 16px  |
| Tarjetas | 20px  |

---

# Animaciones

## Transiciones

* Fade
* Slide
* Scale
* Hero Animations

---

# Responsividad

## Mobile

* Navegación inferior
* Botones amplios
* Inputs táctiles

---

## Tablet

* Panel dividido
* Sidebar clínica

---

## Desktop

* Dashboard avanzado
* Multi panel
* Estadísticas simultáneas

---

# 🖋️ TIPOGRAFÍA OFICIAL

| Uso          | Fuente     |
| ------------ | ---------- |
| Títulos      | Montserrat |
| Contenido    | Open Sans  |
| Estadísticas | Poppins    |
| Formularios  | Inter      |

---

# 🎯 OBJETIVO UX FINAL

La interfaz deberá sentirse como:

* Un software médico premium
* Una plataforma clínica moderna
* Un ecosistema odontológico profesional
* Una aplicación rápida y elegante

El diseño “Mint Blue” permitirá diferenciar visualmente la plataforma frente a software clínico tradicionales, proporcionando una experiencia moderna, limpia y altamente intuitiva.



## PROMT 

Este es el **prompt definitivo y ultra-detallado**. Está diseñado para que no falte ni un solo campo de la base de datos ni una sola subcarpeta del proyecto.

Cópialo y pégalo tal cual en la IA que vayas a utilizar:

---

**COPIA DESDE AQUÍ:**

En este proyecto estamos trabajando en el diseño y desarrollo integral de una solución tecnológica avanzada para la gestión de una clínica odontológica profesional. El objetivo principal es construir una aplicación multiplataforma de alto rendimiento utilizando el framework **Flutter** y como entorno de desarrollo principal **Visual Studio Code**, integrando de manera robusta los servicios de **Firebase** mediante su consola (**Fireconsole**) para la gestión de datos en tiempo real, autenticación de usuarios y almacenamiento en la nube. Esta iniciativa busca digitalizar por completo el flujo de trabajo de un dentista, desde el primer contacto del paciente y la visualización de perfiles médicos de los doctores, hasta el control clínico detallado mediante odontogramas, la gestión de inventarios de productos médicos, y el procesamiento financiero de facturas y pagos. Todo esto se desarrollará bajo una arquitectura limpia y escalable, priorizando una experiencia de usuario moderna con una estética profesional basada en tonos azul menta, garantizando que el sistema sea capaz de manejar de forma segura la información sensible de los pacientes y la logística operativa de la clínica de manera eficiente y automatizada.

**Actúa como un Senior Software Creator y Arquitecto de Soluciones.** Genera un **Plan de Implementación Maestro** en formato Markdown para la aplicación "Dentista". **No proporciones código todavía**, quiero el procedimiento paso a paso con el máximo nivel de detalle técnico.

### 1. Configuración de Entorno y Firebase (Fireconsole)

Describe el proceso exacto para:

* **Comandos CLI:** Ejecución de `firebase login`, `firebase logout`, y `firebase projects:list`.
* **Proyecto:** Creación en Fireconsole del proyecto `bdtallermecanico`.
* **Vinculación Android:** Configuración del package name `com.example.tallermecanico`, descarga de `google-services.json` y edición de archivos `build.gradle` (nivel proyecto y nivel app).

### 2. Estructura de Carpetas Ultra-Específica (VS Code)

Define la organización de la carpeta `lib/` siguiendo una arquitectura limpia:

* `models/`: (Un archivo por cada entidad de la base de datos).
* `screens/`: Subcarpetas para `auth/`, `home/`, `doctors/`, `services/`, `appointments/`, `payment/`, `history/`.
* `providers/`: Clases de gestión de estado para autenticación, citas y carrito de servicios.
* `services/`: Clases `firebase_auth_service.dart`, `firestore_db_service.dart` y `storage_service.dart`.
* `widgets/`: Componentes reutilizables (botones azul menta, tarjetas de doctor, inputs).
* `utils/`: `constants.dart` (colores azul menta, estilos de texto) y `validators.dart`.

### 3. Modelo de Datos Detallado (Firestore Collections)

Especifica cada campo y su tipo de dato (String, int, double, timestamp, boolean) para las siguientes tablas:

* **Módulo Personas:** * `Pacientes`: id, nombre, apellidos, fecha_nacimiento, sexo, teléfono, email, curp, grupo_sanguineo, alergias.
* `Dentista`: id, nombre, apellidos, cedula_profesional, especialidad, teléfono.
* `Empleado`: id, nombre, rui, teléfono, fecha_contratacion.


* **Módulo Clínico:** * `Historia_Clinica`: id_historia, id_paciente, fecha_apertura, antecedentes, medicamentos.
* `Odontograma`: id_odontograma, id_historia, fecha, observaciones.
* `Diente`: id_diente, id_odontograma, numero_pieza, estado, observacion.


* **Módulo Citas:** * `Cita`: id_cita, id_paciente, id_dentista, fecha_hora, estado, motivo.
* `Consulta`: id_consulta, id_cita, id_dentista, id_paciente, fecha, diagnostico, observaciones.
* `Tratamiento_Paciente`: id, id_paciente, id_tratamiento, id_dentista, fecha_inicio, fecha_fin, estado.


* **Módulo Prescripciones:** * `Receta`: id_receta, id_consulta, id_paciente, id_dentista, fecha, observaciones.
* `Receta_Detalle`: id, id_receta, medicamento, dosis, frecuencia, duracion.


* **Módulo Financiero:** * `Factura`: id_factura, id_paciente, fecha, subtotal, descuento, total, estado.
* `Pago`: id_pago, id_factura, fecha, monto, metodo_pago, referencia.


* **Módulo Inventario:** * `Producto`: id_producto, nombre, categoria, unidad_medida, stock_actual, stock_minimo, proveedor.
* `Movimiento_Inventario`: id_movimiento, id_producto, tipo (entrada/salida), cantidad, fecha, motivo.



### 4. Lógica de Usuarios y Pantallas

* **Roles:** Define el flujo de acceso según el rol (Paciente, Dentista, Admin).
* **Flujo de Pantallas:**
1. **Inicio:** Dashboard con resumen médico.
2. **Doctores:** Perfil con fotos; al click, desplegar historial del doctor.
3. **Servicios:** Lista con descripción y precio; botón "Agendar" que lleva al formulario.
4. **Citas y Pago:** Pantalla de selección de horario -> Pantalla de pago (monto y método) -> Pantalla de confirmación con ticket.
5. **Historial:** Lista cronológica de citas del usuario autenticado.



### 5. Dependencias (pubspec.yaml)

Incluye: `firebase_core`, `cloud_firestore`, `firebase_auth`, `provider`, `intl` (fechas), `google_fonts`.

**ENTREGABLE:** Un documento Markdown estructurado, técnico y exhaustivo que sirva de guía de construcción. **NO CODIGO DART.**
