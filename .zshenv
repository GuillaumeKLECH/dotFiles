if [[ ! -o interactive && ! -o login ]]; then
	source /etc/zprofile
fi
. "$HOME/.cargo/env"
