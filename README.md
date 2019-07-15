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

> **Note:** The examples
> assume MiKTeX 2.9.7015 installed system-wide on Windows 10 and
> use 'git bash' as the shell.

Install custom `.cls` and `.sty` files as you normally would;
there's nothing special about the following instructions.

Here are a few methods.

### [MiKTeX](https://docs.miktex.org/2.9/manual/localadditions.html "Integrating local additions")

See [here](https://texfaq.org/FAQ-what-TDS 'Which tree to use')
for trade-offs between the following options.

#### Option 1: MiKTeX-maintained [texmf tree](https://miktex.org/kb/texmf-roots)

1. Clone into 'local' directory in MiKTeX's texmf tree.
2. Refresh the file name database (FNDB).

e.g. using [initexmf](https://docs.miktex.org/manual/initexmf.html),

```bash
$ git clone https://github.com/bschiela/textools 'C:\Program Files\MiKTeX 2.9\tex\latex\local\textools'
$ initexmf --admin --update-fndb
```

The FNDB can also be refreshed via the
[MiKTeX Console](https://miktex.org/howto/miktex-console):\
Start > MiKTeX 2.9 > MiKTeX Console > Switch to administrator mode >
Tasks > Refresh file name database

#### Option 2: User-maintained [texmf tree](https://miktex.org/kb/texmf-roots)

1. Create a [TDS-compliant](https://miktex.org/kb/tds "TeX Directory Structure")
   texmf root.
2. Register the root with MiKTeX.
3. Clone into
   ['latex' directory](https://miktex.org/faq/local-additions "Which is the best directory to keep my .sty files?").
4. Refresh FNDB.

e.g.

<pre>
$ mkdir -p ~/texmf/tex/latex
$ initexmf --admin --register-root=C:\Users\<<i>username</i>>\texmf
$ git clone https://github.com/bschiela/textools ~/texmf/tex/latex/textools
$ initexmf --admin --update-fndb
</pre>

New texmf roots can also be added via the
[MiKTeX Console](https://miktex.org/howto/miktex-console):\
Start > MiKTeX 2.9 > MiKTeX Console > Switch to administrator mode >
Settings > Directories > +

> With TeX Live on macOS (via MaxTeX), symlink `textools` into the local [texmf tree](http://www.tug.org/mactex/faq/index.html#qm05) at `~/Library/texmf` in the `tex/latex/` subdirectory.

### [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

This method is useful for development and version-tracking.

Add this repo as a submodule of another LaTeX project, and
commit the `.gitmodules` and `textools` changes:

```bash
$ git submodule add https://github.com/bschiela/textools
$ git commit -a
```

Now git tracks which commit in `textools` your project depends on.

To use an *individual* file from the repo, use its relative path; e.g.

```latex
\documentclass{textools/classes/wfs-notes}
\usepackage{textools/packages/wfs-utils}
```

> **Note:** This will generate warnings, e.g.\
> LaTeX Warning: You have requested document class 'textools/classes/wfs-notes',
> but the document class provides 'wfs-notes'.

With MiKTeX there are
[better options](https://docs.miktex.org/2.9/manual/localadditions.html "Integrating local additions").
These will override versions installed globally via
[previous methods](#miktex), so that `.cls` and `.sty` files in the submodule
can be used normally, e.g.

```latex
\documentclass{wfs-notes}
\usepackage{wfs-suite}
```

#### Option 1: `--include-directory` command-line option

Pass `--include-directory` to prepend to the search path; e.g. using
[latexmk](https://ctan.org/pkg/latexmk "CTAN: Package latexmk")
to build `main.tex`,

```bash
$ latexmk -pdf -pdflatex="pdflatex --include-directory=textools/classes --include-directory=textools/packages" main
```

#### Option 2: `TEXINPUTS` environment variable

Set `TEXINPUTS` to prepend to the search path; e.g.

```bash
$ export TEXINPUTS="textools/classes;textools/packages"
$ latexmk -pdf main
```

> **Note:** The path separator on Windows is `;`, *not* `:`.

This also allows you to build your project from an IDE
started within the same process.

