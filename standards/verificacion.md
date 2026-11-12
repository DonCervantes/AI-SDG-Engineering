# Verificación proporcional

- **spike:** 2 casos. ¿Responde el modelo en el dominio?
- **bounded:** 5 casos + 1 hostil.
- **architectural:** 5 casos + contrato de datos + qué pasa si el índice está vacío.

## Bucle verify → fix

Antes de marcar un slice como hecho:

1. Define un verify (comando, script o checklist reproducible).
2. Máximo **3** intentos de fix por el mismo fallo.
3. Si el error se repite igual → anótalo en `03-build-slice.md` y **recorta** (no añadas modelo ni otra herramienta).
4. No declares éxito con capturas viejas. Reejecuta antes del jurado.

Si el repo de código usa UAK u otro harness, el verify del slice debe coincidir con el gate de ese repo; la evidencia de dominio sigue viviendo en `04-verification.md` de este run.
