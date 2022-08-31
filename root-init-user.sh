printf "\n\n========= 创建用户 =========\n\n"

read -p "用户名: $ww_username (y/N) " -rn 1; echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  exit 1
fi

if id "$ww_username" &>/dev/null; then
  echo "用户 $ww_username 已存在"
else
  # 让当前用户可以使用 sudo
  # -G wheel 是让当前用户进入到 wheel 用户组，wheel - allows to get superuser privileges with the su command;
  useradd -m -G wheel -s /bin/zsh "$ww_username"
  # 让 wheel 用户组里面的用户，都无需使用密码来 sudo
  echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
  passwd "$ww_username"
fi
