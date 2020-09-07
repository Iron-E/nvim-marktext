# Introduction

`nvim-typora` is a plugin that aims to provide improved functionality with [Typora](typora.io) and its enhanced markdown features.

It is not meant to replace existing markdown plugins, only enhance their functionality with specific additions for Typora.

# Features

* Basic `mermaid` snippets
	* [x] Class Diagrams
	* [x] Entity Relationship Diagrams
	* [ ] Gantt
	* [x] Graphs
	* [ ] Pie Charts
	* [x] Sequence Diagrams
	* [ ] State Diagrams
	* [ ] User Journey Diagrams
* Basic Markdown snippets
	* [x] Code Blocks
	* [ ] LaTeX Blocks
	* [ ] Tables
		* [ ] Appending columns
		* [x] Initial generation
* Links to helpful documentation from `:help`.
	* [ ] LaTeX
	* [ ] Mermaid
	* [ ] Markdown

# Installation & Requirements

Requires the following:

* Neovim 0.5+
* [Typora](typora.io)

__Optionally__ requires the following:

* [nvim-libmodal](https://github.com/Iron-E/nvim-libmodal)
	* Snippet functionality with `:TyporaMode`.
* [vim-markdown](https://github.com/plasticboy/vim-markdown/blob/master/ftplugin/markdown.vim)
	* Automatic table formatting.

You can install it like any other plugin. Here is an example which uses `vim-plug`:

```viml
Plug 'Iron-E/nvim-libmodal'
Plug 'Iron-E/nvim-typora'
Plug 'plasticboy/vim-markdown'
```
