#!/bin/bash
pasta="$(</dev/stdin)"
curl -G --data-urlencode "c=$pasta" http://localhost:5050/
