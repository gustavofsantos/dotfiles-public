#!/bin/bash
echo "Run sync-notes at ${date}" >> /home/gustavo/sync-notes.log

cd ~/notes
git add --all && git commit -m "sync notes"
git pull ; git push
