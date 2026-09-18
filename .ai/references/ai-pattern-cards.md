# Fichas de patrón (ingeniería)

Elige **una** ficha para el hackathon. Enlaza el capítulo largo del *AI System Design Guide* solo si te sobra tiempo después de la demo.

## 1. Prompt + herramientas

**Cuándo sí:** consultar un procedimiento, calcular con una herramienta, rellenar un parte con campos fijos.

**Cuándo no:** el usuario necesita buscar en cientos de manuales o encadenar muchos sistemas.

**Stack mínimo:** un LLM + 1–3 funciones (consulta CMMS ficticio, calculadora, calendario).

**3 riesgos:** alucinación de códigos de falla; herramienta mal llamada; sin límite de pasos.

**3 tests:** código conocido → procedimiento correcto; código inventado → “no lo sé”; herramienta cae → mensaje de fallback.

## 2. RAG sobre corpus cerrado

**Cuándo sí:** manuales, normas, planos en PDF, histórico de OT de un activo.

**Cuándo no:** los documentos no caben o no están segmentados; necesitas acción en tiempo real sobre sensores.

**Stack mínimo:** chunking simple + embeddings + 1 índice + citas al archivo origen.

**3 riesgos:** chunk demasiado grande; citas falsas; mezclar manuales de dos modelos de máquina.

**3 tests:** pregunta con cita real; pregunta fuera de corpus; dos activos con nombres parecidos.

## 3. Clasificar / extraer (no chat)

**Cuándo sí:** tickets, fotos de etiqueta, códigos de alarma → prioridad, tipo de falla, campos estructurados.

**Cuándo no:** el jurado espera una conversación larga; las clases no están definidas.

**Stack mínimo:** esquema JSON + LLM o modelo pequeño + validación de campos.

**3 riesgos:** clases solapadas; umbral de confianza ausente; sesgo del dataset de ejemplo.

**3 tests:** ticket típico; ticket ambiguo (baja confianza); campo obligatorio vacío.

## 4. Agente acotado (3–5 pasos)

**Cuándo sí:** diagnosticar = consultar síntoma → buscar en manual → proponer 2 acciones con presupuesto.

**Cuándo no:** “que investigue toda la planta”. Sin presupuesto de pasos explota el tiempo y el coste.

**Stack mínimo:** bucle con tope de 5 herramientas + verificación humana antes de “cerrar OT”.

**3 riesgos:** bucles; acciones irreversibles; ocultar incertidumbre.

**3 tests:** caso de 2 pasos; caso que debe parar y preguntar; presupuesto agotado.

## 5. Visión / multimodal

**Cuándo sí:** el premio pide inspección visual (soldadura, etiquetas, desgaste) y tienes 10–20 imágenes de ejemplo.

**Cuándo no:** no hay imágenes representativas; la iluminación de planta no se puede simular.

**Stack mínimo:** modelo visión + lista de defectos + “insuficiente calidad de imagen”.

**3 riesgos:** overfitting a 3 fotos; no detectar “no se ve”; responsabilidad de seguridad.

**3 tests:** defecto claro; imagen borrosa; pieza correcta (sin falso positivo grave).

## Cómo elegir en 10 minutos

1. ¿La decisión es **etiquetar** algo? → clasificar/extraer.
2. ¿La verdad está en **documentos**? → RAG.
3. ¿Hay que **mirar**? → visión, solo con fotos.
4. ¿Hay que **llamar sistemas**? → prompt + herramientas.
5. ¿Hay un **diagnóstico de varios pasos** con tope? → agente acotado.

Si dudas entre 4 y 1, elige 1.
