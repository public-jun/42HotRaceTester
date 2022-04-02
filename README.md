# HotRaceTester
This is HotRace Tester

# 使い方
`help/helper.sh`
```sh
#-------------------------------------
# USER SETTING
#-------------------------------------
readonly HOTRACE_DIR="../"
readonly HOTRACE_EXE="hotrace"
#-------------------------------------
```
HotRaceTester から hotrace の相対パスを `HOTRACE_DIR` に設定

### テスト
```sh
$ bash ./grademe.sh
```
出力は`res/

### ベンチマーク
```sh
$ bash ./bench.sh
or
$ zsh ./bench.sh
```

