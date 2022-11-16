#!/bin/bash

code_http=$(curl -w %{http_code} -s -o /dev/null https://projeto-encurtador.netlify.app)

if [ $code_http -ne 200 ]; then
	
	echo "Houve um problema com o site, gerando log $(date +%F\ %T)" >> /logs/site.log
fi
