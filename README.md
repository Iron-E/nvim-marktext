# Introduction

`nvim-marktext` is a plugin that aims to provide improved functionality with [Marktext](https://marktext.app) and its enhanced markdown features.

It is not meant to replace existing markdown plugins, only enhance their functionality with specific additions for Marktext.

# Features

This plugin is still a work in progress. That said, it is in a good state for others to begin getting use out of it:

* Basic `mermaid` snippets
	* [x] Class Diagrams
	* [x] Entity Relationship Diagrams
	* [x] Gantt
	* [x] Graphs
	* [x] Pie Charts
	* [x] Sequence Diagrams
	* [x] State Diagrams
	* [x] User Journey Diagrams
* Basic Markdown snippets
	* [x] Code Blocks
	* [x] LaTeX Blocks
	* [x] Tables
		* [x] Manipulating columns
		* [x] Initial generation
* [x] Links to helpful documentation from `:help`.

## Demo

This is a demo of most of the features. `TableMode` can do more than is shown, and there are more ways to access these features than through `:execute`-ing commands. Read the [docs](./doc/marktext.txt) for more information.

![Demo](./media/2020_10_02.11_44_05.gif "Demo")

* The theme in the demo is [nvim-highlite](https://github.com/Iron-E/nvim-highlite).

# Installation & Requirements

Requires the following:

* Neovim 0.5+
* [Marktext](https://marktext.app)
* [nvim-libmodal](https://github.com/Iron-E/nvim-libmodal)
	* Snippet functionality with `:MarktextMode`.
	* Table manipulation with `:TableMode`.

__Optionally__ requires the following:

* [vim-markdown](https://github.com/plasticboy/vim-markdown/blob/master/ftplugin/markdown.vim)
	* Automatic table formatting.

You can install it like any other plugin. Here is an example which uses `vim-plug`:

```viml
Plug 'Iron-E/nvim-libmodal'
Plug 'Iron-E/nvim-marktext'
Plug 'plasticboy/vim-markdown'
```
