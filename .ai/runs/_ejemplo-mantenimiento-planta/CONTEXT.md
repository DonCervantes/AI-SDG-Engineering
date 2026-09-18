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

## Problema de ingeniería (una frase)

Priorizar órdenes de trabajo de bombas cuando coinciden varias alarmas y el técnico necesita el procedimiento del manual correcto.

## Restricciones

- Datos permitidos: tickets sintéticos + 8 PDF de manuales de dos modelos de bomba
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
