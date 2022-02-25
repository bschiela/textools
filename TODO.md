To-do
=====

Bugs
----
* [ ] See A&M notes:
    * [ ] Generally, optimize form/function (e.g. thm environments, numbers/organization, etc.).
    * [ ] captions aren't justified to figure/table widths.
    * [ ] links to equations go to the wrong place.
* [ ] See QM1 problems:
  * [ ] Long section names overrun the header

Features / Functionality
------------------------
* [ ] optimize load/compile time. options:
  * [ ] conditionally load packages with their concomitant customizations via
    options.
  * [ ] load packages on per-document basis; custom package to set
    configurations/customizations if@packageloaded
* [ ] twocolumn compatibility of wfs-notes.cls
* [ ] `wfs-book.cls`: For taking long-form notes / 
  For compiling many `wfs-notes.cls`s into book form
* [ ] proper package/class documentation (use .dtx and .ins)
* [ ] option: cover page
* [ ] option: table of contents
* [ ] optional subtitle in wfs-notes.cls
  * [ ] make all maketitle params optional
* [ ] mouseover previews (via tooltips?)

Miscellaneous
-------------
* [ ] consider [tufte-latex](https://ctan.org/pkg/tufte-latex?lang=en)
  as a base class (the narrower text block of 60-70 characters is supposedly
  optimal)
