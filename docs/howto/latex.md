# Work With LaTeX

LaTeX is available on {{ site.cluster.name }} as a core software.  For example,

```sh
[alice@{{ site.devel.name }} ~]$ pdflatex --version
pdfTeX 3.1415926-2.5-1.40.14 (TeX Live 2013)
kpathsea version 6.1.1
Copyright 2013 Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
Compiled with libpng 1.5.13; using libpng 1.5.13
Compiled with zlib 1.2.7; using zlib 1.2.7
Compiled with poppler version 0.26.5

[alice@{{ site.devel.name }} ~]$ 
```

## Install missing LaTeX packages

LaTeX documents may depend on different LaTeX packages, which are typically specified as `\usepackage{<some name>}` declarations at the the top of the LaTeX file.  The most common packages are preinstalled on the cluster, but not all.  You can see which ones are installed by using `tlmgr` - the native TeX Live Manager - as in:

```sh
[alice@{{ site.devel.name }} ~]$ tlmgr list --only-installed
i amsfonts: TeX fonts from the American Mathematical Society
i amsmath: AMS mathematical facilities for LaTeX
i atbegshi: Execute stuff at \shipout time
...
i zapfding: URW "Base 35" font pack for LaTeX

[alice@{{ site.devel.name }} ~]$ 
```

If a LaTeX document that you try to compile uses a LaTeX package that is not installed, say, the **appendix** package, then you will see compilation errors such as:

```plain
LaTeX errors:
! LaTeX Error: File `appendix.sty' not found.
```

To install the LaTeX package that provides this missing `appendix.sty` file, a first good guess is that the package is name **appendix**.  To install the LaTeX package with that name to our personal account, we do:

```sh
[alice@{{ site.devel.name }} ~]$ tlmgr install appendix
tlmgr: package repository https://mirror.las.iastate.edu/tex-archive/systems/texlive/tlnet (verified)
[1/1, ??:??/??:??] install: appendix [3k]
running mktexlsr ...
done running mktexlsr.
tlmgr: package log updated: {{ site.user.home }}/.TinyTeX/texmf-var/web2c/tlmgr.log
tlmgr: command log updated: {{ site.user.home }}/.TinyTeX/texmf-var/web2c/tlmgr-commands.log

[alice@{{ site.devel.name }} ~]$ 
```

If we call `tlmgr list --only-installed` again, we will find that **appendix** is now also listed.
