Compiling
---------

To build the PDF:

    make

To clean everything up:

    make clean

Expected errors due to missing figures:

    Latexmk: Reference `exponent-format' on page 14 undefined 
    Latexmk: Reference `mantissa-format' on page 14 undefined 
    Latexmk: Reference `unnorm-math' on page 14 undefined 
    Latexmk: Reference `opt:be' on page 16 undefined 
    Latexmk: Reference `range-tracking' on page 16 undefined 


If you're doing a PhD thesis
----------------------------

You might need to uncomment the `\include{signature}` in `main.tex`
depending on your department.

There is a `propcover.tex` file you can use for your PhD proposal.


Editing `main.tex`
------------------

This file explains the options available to you for editting the file
main.tex.

The commands in the this file allow you to specify options such as
spacing, double-sided printing, a draft copy, etc.   By default, 12pt
and lgrind are included; lgrind is the 2e style for including code in
your thesis.

\documentclass[12pt]{mitthesis}
\usepackage{lgrind}
\pagestyle{plain}

You can add options in the documentclass line as follows:

	o  singlespace

	\documentclass[12pt,singlespace]{mitthesis}
	
	o  twoside

	\documentclass[12pt,twoside]{mitthesis}

	o  draft   (make sure to change the pagestyle to drafthead as
			well)

	\documentclass[12pt,draft]{mitthesis}
	\usepackage{lgrind}
	\pagestyle{drafthead}

	o vi   (for course vi and course viii theses)

	\documentclass[12pt,vi]{mitthesis}

Any options you would use for report.sty will work here as well.


You should not need to change the first three lines and last two lines
below.  Be sure to include an \include command for each file you are
including in your thesis.
  
    \include{cover}
    \pagestyle{plain}
    \include{contents}
    \include{chap1}
    \include{chap2}
    \appendix
    \include{appa}
    \include{appb}
    \include{biblio}
    \end{document}

Comment: to include appendices use a single \appendix command followed by
a number of \include{} commands as many files as needed, each of which
should contain a \chapter{} command for the appendix title.
This file includes the basic commands you will need to use within each
chapter of your thesis.

Chapters
--------

The file chap1.tex is a sample first chapter.  To get started, you may
just want to replace the text and commands in that file as needed.  In
general though, for each new chapter you want to do the following:

	o Make sure the name has the extension .tex .  Otherwise, you
	can call it anything you want.  For ease of use, all the
	examples use chap1, chap2, etc.

	o Add a line to the file main.tex that reads:

	\include{yourfilename}

	This should not include the .tex extension, because latex
	assumes that is there.

Basic syntax:

	o The first line of each chapter should be:

	\chapter{Chapter Title}

	o To start a new section (labeled chap#.sec# -- as in 1.1,
	1.2, etc):

	\section{Section Heading}

	You can also include subsections:

	\subsection{Heading}


Bibliography
------------

This file gives an overview on what you will need to do to create a
bibliographic database for references, as well as create the actual
bibliography for your thesis.

You should not need to touch the file `biblio.tex`.  This merely tells
latex to look for the file with the bibliographic info.  The file you
want to edit is main.bib.  For each entry, use the appropriate style
as designated in the file.

Citing your references:

When you cite a reference, you need to use the `key` you declare in
main.bib for the entry.  No one ever sees the keys, but you'll want to
use something you will easily remember.  For instance, if you had an
entry with:

	key=geer1

Then you would use `\cite{geer1}` to reference it within your thesis.

NOTE: You can not include references in your bibliography that are
never cited in your paper by default. If you need to do this, create a
key for the entry and at the end of your thesis include the line:

    \nocite{key}

This should be done for every entry which is not explicitly cited.

### More bibliography help

To comment out part of an entry in BibTeX, you can use:

	@Comment{body of text}

If you wish to comment out the entire entry, just remove the @ sign in
front of the entry type (i.e., get rid of the '@' in "@Book").

You can specify fixed strings (say if you needed to use it multiple
times in your BibTeX file) with the @String command:

	@String(Leslie-Lamport = {Leslie Lamport})

and then you could use it in various entries:

	@Book{latex,
		Author = Leslie-Lamport,
		Title = "\LaTeX",
		...
		Year = "1993"}

The required fields are not prefaced with OPT.  Those that are optional
*are* prefaced with OPT (remember to delete those three characters should
you wish to use those fields).

Note:
     For most entry types the "author" information is simply the AUTHOR
field.  However:  For the @Book and @Inbook entry types it's the AUTHOR
field, but if there's no author then it's the EDITOR field; for the
@Manual entry type it's the AUTHOR field, but if there's no author then
it's the ORGANIZATION field; and for the @Proceedings entry type it's
the EDITOR filed, but if there's no editor then it's the ORGANIZATION
field.

To use this, just have your main.tex specify the following:

	\bibliography{main}
	\bibliographystyle{plain}

There are several options for bibliographystyle:

    plain   normal style - listed in ABC order and labeled numerically
    unsrt   same as plain except entries appear in order of citation
    alpha   same as plain except entry labels are used
    abbrv   same as plain except uses abbreviations for first names,
            month names, and journal names

Now that you have the basis for a bibliography, you have to run both
latex and bibtex on the document.  First, you should run latex (to
create a foo.aux file, which bibtex reads).  Then run bibtex once to get
some of the citations and create a .bbl file.  Then run latex again so
that the cross references between the text file and the bibliography are
correct.  You may want to repeat running bibtex and latex on the file to
make sure that all cross references are correct.  Be warned that
adding/deleting citations and sources will require running bibtex again.

For more information on this topic, please refer the following pages in
the LaTeX manual by Leslie Lamport:

    72-74    Bibliography and Citation
    74-74    BibTeX
    140-147  Format of the .bib File (also gives info on other entry types)        
    187-188  Bibliography and Citation
