# vim_config

创建链接
```
ln ${HOME}/vim_config/.vimrc /root/.vimrc
```

安装vim-plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

安装bash lsp
```
curl --silent --location https://rpm.nodesource.com/setup_15.x | sudo bash -

sudo yum install -y nodejs

npm i -g bash-language-server
```

PS: VIM7升级到VIM8
```
rpm -Uvh http://mirror.ghettoforge.org/distributions/gf/gf-release-latest.gf.el7.noarch.rpm 
rpm --import http://mirror.ghettoforge.org/distributions/gf/RPM-GPG-KEY-gf.el7 
yum -y remove vim-minimal vim-common vim-enhanced sudo 
yum -y --enablerepo=gf-plus install vim-enhanced sudo
```
