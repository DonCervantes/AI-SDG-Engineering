# Cómo copiar plantillas a un run

Preferido:

```powershell
.\scripts\new-run.ps1 nombre-equipo
```

```bash
./scripts/new-run.sh nombre-equipo
```

```text
.ai/runs/AAAA-MM-DD-nombre-equipo/
  CONTEXT.md          (copia desde .ai/CONTEXT.md)
  01-idea.md
  02-architecture.md
  03-build-slice.md
  04-verification.md
  05-pitch.md
  design-brief.md     (si hay UI)
  baseline.md         (opcional: -WithBaseline / --baseline)
```

Plantillas en blanco: `/templates`. Ejemplos: `_ejemplo-mantenimiento-planta`, `_ejemplo-clasificador-alarmas`.

ADRs: `.ai/adr/` (desde `templates/adr.md`). Reloj/freeze en `CONTEXT.md`. Waves en `03-build-slice.md`. Código y UAK sprint: **otro** repo.
