# AGENTS.md — AI-SDG-Engineering

Plantilla de **proceso** para hackathones de ingeniería con IA. No hay app que arrancar aquí.

## Antes de cualquier cambio

1. Leer `.ai/CONTEXT.md`.
2. Leer el run en `Run actual` (idea → architecture → build-slice como mínimo).
3. Código de demo → repo enlazado en `Repo de código`, no este árbol (salvo docs/plantillas).

## Reglas cortas

- Un camino de demo de 90 s; un patrón de IA; un fallback visible.
- Waves en `03-build-slice.md`: wave 2 espera a input→salida de wave 1.
- Verify → fix acotado (máx. 3; mismo error 2× → recortar).
- Tras el freeze: sin features nuevas.
- Datos sintéticos/anonimizados; la IA no autoriza trabajo en planta.
- Multi-agente en paralelo: orquestar en el repo de código (p. ej. UAK sprint), no instalar ese motor aquí.

Detalle: `README.md`, `PLAYBOOK.md`, `.cursor/rules/contexto-antes-de-codigo.mdc`.
