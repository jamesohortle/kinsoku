# _Kinsoku_ 禁則

## What are _kinsoku_? 「禁則」とは何なのか？

禁則処理とは、改行の際に行う、行頭や行末で禁止されている文字を避ける処理です。

| 文字類 | 行頭禁則文字 | 行末禁則文字 |
|-------|--------------------|---------------------|
| 小さい仮名 | ぁぃぅぇぉっ... | N/A               |
| 括弧類  | ）〉》】...     | （〈《【...        |
| 引用記号類  | 」』”...       | 「『“...           |
| 句読点  | 、。・！？...   | N/A               |


## What is in this repository? このリポジトリには何があるか？

- `makefile`: ドキュメントを XeLaTeX で PDF にコンパイルし、引用などをリンクし、引用などが正しいよう確認するため再コンパイルします。`xeCJK` パッケージの利用は、XeLaTeX が必須です。
- `main.tex`: `make` でコンパイルする、ミニマルな LaTeX ドキュメントです。
- `cjk_support.tex`: `xeCJK` のパッケージを読み込み、 `no_breaks.tex` を挿入します。
- `no_breaks.tex`: フォントフェースと新たな文字クラスを設定します。下記に定義する文字クラスの罰則をも挿入します。
- `no_break_before.tex` と `no_break_after.tex`: 行頭と行末の場合に禁止する文字を定義し、適切な罰則量を設定します。コメントアウトした部分で、適用される文字に色（赤と青）を付けられます。

## How do I use it? どのように使えばいいのか？

### Simple use 簡単な利用

メインの LaTeX ファイルと同じディレクトリに `cjk_support.tex` と `no_breaks.tex`、`no_break_before.tex`、`no_break_after.tex`をコピペし、プリアンブルに `\input{cjk_support}` すれば十分です。

Google の [Noto Sans CJK JP と Noto Sans Mono CJK JP](https://www.google.com/get/noto/help/cjk/) を使用しますが、インストールされていない場合、`cjk_support.tex` と `no_breaks.tex` に好きなフォントを書き換えればいいです。

`cjk_support.tex` は `xeCJK` をインポートするので、この1行をコメントアウトするまたは `\input{no_breaks}` するほうがいいかもしれません。LaTeX は行の調整に対応しますので、手で調整する必要はないはずです。

### Adding rules 規則の追加

次のような1行をその他の定義と一緒に追加すれば結構です。

```latex
\XeTeXcharclass`<new_char>=\noBreakBefore % no_break_before.tex
\XeTeXcharclass`<new_char>=\noBreakAfter % no_break_after.tex
```

## 謝礼

[Cicada](https://tex.stackexchange.com/users/182648/cicada)さんと [Hironobu YAMASHITA](https://tex.stackexchange.com/users/89193/hironobu-yamashita)さんに礼を言います。感謝です。[このスレッドで](https://tex.stackexchange.com/questions/463441/correct-line-breaking-for-japanese-using-babel/490272#490272) Cicadaさんが概ねの処理を教えてくれました。

