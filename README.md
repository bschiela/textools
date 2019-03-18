textools
========
This repository contains LaTeX document classes, packages, and templates to reduce boilerplate and other overhead when making LaTeX documents.
It aims to eliminate commonly repeated tasks by
encapsulating frequently used commands, styles, and formats so that
new LaTeX documents contain mostly content with minimal configuration.

Contents
--------
### Document classes

* `wfs-notes.cls`: For taking short-form notes.
* `wfs-resume.cls`: For making resumes and CVs.

### Packages

### Templates
These provide a quick starting point for new LaTeX projects.

* `.gitignore`
* `Makefile`
* `notes.tex`

Installation and Usage
----------------------
Install custom `.cls` and `.sty` files as you normally would;
there's nothing special about the following instructions.

Here are a few options.

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
    
### [MiKTeX](https://docs.miktex.org/2.9/manual/localadditions.html "MiKTeX docs: Integrating local additions")
See also [this forum question](https://latex.org/forum/viewtopic.php?f=12&t=14802).

1. Put the `.cls` file in MiKTeX's local directory, e.g. on Windows 10

    > C:\Program Files\MiKTeX 2.9\tex\latex\.
    
    This directory can be found (and new ones added) via the GUI:
    
    > Start > MiKTeX 2.9 > MiKTeX Settings (Admin) > Roots
    
2. Refresh the file name database, e.g. from a terminal

    ```bash
    $ initexmf --update-fndb
    ```
    
    or from the GUI, e.g. on Windows 10
    
    > Start > MiKTeX 2.9 > MiKTeX Settings (Admin) > General > Refresh FNDB.
    
3. Use the class name in your `.tex` file, e.g.

    ```latex
    \documentclass{wfs-notes}
    ```
