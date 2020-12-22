#!/bin/bash

execute_install()

execute_install()
{
	config_keyboard()
	add_packages()
	add_programs()
	config_environments()
	add_zsh()
}

config_keyboard()
{
	setxkbmap br
	localectl --no-convert set-x11-keymap br	
}

add_packages() 
{
	add_asdf()
	add_node()
	add_python()
	add_docker()
	add_java()
	add_dotnet()	
	add_ruby()
	add_vim()
	add_tmux()
}

add_programs() 
{
	add_eclipse()
	add_notepadqq()
}
add_asdf()
{
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
	echo ". $HOME/.asdf/asdf.sh" >> .bashrc
	echo ". $HOME/.asdf/completions/asdf.bash" >> .bashrc
	source .bashrc
}

add_node()
{
	asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
	bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
	asdf install nodejs 15.3.0
	asdf global nodejs 15.3.0
	sudo pacman -S yarn npm 
}

add_python()
{
	sudo pacman -S python python-pip
}

add_docker()
{
	sudo pacman -S docker minikube kubectl
	sudo usermod -aG docker $USER
	sudo systemctl start docker
	sudo systemctl enable docker
	sudo chmod 777 /var/run/docker.sock
}

add_java()
{
	sudo pacman -S jdk11-openjdk maven
}

add_dotnet()
{
	sudo pacman -S dotnet-sdk aspnet-runtime
}

add_ruby()
{
	# Sqlite for rails local development 
	sudo pacman -S sqlite
	asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
	
	echo rails > .default-gems
	echo solargraph >> .default-gems
	echo bundler >> .default-gems
	
	asdf install ruby 2.7.2
	asdf global ruby 2.7.2
}

add_vim()
{
	sudo pacman -S neovim
	
	# Dependencies 
	sudo pacman -S the_silver_searcher ctags
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/.vimrc

	# Configs
	echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" > ~/.config/nvim/init.vim
	echo "let &packpath=&runtimepath" >> ~/.config/nvim/init.vim
	echo "source ~/.vimrc" >> ~/.config/nvim/init.vim

	echo "{" > ~/.vim/coc-settings.json
	echo "  \"java.jdt.ls.vmargs\": \"-javaagent: /home/lambert/.vim/lombok.jar\" " >> ~/.vim/coc-settings.json
	echo "}" >> ~/.vim/coc-settings.json

	wget https://projectlombok.org/downloads/lombok.jar -P ~/.vim/
	pip3 install pynvim	
}

add_tmux() 
{
	sudo pacman -S tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

add_eclipse()
{
	cd && cd Downloads
	wget https://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2020-09/R/eclipse-jee-2020-09-R-linux-gtk-x86_64.tar.gz
	cd && sudo mv Downloads/eclipse-jee-*.tar.gz Programas && cd Programas 
	tar -zxvf eclipse-jee-*.tar.gz  && rm eclipse-jee-*.tar.gz
	cd && cd Downloads
	wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/eclipse.desktop
	sudo mv eclipse.desktop /usr/share/applications
	cd
	wget https://projectlombok.org/downloads/lombok.jar -P ~/Programas/eclipse/
}

add_notepadqq()
{
	sudo pacman -S notepadqq
}

config_environments()
{
	wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/environment && sudo mv environment /etc/environment
	source /etc/environment
}

add_zsh()
{
	sudo pacman -S zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/.zshrc
}
