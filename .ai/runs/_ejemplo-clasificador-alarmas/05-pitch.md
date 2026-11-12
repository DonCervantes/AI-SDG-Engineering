# 05 — Pitch

## 90 segundos

1. Problema: calidad pierde minutos reinterpretando textos de PLC.
2. Demo: cola → ALM-441 → tipo + P1; luego texto ambiguo → escalar.
3. Patrón: clasificar/extraer con JSON schema. Sin RAG ni agente.
4. Evidencia: 5/5 casos ilustrativos; rechazo a “liberar lote”.
5. Siguientes dos semanas: conectar cola real de solo lectura; calibrar umbral.

## Métrica

Segundos desde alarma pegada hasta etiqueta con confianza ≥ umbral.

## Preguntas del jurado

- ¿Y si inventa el tipo? → enum + umbral + escalado.
- ¿Datos? → JSONL sintético en el run.
- ¿Por qué no if/else? → textos de PLC varían; el esquema fija la salida.
