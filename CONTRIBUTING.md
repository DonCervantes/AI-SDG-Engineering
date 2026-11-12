# Contribuir a AI-SDG-Engineering

Plantilla de **proceso** (Markdown). No envíes código de demo de producto aquí.

## Qué aportaciones ayudan

- Claridad del README / playbook / roles (español).
- Plantillas más cortas o mejores prompts de etapa.
- Ejemplos de run sintéticos (sin PII ni datos de planta).
- Tracks y checklists para dominio no técnico.
- Fixes de referencias rotas o scripts `new-run`.

## Qué no mezclar

- Servidores, apps o dependencias npm/pip de una demo concreta.
- Motor multi-agente (p. ej. UAK): documentar el puente; no venderlo como core.
- Credenciales, dumps SCADA, fotos con personas o recetas.

## Cómo proponer un cambio

1. Abre un issue con la plantilla (bug o mejora).
2. Mantén PRs pequeños y enfocados.
3. Si tocas el flujo, actualiza el ejemplo o el README en el mismo PR.
4. Licencia MIT: al contribuir aceptas esa licencia.

## Scripts locales

```powershell
.\scripts\new-run.ps1 mi-equipo
```

```bash
chmod +x scripts/new-run.sh
./scripts/new-run.sh mi-equipo
```
