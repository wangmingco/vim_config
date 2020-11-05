#/bin/bash

function init() {
	echo "创建.vimrc链接"
	ln ${HOME}/vim_config/.vimrc /root/.vimrc

	echo "VIM7升级到VIM8"
	rpm -Uvh http://mirror.ghettoforge.org/distributions/gf/gf-release-latest.gf.el7.noarch.rpm 
	rpm --import http://mirror.ghettoforge.org/distributions/gf/RPM-GPG-KEY-gf.el7 
	yum -y remove vim-minimal vim-common vim-enhanced sudo 
	yum -y --enablerepo=gf-plus install vim-enhanced sudo

	echo "安装bash lsp"
	curl --silent --location https://rpm.nodesource.com/setup_15.x | sudo bash -
	sudo yum install -y nodejs
	npm i -g bash-language-server

	echo "安装vim-plug"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function create_crontab_config() {
	cd ${HOME}/vim_config

	echo "开始创建crontab-config 文件"
	
	echo "* * * * * ${HOME}/vim_config/execute_git.sh" > crontab_config
	
	echo "创建crontab-config 文件完成"
	ls -al -h
}

function execute_crontab() {
	cd ${HOME}/vim_config
	
	echo "开始调度crontab"
	
	crontab crontab_config

	echo "调度crontab 结果"
	crontab -l
}

function clean() {
	cd ${HOME}/vim_config

	echo "开始清理工作"
	
	rm -f ./crontab_config

	echo "清理工作完成"
	ls -al -h
}

if [ $1 = "i" || $1 = "init" ] 
then 
	init
fi

create_crontab_config
execute_crontab
clean
