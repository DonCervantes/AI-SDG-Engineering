# 02 — Arquitectura mínima

## Patrón elegido

- Patrón: **3. Clasificar / extraer** + **2. RAG sobre corpus cerrado** (clasificador primero; RAG solo con el modelo de bomba ya identificado)
- Por qué no agente: el flujo es fijo (priorizar → citar). Un bucle no añade valor en 24 h.

## Datos

- Fuente: `data/tickets_sinteticos.jsonl` y `data/manuales/*.md` (sintéticos; no PDF de fabricante)
- Cómo se indexa: chunks de ~400 tokens con metadato `modelo_bomba`
- Metadatos: activo, modelo, planta
- Qué no entra: nombres de técnicos, IPs, recetas de proceso

## Flujo (texto)

1. Input: texto de ticket o alarma.
2. Clasificación JSON: `prioridad`, `tipo_falla`, `modelo_bomba`, `confianza`.
3. Si confianza ≥ umbral, RAG filtrado por `modelo_bomba` y cita de sección.
4. Si confianza baja o índice vacío: “escalar a supervisor”, sin procedimiento inventado.

## Contratos

- Input: `{ "texto": string, "activo_id": string }`
- Output: `{ "prioridad": "alta|media|baja", "tipo_falla": string, "citas": [...], "confianza": number }`
- Acción prohibida: cambiar estado de equipos; marcar OT como cerrada.

## Coste y latencia de demo

- Objetivo de latencia: < 8 s en el camino feliz
- Tope: 4 chunks recuperados

## Riesgos de ingeniería

| Riesgo | Mitigación en 24 h |
| --- | --- |
| Mezclar manuales Acme y Beta | filtro obligatorio por modelo |
| Alucinación de torque | citar o callar |
| API caída | respuesta cacheada del caso feliz + mensaje de degradación |
