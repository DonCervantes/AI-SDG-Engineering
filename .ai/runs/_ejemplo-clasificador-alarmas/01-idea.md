# 01 — Idea y recorte

## Problema de ingeniería

- Activo o proceso: línea de ensamble L-3
- Qué decide hoy un humano: tipo de defecto y si es P1/P2/P3
- Qué duele: 10–15 min reinterpretando textos de PLC distintos
- Para quién: técnico de calidad de turno

## Hipótesis

Si clasificamos cada alarma a un esquema fijo con umbral, entonces calidad prioriza en menos de 30 s, medido por tiempo hasta etiqueta en la demo.

## Qué queda fuera (obligatorio)

1. RAG sobre manuales de máquina.
2. Visión de piezas.
3. Agente que cierra NCR en el QMS real.

## Camino de demo (90 s)

Cola → ALM-441 (soldadura fría) → tipo `soldadura`, prioridad P1, confianza alta → ALM inventada → “no lo sé”.

## Clasificación

- [x] bounded

## Evidencia de dominio

- 8 alarmas sintéticas con códigos PLC
- Norma: la IA no libera lote ni para la línea
