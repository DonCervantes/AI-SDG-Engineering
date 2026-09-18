# 03 — Slice vertical

## Slice 1

- Nombre: Clasificar ticket
- Historia: como técnico, pego el síntoma y veo prioridad y tipo de falla.
- Archivos / endpoints: `POST /clasificar`
- Criterio de hecho: tres tickets del inbox muestran etiqueta distinta.

## Slice 2

- Nombre: Citar manual
- Historia: como técnico, veo el apartado del modelo correcto.
- Archivos / endpoints: `POST /recuperar` con filtro `modelo_bomba`
- Criterio de hecho: B-204 (Acme) no cita el Beta 9.

## Pruebas del slice

- Caso feliz: fuga de sello Acme X3
- Caso vacío / sin red: banner de degradación
- Caso “no lo sé”: alarma de un compresor (fuera de dominio)

## Qué se recorta si no entra

- Histórico de OT similares (nice-to-have)
