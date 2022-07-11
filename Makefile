gitbig:
	find . -size +10M
	echo du -a ./ | sort -n -r | head -n 20
	for file in `find . -size +10M`; do ls -lh $$file; done


token: 
	./token.sh



publish: token
	git remote set-url origin git@github.com:tonybutzer/ws.git
	git config --global user.email tonybutzer@gmail.com
	git config --global user.name tonybutzer
	git config --global push.default simple
	git add .
	git commit -m "automatic git update from Makefile"
	git push


git-hell:
	echo git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch TOO_BIG_FILE'
example:
	echo docker run -i tbutzer/eco_docker_image python3 yr_rangeland.py -y 1993 
