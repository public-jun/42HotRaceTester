# HotRaceTester
This is HotRace Tester

## TREE
```sh
.
├── LICENSE
├── README.md
├── bench.sh
├── gen.py
├── grademe.sh
├── help
│   └── helper.sh
└── test
    ├── ans
    │   ├── empty.ans
    │   ├── example.ans
    │   ├── neol_example.ans
    │   ├── test0.ans
    │   ├── test1.ans
    │   ├── test2.ans
    │   ├── test3.ans
    │   ├── test4.ans
    │   ├── test5.ans
    │   ├── test6.ans
    │   ├── test7.ans
    │   ├── test8.ans
    │   └── test9.ans
    └── cases
        ├── empty.htr
        ├── example.htr
        ├── neol_example.htr
        ├── test0.htr
        ├── test1.htr
        ├── test2.htr
        ├── test3.htr
        ├── test4.htr
        ├── test5.htr
        ├── test6.htr
        ├── test7.htr
        ├── test8.htr
        └── test9.htr

4 directories, 32 files

```

## SETTINGS
`help/helper.sh`
```sh
#-------------------------------------
# USER SETTING
#-------------------------------------
readonly HOTRACE_DIR="../"
readonly HOTRACE_EXE="hotrace"
#-------------------------------------
```
HotRaceTester から hotrace への相対パスを `HOTRACE_DIR` に設定

### USAGE
```sh
$ bash ./grademe.sh
```
結果は`res/`配下にファイルとして出力される

```
$ bash ./grademe.sh clean
```
`res` ディレクトリ削除

### BENCH
```sh
$ bash ./bench.sh
or
$ zsh ./bench.sh
```

