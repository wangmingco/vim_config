#/bin/bash

cd ${HOME}/vim_config

/usr/bin/git add -A
/usr/bin/git commit -a -m "定期提交"
/usr/bin/git pull
/usr/bin/git push -u origin master
