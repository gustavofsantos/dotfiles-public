#!/bin/bash

# This script is used to display the open PRs that are waiting for my review.

FRONT_REPO="/opt/loggi/front-clientes-app-web/"
BEYOND_PY_REPO="/opt/loggi/py/apps/beyond/"
BEYOND_PAYMENTS_REPO="/opt/loggi/beyond-payment/"
LWEB_REPO="/opt/loggi/web/"

PRS_FRONT=$(
  cd $FRONT_REPO || exit
  gh pr list --search 'is:open status:success review-requested:@me' --json author,title --jq 'length'
)
PRS_BEYOND_PY=$(
  cd $BEYOND_PY_REPO || exit
  gh pr list --search 'is:open status:success review-requested:@me' --json author,title --jq 'length'
)
PRS_BEYOND_PAYMENTS=$(
  cd $BEYOND_PAYMENTS_REPO || exit
  gh pr list --search 'is:open status:success review-requested:@me' --json author,title --jq 'length'
)
PRS_LWEB=$(
  cd $LWEB_REPO || exit
  gh pr list --search 'is:open status:success review-requested:@me' --json author,title --jq 'length'
)

echo "  |  $PRS_FRONT  $PRS_BEYOND_PY   $PRS_BEYOND_PAYMENTS LW: $PRS_LWEB"
