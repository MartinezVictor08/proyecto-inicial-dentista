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
