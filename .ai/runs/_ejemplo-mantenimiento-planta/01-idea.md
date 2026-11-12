# 01 — Idea y recorte

## Problema de ingeniería

- Activo o proceso: bombas centrífugas B-200 en sala de utilidades
- Qué decide hoy un humano: qué OT atender primero y qué procedimiento aplicar
- Qué duele: 25–40 min buscando el manual del modelo equivocado; OT de ruido se comen a las de sello
- Para quién: técnico de mantenimiento de turno

## Hipótesis

Si clasificamos el ticket y recuperamos el apartado del manual del **mismo modelo de bomba**, entonces el técnico llega al procedimiento en menos de 2 minutos, medido por tiempo hasta cita correcta en la demo.

## Qué queda fuera (obligatorio)

1. Predicción a 30 días con sensores (no hay serie temporal limpia).
2. Agente que abre y cierra OT en el CMMS real.
3. Visión de sellos (no hay fotos representativas).

## Camino de demo (90 s)

Inbox → síntoma B-204 (fuga en sello) → prioridad alta + cita Manual-Acme-X3 §4.2 → caso de bomba de otro modelo no mezcla procedimientos.

## Clasificación

- [x] bounded

## Evidencia de dominio

- Tickets sintéticos en `data/tickets_sinteticos.jsonl`
- Manuales sintéticos Acme X3 y Beta 9 en `data/manuales/`
- Norma interna: no ejecutar trabajo en caliente sin LOTO; la IA no autoriza
