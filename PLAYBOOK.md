# Playbook de hackathon (ingeniería)

Usa este reloj. Si vas tarde, **corta alcance**, no añadas modelo.

## Reloj y freeze

Rellena en `.ai/CONTEXT.md` (inicio, fin, freeze, dueño de submission, plan-B).

| Momento | Qué pasa |
| --- | --- |
| T0 | Brief + roles; camino de 90 s escrito |
| T0 + 8 h | Debe existir *input de ingeniería → salida visible* (fin de wave 1) |
| Freeze | Solo ensayo, verificación y pitch. Nada de features nuevas sin permiso del dueño de submission |
| Entrega | Presenta el dueño de submission (o co-presenta con dominio) |

Si el equipo construye código con ≥2 agentes o ≥2 personas en paralelo, la orquestación vive en el **repo de código** (p. ej. [UAK](https://github.com/JoahanMorales/upiixia-agentic-kit) en modo `sprint`). Este playbook no se sustituye.

## 24 horas

| Bloque | Tiempo | Artefacto | Salida |
| --- | --- | --- | --- |
| Brief y roles | 30–45 min | `.ai/CONTEXT.md` | Quién decide, quién presenta, reloj, plan-B |
| Idea y recorte | 60 min | `01-idea.md` | Problema de ingeniería + qué NO se hace |
| Arquitectura mínima | 60 min | `02-architecture.md` | 1 patrón de IA, 1 fuente de datos, 1 fallback |
| Wave 1 / Slice 1 | 3 h | `03-build-slice.md` | Una pantalla o API que ya llama al modelo |
| Wave 2 / Slice 2 | 3 h | mismo archivo | El caso feliz de planta |
| Verificación | 90 min | `04-verification.md` | 5 casos, 1 hostil, 1 “no lo sé” |
| Pitch | 60 min | `05-pitch.md` | Demo de 90 s + métrica + siguiente paso |
| Buffer / ensayo | el resto | checklist demo | Ensayo con el reloj (después del freeze) |

## 48 horas

Añade wave 3 / slice 3 (segundo fallo real o una integración CMMS/manuales) y 30 min de ADR si hay una decisión irreversible (dónde vive el índice, on-prem vs API).

## Reglas de recorte

1. Un solo **camino de demo**. El jurado no recorre tu backlog.
2. El modelo puede fallar en público: el **fallback** es parte del producto.
3. Si a las 8 h no hay un input de ingeniería → salida visible, el alcance es demasiado grande.
4. No abras un agente de N pasos si un clasificador o un RAG de un corpus cerrado resuelve el problema.
5. Datos de planta: dataset sintético o anonimizado. Nada de IPs, recetas o PII.
6. Tras el **freeze**: no features nuevas; solo arreglo que desbloquea el guion de 90 s (con ok del dueño de submission).

## Rúbrica (obligatoria dos veces)

Usa [`checklists/rubrica-midhack.md`](checklists/rubrica-midhack.md):

1. **T+8 h** — go/no-go de wave 2.
2. **Pre-freeze** — listo para jurado o solo ensayo.

## Standup cada 3 horas (10 min)

- ¿Cuál es el camino de demo ahora?
- ¿Qué wave / slice está en curso?
- ¿Qué bloquea datos o API?
- ¿Qué se corta si no entra?
- ¿Cuánto falta para el freeze?
