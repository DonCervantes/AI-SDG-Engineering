# Roles

Un equipo de 3–6 personas. Nadie “espera a los devs”: cada rol tiene dueño de archivo.

## Ingeniería de software / datos / ML

- Dueño de `02-architecture.md` y `03-build-slice.md`.
- Elige patrón (ver fichas), límites de tokens, latencia y fallback.
- Integra **una** fuente de datos demoable.
- No discute el problema en el código: está en `01-idea.md`.

## Dominio de ingeniería (mantenimiento, calidad, operaciones, civil, energía)

- Dueño de los **casos de prueba** en `04-verification.md`.
- Trae el lenguaje real: código de falla, activo, síntoma, procedimiento.
- Dice qué decisión humana se acelera (no “un chatbot”).
- Puede ser no programador.

## Producto / negocio / líder de equipo

- Dueño de `01-idea.md` y `05-pitch.md`.
- Recorta alcance. Protege el camino de 90 segundos.
- Presenta o co-presenta.

## Diseño (opcional)

- Dueño de `design-brief.md`.
- Journey del técnico de campo o del ingeniero de escritorio.
- Estados: cargando, sin datos, modelo inseguro, escalado a humano.

## Handoffs

```text
Dominio describe síntoma y decisión
        → Producto recorta y escribe la historia de demo
                → Ingeniería elige patrón y construye un slice
                        → Dominio valida los 5 casos
                                → Producto ensaya el pitch
```

Si UX o código necesitan cambiar una decisión ya escrita, se edita el Markdown **upstream** y se avisa. No se reconstruye el producto en silencio.
