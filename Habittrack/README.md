# HABITTRACK

## Aplicación móvil para la gestión y seguimiento de hábitos personales

### Autor
* **Alex Rhoddo Pacheco**
* **GitHub:** [Cabellodeajinomen](https://github.com/Cabellodeajinomen/Examen-Final-HABITTRACK---GESTOR-DE-H-BITOS-PERSONALES.git)

---

# 1. Introducción

Actualmente muchas personas buscan mejorar aspectos de su vida personal mediante hábitos como estudiar diariamente, realizar actividad física, leer libros o mantener una alimentación saludable. Sin embargo, uno de los principales problemas es la falta de seguimiento y control sobre dichas actividades, lo que dificulta mantener la constancia y medir el progreso alcanzado.

HabitTrack surge como una solución tecnológica que permitirá a los usuarios registrar y monitorear sus hábitos diarios desde un dispositivo móvil. La aplicación ofrecerá herramientas para gestionar hábitos, registrar su cumplimiento y visualizar estadísticas de progreso de manera sencilla e intuitiva.

---

# 2. Objetivo de la Aplicación

Desarrollar una aplicación móvil multiplataforma utilizando Flutter que permita a los usuarios crear, administrar y realizar seguimiento a sus hábitos diarios mediante el registro de actividades y la visualización de estadísticas de cumplimiento.

La aplicación buscará fomentar la organización personal y la disciplina mediante herramientas que permitan al usuario conocer su avance y mantener un historial de sus actividades.

Asimismo, la información será almacenada en la nube utilizando Firebase (próximamente), permitiendo la persistencia de datos y el acceso seguro desde diferentes dispositivos.

---

# 3. Público Objetivo

La aplicación está dirigida a:

* Estudiantes que desean mejorar sus hábitos de estudio.
* Personas que realizan actividad física regularmente.
* Usuarios que desean desarrollar hábitos saludables.
* Personas interesadas en mejorar su productividad personal.

---

# 4. Funcionalidades de la Aplicación

## 4.1 Autenticación de Usuarios
La aplicación permitirá que cada usuario tenga una cuenta personal para gestionar sus hábitos de manera independiente.
* **Estado:** Interfaz de Login implementada y funcional.

## 4.2 Gestión de Hábitos
Permitirá administrar los hábitos que el usuario desea incorporar a su rutina diaria.
* **Estado:** Interfaz de creación de hábitos implementada (Nombre y Descripción).

## 4.3 Seguimiento Diario
Permitirá registrar el cumplimiento de cada hábito diariamente.
* **Estado:** Pantalla principal (Home) con lista visual de hábitos y estados de cumplimiento.

## 4.4 Estadísticas y Reportes
Permitirá visualizar información relacionada con el progreso del usuario.
* **Estado:** Pantalla de estadísticas con indicadores de cumplimiento y estructura para gráficos detallados.

---

# 5. Arquitectura General Propuesta

La aplicación utiliza una estructura organizada para facilitar el mantenimiento:
- `lib/main.dart`: Punto de entrada y configuración de tema (Material 3).
- `lib/screens/`: Vistas principales (Login, Home, Create, Statistics).
- `lib/widgets/`: Componentes reutilizables.
- `lib/models/`: Modelos de datos.

---

# 6. Tecnologías Utilizadas

* **Flutter & Dart:** Framework y lenguaje principal.
* **Material 3:** Diseño moderno y limpio.
* **GitHub:** Control de versiones.
* **Android Studio:** IDE de desarrollo.

---

# 7. Cómo ejecutar el proyecto

1.  **Clonar el repositorio:**
    ```bash
    git clone https://github.com/Cabellodeajinomen/Examen-Final-HABITTRACK---GESTOR-DE-H-BITOS-PERSONALES.git
    ```
2.  **Navegar a la carpeta:**
    ```bash
    cd Habittrack
    ```
3.  **Obtener dependencias:**
    ```bash
    flutter pub get
    ```
4.  **Ejecutar:**
    ```bash
    flutter run
    ```
