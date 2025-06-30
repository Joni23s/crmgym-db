
# 📌 Decisiones Técnicas – CRMGYM Base de Datos

Este documento resume las decisiones clave tomadas durante el diseño y modelado de la base de datos del CRM para gimnasios **CRMGYM**. Se justifican algunas elecciones en función de buenas prácticas, normalización, rendimiento y mantenibilidad.

---

## 1. Modelo Entidad-Relación y Normalización

- Se partió de un **modelo conceptual** (DER) para identificar entidades, relaciones y atributos.
- Luego se transformó en un **modelo lógico relacional**, aplicando hasta **Tercera Forma Normal (3FN)** para evitar redundancias y asegurar integridad de datos.
- Se usaron claves primarias simples (ej. `dni_cliente`, `id_plan`) o autogeneradas (`id_contacto`, `id_turno_cliente`) según necesidad.

---

## 2. Uso de ENUMs

- Se usaron columnas `ENUM` para valores de nulo o poco cambios:
  - `metodo_pago`: efectivo, tarjeta_credito, tarjeta_debito, transferencia
  - `estado` (en pagos): completado, pendiente, rechazado
  - `dia` (en turnos): Lunes a Domingo
- Esto mejora la validación de datos y simplifica el control desde la capa de aplicación.

---

## 3. Campos calculados (`GENERATED ALWAYS`)

- Se implementó `monto_final` en la tabla `pago` como campo **calculado automáticamente**:
  
  monto_final = monto_base - descuento_aplicado
  
- Evita inconsistencias y mantiene la lógica de negocio en la capa de datos.

---

## 4. Relaciones N:M

- Las relaciones **muchos a muchos** (por ejemplo, clientes que asisten a varios turnos) se resolvieron con **tablas intermedias**:
  - `turnos_clientes`
  - `historial_planes` (relación historica entre cliente y plan)

---

## 5. Integridad referencial

- Se utilizaron **claves foráneas con `ON DELETE CASCADE`** en los casos donde la eliminación del padre debe borrar sus hijos (ej. contactos o pagos de un cliente).
- Se agregaron `INDEX` a todas las claves foráneas para mejorar el rendimiento de joins.

---

## 6. Datos de prueba

- Se incluyeron datos de ejemplo en cada tabla (`INSERT INTO`) para permitir pruebas rápidas, depuración y visualización inicial.
- Esto facilita el desarrollo de prototipos de interfaz o lógica de backend sin depender de entornos externos.

---

## 7. Consideraciones futuras

- El modelo fue diseñado para integrarse fácilmente con una arquitectura backend en Java (JDBC, JPA o Spring Data).
- Se prevé sumar campos de auditoría (fecha de alta/modificación) y manejo de usuarios/admins en una siguiente etapa.

---

## ✍️ Autoría

Diseño y desarrollo por **Jonathan Araujo**, en colaboración con **Juan Martín Batiatto**
Estudiantes de la Tecnicatura Universitaria en Desarrollo de Software (ITU – UNCuyo).
