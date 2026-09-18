# Antipatrones en hackathones de ingeniería

- **Copiloto general de planta.** No hay camino de demo ni dueño del error.
- **Agente para todo.** Un clasificador o un RAG cerrado suele bastar.
- **RAG sin citas.** El ingeniero no puede auditar.
- **Entrenar un modelo** en 24 h sin dataset etiquetado. Prefiere LLM + esquema o RAG.
- **Datos reales de planta en el repo.** Usa sintéticos.
- **Chat sin fallback.** El modelo dirá un torque inventado.
- **UI hermosa, cero casos de falla.** El jurado prueba el caso raro.
- **Ignorar seguridad física.** La IA no manda arrancar un motor sin confirmación humana.
- **Mezclar dos líneas o dos modelos de máquina** en el mismo índice sin metadatos.
- **Medir “precisión” con 3 ejemplos amigos.** Usa los 5 casos del template de verificación.
