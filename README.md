# AI-SDG-Engineering

**Plantilla en español** para equipos mixtos (3–6 personas, con o sin programadores) que compiten en hackathones de **problemas de ingeniería con IA**: fallos, mantenimiento, calidad, energía, logística de planta, tickets y documentación operativa.

> **SDG** = *System Design Guide* (diseño de sistemas de IA), no los ODS de la ONU.

| Esto **sí** es | Esto **no** es |
| --- | --- |
| Reloj, roles y plantillas Markdown | Un framework de agentes |
| Repo de **proceso** (brief → pitch) | Una app con `npm start` |
| Puente opcional al repo de **código** | Un curso largo de ML |

Une dos ideas:

1. **System design mínimo** — un patrón (clasificar, RAG, prompt+herramientas, agente acotado o visión).
2. **Ingeniería visible** — cada decisión queda en un archivo corto que sobrevive al chat.

Licencia MIT. Inspirado en [ai-system-design-guide](https://github.com/ombharatiya/ai-system-design-guide) y [AI_Engineering_Kit](https://github.com/ArturVargas/AI_Engineering_Kit); recortado para **hackathon + planta**.

---

## Flujo en una mirada

```text
CONTEXT + roles
    → idea / arquitectura
        → waves (slice 1 → 2 → 3)
            → verify → fix acotado
                → rúbrica T+8h y pre-freeze
                    → demo 90 s + pitch

Proceso: este repo
Código:  otro repo  (+ UAK sprint si hay varios agentes/devs)
```

| Momento | Qué debe existir |
| --- | --- |
| T0 | Camino de demo de 90 s, freeze, dueño de submission |
| T0 + 8 h | *Input de ingeniería → salida visible* (fin wave 1) |
| Freeze | Solo ensayo y pitch; sin features nuevas |
| Jurado | `02-architecture` + `04-verification` como evidencia |

---

## Antes de empezar

- Git + GitHub (**Use this template** recomendado).
- Equipo de **3–6**; puede haber perfiles no técnicos.
- Evento de **24 h o 48 h**.
- Un problema con **activo/proceso**, **datos o documentos**, y una **decisión humana** que hoy tarda o falla.
- Datos **sintéticos, públicos o anonimizados** (nunca PII, recetas, IPs internas ni dumps SCADA).

**No uses este template** para “un copiloto general de ingeniería” o “un agente que hace de todo”. Recorta primero.

---

## Cómo usarlo (en orden)

### 1. Crea tu copia

```bash
# En GitHub: Use this template → Create a new repository
git clone https://github.com/DonCervantes/AI-SDG-Engineering.git
cd AI-SDG-Engineering
```

Si ya tienen repo de código, **este** queda como proceso. Enlázalo en [`.ai/CONTEXT.md`](.ai/CONTEXT.md) → *Repo de código*.

### 2. Roles (15 min)

Lee [`ROLES.md`](ROLES.md). Nadie “espera a los devs”.

| Rol | Archivos |
| --- | --- |
| Producto / líder (suele ser dueño de submission) | `01-idea.md`, `05-pitch.md` |
| Dominio (planta, calidad, mantenimiento…) | casos en `04-verification.md` |
| Ingeniería / datos / ML | `02-architecture.md`, `03-build-slice.md` |
| Diseño (opcional) | `design-brief.md` |

Checklists: [`tracks/producto.md`](tracks/producto.md) · [`tracks/dominio-ingenieria.md`](tracks/dominio-ingenieria.md) · [`tracks/ingenieria.md`](tracks/ingenieria.md) · [`tracks/diseno.md`](tracks/diseno.md)

### 3. Brief del equipo (30–45 min)

Edita [`.ai/CONTEXT.md`](.ai/CONTEXT.md) **antes** de abrir el chat de IA:

1. Evento, equipo y **dueño de submission**
2. Problema en **una frase**
3. Datos permitidos / prohibidos, stack, APIs
4. Camino de demo de **90 s** (jurado ve → usuario hace → sistema responde → si el modelo falla)
5. Reloj: inicio, fin, **freeze**, plan-B (video / portátil espejo)
6. Clasificación: `spike` / `bounded` / `architectural`
7. Enlace al repo de código (y, si aplica, baseline de sistema existente)

Regla: **no hay código de producto** hasta que exista el camino de 90 s.

### 4. Abre un run

Un **run** = la carpeta de *este* hackathon. No edites `templates/` a mano para el evento.

```powershell
.\scripts\new-run.ps1 nombre-del-equipo
# opcional: -WithBaseline -WithAdr
```

```bash
chmod +x scripts/new-run.sh
./scripts/new-run.sh nombre-del-equipo
# opcional: --baseline --adr
```

Actualiza *Run actual* en `.ai/CONTEXT.md`. Detalle: [`.ai/runs/README.md`](.ai/runs/README.md).

Extras útiles:

- Sistema existente → [`.ai/references/baseline.md`](.ai/references/baseline.md)
- Equipo perdido entre etapas → [`templates/stage-contract.md`](templates/stage-contract.md)
- Decisión irreversible → copia ADR a [`.ai/adr/`](.ai/adr/)

### 5. Artefactos (reloj del playbook)

Sigue [`PLAYBOOK.md`](PLAYBOOK.md). Si vas tarde, **corta alcance**; no añadas modelo.

| Orden | 24 h | Archivo | Debe quedar |
| --- | --- | --- | --- |
| 1 | 60 min | `01-idea.md` | Hipótesis, **3 fuera de alcance**, guion 90 s |
| 2 | 60 min | `02-architecture.md` | **1** patrón, **1** fuente de datos, **1** fallback |
| 3 | 3 h + 3 h | `03-build-slice.md` | Waves 1→2 + bucle verify→fix (máx. 3) |
| 4 | 90 min | `04-verification.md` | 5 casos + hostil + “no lo sé” |
| 5 | 60 min | `05-pitch.md` | Demo, métrica, siguientes 2 semanas |

**Elegir patrón (10 min):** etiquetar → clasificar · verdad en docs → RAG · mirar fotos → visión · llamar sistemas → prompt+herramientas · varios pasos con tope → agente acotado. Si dudas entre agente y prompt+herramientas, elige prompt+herramientas.

Fichas: [`.ai/references/ai-pattern-cards.md`](.ai/references/ai-pattern-cards.md) · Antipatraones: [`.ai/references/anti-patterns.md`](.ai/references/anti-patterns.md)

En **48 h**: wave 3 (segundo fallo o integración mock) + ADR si hace falta.

### 6. Código en el otro repo (patrón compañero)

Aquí no hay servidor. Documenta en `03-build-slice.md` el repo, las waves, el comando de demo, el verify y el fallback.

**¿Varios agentes o varias personas en el mismo código?** Orquesta **allí**, no aquí. Recomendado: [upiixia-agentic-kit](https://github.com/JoahanMorales/upiixia-agentic-kit) en modo `sprint` (en Windows: Git Bash).

```bash
# En el repo de CÓDIGO:
git clone --depth 1 https://github.com/JoahanMorales/upiixia-agentic-kit ~/.uak-kit
bash ~/.uak-kit/install.sh --mode sprint .
```

Marca la casilla en `CONTEXT.md`. Este repo sigue mandando el brief, los roles y el pitch.

**Recorte no negociable**

1. Un solo camino de demo.
2. Fallback visible si el modelo falla.
3. A las 8 h: input → salida visible, o el alcance es demasiado grande.
4. No abras un agente de N pasos si basta clasificar o un RAG cerrado.
5. Dataset sintético o anonimizado.
6. Tras el freeze: solo ensayo / arreglo del guion de 90 s.

Estándares: [`standards/ingenieria.md`](standards/ingenieria.md) · [`standards/verificacion.md`](standards/verificacion.md) · [`standards/seguridad.md`](standards/seguridad.md)

Agentes (Cursor y otros): [`AGENTS.md`](AGENTS.md) · [`.cursor/rules/contexto-antes-de-codigo.mdc`](.cursor/rules/contexto-antes-de-codigo.mdc) · skill de dominio [`.cursor/skills/dominio-hackathon/`](.cursor/skills/dominio-hackathon/)

### 7. Verificar y ensayar

- Dominio valida `04-verification.md` en **fresco**.
- Standup cada 3 h: [`checklists/standup.md`](checklists/standup.md)
- Rúbrica **T+8 h** y **pre-freeze**: [`checklists/rubrica-midhack.md`](checklists/rubrica-midhack.md)
- Día de demo: [`checklists/demo.md`](checklists/demo.md)

### 8. Presentar con evidencia

Pitch en `05-pitch.md`. Primera slide: equipo y roles. Ante “¿por qué este diseño?”, enseña arquitectura y verificación — no el chat. Presenta el **dueño de submission** (o co-presenta con dominio).

---

## Ejemplos (15–20 min)

Runs ficticios ya rellenados. La columna “¿Pasó?” es **ilustrativa**; no hay binario en este repo.

| Ejemplo | Patrón | Carpeta |
| --- | --- | --- |
| Bombas / OT | Clasificar + RAG filtrado por modelo | [`.ai/runs/_ejemplo-mantenimiento-planta/`](.ai/runs/_ejemplo-mantenimiento-planta/) |
| Alarmas de línea | Solo clasificar / extraer | [`.ai/runs/_ejemplo-clasificador-alarmas/`](.ai/runs/_ejemplo-clasificador-alarmas/) |

1. Lee `CONTEXT.md` → `01` … `05`.
2. Copia el más parecido y cambia el activo.
3. Lecciones: clasificar+RAG filtrado gana al “agente total”; a veces un JSON schema basta.

---

## Mapa del repositorio

```text
.ai/
  CONTEXT.md           Brief (reloj, freeze, repo de código)
  adr/                 Decisiones irreversibles
  references/          Patrones, baseline, anti-patrones
  runs/                Un run por hackathon + 2 ejemplos
templates/             01–05 (waves), design-brief, adr, stage-contract
scripts/               new-run.ps1 / new-run.sh
tracks/                Checklist por rol
standards/             Ingeniería, verificación, seguridad
checklists/            Standup, demo, rúbrica mid-hack
.cursor/               Regla + skill de dominio
.github/               Plantillas de issues
AGENTS.md              Reglas para agentes
PLAYBOOK.md            Reloj 24 h / 48 h
ROLES.md               Dueños de archivo
CONTRIBUTING.md        Cómo aportar sin hinchar el kit
```

**Handoff**

```text
Dominio (síntoma + decisión)
  → Producto (recorte + historia 90 s)
    → Ingeniería (patrón + waves)
      → Dominio (valida 5 casos)
        → Producto (pitch + submission)
```

Si el código cambia una decisión, edita el Markdown **upstream** y avisa al dueño del archivo.

---

## Qué no hacer

- Subir `.env`, credenciales, dumps de planta o PII.
- Tratar la salida del modelo como permiso de trabajo o arranque de equipo.
- Mezclar manuales de dos modelos de máquina sin metadatos.
- Empezar por UI o por un segundo patrón “por si acaso”.
- Dejar el camino de demo solo en el chat.
- Instalar UAK (u otro motor multi-agente) **en este** repo.
- Seguir codeando features después del freeze.

---

## Contribuir y licencia

MIT. Cómo aportar: [`CONTRIBUTING.md`](CONTRIBUTING.md). Issues: plantillas en `.github/ISSUE_TEMPLATE/`.

No copies credenciales ni datos sensibles a los artefactos: usa identificadores y resúmenes.
