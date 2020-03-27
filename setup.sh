#!/usr/bin/env bash

# Install virtual enviroment
if [ ! -d venv ]; then
	python3 -m venv venv
fi
source venv/bin/activate
pip3 install -r requirements.txt
pip3 install --upgrade pip

# Generate documentation
if [ ! -e docs/README.md ]; then
	touch docs/README.md
	echo "# ${PWD##*/}" >> docs/README.md
fi

# Delete git repo, because we dont want to push to pyskeleton
if [ "${PWD##*/}" != "pyskeleton" ]  &&  [ ! -f ".gitinitialized" ]; then
	echo "[+] Detected new project not pyskeleton, removing .git folder"
	rm -rf .git

	echo "[+] Init new git repo"
	touch .gitinitialized
	git init
	git add .
	git commit -m 'Initial commit'
	
	echo "[i] Run: git remote add origin remote repository URL"
	echo "[i] Run: git remote -v"
	echo "[i] Run: git push -f origin master"
fi
