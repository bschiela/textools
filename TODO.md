To-do
=====

Bugs
----
* [ ] See A&M notes:
    * [ ] Generally, optimize form/function (e.g. thm environments, numbers/organization, etc.).
    * [ ] captions aren't justified to figure/table widths.
    * [ ] links to equations go to the wrong place.

Features / Functionality
------------------------
* [ ] `print` option to `wfs-suite.sty`
   * [ ] research side effects on other packages
     (consider global `wfs-print` analogous to `wfs-draft`)
   * [ ] remove colors (e.g. of hyperlinks, footnote links)
* [ ] `wfs-book.cls`: For taking long-form notes / 
  For compiling many `wfs-notes.cls`s into book form
* [ ] proper package/class documentation (use .dtx and .ins)
* [ ] option: cover page
* [ ] option: table of contents
* [ ] optional subtitle in wfs-notes.cls
* [ ] optimize load/compile time (conditionally load packages with their
  concomitant customizations via options).

Miscellaneous
-------------
* [ ] consider [tufte-latex](https://ctan.org/pkg/tufte-latex?lang=en)
  as a base class (the narrower text block of 60-70 characters is supposedly
  optimal)
