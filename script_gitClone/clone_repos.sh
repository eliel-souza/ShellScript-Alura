#!/bin/bash

folder=repositories-git
url='https://api.github.com/users/eliel-souza/repos'

if [ ! -d $folder ]; then
	echo 'Criando a pasta para armazenar os repositórios...'
	echo 'Baixando os repositórios...'
	mkdir $folder
else
	echo 'Já existe a pasta para armazenar os repositórios...'
	echo 'Baixando os repositórios...'
fi

cd $folder

repositories=$(curl -s $url | awk '/ssh_url/{print $2}' | sed 's/^"//g' | sed 's/",$//g')

for repos in $repositories; do
	
	git clone $repos
done





