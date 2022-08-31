printf "\n\n========= 安装 nvm =========\n\n"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

printf "\n\n========= 安装 node =========\n\n"

nvm install 14
# 固定 node 版本
nvm alias default 14

printf "\n\n========= 安装通用 npm 包 =========\n\n"

npm i -g pm2 yarn pnpm