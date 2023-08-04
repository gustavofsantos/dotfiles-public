#!/bin/bash

docker run -it \
  -v /opt/loggi/py/apps/beyond/src/beyond_app:/opt/loggi/beyond/src/beyond_app \
  -v /opt/loggi/py/apps/beyond/src/proto:/opt/loggi/beyond/src/proto beyond-py \
  bash -c 'poetry run python ../../libs/buildproto.py /loggi/beyond/src/proto'
