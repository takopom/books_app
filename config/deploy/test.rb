# デプロイ先のパス
set :deploy_to, "/home/deploy/test/books_app"
set :tmp_dir, "/home/deploy/tmp"
# RAILS_ENV
set :rails_env, "test"
# ホストの設定
server "153.127.17.56",
  user: "deploy",
  roles: %w{web app db},
  ssh_options: {
    keys: %w(~/.ssh/sakura_deploy_rsa),
    port: 22222
  }
