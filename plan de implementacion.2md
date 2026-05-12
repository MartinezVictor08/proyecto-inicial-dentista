Este es el **Plan de Implementación Maestro** para la solución tecnológica **"Dentista"**. Como Senior Software Creator y Arquitecto de Soluciones, he diseñado esta hoja de ruta técnica detallada, asegurando la escalabilidad, la seguridad de los datos sensibles y una arquitectura limpia.

---

# 📑 Plan de Implementación Maestro: Aplicación "Dentista"

**Arquitectura:** Clean Architecture + Provider

**Stack:** Flutter & Firebase (Multiplataforma)

**Estética:** Professional Mint Blue (Modern UI)

---

## FASE 1: Configuración de Infraestructura y Ecosistema Firebase

Esta fase garantiza que el puente entre el frontend (Flutter) y el backend (Firebase) sea sólido y seguro.

### 1.1 Preparación del CLI (Interfaz de Línea de Comandos)

Antes de tocar el código, se debe asegurar la comunicación con los servidores de Google:

1. **Firebase Login:** Ejecutar `firebase login` en la terminal. Esto abrirá el navegador para autenticar la cuenta de Google asociada al proyecto.
2. **Verificación de Sesión:** Utilizar `firebase logout` en caso de necesitar cambiar de entorno de producción a desarrollo.
3. **Auditoría de Proyectos:** Ejecutar `firebase projects:list` para confirmar que el ID del proyecto está disponible y activo en la consola.

### 1.2 Configuración en Fireconsole

