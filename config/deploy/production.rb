# デプロイ先のパス
set :deploy_to, "/home/deploy/books_app"
set :tmp_dir, "/home/deploy/tmp"
# ホストの設定
server "153.127.17.56",
  user: "deploy",
  roles: %w{web app db},
  ssh_options: {
    port: 22222
  }
