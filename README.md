textools
========
This repository contains LaTeX document classes, packages, and templates
to reduce boilerplate and other overhead when making LaTeX documents.
It aims to eliminate commonly repeated tasks by
encapsulating frequently used commands, styles, and formats so that
new LaTeX documents contain mostly content with minimal configuration.

Contents
--------
### Document classes

* `wfs-notes.cls`: For taking short-form notes.
* `wfs-resume.cls`: For making resumes and CVs.

### Packages

* `wfs-revision.sty`: For revising and adding TODOs.
* `wfs-utils.sty`: Adds document functionality and miscellaneous features.
* `wfs-notation.sty`: Commonly used symbols and macros for math notation.

### Templates
These provide a quick starting point for new LaTeX projects.

* `.gitignore`
* `Makefile`
* `notes.tex`

Installation
------------
Install custom `.cls` and `.sty` files as you normally would;
there's nothing special about the following instructions.

Here are a few options.

### [MiKTeX](https://docs.miktex.org/2.9/manual/localadditions.html "Integrating local additions")

The examples assume MiKTeX 2.9.7015 installed system-wide on Windows 10.

#### Option 1: MiKTeX-maintained [texmf tree](https://miktex.org/kb/texmf-roots "TEXMF root directories")

1. Clone into 'local' directory in MiKTeX's texmf tree.
2. Refresh the file name database (FNDB).

e.g. using [initexmf](https://docs.miktex.org/manual/initexmf.html),

    ```bash
    $ git clone https://github.com/bschiela/textools 'C:\Program Files\MiKTeX 2.9\tex\latex\local\textools'
    $ initexmf --admin --update-fndb
    ```

> **Note:** The FNDB can also be refreshed via the [MiKTeX Console](https://miktex.org/howto/miktex-console):\
> Start > MiKTeX 2.9 > MiKTeX Console > Switch to administrator mode > Tasks > Refresh file name database

#### Option 2: User-maintained texmf tree

1. Create a [TDS-compliant](https://miktex.org/kb/tds "TeX Directory Structure") texmf root.
2. Register the root with MiKTeX.
3. Clone into 'latex' [directory](https://miktex.org/faq/local-additions "Which is the best directory to keep my .sty files?").
4. Refresh FNDB.

e.g.

    <pre>
    $ mkdir -p ~/texmf/tex/latex
    $ initexmf --admin --register-root=C:\Users\<<i>username</i>>\texmf
    $ git clone https://github.com/bschiela/textools ~/texmf/tex/latex/textools
    $ initexmf --admin --update-fndb
    </pre>

> **Note:** New texmf roots can also be added via the MiKTeX Console:\
> Start > MiKTeX 2.9 > MiKTeX Console > Switch to administrator mode > Settings > Directories > +

### [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules "git submodules tutorial")
This option is useful for development.

1. Add this repo as a submodule of another LaTeX project:

    ```bash
    $ git submodule add https://github.com/bschiela/textools.git
    ```
    
2. Use the relative path to the `.cls` file, e.g.

    ```latex
    \documentclass{textools/classes/wfs-notes}
    ```
    
    **Note:** This will generate the warning:
    
    > LaTeX Warning: You have requested document class 'textools/classes/wfs-notes',
    but the document class provides 'wfs-notes'.
    
    unless the `.cls` file is in the same directory as the `.tex` file.
    
