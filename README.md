# This is cron of Ubuntu provide docker-compose

リポジトリを `clone` 後、`docker` フォルダで `make` を実行するだけで、cron が動き出します。
デフォルトでは、実行時の日時をログファイルに書き込む処理が毎分実行されます。
`cron/schedule` を編集し、`restartcron` で任意の処理を実行させることが可能です。
※ `cron/schedule` の所有者は `root` ユーザーである必要があります。（`WRONG FILE OWNER` というエラーがでる）

## build & up

```bash
$ cd docker

$ make

# または、make コマンドが使えない方は以下

$ mkdir -p ../files/logs && \
  touch ../files/logs/schedule.log && \
  touch ../files/logs/schedule-error.log \
  docker-compose build && \
  docker-compose up -d && \
  docker-compose exec linux bash
```

## cron が動いてるか確認する

```:bash
$ cd docker

# コンテナに入る
$ make exec-linux

# コンテナ内では以下のコマンドでいろいろできる
# cron の起動
$ startcron

# cron の停止
$ stopcron

# cron の再起動
$ restartcron

# cron が動いてるか確認
$ cronstatus

# cron のログを tail -f 表示
$ cronlogs

# cron のログを less 表示
$ cronlogall
```
