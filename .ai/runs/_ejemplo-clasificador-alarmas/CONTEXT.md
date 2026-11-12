# Contexto del equipo (ejemplo — clasificador)

## Evento

- Nombre del hackathon: Hack Calidad 2026
- Duración: 24 h
- Fecha: 2026-11-11
- Premios o restricciones: datos sintéticos; sin control de línea

## Equipo

- Nombre: Etiqueta
- Presenta: Sofía (producto)
- Ingeniería: Kai
- Dominio: Elena (calidad)
- Producto: Sofía
- Diseño: —
- Dueño de submission: Sofía

## Reloj (obligatorio)

- Inicio: 2026-11-11 09:00 America/Mexico_City
- Fin / entrega: 2026-11-12 09:00 America/Mexico_City
- **Freeze:** 90 min antes del fin
- Plan-B: [x] video 20–40 s  [ ] portátil espejo  [x] captura del caso feliz

## Problema de ingeniería (una frase)

Clasificar alarmas de línea en tipo de defecto y prioridad para que calidad no pierda 15 min por alarma ambigua.

## Restricciones

- Datos: JSONL sintético de alarmas
- Prohibido: parar/arrancar línea; fotos de personas
- Stack: Python + LLM con salida JSON
- APIs: la del evento

## Camino de demo (90 segundos)

1. El jurado ve 4 alarmas en cola.
2. El usuario pega el texto de ALM-441.
3. El sistema devuelve `tipo_defecto`, `prioridad`, `confianza`.
4. Si confianza baja: “escalar a inspector” sin inventar código de defecto.

## Clasificación

- [x] bounded

## Enlaces

- Repo de código: `github.com/ejemplo/etiqueta-demo` (ficticio)
- Dataset: `data/alarmas.jsonl`
- Run actual: `.ai/runs/_ejemplo-clasificador-alarmas/`
- Orquestación: [x] no aplica
