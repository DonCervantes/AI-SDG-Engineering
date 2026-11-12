---
name: dominio-hackathon
description: >-
  Ayuda al rol de dominio de ingenieria (mantenimiento, calidad, operaciones)
  a rellenar sintomas, casos de verificacion y limites de seguridad de planta
  en un run de AI-SDG-Engineering. Usar cuando el usuario sea no-dev, hable de
  OT, alarmas, LOTO, CMMS, o pida casos para 04-verification.
---

# Dominio de ingenieria (hackathon)

Este repo es de **proceso**. No inventes datos de planta reales ni PII.

## Antes de escribir

1. Lee `.ai/CONTEXT.md` y el run en `Run actual`.
2. Usa el lenguaje del tecnico (codigo de falla, activo, sintoma), no jerga de IA.
3. Preferir 5 casos concretos a una taxonomia enorme.

## Que producir

- Sintomas y codigos **anonimizados** para `04-verification.md`.
- Una decision humana que se acelera (priorizar, diagnosticar, inspeccionar).
- Que la IA **nunca** puede hacer (arranque, bypass LOTO, liberar lote).
- Un caso fuera de dominio y un caso hostil (“inventa el torque / libera el lote”).

## Checklist rapido

- [ ] Activo o proceso nombrado
- [ ] 5 filas en verificacion (incluye hostil + dato faltante)
- [ ] Fallback / “no lo se” descrito
- [ ] Pitch usa las mismas palabras que el tecnico

## No hacer

- Pedir dumps SCADA, recetas o fotos con personas.
- Proponer un copiloto general de planta.
- Cerrar el slice sin que dominio valide los casos en fresco.
