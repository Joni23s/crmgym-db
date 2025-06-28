# 🏋️‍♂️ CRMGYM – Base de Datos para CRM de Gimnasio

📊 Base de datos del CRM para gimnasios **CRMGYM**, con diseño relacional normalizado, manejo de clientes, pagos, planes, turnos e instructores. Incluye claves foráneas, uso de `ENUM`, cálculos automáticos y datos de prueba. Pensado para integrarse con backend Java.

---

## 📌 Descripción

Este proyecto contiene el diseño y estructura de la base de datos del CRM para gimnasios **CRMGYM**, desarrollado como parte de un sistema integral de gestión de clientes, pagos, turnos e instructores.

🔧 **Características principales:**
- Diseño relacional normalizado (hasta 3FN)
- Claves primarias y foráneas bien definidas
- Columnas `ENUM` para métodos de pago y días de semana
- Campo calculado (`monto_final`) con `GENERATED ALWAYS`
- Datos de prueba incluidos (`INSERT INTO`) para facilitar testing
- Soporte para relaciones N:M (ej. clientes ↔ turnos)

---

## 📁 Estructura del repositorio

crmgym-db/
├── schema/
│ └── crm_gym_egi.sql
├── diagramas/
│ └── modelo-logico.png # Opcional
├── notas/
│ └── decisiones-tecnicas.md # Opcional
└── README.md

📌 Requisitos
MySQL 8.0+ o MariaDB 10.4+
Cliente SQL o entorno como MySQL Workbench

### ▶️ Cómo usar (con MySQL Workbench)

1. **Abrí MySQL Workbench** e iniciá sesión en tu conexión local o remota.
2. Importá el archivo SQL desde el menú:

   * `File` > `Open SQL Script...`
   * Buscá y seleccioná `crm_gym.sql` dentro de la carpeta `schema/`
   * Se abrirá en una nueva pestaña.
4. Ejecutá todo el script (Ctrl + Shift + Enter o el rayo doble ⚡).
5. ¡Listo! La base de datos estará creada con su estructura y datos de prueba.

📬 Contacto
Hecho por Jonathan Araujo en colaboración con Juan Martín Batiatto
Estudiante en Desarrollo de Software – ITU | UNCuyo
Desarrollador Java | Apasionado por bases de datos y proyectos sólidos 🔥

