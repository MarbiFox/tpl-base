---
name: "🗂️ Checklist de setup de repo"
about: Usar al crear un proyecto nuevo desde este template
title: "Setup inicial del repo"
labels: setup
assignees: ''
---

Checklist basado en `docs/guidelines/01-organizacion-repos.md` del repo `.github`.
Ir marcando a medida que se completa el setup.

## Naming y visibilidad
- [ ] Nombre correcto según tipo (PascalCase creativo si será pública / prefijo+kebab-case si es privada o experimento)
- [ ] Visibilidad decidida (privado por defecto, público solo si cumple los requisitos)
- [ ] Labels creados con `scripts/setup-labels.sh` (requiere `gh auth login`)
- [ ] Si es repo público: Discussions activado, categorías configuradas (Q&A, Ideas, Show and tell, Announcements bloqueada al maintainer)
- [ ] Si es repo público: Interaction Limit en `existing_users` configurado (`scripts/setup-interaction-limit.sh`) — recordar renovar cada 6 meses, no es permanente (ver Regla #7)

## Anatomía mínima
- [ ] `README.md` completado (qué hace / cómo correrlo / stack / estado)
- [ ] `.gitignore` ajustado al stack real (no el genérico del template)
- [ ] `LICENSE` revisada/elegida
- [ ] `.env.example` creado si el proyecto usa variables de entorno

## Estructura
- [ ] Decisión mono/poly tomada y justificada (ver tabla de la Regla 1)
- [ ] Si es monorepo: estructura `apps/` + `packages/` creada

## CI
- [ ] `.github/workflows/ci.yml` -- reemplazar `MarbiFox` por el usuario/org real
- [ ] `.github/workflows/ci-full.yml` -- reemplazar `MarbiFox` por el usuario/org real
- [ ] Scripts estandarizados agregados a `package.json`: `lint`, `build`, `test:unit`, `test:integration`, `test:e2e`, `test:coverage` (los que apliquen a esta etapa del proyecto)
- [ ] `vitest.config.ts` creado a partir de `vitest.config.ts.example`, con threshold de cobertura ajustado (ver Regla #5)
- [ ] `playwright.config.ts` creado a partir de `playwright.config.ts.example` si el proyecto tendrá E2E
- [ ] Preview deployments conectados (Vercel/Netlify/Railway) para que `ci-full.yml` tenga un entorno real donde correr integración/E2E

## Portafolio (solo si es pública)
- [ ] Topics agregados en Settings

## GitHub Projects
- [ ] Project creado desde plantilla "Team planning" (uno por proyecto, no por repo — si es polyrepo, enlazar todos los repos al mismo Project)
- [ ] Duración de Iteration configurada según este proyecto en particular
- [ ] Workflows "Item added" y "Item closed" activados en Project Settings

## Documentación técnica
- [ ] `eslint-plugin-jsdoc` instalado y config integrada al `.eslintrc` (a partir de `.eslintrc.jsdoc.js.example`)
- [ ] Si el proyecto tiene UI reutilizable: Storybook instalado
- [ ] `docs/adr/` presente (ya viene con `0000-template.md`) si el proyecto es chico; si es grande, sección "Decisiones" creada en Wiki

## Seguridad y licenciamiento
- [ ] Licencia decidida según escala (MIT chico / GPLv3 grande / sin LICENSE si es privado con valor de mercado — ver Regla #10)
- [ ] Secret scanning + Push protection activados en Settings → Code security
- [ ] Si se hará público: `npx license-checker --summary` corrido, sin conflictos de licencia en dependencias

## Estándares de código
- [ ] Prettier configurado (`.prettierrc.json` a partir del `.example`)
- [ ] Husky + lint-staged instalados y `.husky/pre-commit` configurado
- [ ] `tsconfig.json` con `strict: true` si es proyecto grande (relajable si es `exp-`/chico, ver Regla #11)

## Release y versionado
- [ ] `.github/workflows/release.yml` -- reemplazar `MarbiFox` por el usuario/org real
- [ ] `release.config.js` creado a partir de `release.config.js.example`
- [ ] Dependencias instaladas: `npm i -D semantic-release @semantic-release/changelog @semantic-release/git`
- [ ] Si el repo publica a npm (`lib-*`): `publish-npm: true` en `release.yml` + secret `NPM_TOKEN` configurado + plugin `@semantic-release/npm` descomentado en `release.config.js`
- [ ] En Settings → Branches: GitHub Actions exceptuado de la protección de `main` para permitir el commit de vuelta de `CHANGELOG.md`
- [ ] `.github/workflows/release-gate.yml` -- reemplazar `MarbiFox` por el usuario/org real
- [ ] Check "Release gate" marcado como required status check en la protección de `main`

---
Cerrar este Issue cuando todo esté marcado.
