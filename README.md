# _Kinsoku_ 禁則

## What are _kinsoku_? 「禁則」とは何なのか？

_Kinsoku_ are typographic conventions for line breaking in Japanese typesetting.


| Class | Can't begin a line | Can't finish a line |
|-------|--------------------|---------------------|
| Small _kana_ | ぁぃぅぇぉっ... | N/A               |
| Parentheses  | ）〉》】...     | （〈《【...        |
| Quotations   | 」』”...       | 「『“...           |
| Punctuation  | 、。・！？...   | N/A               |


## What is in this repository? このリポジトリには何があるか？

- `makefile`: Compiles the document to a PDF with XeLaTeX, links references with BibTeX and compiles again to make sure references are correct. XeLaTex is required for the `xeCJK` package to work.
- `main.tex`: A minimal LaTeX document to compile with `make`.
- `cjk_support.tex`: Loads the `xeCJK` package to support Japanese input and inputs `no_breaks.tex`.
- `no_breaks.tex`: Sets a fontface and new character classes for the relevant characters. Inputs the penalties defined below.
- `no_break_before.tex` and `no_break_after.tex`: Define characters that should not be begin/end lines and add penalties to line breaking as appropriate. Uncomment a line to highlight  the relevant characters in red/blue.

## How do I use it? どのように使えばいいのか？

### Simple use 簡単な利用
Simply copy and paste `cjk_support.tex`, `no_breaks.tex`, `no_break_before.tex` and `no_break_after.tex` into the same directory as your main LaTeX file and put `\input{cjk_support}` into the preamble. 

As an example, we use Google's [Noto Sans CJK JP and Noto Sans Mono CJK JP](https://www.google.com/get/noto/help/cjk/), but if these are not installed on your system simply change the fonts set in `cjk_support.tex` and `no_breaks.tex` to one you prefer.

Since `cjk_support.tex` also imports `xeCJK`, you may want to comment this line out if you are already importing it or just `\input{no_breaks}` in your preamble. LaTeX will justify lines as needed, so you won't need to do any manual adjustment.

### Adding rules 規則の追加

Add a line of the following form to the relevant file with the other definitions.

```latex
\XeTeXcharclass`<new_char>=\noBreakBefore % no_break_before.tex
\XeTeXcharclass`<new_char>=\noBreakAfter % no_break_after.tex
```

## Acknowledgements

Thanks to [Cicada](https://tex.stackexchange.com/users/182648/cicada) and [Hironobu YAMASHITA](https://tex.stackexchange.com/users/89193/hironobu-yamashita) who helped me in [this thread](https://tex.stackexchange.com/questions/463441/correct-line-breaking-for-japanese-using-babel/490272#490272). The main idea was Cicada's.