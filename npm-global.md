# Setup NPM global dir for node_modules

	mkdir ~/.npm-global

	npm config set prefix '~/.npm-global'

export PATH to ~/.profile or ~/.zshrc

	export PATH=~/.npm-global/bin:$PATH

	source ~/.profile
	source ~/.zshrc