1. **Creación del Proyecto:** Acceder a [console.firebase.google.com](https://console.firebase.google.com) y crear el proyecto bajo el identificador único `bdtallermecanico` (Nota: Se utiliza este ID específico según requerimiento, aunque la lógica sea de clínica dental).
2. **Habilitación de Servicios:**
* **Authentication:** Activar el método de "Correo electrónico y contraseña".
* **Cloud Firestore:** Inicializar la base de datos en "Modo producción" y seleccionar la ubicación regional más cercana a los usuarios (ej. `us-central1`).
* **Storage:** Configurar las reglas de almacenamiento para las fotos de perfil de doctores y comprobantes de pago.



### 1.3 Vinculación Específica para Android

Para la integración nativa, se deben seguir estos pasos quirúrgicos:

1. **Registro de App:** En la consola, añadir una aplicación Android con el Package Name: `com.example.tallermecanico`.
2. **Descarga de Credenciales:** Descargar el archivo `google-services.json` y colocarlo estrictamente en la ruta `android/app/`.
3. **Edición de `build.gradle` (Nivel Proyecto):**
* Añadir la dependencia de classpath: `com.google.gms:google-services:4.3.x`.


4. **Edición de `build.gradle` (Nivel App):**
* Aplicar el plugin: `apply plugin: 'com.google.gms.google-services'`.
* Configurar `minSdkVersion` a 21 (mínimo requerido para Firebase) y `targetSdkVersion` a 33 o superior.
* Añadir la implementación de `platform('com.google.firebase:firebase-bom:x.x.x')`.



---

## FASE 2: Arquitectura de Software y Estructura de Directorios

Se utilizará una estructura basada en **Clean Architecture** para separar la lógica de negocio de la interfaz de usuario, facilitando el mantenimiento y las pruebas unitarias.

### 📁 Organización de la carpeta `lib/`

* `main.dart`: Punto de entrada que inicializa Firebase y configura los Providers globales.
* **`models/`**: (POJO - Plain Old Java Objects)
* `paciente_model.dart`, `doctor_model.dart`, `cita_model.dart`, `producto_model.dart`, etc.


* **`screens/`**: (UI Organizada por módulos)
* `auth/`: `login_screen.dart`, `register_screen.dart`.
* `home/`: `dashboard_screen.dart`.
* `doctors/`: `doctor_list_screen.dart`, `doctor_profile_screen.dart`.
* `services/`: `services_catalog_screen.dart`.
* `appointments/`: `calendar_screen.dart`, `booking_form.dart`.
* `payment/`: `checkout_screen.dart`, `payment_success_screen.dart`.
* `history/`: `medical_history_screen.dart`.


* **`providers/`**: (Gestión de Estado Reactivo)
* `auth_provider.dart`: Maneja el flujo de login/logout y roles de usuario.
* `appointment_provider.dart`: Gestión de lógica de horarios y selección de citas.
* `cart_provider.dart`: Maneja los servicios seleccionados antes de la facturación.


* **`services/`**: (Lógica de comunicación externa)
* `firebase_auth_service.dart`: Métodos `signIn`, `signUp`, `resetPassword`.
* `firestore_db_service.dart`: Operaciones CRUD para todas las colecciones.
* `storage_service.dart`: Subida de imágenes y documentos.


* **`widgets/`**: (Componentes Atómicos Reutilizables)
* `custom_button.dart`: Botones con el estilo "Mint Blue".
* `doctor_card.dart`: Tarjeta visual para perfiles médicos.
* `custom_input.dart`: Campos de texto validados.


* **`utils/`**:
* `constants.dart`: Definición de la paleta: `Color(0xFFB2EBF2)` (Mint Blue Light) y `Color(0xFF0097A7)` (Mint Blue Dark).
* `validators.dart`: Regex para emails, CURP y teléfonos.



---

## FASE 3: Diseño del Modelo de Datos (Cloud Firestore)

Estructura de colecciones y subcolecciones optimizada para consultas rápidas.

### 3.1 Módulo de Personas

* **Colección `pacientes**`:
* `id`: String (UID de Firebase Auth)
* `nombre`: String | `apellidos`: String
* `fecha_nacimiento`: Timestamp
* `sexo`: String (M/F/O)
* `telefono`: String | `email`: String
* `curp`: String (Único)
* `grupo_sanguineo`: String
* `alergias`: List


* **Colección `doctores**`:
* `id`: String | `nombre`: String | `apellidos`: String
* `cedula_profesional`: String
* `especialidad`: String
* `telefono`: String
* `foto_url`: String


* **Colección `empleados**`:
* `id`: String | `nombre`: String | `rui`: String
* `telefono`: String | `fecha_contratacion`: Timestamp



### 3.2 Módulo Clínico (Estructura Jerárquica)

* **Colección `historias_clinicas**`:
* `id_historia`: String | `id_paciente`: String (Indexado)
* `fecha_apertura`: Timestamp
* `antecedentes`: String | `medicamentos`: String
* **Subcolección `odontogramas**`:
* `id_odontograma`: String | `fecha`: Timestamp | `observaciones`: String
* **Subcolección `dientes**`:
* `numero_pieza`: int | `estado`: String (Caries, Ausente, Sellado) | `observacion`: String







### 3.3 Módulo de Citas y Consultas

* **Colección `citas**`:
* `id_cita`: String | `id_paciente`: String | `id_dentista`: String
* `fecha_hora`: Timestamp | `estado`: String (Pendiente, Completada, Cancelada) | `motivo`: String


* **Colección `consultas**`:
* `id_consulta`: String | `id_cita`: String | `diagnostico`: String | `observaciones`: String


* **Colección `tratamientos_paciente**`:
* `id`: String | `id_paciente`: String | `fecha_inicio`: Timestamp | `estado`: String (En curso/Finalizado)



### 3.4 Módulo de Prescripciones y Financiero

* **Colección `recetas**`:
* `id_receta`: String | `id_consulta`: String | `detalles`: List {`medicamento`, `dosis`, `frecuencia`}


* **Colección `facturas**`:
* `id_factura`: String | `id_paciente`: String | `total`: double | `estado`: String (Pagada/Pendiente)


* **Colección `pagos**`:
* `id_pago`: String | `id_factura`: String | `monto`: double | `metodo_pago`: String



### 3.5 Módulo de Inventario

* **Colección `productos**`:
* `id_producto`: String | `nombre`: String | `stock_actual`: int | `stock_minimo`: int


* **Colección `movimientos_inventario**`:
* `id_movimiento`: String | `tipo`: String (Entrada/Salida) | `cantidad`: int | `fecha`: Timestamp



---

## FASE 4: Lógica de Negocio y Flujo de Usuario

### 4.1 Sistema de Roles (RBAC)

El sistema identificará el rol mediante un campo `role` en el documento del usuario en Firestore al iniciar sesión:

* **Paciente:** Acceso a perfil de doctores, agendamiento y su propio historial.
* **Dentista:** Gestión de odontogramas, consultas y recetas.
* **Admin:** Control total de inventario, finanzas y gestión de empleados.

### 4.2 User Journey (Flujo de Navegación)

1. **Dashboard (Home):** Visualización de próximas citas y accesos rápidos (ej. "Ver mi Odontograma").
2. **Módulo de Doctores:** Galería de especialistas. Al seleccionar uno, se cargan sus credenciales desde Firestore y se muestra su disponibilidad.
3. **Catálogo de Servicios:** Lista de procedimientos (Limpieza, Ortodoncia, etc.). Al dar click en "Agendar", el sistema pasa al `BookingFlow`.
4. **Booking & Payment Flow:**
* Paso A: Selección de fecha y hora (filtrando horas ya ocupadas en la DB).
* Paso B: Pantalla de Pago con el total calculado. Selección de método (Efectivo/Tarjeta).
* Paso C: Generación de ticket digital y actualización del stock de insumos básicos si aplica.


5. **Historial Clínico:** Vista cronológica tipo "Timeline" donde el paciente puede descargar sus recetas anteriores.

---

## FASE 5: Dependencias Críticas (`pubspec.yaml`)

Se seleccionan las librerías que garantizan el rendimiento y la estabilidad:

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # Core Firebase
  firebase_core: latest_version
  cloud_firestore: latest_version
  firebase_auth: latest_version
  firebase_storage: latest_version

  # Estado y Arquitectura
  provider: latest_version

  # Utilidades UI y Datos
  google_fonts: latest_version      # Para tipografía profesional
  intl: latest_version              # Formateo de fechas y moneda local
  font_awesome_flutter: latest_version # Iconografía médica
  uuid: latest_version              # Generación de IDs únicos locales
  cached_network_image: latest_version # Optimización de carga de fotos de doctores

```

---

## FASE 6: Próximos Pasos Técnicos

1. **Maquetación de Temas:** Configurar el `ThemeData` global en `main.dart` definiendo los colores Azul Menta.
2. **Security Rules:** Configurar las reglas de Firestore para que los pacientes solo puedan leer sus propios datos médicos.
3. **Implementación de Odontograma:** Desarrollo de un CustomPainter para representar gráficamente cada pieza dental y su estado.

Este plan constituye la base estructural del proyecto **Dentista**, asegurando que cada línea de código futura tenga un propósito dentro de una arquitectura profesional.

¡Excelente adición! Para que un proyecto de esta magnitud tenga éxito, la interfaz debe transmitir **higiene, confianza y modernidad**. Como Arquitecto de Soluciones, he diseñado esta nueva fase centrada en el **UI/UX (Interfaz y Experiencia de Usuario)**, definiendo la identidad visual "Professional Mint Blue" y la disposición de los elementos clave.

---

## 🎨 FASE 6: Diseño de Interfaz (UI) y Experiencia de Usuario (UX)

Esta fase define el lenguaje visual que se implementará en Flutter utilizando `Material Design 3` como base, personalizado para el entorno clínico.

### 6.1 Identidad Visual y Paleta de Colores

Utilizaremos una combinación de tonos fríos para evocar limpieza y calma, contrastando con blancos puros.

* **Color Primario (Mint Blue):** `0xFF00B4D8` – Utilizado en botones de acción principal (CTA) y encabezados.
* **Color Secundario (Soft Mint):** `0xFFCAF0F8` – Fondos de tarjetas, campos de entrada y estados de "seleccionado".
* **Color de Acento (Teal):** `0xFF0077B6` – Para iconos críticos, enlaces y estados activos.
* **Superficies:** `0xFFF8FDFF` – Un blanco con matiz azulado para evitar la fatiga visual del blanco puro.
* **Tipografía:** * *Montserrat* (Headings): Para títulos de secciones, transmitiendo firmeza.
* *Open Sans* (Body): Para lectura de expedientes y datos técnicos, priorizando la legibilidad.



### 6.2 Diseño de Pantallas Clave

#### A. El Dashboard Principal (Paciente)

Diseñado para ser un "centro de comando" intuitivo.

1. **Header Dinámico:** Saludo personalizado ("Hola, Juan") con una burbuja de notificación para la próxima cita.
2. **Carrusel de Doctores:** Tarjetas horizontales con la foto circular del doctor, nombre y especialidad, usando un ligero sombreado (`BoxShadow`) para dar profundidad.
3. **Grid de Accesos Rápidos:** Iconos grandes con bordes redondeados para "Nueva Cita", "Mi Historial", "Pagos" y "Tratamientos".

#### B. El Odontograma Interactivo (Vista Dentista)

Este es el componente técnico más importante del diseño.

* **Representación Visual:** Un esquema simétrico de la dentadura (32 piezas para adultos).
* **Interactividad:** Cada diente es un widget independiente (`GestureDetector`).
* *Tap:* Abre un modal para marcar estado (Caries, Corona, Ausente).
* *Codificación de Color:* Rojo (Caries detectada), Azul (Tratamiento realizado), Verde (Sano).


* **Zoom y Pan:** Implementación de `InteractiveViewer` para que el dentista pueda enfocarse en cuadrantes específicos (Superior Izquierdo, Inferior Derecho, etc.).

#### C. Catálogo de Servicios y Agendamiento

* **Lista de Servicios:** Estilo "Clean List". Cada servicio tiene un icono minimalista, descripción breve y precio en negrita.
* **Calendario de Citas:** Un `TableCalendar` personalizado en tonos azul menta.
* Los días con disponibilidad tienen un punto sutil debajo.
* Las horas se presentan en "Chips" de selección rápida.



### 6.3 Elementos de UX (Microinteracciones)

* **Loading States:** Skeletons (animaciones de carga desvanecidas) en lugar de spinners aburridos para las fotos de los doctores.
* **Transiciones de Hero:** Al tocar la foto de un doctor en la lista, esta se expande suavemente hacia la pantalla de perfil usando el widget `Hero` de Flutter.
* **Feedback Táctico:** Uso de `HapticFeedback` (vibración ligera) al confirmar una cita o completar un pago.

---

## 🏗️ FASE 7: Prototipado y Wireframing Técnico

Antes de escribir el código de los widgets, el flujo se organiza mediante la siguiente jerarquía de componentes:

| Componente | Descripción Visual | Función UX |
| --- | --- | --- |
| **MintAppBar** | Fondo azul menta degradado, logo minimalista a la izquierda. | Navegación global y perfil. |
| **DoctorProfileCard** | Imagen con `BorderRadius.circular(20)`, badge de especialidad. | Generar confianza inmediata. |
| **StatusChip** | Píldora de color (Verde: Pagado, Naranja: Pendiente). | Identificación rápida de estados financieros. |
| **ActionBottomBar** | Barra fija inferior con botón "Confirmar y Pagar" en azul vibrante. | Reducir la fricción en la conversión. |

---

## FASE 8: Estrategia de Responsividad (Multiplataforma)

Dado que es una app multiplataforma, el diseño se adapta:

* **Mobile (Android/iOS):** Navegación mediante `BottomNavigationBar`.
* **Tablet/Desktop (Admin):** Navegación mediante `NavigationRail` (barra lateral izquierda) para aprovechar el espacio horizontal, permitiendo ver el odontograma y el historial clínico simultáneamente en pantalla dividida.

### 📝 Resumen del Layout Final

La aplicación lucirá como un software médico de gama alta: **limpio, espacioso y altamente funcional**, donde el color azul menta actúa como guía visual para las acciones más importantes, eliminando el estrés visual común en las aplicaciones clínicas tradicionales.




## prompt 

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
