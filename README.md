# Neovim config

個人用のNeovim設定です。プラグイン管理には [lazy.nvim](https://github.com/folke/lazy.nvim) を使用しています。

## セットアップ

```sh
git clone https://github.com/k-symmons/nvim-config.git ~/.config/nvim
nvim
```

初回起動時にlazy.nvimと設定内のプラグインがインストールされます。

## ファイル操作

`mini.files`を使用しています。

- `<leader>ee`: 現在のファイルを起点に開く
- `<leader>ec`: カレントディレクトリを起点に開く
- `<leader>ey`: 現在のファイルを起点にYaziを開く
- `<leader>ew`: カレントディレクトリを起点にYaziを開く
- `l`: ディレクトリに入る／ファイルを開く
- `h`: 親ディレクトリへ戻る
- `w`: 変更を同期する
- `q`: 閉じる
- `g?`: ヘルプを表示する

## 42向けコマンド

- `<leader>cg`: `make`を実行する
- `<leader>cn`: 現在のファイルにNorminetteを実行する
- `<leader>cf`: 現在のバッファを42normでフォーマットする
- `<leader>cd`: 診断の内容と発生元を表示する
- `<leader>ct`: Norminetteの診断表示を切り替える
- `<leader>ff`: LSPで現在のバッファをフォーマットする
- `<leader>fp`: 現在のファイルの絶対パスをコピーする
- `<leader>r`: カーソル下の単語をファイル内で置換する
- `:Cc42`: `cc -Wall -Wextra -Werror`でコンパイルして実行する

GCCやLSP、Norminetteの診断には発生元が表示されます。`[42norm]`や`[clangd]`などのラベルを確認してください。

## 42の学校端末について

42の学校端末ではYaziを使用できないことがあるため、学校端末では`no_yazi`ブランチを使用してください。

```sh
git switch no_yazi
```

## ヘッダーについて

.config/nvim/lua/kazuki/plugins/42.lua内の以下の項目を変更してください：
user = "ksymmons",                                                                                                                                                                                                                                                                    
mail = "ksymmons@student.42tokyo.jp",  
