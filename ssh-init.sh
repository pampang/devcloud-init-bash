echo "请从本地的 ~/.ssh/id_rsa.pub 获取 SSH Key（可选）:"
read ww_sshkey; echo

mkdir -p ~/.ssh

# 通过配置 authorized_keys，实现 ssh 免登录
echo "$ww_sshkey" >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
