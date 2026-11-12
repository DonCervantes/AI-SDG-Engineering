# Contexto del equipo (ejemplo)

## Evento

- Nombre del hackathon: Hack Ingeniería 2026
- Duración: 24 h
- Fecha: 2026-09-18
- Premios o restricciones del organizador: datos sintéticos; no control de equipos reales

## Equipo

- Nombre: Torque
- Presenta: Marina (producto)
- Ingeniería: Leo
- Dominio: Andrés (mantenimiento predictivo)
- Producto: Marina
- Diseño: Nuria
- Dueño de submission (una persona): Marina

## Reloj (obligatorio)

- Inicio (fecha + hora + zona): 2026-09-18 09:00 America/Mexico_City
- Fin / entrega al jurado: 2026-09-19 09:00 America/Mexico_City
- **Freeze** (dejar de codear; solo ensayo y pitch): 90 min antes del fin
- Plan-B si cae la red: [x] video 20–40 s  [ ] portátil espejo  [x] captura del caso feliz

## Problema de ingeniería (una frase)

Priorizar órdenes de trabajo de bombas cuando coinciden varias alarmas y el técnico necesita el procedimiento del manual correcto.

## Restricciones

- Datos permitidos: tickets sintéticos + extractos Markdown de manuales Acme X3 y Beta 9 (`data/manuales/`)
- Lo que está prohibido: arrancar o parar equipos; datos de personas
- Stack: Python, una API de LLM, índice local
- APIs de modelos disponibles: la del evento

## Camino de demo (90 segundos)

1. El jurado ve un inbox de 3 OT abiertas.
2. El usuario pega el síntoma de la bomba B-204.
3. El sistema prioriza, clasifica el tipo de falla y cita el apartado del manual.
4. Si el modelo falla, se ve “baja confianza — escalar a supervisor” y no se inventa un torque.

## Clasificación

- [x] bounded

## Enlaces

- Repo de código: `github.com/ejemplo/torque-demo` (ficticio)
- Dataset: `data/tickets_sinteticos.jsonl` en este run
- Run actual: `.ai/runs/_ejemplo-mantenimiento-planta/`
- Orquestación en el repo de código (opcional): [ ] UAK sprint  [ ] otro  [x] no aplica
  - Cuándo sí UAK: ≥2 agentes o ≥2 personas editando el mismo repo de código en paralelo.
  - Este repo (AI-SDG) sigue siendo el de proceso; UAK no se instala aquí.
