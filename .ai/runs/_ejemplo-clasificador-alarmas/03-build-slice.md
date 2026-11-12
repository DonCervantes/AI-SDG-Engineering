# 03 — Slice vertical

## Waves

| Wave | Slice | Depende de | Dueño | Criterio de hecho |
| --- | --- | --- | --- | --- |
| 1 | Clasificar alarma | — | Kai | 3 alarmas → 3 etiquetas distintas |
| 2 | Umbral + escalado | Wave 1 | Kai | Confianza baja muestra “escalar” |
| 3 | — | — | — | Fuera de 24 h |

## Slice 1

- Nombre: Clasificar alarma
- Wave: 1
- Historia: como calidad, pego el texto y veo tipo + prioridad.
- Endpoints: `POST /clasificar`
- Criterio: tres alarmas de la cola etiquetadas distinto.

## Bucle verify → fix

1. Verify: `pytest -q` + filas 1–3 de `04-verification.md`
2. Máx. 3 intentos; mismo error 2× → recortar taxonomía

## Pruebas del slice

- Feliz: ALM-441 soldadura fría → P1
- Vacío / sin red: banner
- No lo sé: texto de almacén (fuera de línea)

## Qué se recorta si no entra

- Histórico de NCR similares
