################################################
# ssh config
################################################

echo "Ensure your public key is registered at https://github.com/settings/keys"
open "https://github.com/settings/keys"
read -p "Press RETURN to continue"
ssh -T git@github.com

echo "Ensure you created a personal access token with read permissions at https://github.com/settings/tokens/new"
open "https://github.com/settings/tokens/new"

if [ ! -f ~/.gitlab-token ]; then
	read -sp 'Please provide your gitlab token :' GITLAB_TOKEN
	echo $GITLAB_TOKEN > ~/.gitlab-token
fi

GITLAB_TOKEN=$(cat ~/.gitlab-token)
ghorg clone cacd2 --scm=gitlab --token=$GITLAB_TOKEN --preserve-dir --protocol ssh --skip-archived --path ~/
