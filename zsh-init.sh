#!/bin/bash

# printf "\n\n========= 更新软件包 =========\n\n"

# centOS 需要特殊处理，https://www.tecmint.com/error-failed-to-download-metadata-for-repo-appstream/
sudo yum update && sudo yum -y install zsh
# 安装 oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "已安装 omz"
fi

printf "\n\n========= 配置 zsh =========\n\n"

cat ./ys.zsh-theme > ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/ys.zsh-theme
sed -i 's/ZSH_THEME="[A-Za-z[:blank:]]\+"/ZSH_THEME="ys"/' ~/.zshrc

printf "\n\n========= 配置 zsh 插件 =========\n\n"
# 报错不中断
set +e

# gitfast、zsh-autosuggestions、zsh-syntax-highlighting、zsh-z
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z

sed -i 's/plugins=([A-Za-z[:blank:]]\+)/plugins=(git gitfast zsh-autosuggestions zsh-syntax-highlighting zsh-z)/' ~/.zshrc

# 报错中断
set -e

# 追加其他命令
cat zshrc >> ~/.zshrc
