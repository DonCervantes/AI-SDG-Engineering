# 03 — Slice vertical (ejemplo)

## Waves (orden de construcción)

| Wave | Slice | Depende de | Dueño | Criterio de hecho |
| --- | --- | --- | --- | --- |
| 1 | Clasificar ticket | — | Leo | Tres tickets del inbox muestran etiqueta distinta |
| 2 | Citar manual | Wave 1 | Leo | B-204 (Acme) no cita el Beta 9 |
| 3 (solo 48 h) | — | — | — | Fuera de alcance en 24 h |

## Slice 1

- Nombre: Clasificar ticket
- Wave: 1
- Historia: como técnico, pego el síntoma y veo prioridad y tipo de falla.
- Archivos / endpoints: `POST /clasificar` (repo de código)
- Criterio de hecho: tres tickets del inbox muestran etiqueta distinta.

## Slice 2

- Nombre: Citar manual
- Wave: 2
- Historia: como técnico, veo el apartado del modelo correcto.
- Archivos / endpoints: `POST /recuperar` con filtro `modelo_bomba`
- Criterio de hecho: B-204 (Acme) no cita el Beta 9.

## Bucle verify → fix (acotado)

1. Comando de verify: `pytest -q` + re-correr filas 1–3 de `04-verification.md`
2. Intentos máximos antes de escalar / recortar: **3**
3. Si el mismo error se repite 2 veces → documentar y recortar (p. ej. soltar histórico de OT similares)

## Pruebas del slice

- Caso feliz: fuga de sello Acme X3
- Caso vacío / sin red: banner de degradación
- Caso “no lo sé”: alarma de un compresor (fuera de dominio)

## Qué se recorta si no entra

- Histórico de OT similares (nice-to-have)
