#!/usr/bin/env bash
# Uso: ./setup-interaction-limit.sh <owner>/<repo>
# Configura el filtro anti-spam por defecto de la Regla #7 en un repo
# público: bloquea solo cuentas nuevas sin historial (<24h, sin
# contribuciones previas), sin afectar a gente real.
#
# IMPORTANTE: la API no permite un límite permanente -- el máximo es
# six_months, después se reabre solo. Hay que re-correr este script (o
# programar un recordatorio) cada 6 meses.
#
# Para escalar temporalmente ante una ola de spam puntual, correr:
#   gh api -X PUT repos/<owner>/<repo>/interaction-limits \
#     -f limit=collaborators_only -f expiry=one_week
#
# Para un bloqueo realmente indefinido (spam persistente, no puntual),
# usar en su lugar el toggle permanente en la UI:
#   Settings -> Issues -> Creation allowed by: Collaborators only

set -e
REPO="$1"

if [ -z "$REPO" ]; then
  echo "Uso: ./setup-interaction-limit.sh <owner>/<repo>"
  exit 1
fi

gh api -X PUT "repos/${REPO}/interaction-limits" \
  -f limit=existing_users -f expiry=six_months

echo "Interaction limit configurado en 'existing_users' (expira en 6 meses) para ${REPO}."
echo "Recordatorio: renovar este límite antes de que expire."
