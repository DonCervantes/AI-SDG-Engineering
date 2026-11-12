# 03 — Slice vertical

Un slice = UI o API + llamada de IA + dato real o mock. No “toda la plataforma”.

## Waves (orden de construcción)

Una wave = slices que pueden avanzar en paralelo. La wave 2 no empieza hasta que la 1 demuestre *input → salida visible*.

| Wave | Slice | Depende de | Dueño | Criterio de hecho |
| --- | --- | --- | --- | --- |
| 1 | | — | | Input de ingeniería → salida visible |
| 2 | | Wave 1 | | Caso feliz de planta en el camino de 90 s |
| 3 (solo 48 h) | | Wave 2 | | Segundo fallo o integración mock |

## Slice N

- Nombre:
- Wave:
- Historia: como [rol], quiero [acción], para [resultado de ingeniería].
- Archivos / endpoints (o rutas en el **repo de código**):
- Criterio de hecho: se puede mostrar en 90 s.

## Bucle verify → fix (acotado)

Por slice, antes de darlo por cerrado:

1. Comando de verify (tests, script o checklist manual):
2. Intentos máximos antes de escalar / recortar: **3**
3. Si el mismo error se repite 2 veces → documentar el error exacto y **recortar**, no añadir modelo.

## Pruebas del slice

- Caso feliz:
- Caso vacío / sin red:
- Caso “no lo sé”:

## Qué se recorta si no entra

-
