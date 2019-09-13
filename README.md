textools
========
This repository contains LaTeX document classes, packages, and templates
to reduce boilerplate and other overhead when making LaTeX documents.
It aims to eliminate commonly repeated tasks by
encapsulating frequently used commands, styles, and formats so that
new LaTeX documents contain mostly content with minimal configuration.

Contents
--------------------------------------------------------------------------------

### Document classes

* `wfs-notes.cls`: For taking short-form notes.
* `wfs-resume.cls`: For making resumes and CVs.

### Packages

* `wfs-suite.sty`: Wraps all packages in this set.

   options: `(wfs-)draft`, `final`, `initial`, `nostamp`

* `wfs-utils.sty`: Extends LaTeX code features and functionality.
* `wfs-tableau.sty`: Defines tableau 10 colors.
* `wfs-revision.sty`: For revising and adding TODOs.

   options: `final`, `initial`, `nostamp`

* `wfs-pdf.sty`: Adds pdf features/appearance-related macros.
* `wfs-notation.sty`: Defines default math notation.
* `wfs-theorem.sty`: Provides environments for theorems, proofs, etc.

### Templates
These provide a quick starting point for new LaTeX projects.

* `.gitignore`
* `Makefile`
* `notes.tex`

Installation
--------------------------------------------------------------------------------
Install custom `.cls` and `.sty` files as you normally would;
there's nothing special about the following instructions.

Start by cloning the repo:
```sh
$ git clone http://github.com/bschiela/textools.git ~/repos/textools
```


### `wfstex` package
This directory contains class `.cls` and style `.sty` files.

These should be symlinked or copied into a
[TDS-compliant](http://tug.org/tds/) `texmf` tree.

A minimalistic example:
```sh
$ tree ~/texmf
~/texmf
├── tex
│   └── latex
│       └── wfstex
├── bibtex
│   └── bib
```

You may need to make your TeX distro aware of your `texmf` tree, as follows.

> `tex` also defines a `TEXINPUTS` environment variable
> that can be used to prepend to the standard search path.


#### [TeX Live](http://tug.org/texlive/doc/)
TeX Live is aware of several `texmf` trees by default.

To find your [home or local](http://texfaq.org/FAQ-what-TDS) tree:
```sh
$ kpsewhich -var-value TEXMFHOME
$ kpsewhich -var-value TEXMFLOCAL
```

To add a tree in a non-default location:
```sh
$ tlmgr conf auxtrees add /some/other/texmf
```


#### [MiKTeX](http://docs.miktex.org/)
MiKTeX is aware of several `texmf` trees
[by default](http://miktex.org/kb/texmf-roots),
but you probably don't want to use those.

Instead, register your own
[TDS-compliant](http://miktex.org/kb/tds) `texmf` tree
and update the filename database:
```sh
$ initexmf --register-root="~/texmf"
$ initexmf --update-fndb
```
> You may need the `--admin` switch.

You can also manage your trees from the
[MiKTeX Console](http://miktex.org/howto/miktex-console)
under "Settings > Directories"
and refresh the filename database from the "Tasks" menu.

> MiKTeX also defines an `--include-directory` command line option
> that can be used to prepend to the standard search path.

### `latexmk`
There is a template `latexmkrc` file that configures `latexmk`
to use `pdflatex` and
to fire up and auto-update `xpdf` when the `-pvc` option is passed.

This can be symlinked/copied into your home
[XDG config](http://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
"XDG base directory spec")
directory:
```sh
$ tree ~/.config
~/.config
└── latexmk
    └── latexmkrc
```

It can also be overridden locally by a `.latexmkrc` file
in the working directory.
