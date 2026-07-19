#!/usr/bin/env bash
# Uso: ./setup-labels.sh (requiere estar autenticado con `gh auth login`
# y ejecutarse dentro del repo, o con `gh repo set-default` configurado)
#
# Crea el set unificado de labels de la Regla #7. --force sobreescribe si
# ya existe uno con el mismo nombre (por si se corre más de una vez).

set -e

# Tipo (mismo vocabulario que la convención de commits, Regla #3)
gh label create "type:feat"     --color "0E8A16" --description "Nueva funcionalidad"        --force
gh label create "type:fix"      --color "D73A4A" --description "Corrección de bug"           --force
gh label create "type:docs"     --color "0075CA" --description "Documentación"               --force
gh label create "type:chore"    --color "CFD3D7" --description "Mantenimiento / tooling"     --force
gh label create "type:refactor" --color "5319E7" --description "Cambio interno sin nueva func." --force
gh label create "type:perf"     --color "FBCA04" --description "Rendimiento"                 --force
gh label create "type:test"     --color "BFD4F2" --description "Tests"                       --force
gh label create "type:style"    --color "E4E669" --description "Formato / estilo de código"  --force

# Prioridad
gh label create "priority:critical" --color "B60205" --description "Bloqueante, atender ya"  --force
gh label create "priority:high"     --color "D93F0B" --description "Importante, atender pronto" --force
gh label create "priority:medium"   --color "FEF2C0" --description "Normal"                   --force
gh label create "priority:low"      --color "C5DEF5" --description "Puede esperar"            --force

# Extra para repos públicos (opcional, comentar si el repo es privado)
gh label create "good-first-issue" --color "7057FF" --description "Buen punto de entrada para colaboradores" --force

echo "Labels creados/actualizados."
