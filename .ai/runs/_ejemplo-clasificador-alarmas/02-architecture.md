# 02 — Arquitectura mínima

## Patrón elegido

- Patrón: **3. Clasificar / extraer (no chat)**
- Por qué no RAG: no hay corpus; la decisión es etiquetar, no citar.

## Datos

- Fuente: `data/alarmas.jsonl`
- Mock: lista en memoria / POST
- Metadatos: `linea`, `codigo_plc`
- Qué no entra: nombres de operarios, lotes reales

## Flujo (texto)

1. Input: texto de alarma + `linea`.
2. LLM → JSON validado: `tipo_defecto`, `prioridad`, `confianza`.
3. Si `confianza` baja del umbral → escalar; no rellenar campos.
4. Fallback API caída: cola manual + banner.

## Contratos

- Input: `{ "texto": string, "linea": string }`
- Output: `{ "tipo_defecto": string, "prioridad": "P1|P2|P3", "confianza": number }`
- Acción prohibida: parar línea; cerrar NCR.

## Coste y latencia de demo

- Latencia &lt; 5 s
- Tope: 1 llamada al modelo

## Riesgos de ingeniería

| Riesgo | Mitigación en 24 h |
| --- | --- |
| Clases solapadas | Taxonomía fija de 5 tipos |
| Alucinación de código | Enum en JSON schema |
| API caída | Banner + CSV de respaldo |
