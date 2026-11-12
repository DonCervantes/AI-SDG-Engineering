# AI-SDG-Engineering

Plantilla en español para equipos mixtos (técnicos y no técnicos) que quieren **participar en hackathones de problemas de ingeniería** con IA: fallos, mantenimiento, calidad, energía, logística de planta, tickets técnicos y documentación operativa.

Une dos ideas:

- **System design de IA:** elegir un patrón mínimo (prompt + herramientas, RAG, clasificador, agente acotado, visión).
- **Ingeniería visible:** cada decisión vive en un archivo corto, revisable, que sobrevive al chat.

No es un framework de agentes, ni una app lista para correr, ni un curso. Es un **reloj + roles + plantillas Markdown**. El código de la demo lo escribes tú (o tu equipo) en **otro repo**; este repo guarda el brief, la arquitectura, los casos de prueba y el pitch.

Licencia MIT. Inspirado en [ai-system-design-guide](https://github.com/ombharatiya/ai-system-design-guide) y [AI_Engineering_Kit](https://github.com/ArturVargas/AI_Engineering_Kit), recortado para **hackathon + ingeniería**.

---

## Qué necesitas antes de empezar

- Git y una cuenta de GitHub.
- Un equipo de **3–6 personas** (puede haber perfiles no programadores).
- Un hackathon (o un fin de semana) de **24 o 48 horas**.
- Un problema con:
  - un **activo o proceso** (máquina, línea, red, flota, obra);
  - **datos o documentos** (sensores, CMMS, manuales, planos, tickets);
  - una **decisión humana** que hoy tarda o falla (diagnóstico, priorización, inspección).
- Datos **sintéticos, públicos o anonimizados**. Nunca PII, recetas, IPs internas ni dumps de SCADA.

**No uses este template** si el alcance es “un copiloto general de ingeniería” o “un agente que hace de todo”. Recorta primero.

---

## Cómo usarlo (paso a paso)

Haz esto **en orden**. No saltes al código.

### 1. Copia este repositorio

En GitHub: **Use this template** → *Create a new repository* (recomendado), o clónalo:

```bash
git clone https://github.com/DonCervantes/AI-SDG-Engineering.git
cd AI-SDG-Engineering
```

Si el equipo ya tiene un repo de código (Python, web, etc.), **deja este repo como el de proceso** y enlázalo en `.ai/CONTEXT.md` → *Repo de código*.

### 2. Asigna roles (15 min)

Abre [`ROLES.md`](ROLES.md). Cada rol es dueño de archivos concretos. Nadie “espera a los devs”.

| Rol | Quién suele ser | Archivos que rellena |
| --- | --- | --- |
| Producto / líder | Alcance y pitch | `01-idea.md`, `05-pitch.md` |
| Dominio (mantenimiento, calidad, operaciones, civil, energía) | El problema real | casos en `04-verification.md` |
| Ingeniería / datos / ML | Patrón, datos, slice | `02-architecture.md`, `03-build-slice.md` |
| Diseño (opcional) | Journey y estados de error | `design-brief.md` |

Pistas por rol (checklist de una página):

- [`tracks/producto.md`](tracks/producto.md)
- [`tracks/dominio-ingenieria.md`](tracks/dominio-ingenieria.md)
- [`tracks/ingenieria.md`](tracks/ingenieria.md)
- [`tracks/diseno.md`](tracks/diseno.md)

### 3. Completa el brief del equipo (30–45 min)

Edita [`.ai/CONTEXT.md`](.ai/CONTEXT.md) **antes de abrir el chat de IA**. Rellena:

1. Nombre, duración y fecha del evento.
2. Quién presenta y quién es ingeniería / dominio / producto.
3. El problema en **una frase**.
4. Datos permitidos, lo prohibido, stack y APIs de modelos.
5. El **camino de demo de 90 segundos** (jurado ve → usuario hace → sistema responde → qué se ve si el modelo falla).
6. Reloj: inicio, fin, **freeze**, dueño de submission y plan-B (video / portátil espejo).
7. Clasificación: `spike` / `bounded` / `architectural` (marca una).
8. Enlace al **repo de código** (si ya existe).

Regla: ingeniería **no escribe código de producto** hasta que exista ese camino de 90 segundos.

### 4. Abre un run (carpeta de esta edición)

Un **run** es la carpeta de *este* hackathon. No edites las plantillas en `templates/` para el evento: cópialas.

**Recomendado** — script:

```powershell
.\scripts\new-run.ps1 nombre-del-equipo
# opcional: .\scripts\new-run.ps1 nombre-del-equipo -WithBaseline -WithAdr
```

```bash
chmod +x scripts/new-run.sh
./scripts/new-run.sh nombre-del-equipo
# opcional: ./scripts/new-run.sh nombre-del-equipo --baseline --adr
```

Sustituye `nombre-del-equipo` por un slug corto (sin espacios). Actualiza en `.ai/CONTEXT.md` la línea *Run actual*.

Si partes de un sistema existente, copia también el baseline: flag `-WithBaseline` / `--baseline`, o a mano desde [`.ai/references/baseline.md`](.ai/references/baseline.md). Si el equipo se pierde entre etapas, usa [`templates/stage-contract.md`](templates/stage-contract.md).

Estructura esperada:

```text
.ai/runs/AAAA-MM-DD-nombre-del-equipo/
  CONTEXT.md
  01-idea.md
  02-architecture.md
  03-build-slice.md
  04-verification.md
  05-pitch.md
  design-brief.md     # si hay UI; si no, déjalo o bórralo
```

Detalle: [`.ai/runs/README.md`](.ai/runs/README.md).

### 5. Rellena los artefactos en este orden

Sigue el reloj de [`PLAYBOOK.md`](PLAYBOOK.md). Si vas tarde, **corta alcance**; no añadas otro modelo.

| Orden | Tiempo (24 h) | Archivo en el run | Qué debe quedar escrito |
| --- | --- | --- | --- |
| 1 | 60 min | `01-idea.md` | Activo, decisión humana, hipótesis, **3 cosas fuera de alcance**, guion de 90 s |
| 2 | 60 min | `02-architecture.md` | **1** patrón de [`.ai/references/ai-pattern-cards.md`](.ai/references/ai-pattern-cards.md), **1** fuente de datos, **1** fallback |
| 3 | 3 h + 3 h | `03-build-slice.md` | **Waves:** wave 1 = input→salida; wave 2 = caso feliz de planta. Bucle verify→fix acotado |
| 4 | 90 min | `04-verification.md` | 5 casos + 1 hostil + 1 “no lo sé” |
| 5 | 60 min | `05-pitch.md` | Demo 90 s + métrica + siguiente paso |

Cómo elegir patrón (10 min), en este orden:

1. ¿La decisión es **etiquetar**? → clasificar / extraer.
2. ¿La verdad está en **documentos**? → RAG de corpus cerrado.
3. ¿Hay que **mirar** fotos? → visión, solo si tienes 10–20 imágenes de ejemplo.
4. ¿Hay que **llamar sistemas**? → prompt + 1–3 herramientas.
5. ¿Diagnóstico de varios pasos con tope? → agente acotado (3–5 pasos).

Si dudas entre agente y prompt+herramientas, elige prompt+herramientas.

Clasifica **antes** de implementar:

- **spike:** ¿la API o el modelo responde en el dominio?
- **bounded:** una función demoable sobre un flujo existente (lo habitual).
- **architectural:** solo si el premio depende de integración o datos reales.

En 48 h: añade un slice 3 (segundo fallo o integración CMMS/manuales) y, si hay una decisión irreversible, un ADR desde [`templates/adr.md`](templates/adr.md).

### 6. Construye la demo en el repo de código (patrón compañero)

Este template **no incluye servidor ni `npm start`**. Es el repo de **proceso**. El código vive en otro repo (o carpeta), enlazado en `.ai/CONTEXT.md`.

En `03-build-slice.md` documentas:

- qué repo / carpeta contiene el código;
- las **waves** (qué va en paralelo y qué espera);
- el comando para levantar la demo;
- el verify del slice y el tope de intentos;
- el input y el output (campos o JSON);
- el fallback visible si el modelo o la API caen.

**Orquestación multi-agente (opcional, en el repo de código):**

Si hay **≥2 agentes** o **≥2 personas** editando el mismo código en paralelo, instala allí un kit de coordinación — recomendado: [upiixia-agentic-kit](https://github.com/JoahanMorales/upiixia-agentic-kit) en modo `sprint`. **No** lo instales en este repo: aquí siguen mandando `CONTEXT.md`, roles y el pitch.

```bash
# En el repo de CÓDIGO (no en AI-SDG-Engineering):
git clone --depth 1 https://github.com/JoahanMorales/upiixia-agentic-kit ~/.uak-kit
bash ~/.uak-kit/install.sh --mode sprint .
```

En Windows usa **Git Bash** para UAK. Marca la casilla en `.ai/CONTEXT.md` → *Orquestación en el repo de código*.

Reglas de recorte (no negociables):

1. Un solo **camino de demo**. El jurado no recorre tu backlog.
2. El modelo puede fallar en público: el **fallback es parte del producto**.
3. Si a las 8 h no hay *input de ingeniería → salida visible*, el alcance es demasiado grande (wave 1 incompleta).
4. No abras un agente de N pasos si un clasificador o un RAG cerrado resuelve el problema.
5. Dataset sintético o anonimizado en el run o en el repo de código.
6. Tras el **freeze**: solo ensayo y arreglos del guion de 90 s.

Estándares cortos mientras construyes:

- [`standards/ingenieria.md`](standards/ingenieria.md)
- [`standards/verificacion.md`](standards/verificacion.md)
- [`standards/seguridad.md`](standards/seguridad.md)

Los agentes en Cursor deben leer el brief primero: [`.cursor/rules/contexto-antes-de-codigo.mdc`](.cursor/rules/contexto-antes-de-codigo.mdc) y [`AGENTS.md`](AGENTS.md).

### 7. Verifica y ensaya

- Dominio valida los casos de `04-verification.md` **antes** del jurado.
- Standup cada 3 horas (10 min): [`checklists/standup.md`](checklists/standup.md) (incluye minutos hasta el freeze).
- Rúbrica en **T+8 h** y **pre-freeze**: [`checklists/rubrica-midhack.md`](checklists/rubrica-midhack.md).
- Día de demo: [`checklists/demo.md`](checklists/demo.md) (freeze, plan-B, cronómetro 90 s, caso de fallo narrado).

### 8. Presenta con evidencia

El pitch vive en `05-pitch.md`. Primera diapositiva o terminal: nombre del equipo y roles. Si el jurado pregunta “¿por qué este diseño?”, enseña `02-architecture.md` y `04-verification.md`, no el historial del chat. Presenta el **dueño de submission** (o co-presenta con dominio).

---

## Aprende con los ejemplos (15–20 min)

Hackathones **ficticios** ya rellenados (la verificación es ilustrativa; no hay binario aquí):

| Ejemplo | Patrón | Carpeta |
| --- | --- | --- |
| Bombas / OT | Clasificar + RAG filtrado por modelo | [`.ai/runs/_ejemplo-mantenimiento-planta/`](.ai/runs/_ejemplo-mantenimiento-planta/) |
| Alarmas de línea | Solo clasificar / extraer | [`.ai/runs/_ejemplo-clasificador-alarmas/`](.ai/runs/_ejemplo-clasificador-alarmas/) |

1. Léelos en orden: `CONTEXT.md` → `01` … `05`.
2. Copia el que se parezca a tu problema y **cambia el activo**.
3. Lecciones: (bombas) clasificar + RAG filtrado gana al agente total; (alarmas) un JSON schema basta.

No trates los ejemplos como código de producción.

---

## Mapa del repositorio

```text
.ai/
  CONTEXT.md              Brief del equipo (editar primero; reloj + repo código)
  adr/                    Decisiones irreversibles (copiar templates/adr.md)
  workflow.yaml           Orden de etapas (idea → pitch)
  references/             Fichas de patrón, baseline, anti-patrones
  runs/                   Un directorio por hackathon (+ 2 ejemplos)
templates/                01–05 (waves), design-brief, adr, stage-contract
scripts/                  new-run.ps1 / new-run.sh
tracks/                   Checklist por rol
standards/                Ingeniería, verificación (verify→fix), seguridad
checklists/               Standup, demo, rúbrica T+8h / pre-freeze
.cursor/rules/            Leer CONTEXT + run antes de código
.cursor/skills/           Skill de dominio (casos y seguridad de planta)
AGENTS.md                 Misma regla para agentes multi-herramienta
PLAYBOOK.md               Reloj, freeze, waves 24 h / 48 h
ROLES.md                  Dueños de archivo y handoffs
CONTRIBUTING.md           Cómo aportar sin hinchar el kit
```

Handoff (no reconstruyas el producto en silencio):

```text
Dominio describe síntoma y decisión
        → Producto recorta y escribe la historia de demo
                → Ingeniería elige patrón y construye un slice
                        → Dominio valida los 5 casos
                                → Producto ensaya el pitch
```

Si el código obliga a cambiar una decisión, **edita el Markdown upstream** y avisa al dueño del archivo.

---

## Qué no hacer

- Subir `.env`, credenciales, dumps de planta o datos personales (`.gitignore` ya ignora `.env` y `.ai/runs/*/.secrets`).
- Tratar las salidas del modelo como **permiso de trabajo** o arranque de equipo.
- Mezclar manuales de dos modelos de máquina en el mismo índice sin metadatos.
- Empezar por UI o por un segundo patrón de IA “por si acaso”.
- Dejar el camino de demo solo en el chat.
- Instalar UAK (u otro motor multi-agente) **en este** repo de proceso: va en el repo de código.
- Seguir codeando features después del freeze.

---

## Origen y licencia

MIT. Cómo aportar: [`CONTRIBUTING.md`](CONTRIBUTING.md). No copies credenciales, PII ni datos de planta sensibles a los artefactos: usa identificadores y resúmenes.
