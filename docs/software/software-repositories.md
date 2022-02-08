<!--
WARNING: Do _not_ update this file; it is automatically generated from software-respository.md.rsp.
-->



# Software Repositories

In addition to the [core software] tools that are available by default, other software tools are available via _environment modules_.  Particularly, there are software tools that are installed and maintained by other users or research groups.  To access these, we first need to load the corresponding "Software Repository" module.  For example, to get access to the repository and the software shared by the UCSF Computation Biology and Informatics core (CBI), make sure to load ("enable") the repository first, e.g.

```sh
module load CBI
```

Then use `module avail` to list what modules and versions are available (or see below).  Next, to actually get access to one or more of the shared software modules, use `module load <name>` or `module load <name>/<version>`.  Here are a few examples:
```sh
module load bowtie2
module load bowtie2/2.4.2
module load r
```

It is possible to (i) enable a software repository and (ii) load a set of software tools in one call, e.g.
```sh
module load CBI r bwa bowtie2/2.4.2
```


Below are 3 software repositories, each providing a set of software tools.


<ul class="nav nav-pills">
  <li class="active"><a data-toggle="pill" href="#queues-built-in"><span style="font-weight: bold;">built-in</span>&nbsp;(4)</a></li>
  <li><a data-toggle="pill" href="#queues-CBI"><span style="font-weight: bold;">CBI</span>&nbsp;(81)</a></li>
  <li><a data-toggle="pill" href="#queues-WitteLab"><span style="font-weight: bold;">WitteLab</span>&nbsp;(17)</a></li>
</ul>

<div class="tab-content" style="margin-top: 1ex;">
<div id="queues-built-in" class="tab-pane fadein active">

<h2>Module Software Repository: built-in</h2>

Maintained by: {{ site.cluster.nickname }} Systems Administrators, <a href="{{ '/about/contact.html' | relative_url }}">{{ site.cluster.name }}</a><br>
Enable repository: <em>this software repository is always enabled</em><br>

<dl>
  <dt id="built-in--matlab">matlab</dt>
  <dd>
    Versions: <span class="module-version"><em>2021a</em></span><br>
  </dd>

  <dt id="built-in--mpi">mpi</dt>
  <dd>
    Versions: <span class="module-version">openmpi3-x86_64, <em>openmpi-x86_64</em></span><br>
  </dd>

  <dt id="built-in--openjdk">openjdk</dt>
  <dd>
    <strong class="module-help">openjdk: Open Java Development Kit</strong><br>
    <span class="module-description">OpenJDK is a free and open-source implementation of the Java Platform, Standard Edition. It is the result of an effort Sun Microsystems began in 2006.</span><br>
    Example: <span class="module-example"><code>java -version</code> and <code>javac -version</code>.</span><br>
    URL: <span class="module-url"><a href="https://openjdk.java.net/">https://openjdk.java.net/</a></span><br>
    Versions: <span class="module-version">1.6.0, 1.8.0, <em>11</em></span><br>
  </dd>

  <dt id="built-in--scl-python">scl-python</dt>
  <dd>
    Versions: <span class="module-version"><em>3.6</em></span><br>
  </dd>

</dl>
</div> 

<div id="queues-CBI" class="tab-pane fade">

<h2>Module Software Repository: CBI</h2>

Maintained by: Henrik Bengtsson, <a href="https://cbi.ucsf.edu">Computational Biology and Informatics</a><br>
Enable repository: <code>module load CBI</code><br>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
Please note that this software stacks is maintained and contributed by a research group on a voluntary basis. It is <em>not</em> maintained by the {{ site.cluster.name }} admins. Please reach out to the corresponding maintainer for bug reports, feedback, or questions.
</div>

<dl>
  <dt id="CBI--annovar">annovar</dt>
  <dd>
    <strong class="module-help">ANNOVAR: Functional Annotation of Genetic Variants from Next-Generation Sequencing Data</strong><br>
    <span class="module-description">ANNOVAR is an efficient software tool to utilize update-to-date information to functionally annotate genetic variants detected from diverse genomes (including human genome hg18, hg19, hg38, as well as mouse, worm, fly, yeast and many others).</span><br>
    Example: <span class="module-example"><code>annotate_variation.pl --help</code>.</span><br>
    URL: <span class="module-url"><a href="https://annovar.openbioinformatics.org/en/latest/">https://annovar.openbioinformatics.org/en/latest/</a>, <a href="https://annovar.openbioinformatics.org/en/latest/misc/version_history/">https://annovar.openbioinformatics.org/en/latest/misc/version_history/</a> (changelog)</span><br>
    Versions: <span class="module-version">2011-10-02, 2015-06-17, <em>2020-06-07</em></span><br>
  </dd>

  <dt id="CBI--apache-ant">apache-ant</dt>
  <dd>
    <strong class="module-help">Apache Ant: A Java Library and Command-Line Tool to Build Software</strong><br>
    <span class="module-description">Apache Ant is a Java library and command-line tool that help building software.</span><br>
    Example: <span class="module-example"><code>ant -h</code></span><br>
    URL: <span class="module-url"><a href="https://ant.apache.org/bindownload.cgi">https://ant.apache.org/bindownload.cgi</a>, <a href="https://ant.apache.org/antnews.html">https://ant.apache.org/antnews.html</a> (changelog)</span><br>
    Versions: <span class="module-version"><em>1.10.12</em></span><br>
  </dd>

  <dt id="CBI--asciigenome">asciigenome</dt>
  <dd>
    <strong class="module-help">ASCIIGenome: Text Only Genome Viewer</strong><br>
    <span class="module-description">ASCIIGenome is a genome browser based on command line interface and designed for running from console terminals. Since ASCIIGenome does not require a graphical interface it is particularly useful for quickly visualizing genomic data on remote servers while offering flexibility similar to popular GUI viewers like IGV.</span><br>
    Example: <span class="module-example"><code>ASCIIGenome --help</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/dariober/ASCIIGenome">https://github.com/dariober/ASCIIGenome</a>, <a href="https://github.com/dariober/ASCIIGenome/blob/master/CHANGELOG.md">https://github.com/dariober/ASCIIGenome/blob/master/CHANGELOG.md</a> (changelog), <a href="https://asciigenome.readthedocs.io/en/latest/">https://asciigenome.readthedocs.io/en/latest/</a> (documentation)</span><br>
    Versions: <span class="module-version">1.15.0, <em>1.16.0</em></span><br>
  </dd>

  <dt id="CBI--bamutil">bamutil</dt>
  <dd>
    <strong class="module-help">bamUtil: Programs for Working on SAM/BAM Files</strong><br>
    <span class="module-description">bamUtil is a repository that contains several programs that perform operations on SAM/BAM files. All of these programs are built into a single executable, <code>bam</code>.</span><br>
    Example: <span class="module-example"><code>bam help</code>.</span><br>
    URL: <span class="module-url"><a href="https://genome.sph.umich.edu/wiki/BamUtil">https://genome.sph.umich.edu/wiki/BamUtil</a>, <a href="https://genome.sph.umich.edu/wiki/BamUtil#Releases">https://genome.sph.umich.edu/wiki/BamUtil#Releases</a> (changelog), <a href="https://github.com/statgen/bamUtil">https://github.com/statgen/bamUtil</a> (source code)</span><br>
    Versions: <span class="module-version">1.0.14, <em>1.0.15</em></span><br>
  </dd>

  <dt id="CBI--bashdb">bashdb</dt>
  <dd>
    <strong class="module-help">bashdb: Bash Debugger Script</strong><br>
    <span class="module-description">The Bash Debugger Project is a source-code debugger for bash that follows the gdb command syntax.</span><br>
    Example: <span class="module-example"><code>bashdb --help</code>, <code>bash --version</code>.</span><br>
    URL: <span class="module-url"><a href="http://bashdb.sourceforge.net/">http://bashdb.sourceforge.net/</a>, <a href="https://sourceforge.net/p/bashdb/code/ci/master/tree/">https://sourceforge.net/p/bashdb/code/ci/master/tree/</a>, <a href="https://sourceforge.net/p/bashdb/bugs/">https://sourceforge.net/p/bashdb/bugs/</a>, <a href="https://sourceforge.net/projects/bashdb/files/bashdb/">https://sourceforge.net/projects/bashdb/files/bashdb/</a></span><br>
    Versions: <span class="module-version"><em>4.4-1.0.1</em></span><br>
  </dd>

  <dt id="CBI--bat">bat</dt>
  <dd>
    <strong class="module-help">bat: A cat(1) Clone with Syntax Highlighting and Git Integration</strong><br>
    <span class="module-description">A cat(1) clone with syntax highlighting and Git integration.</span><br>
    Example: <span class="module-example"><code>bat README.md</code>, <code>bat scripts/*.sh</code>, and <code>bat src/*.c</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/sharkdp/bat">https://github.com/sharkdp/bat</a>, <a href="https://github.com/sharkdp/bat/blob/master/CHANGELOG.md">https://github.com/sharkdp/bat/blob/master/CHANGELOG.md</a> (changelog)</span><br>
    Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
    Versions: <span class="module-version">0.17.1, 0.18.3, <em>0.19.0</em></span><br>
  </dd>

  <dt id="CBI--bats-core">bats-core</dt>
  <dd>
    <strong class="module-help">bats: Bash Automated Testing System</strong><br>
    <span class="module-description">Bats is a TAP-compliant testing framework for Bash. It provides a simple way to verify that the UNIX programs you write behave as expected.</span><br>
    Example: <span class="module-example"><code>bats --version</code>, <code>bats --help</code>, <code>man bats</code>, <code>man 7 bats</code>, and <code>bats tests/</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/bats-core/bats-core">https://github.com/bats-core/bats-core</a>, <a href="https://github.com/bats-core/bats-core#version-history">https://github.com/bats-core/bats-core#version-history</a> (changelog), <a href="https://bats-core.readthedocs.io/en/stable/">https://bats-core.readthedocs.io/en/stable/</a> (documentation)</span><br>
    Versions: <span class="module-version">1.2.1, <em>1.5.0</em></span><br>
  </dd>

  <dt id="CBI--bcftools">bcftools</dt>
  <dd>
    <strong class="module-help">BCFtools: Utilities for Variant Calling and Manipulating VCFs and BCFs</strong><br>
    <span class="module-description">BCFtools is a set of utilities that manipulate variant calls in the Variant Call Format (VCF) and its binary counterpart BCF. All commands work transparently with both VCFs and BCFs, both uncompressed and BGZF-compressed.</span><br>
    Example: <span class="module-example"><code>bcftools --version</code></span><br>
    URL: <span class="module-url"><a href="https://www.htslib.org/">https://www.htslib.org/</a>, <a href="https://github.com/samtools/bcftools/blob/develop/NEWS">https://github.com/samtools/bcftools/blob/develop/NEWS</a> (changelog), <a href="https://github.com/samtools/bcftools">https://github.com/samtools/bcftools</a> (source code)</span><br>
    Versions: <span class="module-version">1.10.2, 1.11, 1.12, 1.13, <em>1.14</em></span><br>
  </dd>

  <dt id="CBI--bcl2fastq">bcl2fastq</dt>
  <dd>
    <strong class="module-help">bcl2fastq: Illumina Conversion Software</strong><br>
    <span class="module-description">bcl2fastq Conversion Software both demultiplexes data and converts BCL files generated by Illumina sequencing systems to standard FASTQ file formats for downstream analysis.</span><br>
    Example: <span class="module-example"><code>bcl2fastq --version</code></span><br>
    URL: <span class="module-url"><a href="https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software.html">https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software.html</a>, <a href="https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software/downloads.html">https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software/downloads.html</a> (changelog)</span><br>
    Versions: <span class="module-version"><em>2.20.0</em></span><br>
  </dd>

  <dt id="CBI--bedops">bedops</dt>
  <dd>
    <strong class="module-help">BEDOPS: The Fast, Highly Scalable and Easily-Parallelizable Genome Analysis Toolkit</strong><br>
    <span class="module-description">BEDOPS is an open-source command-line toolkit that performs highly efficient and scalable Boolean and other set operations, statistical calculations, archiving, conversion and other management of genomic data of arbitrary scale. Tasks can be easily split by chromosome for distributing whole-genome analyses across a computational cluster.</span><br>
    Example: <span class="module-example"><code>bedops --version</code></span><br>
    URL: <span class="module-url"><a href="https://bedops.readthedocs.io/">https://bedops.readthedocs.io/</a>, <a href="https://bedops.readthedocs.io/en/latest/content/revision-history.html">https://bedops.readthedocs.io/en/latest/content/revision-history.html</a> (changelog), <a href="https://github.com/bedops/bedops">https://github.com/bedops/bedops</a> (source code)</span><br>
    Versions: <span class="module-version">2.4.39, <em>2.4.40</em></span><br>
  </dd>

  <dt id="CBI--bedtools2">bedtools2</dt>
  <dd>
    <strong class="module-help">bedtools2: The Swiss Army Knife for Genome Arithmetic</strong><br>
    <span class="module-description">Collectively, the bedtools utilities are a swiss-army knife of tools for a wide-range of genomics analysis tasks. The most widely-used tools enable genome arithmetic: that is, set theory on the genome. For example, bedtools allows one to intersect, merge, count, complement, and shuffle genomic intervals from multiple files in widely-used genomic file formats such as BAM, BED, GFF/GTF, VCF.</span><br>
    Example: <span class="module-example"><code>bedtools --version</code> and <code>ls $BEDTOOLS2_HOME/genomes/</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/arq5x/bedtools2/">https://github.com/arq5x/bedtools2/</a>, <a href="https://bedtools.readthedocs.io/en/latest/content/history.html">https://bedtools.readthedocs.io/en/latest/content/history.html</a> (changelog), <a href="https://bedtools.readthedocs.org">https://bedtools.readthedocs.org</a> (documentation), <a href="https://code.google.com/archive/p/bedtools/downloads">https://code.google.com/archive/p/bedtools/downloads</a> (legacy)</span><br>
    Versions: <span class="module-version">2.16.2, 2.18.1, 2.26.0, 2.29.2, <em>2.30.0</em></span><br>
  </dd>

  <dt id="CBI--blast">blast</dt>
  <dd>
    <strong class="module-help">BLAST+: Basic Local Alignment Search Tool</strong><br>
    <span class="module-description">BLAST finds regions of similarity between biological sequences. The program compares nucleotide or protein sequences to sequence databases and calculates the statistical significance.</span><br>
    Example: <span class="module-example"><code>blastx -version</code></span><br>
    URL: <span class="module-url"><a href="https://blast.ncbi.nlm.nih.gov/Blast.cgi">https://blast.ncbi.nlm.nih.gov/Blast.cgi</a>, <a href="https://www.ncbi.nlm.nih.gov/books/NBK131777/">https://www.ncbi.nlm.nih.gov/books/NBK131777/</a> (changelog)</span><br>
    Versions: <span class="module-version">2.10.1, 2.11.0, <em>2.12.0</em></span><br>
  </dd>

  <dt id="CBI--blat">blat</dt>
  <dd>
    <strong class="module-help">BLAT: Fast Sequence Search Command Line Tool</strong><br>
    <span class="module-description">BLAT - client and server combined into a single program, first building the index, then using the index, and then exiting.</span><br>
    Example: <span class="module-example"><code>blat</code></span><br>
    URL: <span class="module-url"><a href="https://genome.ucsc.edu/goldenPath/help/blatSpec.html">https://genome.ucsc.edu/goldenPath/help/blatSpec.html</a></span><br>
    Versions: <span class="module-version"><em>36x4</em></span><br>
  </dd>

  <dt id="CBI--bowtie">bowtie</dt>
  <dd>
    <strong class="module-help">Bowtie: A Fast and Sensitive Gapped Read Aligner</strong><br>
    <span class="module-description">Bowtie is an ultrafast, memory-efficient short read aligner.</span><br>
    Example: <span class="module-example"><code>bowtie --version</code> and <code>ls $BOWTIE_HOME/{genomes,indexes}</code></span><br>
    Note: <span class="module-note">This is Bowtie v1 - <em>not v2</em>.</span><br>
    URL: <span class="module-url"><a href="http://bowtie-bio.sourceforge.net/index.shtml">http://bowtie-bio.sourceforge.net/index.shtml</a>, <a href="http://bowtie-bio.sourceforge.net/index.shtml">http://bowtie-bio.sourceforge.net/index.shtml</a> (changelog), <a href="https://github.com/BenLangmead/bowtie">https://github.com/BenLangmead/bowtie</a> (source code)</span><br>
    Versions: <span class="module-version">1.2.3, 1.3.0, <em>1.3.1</em></span><br>
  </dd>

  <dt id="CBI--bowtie2">bowtie2</dt>
  <dd>
    <strong class="module-help">Bowtie 2: A Fast and Sensitive Gapped Read Aligner</strong><br>
    <span class="module-description">Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequences.</span><br>
    Example: <span class="module-example"><code>bowtie2 --version</code></span><br>
    URL: <span class="module-url"><a href="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml">http://bowtie-bio.sourceforge.net/bowtie2/index.shtml</a>, <a href="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml">http://bowtie-bio.sourceforge.net/bowtie2/index.shtml</a> (changelog), <a href="https://github.com/BenLangmead/bowtie2">https://github.com/BenLangmead/bowtie2</a> (source code)</span><br>
    Versions: <span class="module-version">2.4.1, 2.4.2, 2.4.4, <em>2.4.5</em></span><br>
  </dd>

  <dt id="CBI--bwa">bwa</dt>
  <dd>
    <strong class="module-help">BWA: Burrows-Wheeler Aligner</strong><br>
    <span class="module-description">Burrows-Wheeler Aligner (BWA) is a software package for mapping low-divergent sequences against a large reference genome, such as the human genome.</span><br>
    Example: <span class="module-example"><code>bwa</code>.</span><br>
    URL: <span class="module-url"><a href="http://bio-bwa.sourceforge.net/">http://bio-bwa.sourceforge.net/</a>, <a href="https://github.com/lh3/bwa/blob/master/NEWS.md">https://github.com/lh3/bwa/blob/master/NEWS.md</a> (changelog), <a href="https://github.com/lh3/bwa">https://github.com/lh3/bwa</a> (source code)</span><br>
    Versions: <span class="module-version">0.5.10, <em>0.7.17</em></span><br>
  </dd>

  <dt id="CBI--byobu">byobu</dt>
  <dd>
    <strong class="module-help">byobu: Elegant Enhancement of the Otherwise Functional, Plain, Practical GNU Screen</strong><br>
    <span class="module-description">Byobu is an elegant enhancement of the otherwise functional, plain, practical GNU Screen. Byobu includes an enhanced profile, configuration utilities, and system status notifications for the GNU screen window manager as well as the Tmux terminal multiplexer.</span><br>
    Example: <span class="module-example"><code>byobu --version</code>.</span><br>
    URL: <span class="module-url"><a href="https://www.byobu.org/">https://www.byobu.org/</a>, <a href="https://bazaar.launchpad.net/~kirkland/byobu/trunk/view/head:/debian/changelog">https://bazaar.launchpad.net/~kirkland/byobu/trunk/view/head:/debian/changelog</a> (changelog), <a href="https://github.com/dustinkirkland/byobu">https://github.com/dustinkirkland/byobu</a> (source code)</span><br>
    Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
    Versions: <span class="module-version"><em>5.133</em></span><br>
  </dd>

  <dt id="CBI--cellranger">cellranger</dt>
  <dd>
    <strong class="module-help">Cell Ranger: 10x Genomics Pipeline for Single-Cell Data Analysis</strong><br>
    <span class="module-description">Cell Ranger is a set of analysis pipelines that process Chromium Single Cell 3' RNA-seq output to align reads, generate gene-cell matrices and perform clustering and gene expression analysis.</span><br>
    Example: <span class="module-example"><code>cellranger</code>.</span><br>
    URL: <span class="module-url"><a href="https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/what-is-cell-ranger">https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/what-is-cell-ranger</a>, <a href="https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/release-notes">https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/release-notes</a> (changelog), <a href="https://github.com/10XGenomics/cellranger">https://github.com/10XGenomics/cellranger</a> (source code)</span><br>
    Warning: <span class="module-warning">To prevent a single Cell Ranger process from hijacking all CPU and RAM by default, this module sets environment variable <code>MROFLAGS='--localcores=1 --localmem=8 --limit-loadavg'</code> making those the default.</span><br>
    Versions: <span class="module-version">4.0.0, 5.0.1, 6.1.1, <em>6.1.2</em></span><br>
  </dd>

  <dt id="CBI--clp">clp</dt>
  <dd>
    <strong class="module-help">Clp: COIN-OR Linear Programming Solver</strong><br>
    <span class="module-description">Clp (Coin-or linear programming) is an open-source linear programming solver. It is primarily meant to be used as a callable library, but a basic, stand-alone executable version is also available.</span><br>
    Example: <span class="module-example"><code>clp</code></span><br>
    URL: <span class="module-url"><a href="https://www.coin-or.org/">https://www.coin-or.org/</a>, <a href="https://github.com/coin-or/Clp">https://github.com/coin-or/Clp</a> (source code)</span><br>
    Versions: <span class="module-version">1.17.2, <em>1.17.6</em></span><br>
  </dd>

  <dt id="CBI--cluster-utils">cluster-utils</dt>
  <dd>
    <strong class="module-help">cluster-utils: Collection of Utilities / Helper Scripts to Make Life Easier on HPC Clusters</strong><br>
    <span class="module-description">Collection of utilities / helper scripts to make life easier on HPC clusters.</span><br>
    Example: <span class="module-example"><code>ctop</code> and <code>ctopx</code> (silence 'Invalid user id' output).</span><br>
    URL: <span class="module-url"><a href="https://github.com/molgenis/cluster-utils/">https://github.com/molgenis/cluster-utils/</a></span><br>
    Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
    Versions: <span class="module-version">20.07.2, <em>21.05.1</em></span><br>
  </dd>

  <dt id="CBI--cmake">cmake</dt>
  <dd>
    <strong class="module-help">CMake: Open-source, Cross-platform Family of Tools Designed to Build, Test and Package Software</strong><br>
    <span class="module-description">CMake is cross-platform free and open-source software for managing the build process of software using a compiler-independent method. It supports directory hierarchies and applications that depend on multiple libraries.</span><br>
    Example: <span class="module-example"><code>cmake --version</code>.</span><br>
    URL: <span class="module-url"><a href="https://cmake.org/">https://cmake.org/</a>, <a href="https://github.com/Kitware/CMake/releases">https://github.com/Kitware/CMake/releases</a></span><br>
    Versions: <span class="module-version">3.18.2, 3.19.2, <em>3.22.2</em></span><br>
  </dd>

  <dt id="CBI--coinutils">coinutils</dt>
  <dd>
    <strong class="module-help">CoinUtils: COIN-OR Utilities</strong><br>
    <span class="module-description">CoinUtils is an open-source collection of classes and helper functions that are generally useful to multiple COIN-OR projects. CoinUtils is written in C++ and is released as open source under the Eclipse Public License 2.0.</span><br>
    URL: <span class="module-url"><a href="https://www.coin-or.org/">https://www.coin-or.org/</a>, <a href="https://github.com/coin-or/CoinUtils">https://github.com/coin-or/CoinUtils</a></span><br>
    Versions: <span class="module-version"><em>2.11.4</em></span><br>
  </dd>

  <dt id="CBI--control-freec">control-freec</dt>
  <dd>
    <strong class="module-help">Control FREEC: Control-FREE Copy Number and Genotype Caller</strong><br>
    <span class="module-description">Prediction of copy numbers and allelic content using deep-sequencing data.</span><br>
    Example: <span class="module-example"><code>freec</code>.</span><br>
    URL: <span class="module-url"><a href="http://boevalab.com/FREEC/">http://boevalab.com/FREEC/</a>, <a href="https://github.com/BoevaLab/FREEC/">https://github.com/BoevaLab/FREEC/</a></span><br>
    Versions: <span class="module-version">11.5, <em>11.6</em></span><br>
  </dd>

  <dt id="CBI--cufflinks">cufflinks</dt>
  <dd>
    <strong class="module-help">Cufflinks: Transcriptome Assembly and Differential Expression Analysis for RNA-Seq</strong><br>
    <span class="module-description">Cufflinks assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples. It accepts aligned RNA-Seq reads and assembles the alignments into a parsimonious set of transcripts. Cufflinks then estimates the relative abundances of these transcripts based on how many reads support each one, taking into account biases in library preparation protocols.</span><br>
    Example: <span class="module-example"><code>cufflinks</code>.</span><br>
    URL: <span class="module-url"><a href="http://cole-trapnell-lab.github.io/cufflinks/">http://cole-trapnell-lab.github.io/cufflinks/</a>, <a href="https://github.com/cole-trapnell-lab/cufflinks">https://github.com/cole-trapnell-lab/cufflinks</a></span><br>
    Versions: <span class="module-version"><em>2.2.1</em></span><br>
  </dd>

  <dt id="CBI--cutadapt">cutadapt</dt>
  <dd>
    <strong class="module-help">Cutadapt: Remove Adapter Sequences from Sequencing Reads</strong><br>
    <span class="module-description">Cutadapt finds and removes adapter sequences, primers, poly-A tails and other types of unwanted sequence from your high-throughput sequencing reads.</span><br>
    Example: <span class="module-example"><code>cutadapt --version</code> and <code>cutadapt --help</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/marcelm/cutadapt">https://github.com/marcelm/cutadapt</a></span><br>
    Versions: <span class="module-version">1.2.1, 1.8.1, <em>3.4</em></span><br>
  </dd>

  <dt id="CBI--easycatfs">easycatfs</dt>
  <dd>
    <strong class="module-help">easycatfs: Easy Read-Only Mounting of Slow Folders onto a Local Drive</strong><br>
    <span class="module-description">This is Linux command-line tool for mounting one or more folders on a network file system on a local disk such that the local-disk folders mirrors everything (read-only) on the network folder. This will result in (i) faster repeated access to files, and (ii) decreased load on the network file system. This is particularly beneficial when working on high-performance compute (HPC) clusters used by hundreds and thousands of processes and users simultaneously..</span><br>
    Example: <span class="module-example"><code>easycatfs --help</code> and <code>easycatfs mount /shared/data</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/HenrikBengtsson/easycatfs">https://github.com/HenrikBengtsson/easycatfs</a></span><br>
    Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
    Versions: <span class="module-version">0.1.0, 0.1.2, 0.1.3, 0.1.4, <em>0.1.5</em></span><br>
  </dd>

  <dt id="CBI--emacs">emacs</dt>
  <dd>
    <strong class="module-help">GNU Emacs: An Extensible, Customizable, Free/Libre Text Editor</strong><br>
    <span class="module-description">At its core is an interpreter for Emacs Lisp, a dialect of the Lisp programming language with extensions to support text editing.</span><br>
    Example: <span class="module-example"><code>emacs --version</code> and <code>emacs -nw</code>.</span><br>
    URL: <span class="module-url"><a href="https://www.gnu.org/software/emacs/">https://www.gnu.org/software/emacs/</a>, <a href="https://www.gnu.org/savannah-checkouts/gnu/emacs/emacs.html#Releases">https://www.gnu.org/savannah-checkouts/gnu/emacs/emacs.html#Releases</a></span><br>
    Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
    Versions: <span class="module-version">26.3, 27.1, <em>27.2</em></span><br>
  </dd>

  <dt id="CBI--fastqc">fastqc</dt>
  <dd>
    <strong class="module-help">FastQC: A Quality Control Analysis Tool for High Throughput Sequencing Data</strong><br>
    <span class="module-description">FastQC is a program designed to spot potential problems in high througput sequencing datasets. It runs a set of analyses on one or more raw sequence files in fastq or bam format and produces a report which summarises the results.</span><br>
    Example: <span class="module-example"><code>fastqc --version</code>.</span><br>
    URL: <span class="module-url"><a href="https://www.bioinformatics.babraham.ac.uk/projects/download.html#fastqc">https://www.bioinformatics.babraham.ac.uk/projects/download.html#fastqc</a>, <a href="https://github.com/s-andrews/FastQC/">https://github.com/s-andrews/FastQC/</a></span><br>
    Versions: <span class="module-version"><em>0.11.9</em></span><br>
  </dd>

  <dt id="CBI--fzf">fzf</dt>
  <dd>
    <strong class="module-help">fzf - A Command-Line Fuzzy Finder</strong><br>
    <span class="module-description">fzf is a general-purpose command-line fuzzy finder. It's an interactive Unix filter for command-line that can be used with any list; files, command history, processes, hostnames, bookmarks, git commits, etc.</span><br>
    Example: <span class="module-example"><code>fzf --version</code> and <code>emacs &quot;$(fzf)&quot;</code>.</span><br>
    Note: <span class="module-note">To install tab completions and key bindinds to your shell, call <code>$FZF_HOME/install</code>. To uninstall, use <code>$FZF_HOME/uninstall</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/junegunn/fzf">https://github.com/junegunn/fzf</a>, <a href="https://github.com/junegunn/fzf/wiki">https://github.com/junegunn/fzf/wiki</a></span><br>
    Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
    Versions: <span class="module-version">0.22.0, 0.25.1, 0.27.2, 0.28.0, <em>0.29.0</em></span><br>
  </dd>

  <dt id="CBI--gatk">gatk</dt>
  <dd>
    <strong class="module-help">Genome Analysis Toolkit (GATK): Variant Discovery in High-Throughput Sequencing Data</strong><br>
    <span class="module-description">Developed in the Data Sciences Platform at the Broad Institute, the toolkit offers a wide variety of tools with a primary focus on variant discovery and genotyping. Its powerful processing engine and high-performance computing features make it capable of taking on projects of any size.</span><br>
    Example: <span class="module-example"><code>gatk --help</code> and <code>gatk --list</code>.</span><br>
    URL: <span class="module-url"><a href="https://software.broadinstitute.org/gatk/">https://software.broadinstitute.org/gatk/</a>, <a href="https://github.com/broadinstitute/gatk">https://github.com/broadinstitute/gatk</a>, <a href="https://github.com/broadgsa/gatk">https://github.com/broadgsa/gatk</a>, <a href="https://console.cloud.google.com/storage/browser/gatk-software/package-archive">https://console.cloud.google.com/storage/browser/gatk-software/package-archive</a>, <a href="ftp://ftp.broadinstitute.org/pub/gsa/GenomeAnalysisTK/">ftp://ftp.broadinstitute.org/pub/gsa/GenomeAnalysisTK/</a></span><br>
    Versions: <span class="module-version">1.1-37-ge63d9d8, 1.6-5-g557da77, 4.1.1.0, 4.1.7.0, 4.1.8.1, 4.1.9.0, 4.2.0.0, 4.2.2.0, 4.2.3.0, <em>4.2.4.1</em></span><br>
  </dd>

  <dt id="CBI--gcta">gcta</dt>
  <dd>
    <strong class="module-help">GCTA: Genome-wide Complex Trait Analysis</strong><br>
    <span class="module-description">A tool for Genome-wide Complex Trait Analysis (GCTA).</span><br>
    Example: <span class="module-example"><code>gcta64</code>.</span><br>
    URL: <span class="module-url"><a href="https://yanglab.westlake.edu.cn/software/gcta/#Overview">https://yanglab.westlake.edu.cn/software/gcta/#Overview</a>, <a href="https://cnsgenomics.com/software/gcta/">https://cnsgenomics.com/software/gcta/</a></span><br>
    Versions: <span class="module-version">1.93.2beta, <em>1.93.3beta2</em></span><br>
  </dd>

  <dt id="CBI--gdal">gdal</dt>
  <dd>
    <strong class="module-help">GDAL: Geospatial Data Abstraction Library</strong><br>
    <span class="module-description">GDAL is an open source X/MIT licensed translator library for raster and vector geospatial data formats.</span><br>
    Example: <span class="module-example"><code>gdalinfo --version</code></span><br>
    URL: <span class="module-url"><a href="https://gdal.org/">https://gdal.org/</a>, <a href="https://github.com/OSGeo/gdal">https://github.com/OSGeo/gdal</a></span><br>
    Versions: <span class="module-version"><em>2.4.4</em></span><br>
  </dd>

  <dt id="CBI--geos">geos</dt>
  <dd>
    <strong class="module-help">GEOS: Geometry Engine, Open Source</strong><br>
    <span class="module-description">GEOS (Geometry Engine - Open Source) is a C++ port of the JTS Topology Suite (JTS). It aims to contain the complete functionality of JTS in C++. This includes all the OpenGIS Simple Features for SQL spatial predicate functions and spatial operators, as well as specific JTS enhanced functions. GEOS provides spatial functionality to many other projects and products.</span><br>
    Example: <span class="module-example"><code>geos-config --version</code>.</span><br>
    URL: <span class="module-url"><a href="https://libgeos.org/">https://libgeos.org/</a>, <a href="https://libgeos.org/usage/download/">https://libgeos.org/usage/download/</a> (changelog), <a href="https://github.com/libgeos/geos/issues">https://github.com/libgeos/geos/issues</a> (bug reports)</span><br>
    Versions: <span class="module-version">3.5.2, 3.7.3, 3.8.1, 3.9.1, <em>3.9.2</em></span><br>
  </dd>

  <dt id="CBI--gistic2">gistic2</dt>
  <dd>
    <strong class="module-help">GISTIC2: Genomic Identification of Significant Targets in Cancer (GISTIC), version 2</strong><br>
    <span class="module-description">GISTIC2.0 facilitates sensitive and confident localization of the targets of focal somatic copy-number alteration in human cancers.</span><br>
    Example: <span class="module-example"><code>gistic2</code>.</span><br>
    URL: <span class="module-url"><a href="https://software.broadinstitute.org/cancer/cga/gistic">https://software.broadinstitute.org/cancer/cga/gistic</a>, <a href="https://github.com/broadinstitute/gistic2">https://github.com/broadinstitute/gistic2</a>, <a href="https://www.genepattern.org/modules/docs/GISTIC_2.0/7">https://www.genepattern.org/modules/docs/GISTIC_2.0/7</a></span><br>
    Versions: <span class="module-version"><em>2.0.23</em></span><br>
  </dd>

  <dt id="CBI--git-flow">git-flow</dt>
  <dd>
    <strong class="module-help">git-flow: Git Extension Git Flow (AVH Edition)</strong><br>
    <span class="module-description">A collection of Git extensions to provide high-level repository operations for Vincent Driessen's branching model.</span><br>
    Example: <span class="module-example"><code>git flow</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/petervanderdoes/gitflow-avh">https://github.com/petervanderdoes/gitflow-avh</a>, <a href="https://github.com/nvie/gitflow">https://github.com/nvie/gitflow</a></span><br>
    Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
    Versions: <span class="module-version"><em>1.12.3</em></span><br>
  </dd>

  <dt id="CBI--glow">glow</dt>
  <dd>
    <strong class="module-help">glow: Render Markdown on the CLI, with Pizzazz!</strong><br>
    <span class="module-description">Glow is a terminal based markdown reader designed from the ground up to bring out the beauty—and power—of the CLI.  Use it to discover markdown files, read documentation directly on the command line and stash markdown files to your own private collection so you can read them anywhere. Glow will find local markdown files in subdirectories or a local Git repository.</span><br>
    Example: <span class="module-example"><code>glow README.md</code>, <code>glow --pager README.md</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/charmbracelet/glow">https://github.com/charmbracelet/glow</a></span><br>
    Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
    Versions: <span class="module-version">1.3.0, <em>1.4.1</em></span><br>
  </dd>

  <dt id="CBI--gsl">gsl</dt>
  <dd>
    <strong class="module-help">GSL: Gnu Scientific Library</strong><br>
    <span class="module-description">The GNU Scientific Library (GSL) is a numerical library for C and C++ programmers. It is free software under the GNU General Public License. The library provides a wide range of mathematical routines such as random number generators, special functions and least-squares fitting. There are over 1000 functions in total with an extensive test suite.</span><br>
    Example: <span class="module-example"><code>gsl-config --version</code></span><br>
    URL: <span class="module-url"><a href="https://www.gnu.org/software/gsl/">https://www.gnu.org/software/gsl/</a></span><br>
    Versions: <span class="module-version">2.6, <em>2.7</em></span><br>
  </dd>

  <dt id="CBI--hdf5">hdf5</dt>
  <dd>
    <strong class="module-help">hdf5: A General Purpose Library and File Format for Storing Scientific Data</strong><br>
    <span class="module-description">Hierarchical Data Format (HDF) is a set of file formats (HDF4, HDF5) designed to store and organize large amounts of data. The HDF5 format is designed to address some of the limitations of the HDF4 library, and to address current and anticipated requirements of modern systems and applications.</span><br>
    Example: <span class="module-example"><code>h5stat --version</code></span><br>
    URL: <span class="module-url"><a href="https://www.hdfgroup.org/downloads/hdf5/">https://www.hdfgroup.org/downloads/hdf5/</a></span><br>
    Versions: <span class="module-version">1.12.0, <em>1.12.1</em></span><br>
  </dd>

  <dt id="CBI--hisat2">hisat2</dt>
  <dd>
    <strong class="module-help">HISAT2: Graph-based Alignment of Next Generation Sequencing Reads to a Population of Genomes</strong><br>
    <span class="module-description">HISAT2 is a fast and sensitive alignment program for mapping next-generation sequencing reads (both DNA and RNA) to a population of human genomes (as well as to a single reference genome). Based on an extension of BWT for graphs [Sirén et al. 2014], we designed and implemented a graph FM index (GFM), an original approach and its first implementation to the best of our knowledge. In addition to using one global GFM index that represents a population of human genomes, HISAT2 uses a large set of small GFM indexes that collectively cover the whole genome (each index representing a genomic region of 56 Kbp, with 55,000 indexes needed to cover the human population). These small indexes (called local indexes), combined with several alignment strategies, enable rapid and accurate alignment of sequencing reads. This new indexing scheme is called a Hierarchical Graph FM index (HGFM).</span><br>
    Example: <span class="module-example"><code>hisat2 --version</code>.</span><br>
    URL: <span class="module-url"><a href="https://daehwankimlab.github.io/hisat2/">https://daehwankimlab.github.io/hisat2/</a>, <a href="https://github.com/DaehwanKimLab/hisat2/">https://github.com/DaehwanKimLab/hisat2/</a></span><br>
    Versions: <span class="module-version"><em>2.2.0</em></span><br>
  </dd>

  <dt id="CBI--htop">htop</dt>
  <dd>
    <strong class="module-help">htop: An Interactive Process Viewer for Unix</strong><br>
    <span class="module-description"><code>htop</code> is an interactive process viewer for Unix systems. It is a text-mode application (for console or X terminals) and requires ncurses.</span><br>
    Example: <span class="module-example"><code>htop</code>.</span><br>
    URL: <span class="module-url"><a href="https://htop.dev">https://htop.dev</a>, <a href="https://github.com/htop-dev/htop">https://github.com/htop-dev/htop</a></span><br>
    Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
    Versions: <span class="module-version">3.0.4, 3.0.5, 3.1.0, 3.1.1, <em>3.1.2</em></span><br>
  </dd>

  <dt id="CBI--htslib">htslib</dt>
  <dd>
    <strong class="module-help">HTSlib: C Library for High-Throughput Sequencing Data Formats</strong><br>
    <span class="module-description">HTSlib is an implementation of a unified C library for accessing common file formats, such as SAM, CRAM and VCF, used for high-throughput sequencing data, and is the core library used by samtools and bcftools. HTSlib also provides the bgzip, htsfile, and tabix utilities.</span><br>
    Example: <span class="module-example"><code>bgzip --version</code>, <code>htsfile --version</code>, and <code>tabix --version</code>.</span><br>
    URL: <span class="module-url"><a href="https://www.htslib.org/">https://www.htslib.org/</a>, <a href="https://github.com/samtools/htslib">https://github.com/samtools/htslib</a></span><br>
    Versions: <span class="module-version">1.10.2, 1.11, 1.12, 1.13, <em>1.14</em></span><br>
  </dd>

  <dt id="CBI--htstools">htstools</dt>
  <dd>
    <strong class="module-help">htstools: Tools to Process BAM Files for Downstream Copy-Number Analysis</strong><br>
    <span class="module-description">Contains three tools (dnafrags, ppflag-fixer, snp-pileup) written by Alex Studer to process bam files for downstream copy number analysis.</span><br>
    Example: <span class="module-example"><code>snp-pileup --help</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/mskcc/htstools">https://github.com/mskcc/htstools</a></span><br>
    Versions: <span class="module-version"><em>0.1.1</em></span><br>
  </dd>

  <dt id="CBI--igv">igv</dt>
  <dd>
    <strong class="module-help">IGV: The Integrative Genomics Viewer</strong><br>
    <span class="module-description">The Integrative Genomics Viewer (IGV) is a high-performance visualization tool for interactive exploration of large, integrated genomic datasets. It supports a wide variety of data types, including array-based and next-generation sequence data, and genomic annotations.</span><br>
    Example: <span class="module-example"><code>igv</code>.</span><br>
    Note: <span class="module-note">IGV (&gt;= 2.5.0) requires Java 11. Coincidentally, <code>igvtools</code> is integrated with IGV (&gt;= 2.5.0).</span><br>
    URL: <span class="module-url"><a href="https://software.broadinstitute.org/software/igv/">https://software.broadinstitute.org/software/igv/</a>, <a href="https://software.broadinstitute.org/software/igv/download">https://software.broadinstitute.org/software/igv/download</a></span><br>
    Versions: <span class="module-version">2.8.6, 2.8.13, 2.9.1, 2.11.0, 2.11.3, <em>2.11.9</em></span><br>
  </dd>

  <dt id="CBI--igvtools">igvtools</dt>
  <dd>
    <strong class="module-help">IGVTools: Tools for Pre-processing HT-Seq Data Files</strong><br>
    <span class="module-description">The igvtools utility provides a set of tools for pre-processing data files. Note, <code>igvtools</code> moved to IGV as of IGV (&gt;= 2.5.0).</span><br>
    Example: <span class="module-example"><code>igvtools help</code>.</span><br>
    URL: <span class="module-url"><a href="https://software.broadinstitute.org/software/igv/igvtools">https://software.broadinstitute.org/software/igv/igvtools</a></span><br>
    Versions: <span class="module-version"><em>2.4.19</em></span><br>
  </dd>

  <dt id="CBI--jags">jags</dt>
  <dd>
    <strong class="module-help">JAGS: Just Another Gibbs Sampler</strong><br>
    <span class="module-description">JAGS is Just Another Gibbs Sampler.  It is a program for analysis of Bayesian hierarchical models using Markov Chain Monte Carlo (MCMC) simulation not wholly unlike BUGS.</span><br>
    Example: <span class="module-example"><code>jags</code> and <code>man jags</code>.</span><br>
    URL: <span class="module-url"><a href="http://mcmc-jags.sourceforge.net/">http://mcmc-jags.sourceforge.net/</a></span><br>
    Versions: <span class="module-version"><em>4.3.0</em></span><br>
  </dd>

  <dt id="CBI--kallisto">kallisto</dt>
  <dd>
    <strong class="module-help">kallisto: Near-optimal RNA-Seq Quantification</strong><br>
    <span class="module-description">kallisto is a program for quantifying abundances of transcripts from RNA-Seq data, or more generally of target sequences using high-throughput sequencing reads. It is based on the novel idea of pseudoalignment for rapidly determining the compatibility of reads with targets, without the need for alignment.</span><br>
    Example: <span class="module-example"><code>kallisto version</code>.</span><br>
    URL: <span class="module-url"><a href="https://pachterlab.github.io/kallisto/about.html">https://pachterlab.github.io/kallisto/about.html</a>, <a href="https://github.com/pachterlab/kallisto">https://github.com/pachterlab/kallisto</a></span><br>
    Versions: <span class="module-version"><em>0.46.2</em></span><br>
  </dd>

  <dt id="CBI--lg3">lg3</dt>
  <dd>
    <strong class="module-help">lg3: The UCSF Costello Lab's LG3 Pipeline</strong><br>
    <span class="module-description">This is the LG3 Pipeline developed by the UCSF Costello Lab.</span><br>
    Example: <span class="module-example"><code>lg3 --help</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/UCSF-Costello-Lab/LG3_Pipeline">https://github.com/UCSF-Costello-Lab/LG3_Pipeline</a></span><br>
    Warning: <span class="module-warning">This software can currently only run on the C4 cluster and legacy TIPCC cluster as the UCSF Cancer Center.</span><br>
    Versions: <span class="module-version">2021-10-09, 2021-10-10, <em>2021-10-11</em></span><br>
  </dd>

  <dt id="CBI--libsbml">libsbml</dt>
  <dd>
    <strong class="module-help">libSBML: An Open-Source Library for Working with SBML (the Systems Biology Markup Language)</strong><br>
    <span class="module-description">LibSBML is a native library for reading, writing and manipulating files and data streams containing the Systems Biology Markup Language (SBML). It offers language bindings for C, C++, C#, Java, JavaScript, MATLAB, Perl, PHP, Python, R and Ruby.</span><br>
    URL: <span class="module-url"><a href="http://sbml.org/Software/libSBML">http://sbml.org/Software/libSBML</a>, <a href="https://github.com/sbmlteam/libsbml">https://github.com/sbmlteam/libsbml</a></span><br>
    Versions: <span class="module-version">5.10.2, <em>5.19.0</em></span><br>
  </dd>

  <dt id="CBI--mc">mc</dt>
  <dd>
    <strong class="module-help">mc: Midnight Commander</strong><br>
    <span class="module-description">GNU Midnight Commander is a visual file manager. It's a feature rich full-screen text mode application that allows you to copy, move and delete files and whole directory trees, search for files and run commands in the subshell. Internal viewer and editor are included.</span><br>
    Example: <span class="module-example"><code>mc</code> and <code>mc --version</code>.</span><br>
    URL: <span class="module-url"><a href="http://www.midnight-commander.org/">http://www.midnight-commander.org/</a>, <a href="https://github.com/MidnightCommander/mc">https://github.com/MidnightCommander/mc</a></span><br>
    Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
    Versions: <span class="module-version">4.8.26, <em>4.8.27</em></span><br>
  </dd>

  <dt id="CBI--mutect">mutect</dt>
  <dd>
    <strong class="module-help">muTect: Identification of Somatic Point Mutations in Next Generation Sequencing Data of Cancer Genomes</strong><br>
    <span class="module-description">MuTect is a method developed at the Broad Institute for the reliable and accurate identification of somatic point mutations in next generation sequencing data of cancer genomes.</span><br>
    Example: <span class="module-example"><code>mutect</code>, which is short for <code>java -Xmx2g -jar &quot;$MUTECT_JAR&quot;</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/broadinstitute/mutect">https://github.com/broadinstitute/mutect</a>, <a href="https://software.broadinstitute.org/cancer/cga/mutect">https://software.broadinstitute.org/cancer/cga/mutect</a></span><br>
    Versions: <span class="module-version">1.0.27783, 1.1.1, 1.1.4, <em>1.1.5</em></span><br>
  </dd>

  <dt id="CBI--pandoc">pandoc</dt>
  <dd>
    <strong class="module-help">Pandoc: A Universal Document Converter</strong><br>
    <span class="module-description">Pandoc is a Haskell library and software tool for converting from one markup format to another, and a command-line tool that uses this library.</span><br>
    Example: <span class="module-example"><code>pandoc --version</code>.</span><br>
    URL: <span class="module-url"><a href="https://pandoc.org/">https://pandoc.org/</a>, <a href="https://github.com/jgm/pandoc">https://github.com/jgm/pandoc</a></span><br>
    Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
    Versions: <span class="module-version">2.10.1, 2.11.3.2, 2.11.4, 2.14.2, <em>2.16.2</em></span><br>
  </dd>

  <dt id="CBI--picard">picard</dt>
  <dd>
    <strong class="module-help">Picard: Command-line tools for Manipulating High-throughput Sequencing Data and Formats</strong><br>
    <span class="module-description">Picard is a set of command line tools for manipulating high-throughput sequencing (HTS) data and formats such as SAM/BAM/CRAM and VCF.</span><br>
    Example: <span class="module-example"><code>picard -h</code>, which is an alias for <code>java -jar $PICARD_HOME/picard.jar -h</code></span><br>
    URL: <span class="module-url"><a href="http://broadinstitute.github.io/picard/">http://broadinstitute.github.io/picard/</a>, <a href="https://github.com/broadinstitute/picard">https://github.com/broadinstitute/picard</a></span><br>
    Versions: <span class="module-version">1.64, 2.23.1, 2.24.0, 2.25.0, 2.26.2, 2.26.5, <em>2.26.10</em></span><br>
  </dd>

  <dt id="CBI--pindel">pindel</dt>
  <dd>
    <strong class="module-help">pindel: Detection of Indels and Structural Variations</strong><br>
    <span class="module-description">Pindel can detect breakpoints of large deletions, medium sized insertions, inversions, tandem duplications and other structural variants at single-based resolution from next-gen sequence data. It uses a pattern growth approach to identify the breakpoints of these variants from paired-end short reads.</span><br>
    Example: <span class="module-example"><code>pindel</code>.</span><br>
    URL: <span class="module-url"><a href="https://www.sanger.ac.uk/science/tools/pindel">https://www.sanger.ac.uk/science/tools/pindel</a>, <a href="https://github.com/genome/pindel">https://github.com/genome/pindel</a></span><br>
    Versions: <span class="module-version">0.2.4t, <em>0.2.5b8</em></span><br>
  </dd>

  <dt id="CBI--plink">plink</dt>
  <dd>
    <strong class="module-help">PLINK: Whole Genome Association Analysis Toolset</strong><br>
    <span class="module-description">PLINK is a free, open-source whole genome association analysis toolset, designed to perform a range of basic, large-scale analyses in a computationally efficient manner. The focus of PLINK is purely on analysis of genotype/phenotype data, so there is no support for steps prior to this (e.g. study design and planning, generating genotype or CNV calls from raw data).</span><br>
    Example: <span class="module-example"><code>plink --help</code>.</span><br>
    URL: <span class="module-url"><a href="https://www.cog-genomics.org/plink/">https://www.cog-genomics.org/plink/</a></span><br>
    Versions: <span class="module-version">1.90b6.18, 1.90b6.21, <em>1.90b6.24</em></span><br>
  </dd>

  <dt id="CBI--plink2">plink2</dt>
  <dd>
    <strong class="module-help">PLINK2: Whole Genome Association Analysis Toolset</strong><br>
    <span class="module-description">PLINK is a free, open-source whole genome association analysis toolset, designed to perform a range of basic, large-scale analyses in a computationally efficient manner. The focus of PLINK is purely on analysis of genotype/phenotype data, so there is no support for steps prior to this (e.g. study design and planning, generating genotype or CNV calls from raw data).</span><br>
    Example: <span class="module-example"><code>plink2 --help</code>.</span><br>
    URL: <span class="module-url"><a href="https://www.cog-genomics.org/plink/2.0/">https://www.cog-genomics.org/plink/2.0/</a>, <a href="https://github.com/chrchang/plink-ng">https://github.com/chrchang/plink-ng</a></span><br>
    Versions: <span class="module-version"><em>2.00a3LM</em></span><br>
  </dd>

  <dt id="CBI--proj">proj</dt>
  <dd>
    <strong class="module-help">PROJ: PROJ Coordinate Transformation Software Library</strong><br>
    <span class="module-description">PROJ is a generic coordinate transformation software that transforms geospatial coordinates from one coordinate reference system (CRS) to another. This includes cartographic projections as well as geodetic transformations. PROJ includes command line applications for easy conversion of coordinates from text files or directly from user input. In addition to the command line utilities PROJ also exposes an application programming interface, or API in short. The API lets developers use the functionality of PROJ in their own software without having to implement similar functionality themselves.</span><br>
    Example: <span class="module-example"><code>geod</code>, <code>proj</code> and <code>man proj</code>.</span><br>
    URL: <span class="module-url"><a href="https://proj.org/">https://proj.org/</a>, <a href="https://proj.org/news.html">https://proj.org/news.html</a> (changelog), <a href="https://github.com/OSGeo/PROJ">https://github.com/OSGeo/PROJ</a> (source code)</span><br>
    Versions: <span class="module-version"><em>4.9.3</em></span><br>
  </dd>

  <dt id="CBI--r">r</dt>
  <dd>
    <strong class="module-help">R: The R Programming Language</strong><br>
    <span class="module-description">The R programming language.</span><br>
    Example: <span class="module-example"><code>R --version</code> and <code>Rscript --version</code>.</span><br>
    URL: <span class="module-url"><a href="https://www.r-project.org/">https://www.r-project.org/</a></span><br>
    Versions: <span class="module-version">2.15.0, 3.0.0, 3.1.0, 3.2.0, 3.3.0, 3.5.0, 3.5.3, 3.6.0, 3.6.3, 4.0.0, 4.0.2, 4.0.3, 4.0.4, 4.0.5, 4.1.0-gcc8, 4.1.1-gcc8, <em>4.1.2-gcc8</em></span><br>
  </dd>

  <dt id="CBI--r-siteconfig">r-siteconfig</dt>
  <dd>
    <strong class="module-help">R Site Configuration: Tweaks to R for the Current Compute Environment</strong><br>
    <span class="module-description">Sets R options and environment variables customized for the current compute environment. Notably, it configures R to install packages from local CRAN and Bioconductor mirrors without the need for internet access.</span><br>
    Example: <span class="module-example">In R, <code>install.packages(&quot;ggplot2&quot;)</code>.</span><br>
    Versions: <span class="module-version"><em>0.1</em></span><br>
  </dd>

  <dt id="CBI--rclone">rclone</dt>
  <dd>
    <strong class="module-help">rclone: Rsync for Cloud Storage and More</strong><br>
    <span class="module-description">Rclone is a command line program to sync files and directories to and from a large number of end points on the local file system, or remote file systems, and in the cloud.</span><br>
    Example: <span class="module-example"><code>rclone --version</code>, <code>rclone --help</code>, <code>rclone config</code>, and <code>info rclone</code>.</span><br>
    URL: <span class="module-url"><a href="https://rclone.org/">https://rclone.org/</a>, <a href="https://rclone.org/changelog/">https://rclone.org/changelog/</a> (changelog) <a href="https://github.com/rclone/rclone">https://github.com/rclone/rclone</a> (source code)</span><br>
    Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
    Versions: <span class="module-version">1.53.3, 1.54.0, 1.56.1, <em>1.57.0</em></span><br>
  </dd>

  <dt id="CBI--ripgrep">ripgrep</dt>
  <dd>
    <strong class="module-help">ripgrep - Recursively Searches Directories for a Regex Pattern</strong><br>
    <span class="module-description">ripgrep is a line-oriented search tool that recursively searches your current directory for a regex pattern. By default, ripgrep will respect your .gitignore and automatically skip hidden files/directories and binary files. ripgrep is similar to other popular search tools like The Silver Searcher, ack and grep.</span><br>
    Example: <span class="module-example"><code>rg --version</code> and <code>rg -i 'lorem ipsum'</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/BurntSushi/ripgrep">https://github.com/BurntSushi/ripgrep</a></span><br>
    Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
    Versions: <span class="module-version">12.1.1, <em>13.0.0</em></span><br>
  </dd>

  <dt id="CBI--rstudio">rstudio</dt>
  <dd>
    <strong class="module-help">rstudio: RStudio Desktop</strong><br>
    <span class="module-description">The RStudio Desktop is an integrated development environment (IDE) for R, a programming language for statistical computing and graphics.</span><br>
    Example: <span class="module-example"><code>rstudio</code>.  If you get blank window, retry with <code>QMLSCENE_DEVICE=softwarecontext rstudio</code>.</span><br>
    URL: <span class="module-url"><a href="https://rstudio.com/products/rstudio/#rstudio-desktop">https://rstudio.com/products/rstudio/#rstudio-desktop</a>, <a href="https://www.rstudio.com/products/rstudio/release-notes/">https://www.rstudio.com/products/rstudio/release-notes/</a>, <a href="https://www.rstudio.com/products/rstudio/download/">https://www.rstudio.com/products/rstudio/download/</a></span><br>
    Warning: <span class="module-warning">This software works only on the development nodes. It requires a connection with X11 Forwarding enabled. It does <em>not</em> work with X2Go (gives error &quot;GLX 1.3 or later is required&quot;). For best performance, use SSH compression when using X11 Forwarding, i.e. <code>ssh -X -C ...</code>.</span><br>
    Versions: <span class="module-version">1.4.1103, 1.4.1717, 2021.09.0+351, 2021.09.1-372, <em>2021.09.2-382</em></span><br>
  </dd>

  <dt id="CBI--rstudio-server">rstudio-server</dt>
  <dd>
    <strong class="module-help">RStudio Server: The RStudio Server</strong><br>
    <span class="module-description">The RStudio Server is an integrated development environment (IDE) for R that can be used from the web browser.</span><br>
    Example: <span class="module-example"><code>rserver</code>.</span><br>
    URL: <span class="module-url"><a href="https://rstudio.com/products/rstudio/#rstudio-server">https://rstudio.com/products/rstudio/#rstudio-server</a>, <a href="https://www.rstudio.com/products/rstudio/release-notes/">https://www.rstudio.com/products/rstudio/release-notes/</a></span><br>
    Warning: <span class="module-warning">This is work under construction!</span><br>
    Versions: <span class="module-version"><em>2021.09.2-382</em></span><br>
  </dd>

  <dt id="CBI--rstudio-server-controller">rstudio-server-controller</dt>
  <dd>
    <strong class="module-help">RSC: An RStudio Server Controller</strong><br>
    <span class="module-description">The RStudio Server Controller (RSC) is a tool for launching a personal instance of the RStudio Server on a Linux machine, which then can be access via the web browser, either directly or via SSH tunneling.</span><br>
    Example: <span class="module-example"><code>rsc --help</code> and <code>rsc start --port=uid</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/UCSF-CBI/rstudio-server-controller">https://github.com/UCSF-CBI/rstudio-server-controller</a></span><br>
    Warning: <span class="module-warning">This is work under construction!</span><br>
    Versions: <span class="module-version">0.3.0, <em>0.3.3</em></span><br>
  </dd>

  <dt id="CBI--salmon">salmon</dt>
  <dd>
    <strong class="module-help">salmon: Salmon Provides Fast and Bias-Aware Quantification of Transcript Expression</strong><br>
    <span class="module-description">Highly-accurate &amp; wicked fast transcript-level quantification from RNA-seq reads using selective alignment.</span><br>
    Example: <span class="module-example"><code>salmon --version</code>.</span><br>
    URL: <span class="module-url"><a href="https://combine-lab.github.io/salmon/">https://combine-lab.github.io/salmon/</a>, <a href="https://github.com/COMBINE-lab/salmon">https://github.com/COMBINE-lab/salmon</a></span><br>
    Versions: <span class="module-version">1.3.0, 1.4.0, 1.5.2, <em>1.6.0</em></span><br>
  </dd>

  <dt id="CBI--samtools">samtools</dt>
  <dd>
    <strong class="module-help">SAMtools: Tools (written in C using htslib) for Manipulating Next-Generation Sequencing Data</strong><br>
    <span class="module-description">SAMtools is a suite of programs for interacting with high-throughput sequencing data.</span><br>
    Example: <span class="module-example"><code>samtools --version</code>.</span><br>
    URL: <span class="module-url"><a href="https://www.htslib.org/">https://www.htslib.org/</a>, <a href="https://github.com/samtools/samtools">https://github.com/samtools/samtools</a></span><br>
    Versions: <span class="module-version">0.1.12a, 0.1.18, 1.10, 1.11, 1.12, 1.13, <em>1.14</em></span><br>
  </dd>

  <dt id="CBI--scl-devtoolset">scl-devtoolset</dt>
  <dd>
    <strong class="module-help">SCL Developer Toolset: GNU Compiler Collection, GNU Debugger, etc.</strong><br>
    <span class="module-description">These Developer Toolset provides modern versions of the GNU Compiler Collection, GNU Debugger, and other development, debugging, and performance monitoring tools. Loading these modules enables the corresponding CentOS Software Collection (SCL) <code>devtoolset-&lt;version&gt;</code> in the current environment.  This is an alternative to calling <code>source scl_source enable devtoolset-&lt;version&gt;</code>, which is an approach that is not officially supported by RedHat/CentOS.</span><br>
    Example: <span class="module-example"><code>gcc --version</code>.</span><br>
    URL: <span class="module-url"><a href="https://access.redhat.com/documentation/en-us/red_hat_developer_toolset/11">https://access.redhat.com/documentation/en-us/red_hat_developer_toolset/11</a></span><br>
    Warning: <span class="module-warning">Older versions may be removed in the future.</span><br>
    Versions: <span class="module-version">7, 8, 9, 10, <em>11</em></span><br>
  </dd>

  <dt id="CBI--scl-rh-ruby">scl-rh-ruby</dt>
  <dd>
    <strong class="module-help">SCL Ruby: Ruby</strong><br>
    <span class="module-description">Enables the CentOS Software Collection (SCL) <code>rh-ruby26</code> in the current environment.  This is an alternative to calling <code>source scl_source enable rh-ruby26</code>, which is an approach that is not of ficially supported by RedHat/CentOS.</span><br>
    Example: <span class="module-example"><code>irb --help</code>, <code>ruby --help</code>, <code>ruby script.rb</code>.</span><br>
    URL: <span class="module-url"><a href="https://www.softwarecollections.org/en/scls/rhscl/rh-ruby26/">https://www.softwarecollections.org/en/scls/rhscl/rh-ruby26/</a></span><br>
    Versions: <span class="module-version">25, <em>26</em></span><br>
  </dd>

  <dt id="CBI--shellcheck">shellcheck</dt>
  <dd>
    <strong class="module-help">ShellCheck: A Shell Script Static Analysis Tool</strong><br>
    <span class="module-description">ShellCheck finds bugs in your shell scripts.</span><br>
    Example: <span class="module-example"><code>shellcheck --version</code> and <code>shellcheck -x ~/.bashrc</code>.</span><br>
    URL: <span class="module-url"><a href="https://www.shellcheck.net/">https://www.shellcheck.net/</a>, <a href="https://github.com/koalaman/shellcheck/">https://github.com/koalaman/shellcheck/</a></span><br>
    Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
    Versions: <span class="module-version">0.7.1, 0.7.2, <em>0.8.0</em></span><br>
  </dd>

  <dt id="CBI--snpeff">snpeff</dt>
  <dd>
    <strong class="module-help">SnpEff: Genetic Variant Annotation and Effect Prediction Toolbox</strong><br>
    <span class="module-description">SnpEff is a variant annotation and effect prediction tool. It annotates and predicts the effects of variants on genes (such as amino acid changes).</span><br>
    Example: <span class="module-example"><code>snpEff -help</code>, <code>SnpSift -help</code>,  and <code>ClinEff -help</code>, which are aliases for <code>java -jar $SNPEFF_HOME/snpEff/snpEff.jar -help</code>, <code>java -jar $SNPEFF_HOME/snpEff/SnpSift.jar -help</code>, and <code>java -jar $SNPEFF_HOME/clinEff/ClinEff.jar -help</code>.</span><br>
    URL: <span class="module-url"><a href="http://snpeff.sourceforge.net/">http://snpeff.sourceforge.net/</a></span><br>
    Versions: <span class="module-version">4.3t, 5.0c, <em>5.0e</em></span><br>
  </dd>

  <dt id="CBI--sqlite">sqlite</dt>
  <dd>
    <strong class="module-help">sqlite: SQLite Database Engine &amp; Library</strong><br>
    <span class="module-description">SQLite is a relational database management system (RDBMS) contained in a C library. In contrast to many other database management systems, SQLite is not a client–server database engine. Rather, it is embedded into the end program.</span><br>
    Example: <span class="module-example"><code>sqlite3 --version</code>.</span><br>
    URL: <span class="module-url"><a href="https://sqlite.org/">https://sqlite.org/</a></span><br>
    Versions: <span class="module-version"><em>3.32.3</em></span><br>
  </dd>

  <dt id="CBI--sratoolkit">sratoolkit</dt>
  <dd>
    <strong class="module-help">SRA Toolkit: Tools and Libraries for Using Data in the INSDC Sequence Read Archives</strong><br>
    <span class="module-description">The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives.</span><br>
    Example: <span class="module-example"><code>fastq-dump --help</code>.</span><br>
    URL: <span class="module-url"><a href="https://ncbi.github.io/sra-tools/">https://ncbi.github.io/sra-tools/</a>, <a href="https://github.com/ncbi/sra-tools">https://github.com/ncbi/sra-tools</a></span><br>
    Warning: <span class="module-warning">To work around a bug where <code>fasterq-dump</code> crashes the local machine, it has been tweaked such that it uses <code>$TMPDIR</code> rather than <code>$PWD</code> as the default temporary folder and it will only use two threads instead of six by default.</span><br>
    Versions: <span class="module-version">2.10.8, 2.10.9, 2.11.0, 2.11.1, 2.11.2, <em>2.11.3</em></span><br>
  </dd>

  <dt id="CBI--star">star</dt>
  <dd>
    <strong class="module-help">STAR: Spliced Transcripts Alignment to a Reference</strong><br>
    <span class="module-description">STAR (Spliced Transcripts Alignment to a Reference) is a fast NGS read aligner for RNA-seq data.</span><br>
    Example: <span class="module-example"><code>STAR --help</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/alexdobin/STAR">https://github.com/alexdobin/STAR</a>, <a href="https://github.com/alexdobin/STAR/blob/master/CHANGES.md">https://github.com/alexdobin/STAR/blob/master/CHANGES.md</a> (changelog)</span><br>
    Versions: <span class="module-version">2.7.5a, 2.7.5c, 2.7.7a, <em>2.7.9a</em></span><br>
  </dd>

  <dt id="CBI--tiledb">tiledb</dt>
  <dd>
    <strong class="module-help">TileDB: The Universal Storage Engine</strong><br>
    <span class="module-description">TileDB is a powerful engine for storing and accessing dense and sparse multi-dimensional arrays, which can help you model any complex data efficiently. It is an embeddable C++ library that works on Linux, macOS, and Windows.</span><br>
    URL: <span class="module-url"><a href="https://tiledb.com/">https://tiledb.com/</a>, <a href="https://github.com/TileDB-Inc/TileDB">https://github.com/TileDB-Inc/TileDB</a></span><br>
    Versions: <span class="module-version">2.4.3, 2.4.4, <em>2.5.2</em></span><br>
  </dd>

  <dt id="CBI--tmux">tmux</dt>
  <dd>
    <strong class="module-help">tmux: A Terminal Multiplexer</strong><br>
    <span class="module-description">tmux is a terminal multiplexer. It lets you switch easily between several programs in one terminal, detach them (they keep running in the background) and reattach them to a different terminal. And do a lot more.</span><br>
    Example: <span class="module-example"><code>tmux</code> and <code>man tmux</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/tmux/tmux/wiki">https://github.com/tmux/tmux/wiki</a></span><br>
    Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
    Versions: <span class="module-version"><em>2.8</em></span><br>
  </dd>

  <dt id="CBI--tophat">tophat</dt>
  <dd>
    <strong class="module-help">TopHat: A Spliced Read Mapper for RNA-Seq</strong><br>
    <span class="module-description">TopHat is a fast splice junction mapper for RNA-Seq reads. It aligns RNA-Seq reads to mammalian-sized genomes using the ultra high-throughput short read aligner Bowtie, and then analyzes the mapping results to identify splice junctions between exons.</span><br>
    Example: <span class="module-example"><code>tophat --version</code>.</span><br>
    URL: <span class="module-url"><a href="https://ccb.jhu.edu/software/tophat/index.shtml">https://ccb.jhu.edu/software/tophat/index.shtml</a>, <a href="https://github.com/infphilo/tophat">https://github.com/infphilo/tophat</a></span><br>
    Versions: <span class="module-version"><em>2.1.1</em></span><br>
  </dd>

  <dt id="CBI--tree">tree</dt>
  <dd>
    <strong class="module-help">tree: List Content of Directories in a Tree-like Format</strong><br>
    <span class="module-description">Tree is a recursive directory listing command that produces a depth indented listing of files, which is colorized ala dircolors if the <code>LS_COLORS</code> environment variable is set and output is to tty.</span><br>
    Example: <span class="module-example"><code>tree --help</code>.</span><br>
    URL: <span class="module-url"><a href="http://mama.indstate.edu/users/ice/tree/">http://mama.indstate.edu/users/ice/tree/</a>,</span><br>
    Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
    Versions: <span class="module-version"><em>1.8.0</em></span><br>
  </dd>

  <dt id="CBI--trimgalore">trimgalore</dt>
  <dd>
    <strong class="module-help">TrimGalore: Taking Appropriate QC Measures for RRBS-Type or Other -Seq Applications with Trim Galore!</strong><br>
    <span class="module-description">A wrapper around Cutadapt and FastQC to consistently apply adapter and quality trimming to FastQ files, with extra functionality for RRBS data.</span><br>
    Example: <span class="module-example"><code>trim_galore --version</code>, <code>trim_galore --help</code>, and <code>more &quot;$TRIMGALORE_HOME/Docs/Trim_Galore_User_Guide.md&quot;</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/FelixKrueger/TrimGalore">https://github.com/FelixKrueger/TrimGalore</a></span><br>
    Versions: <span class="module-version">0.4.4, 0.6.6, <em>0.6.7</em></span><br>
  </dd>

  <dt id="CBI--up">up</dt>
  <dd>
    <strong class="module-help">up: The Ultimate Plumber</strong><br>
    <span class="module-description">A tool for writing Linux pipes in a terminal-based UI interactively, with instant live preview of command results. Interactively and incrementally explore textual data in Linux using text-processing utils such as grep, sort, cut, paste, awk, wc, perl, etc.  When done, press Ctrl-C to view final pipe commands, or Ctrl-X to save it to file.</span><br>
    Example: <span class="module-example"><code>up --help</code>, <code>ls | up</code> (exit with Ctrl-C).</span><br>
    URL: <span class="module-url"><a href="https://github.com/akavel/up">https://github.com/akavel/up</a></span><br>
    Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
    Versions: <span class="module-version"><em>0.4</em></span><br>
  </dd>

  <dt id="CBI--varscan">varscan</dt>
  <dd>
    <strong class="module-help">VarScan: Variant Detection in Massively Parallel Sequencing Data</strong><br>
    <span class="module-description">VarScan is a platform-independent mutation caller for targeted, exome, and whole-genome resequencing data generated on Illumina, SOLiD, Life/PGM, Roche/454, and similar instruments.</span><br>
    Example: <span class="module-example"><code>varscan</code>, which is an alias to <code>java -jar $VARSCAN_HOME/VarScan.jar</code>.</span><br>
    URL: <span class="module-url"><a href="https://dkoboldt.github.io/varscan/">https://dkoboldt.github.io/varscan/</a>, <a href="https://github.com/dkoboldt/varscan">https://github.com/dkoboldt/varscan</a></span><br>
    Versions: <span class="module-version"><em>2.4.2</em></span><br>
  </dd>

  <dt id="CBI--vcf-validator">vcf-validator</dt>
  <dd>
    <strong class="module-help">vcf-validator: Validation Suite for Variant Call Format (VCF) Files</strong><br>
    <span class="module-description">Validator for the Variant Call Format (VCF) implemented using C++11. It includes all the checks from the vcftools suite, and some more that involve lexical, syntactic and semantic analysis of the VCF input.</span><br>
    Example: <span class="module-example"><code>vcf_validator --help</code>, <code>vcf-debugulator --help</code>, and <code>vcf-assembly-checker --help</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/EBIvariation/vcf-validator">https://github.com/EBIvariation/vcf-validator</a></span><br>
    Versions: <span class="module-version"><em>0.9.4</em></span><br>
  </dd>

  <dt id="CBI--vcftools">vcftools</dt>
  <dd>
    <strong class="module-help">VCFtools: Tools Written in Perl and C++ for Working with VCF Files</strong><br>
    <span class="module-description">VCFtools is a program package designed for working with VCF files, such as those generated by the 1000 Genomes Project. The aim of VCFtools is to provide easily accessible methods for working with complex genetic variation data in the form of VCF files.</span><br>
    Example: <span class="module-example"><code>vcftools --version</code>.</span><br>
    URL: <span class="module-url"><a href="https://vcftools.github.io/">https://vcftools.github.io/</a>, <a href="https://github.com/vcftools/vcftools">https://github.com/vcftools/vcftools</a></span><br>
    Versions: <span class="module-version"><em>0.1.16</em></span><br>
  </dd>

</dl>
</div> 

<div id="queues-WitteLab" class="tab-pane fade">

<h2>Module Software Repository: WitteLab</h2>

Maintained by: Taylor Cavazos, <a href="https://wittelab.ucsf.edu">Witte Lab Software Repository</a><br>
Enable repository: <code>module load WitteLab</code><br>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
Please note that this software stacks is maintained and contributed by a research group on a voluntary basis. It is <em>not</em> maintained by the {{ site.cluster.name }} admins. Please reach out to the corresponding maintainer for bug reports, feedback, or questions.
</div>

<dl>
  <dt id="WitteLab--ascp">ascp</dt>
  <dd>
    <strong class="module-help">ascp: Command line data transfer client</strong><br>
    <span class="module-description">The IBM Aspera Command-Line Interface (CLI) is a lightweight shell scripting tool that be used to automate Faspex and Shares tasks without having to do additional coding. The CLI is for users and organizations that want to automate their transfer workflows; it provides an alternative to using the API for the same functionality.</span><br>
    Example: <span class="module-example"><code>ascp --help</code>.</span><br>
    URL: <span class="module-url"><a href="https://developer.asperasoft.com/desktop-advance/command-line-client">https://developer.asperasoft.com/desktop-advance/command-line-client</a></span><br>
    Versions: <span class="module-version"><em>3.9.6</em></span><br>
  </dd>

  <dt id="WitteLab--bcftools">bcftools</dt>
  <dd>
    <strong class="module-help">bcftools: Command line suite for working with bgzipped vcf files, includes tabix and bgzip</strong><br>
    <span class="module-description">BCFtools is a set of utilities that manipulate variant calls in the Variant Call Format (VCF) and its binary counterpart BCF. All commands work transparently with both VCFs and BCFs, both uncompressed and BGZF-compressed.</span><br>
    Example: <span class="module-example"><code>bcftools --help</code>.</span><br>
    URL: <span class="module-url"><a href="http://www.htslib.org/download/">http://www.htslib.org/download/</a></span><br>
    Versions: <span class="module-version"><em>1.11</em></span><br>
  </dd>

  <dt id="WitteLab--charger">charger</dt>
  <dd>
    <strong class="module-help">charger: a software tool for interpreting and predicting clinical pathogenicity of germline variants.</strong><br>
    <span class="module-description">CharGer gathers evidence from databases and annotations, provided by local tools and files or via ReST APIs, and classifies variants according to ACMG guidelines for assessing variant pathogenicity. User-designed pathogenicity criteria can be incorporated into CharGer’s flexible framework, thereby allowing users to create a customized classification protocol. If you use CharGer, please cite our publication so we can continue to support CharGer development: Adam D Scott, Kuan-Lin Huang, Amila Weerasinghe, R Jay Mashl, Qingsong Gao, Fernanda Martins Rodrigues, Matthew A Wyczalkowski, Li Ding, CharGer: clinical Characterization of Germline variants, Bioinformatics, Volume 35, Issue 5, 01 March 2019, Pages 865–867, <a href="https://doi.org/10.1093/bioinformatics/bty649">https://doi.org/10.1093/bioinformatics/bty649</a></span><br>
    URL: <span class="module-url"><a href="https://github.com/ding-lab/CharGer/tree/7d7d2911b89261fa5dceea6395a5d188a82757f2">https://github.com/ding-lab/CharGer/tree/7d7d2911b89261fa5dceea6395a5d188a82757f2</a></span><br>
    Versions: <span class="module-version"><em>0.5.4</em></span><br>
  </dd>

  <dt id="WitteLab--flashpca">flashpca</dt>
  <dd>
    <strong class="module-help">FlashPCA2: performs fast PCA of SNP data</strong><br>
    <span class="module-description">FlashPCA performs fast principal component analysis (PCA) of single nucleotide polymorphism (SNP) data, similar to smartpca from EIGENSOFT (<a href="http://www.hsph.harvard.edu/alkes-price/software/">http://www.hsph.harvard.edu/alkes-price/software/</a>) and shellfish (<a href="https://github.com/dandavison/shellfish">https://github.com/dandavison/shellfish</a>). FlashPCA is based on the <a href="https://github.com/yixuan/spectra/">https://github.com/yixuan/spectra/</a> library.</span><br>
    URL: <span class="module-url"><a href="https://github.com/gabraham/flashpca">https://github.com/gabraham/flashpca</a></span><br>
    Versions: <span class="module-version"><em>2.0.0</em></span><br>
  </dd>

  <dt id="WitteLab--focus">focus</dt>
  <dd>
    <strong class="module-help">focus: a set of tools to finemap twas statistics</strong><br>
    <span class="module-description">FOCUS (Fine-mapping Of CaUsal gene Sets) is software to fine-map transcriptome-wide association study statistics at genomic risk regions. The software takes as input summary GWAS data along with eQTL weights and outputs a credible set of genes to explain observed genomic risk.</span><br>
    Example: <span class="module-example">source $ENV; focus --help; deactivate</span><br>
    URL: <span class="module-url"><a href="https://github.com/bogdanlab/focus">https://github.com/bogdanlab/focus</a></span><br>
    Versions: <span class="module-version"><em>0.7.0</em></span><br>
  </dd>

  <dt id="WitteLab--gcta">gcta</dt>
  <dd>
    <strong class="module-help">gcta: GCTA (Genome-wide Complex Trait Analysis) was initially designed to estimate the proportion of phenotypic variance explained by all genome-wide SNPs for complex traits (i.e., the GREML method). It has been subsequently extended for many other analyses to better understand the genetic architecture of complex traits. GCTA currently supports the following analyses.</strong><br>
    <span class="module-description">Additional information can be found in the tutorial: <a href="https://cnsgenomics.com/software/gcta/#Tutorial">https://cnsgenomics.com/software/gcta/#Tutorial</a></span><br>
    Versions: <span class="module-version"><em>1.93.2</em></span><br>
  </dd>

  <dt id="WitteLab--gfetch">gfetch</dt>
  <dd>
    <strong class="module-help">gfetch: Download multi-person genetic data for the UK Biobank</strong><br>
    <span class="module-description">gfetch client has been developed to allow Approved researchers to download elements of it piecemeal to their local systems from secure online repositories outside the main UK Biobank showcase system</span><br>
    URL: <span class="module-url"><a href="https://biobank.ndph.ox.ac.uk/ukb/refer.cgi?id=668">https://biobank.ndph.ox.ac.uk/ukb/refer.cgi?id=668</a></span><br>
    Versions: <span class="module-version"><em>1.0.0</em></span><br>
  </dd>

  <dt id="WitteLab--gwama">gwama</dt>
  <dd>
    <strong class="module-help">GWAMA: Genome-Wide Association Meta Analysis</strong><br>
    <span class="module-description">software has been developed to perform meta-analysis of the results of GWA studies of binary or quantitative phenotypes. The software incorporates error trapping facilities to identify strand alignment errors and allele flipping, and performs tests of heterogeneity of effects between studies.</span><br>
    Example: <span class="module-example"><code>GWAMA --help</code>.</span><br>
    URL: <span class="module-url"><a href="https://genomics.ut.ee/en/tools/gwama">https://genomics.ut.ee/en/tools/gwama</a></span><br>
    Versions: <span class="module-version"><em>2.2.2</em></span><br>
  </dd>

  <dt id="WitteLab--gwastools">gwastools</dt>
  <dd>
    <strong class="module-help">gwastools: This repository contains tools to harmonize GWAS summary statistics to a given reference. The main application is harmonization of a public gwas' variants to those in the GTEx study, and allow imputation of summary statistics for missing variants.</strong><br>
    <span class="module-description">Here you can find many python files for GWAS harmination and summary stat imputation. See github page for more details.</span><br>
    Example: <span class="module-example">source $ENV; ls $GWAS_TOOLS/; python $GWAS_TOOLS/gwas_parsing.py --help; deactivate</span><br>
    URL: <span class="module-url"><a href="https://github.com/hakyimlab/summary-gwas-imputation">https://github.com/hakyimlab/summary-gwas-imputation</a></span><br>
    Versions: <span class="module-version"><em>0.0.0</em></span><br>
  </dd>

  <dt id="WitteLab--hess">hess</dt>
  <dd>
    <strong class="module-help">HESS: is a Python package that provides utilities for estimating and analyzing local SNP-heritability and genetic covariance from GWAS summary association data.</strong><br>
    URL: <span class="module-url"><a href="https://github.com/huwenboshi/hess">https://github.com/huwenboshi/hess</a></span><br>
    Versions: <span class="module-version"><em>0.5.4</em></span><br>
  </dd>

  <dt id="WitteLab--ldak">ldak</dt>
  <dd>
    <strong class="module-help">LDAK: program for running heritability, genetic correlation, and genetic prediction (BayesR, MultiBLUP) analyses</strong><br>
    <span class="module-description">This is a command-line tool for analyses of individual-level and summary data (formatted accordingly: <a href="https://dougspeed.com/summary-statistics/">https://dougspeed.com/summary-statistics/</a>). Analyses of summary data require pre-computed tagging files (LD reference panels). You can generate these from individual-level data (<a href="https://dougspeed.com/calculate-taggings/">https://dougspeed.com/calculate-taggings/</a>) or use pre-computed files from external reference datasets (<a href="https://dougspeed.com/pre-computed-tagging-files/">https://dougspeed.com/pre-computed-tagging-files/</a>). Recommended tagging files for EUR/GBB and AFR populations have been downloaded.</span><br>
    URL: <span class="module-url"><a href="https://dougspeed.com/ldak/">https://dougspeed.com/ldak/</a></span><br>
    Versions: <span class="module-version"><em>5.1</em></span><br>
  </dd>

  <dt id="WitteLab--ldsc">ldsc</dt>
  <dd>
    <strong class="module-help">ldsc: a command line tool for estimating heritability and genetic correlation from GWAS summary statistics. ldsc also computes LD Scores.</strong><br>
    <span class="module-description">Additional information can be found at the wiki: <a href="https://github.com/bulik/ldsc/wiki">https://github.com/bulik/ldsc/wiki</a></span><br>
    URL: <span class="module-url"><a href="https://github.com/bulik/ldsc">https://github.com/bulik/ldsc</a></span><br>
    Versions: <span class="module-version"><em>1.0.1</em></span><br>
  </dd>

  <dt id="WitteLab--liftOver">liftOver</dt>
  <dd>
    <strong class="module-help">liftOver: program can be used to convert coordinate ranges between genome assemblies</strong><br>
    <span class="module-description">This is a command-line tool, and supports forward/reverse conversions, batch conversions, and conversions between species. The LiftOver program requires a UCSC-generated over.chain file as input. Pre-generated files are available for selected assemblies here: <a href="http://hgdownload.cse.ucsc.edu/downloads.html">http://hgdownload.cse.ucsc.edu/downloads.html</a>.</span><br>
    Example: <span class="module-example"><code>liftOver</code>.</span><br>
    URL: <span class="module-url"><a href="https://genome-store.ucsc.edu/products/">https://genome-store.ucsc.edu/products/</a></span><br>
    Versions: <span class="module-version"><em>1.0.0</em></span><br>
  </dd>

  <dt id="WitteLab--metaxcan">metaxcan</dt>
  <dd>
    <strong class="module-help">metaxcan: a set of tools to perform twas</strong><br>
    <span class="module-description">Here you can find the latest implementation of PrediXcan: PrediXcan.py. This uses individual-level genotype and phenotype, along a mechanism's prediction model (e.g. models predicting expression or splicing quantification), to compute associations between omic features and a complex trait.</span><br>
    Example: <span class="module-example">source $ENV; python ${METAXCAN_DIR}/SPrediXcan.py --help; deactivate</span><br>
    URL: <span class="module-url"><a href="https://github.com/hakyimlab/MetaXcan/tree/master/software">https://github.com/hakyimlab/MetaXcan/tree/master/software</a></span><br>
    Versions: <span class="module-version"><em>0.6.5</em></span><br>
  </dd>

  <dt id="WitteLab--paintor">paintor</dt>
  <dd>
    <strong class="module-help">liftOver: program can be used to fine map putative causal variants using GWAS summary statistics.</strong><br>
    <span class="module-description">PAINTOR is a statistical fine-mapping method that integrates functional genomic data with association strength from potentially multiple populations (or traits) to prioritize variants for follow-up analysis. The software runs on multiple fine-mapping loci and/or populations/traits simultaneously and takes as input the following data for each set of SNPs at a locus. Examples can be found at <a href="https://github.com/gkichaev/PAINTOR_V3.0">https://github.com/gkichaev/PAINTOR_V3.0</a></span><br>
    URL: <span class="module-url"><a href="https://github.com/gkichaev/PAINTOR_V3.0">https://github.com/gkichaev/PAINTOR_V3.0</a></span><br>
    Versions: <span class="module-version"><em>3.0</em></span><br>
  </dd>

  <dt id="WitteLab--python3">python3</dt>
  <dd>
    <strong class="module-help">python3: programming language</strong><br>
    <span class="module-description">Python is powerful... and fast; plays well with others; runs everywhere; is friendly &amp; easy to learn; is Open.Example: python3 --help</span><br>
    URL: <span class="module-url"><a href="https://www.python.org/about/">https://www.python.org/about/</a></span><br>
    Versions: <span class="module-version"><em>3.9.1</em></span><br>
  </dd>

  <dt id="WitteLab--regenie">regenie</dt>
  <dd>
    <strong class="module-help">regenie: a C++ program for whole genome regression modelling of large genome-wide association studies developed and supported by a team of scientists at the Regeneron Genetics Center.</strong><br>
    <span class="module-description">performs fast gene-based and single-variants tests specifically designed for case-control imbalance</span><br>
    Example: <span class="module-example"><code>regenie --help</code>.</span><br>
    URL: <span class="module-url"><a href="https://github.com/rgcgithub/regenie">https://github.com/rgcgithub/regenie</a></span><br>
    Versions: <span class="module-version"><em>2.2.4</em></span><br>
  </dd>

</dl>
</div> 


</div> 

<ul class="nav nav-pills">
  <li class="active"><a data-toggle="pill" href="#queues-built-in"><span style="font-weight: bold;">built-in</span>&nbsp;(4)</a></li>
  <li><a data-toggle="pill" href="#queues-CBI"><span style="font-weight: bold;">CBI</span>&nbsp;(81)</a></li>
  <li><a data-toggle="pill" href="#queues-WitteLab"><span style="font-weight: bold;">WitteLab</span>&nbsp;(17)</a></li>
</ul>

_The above information was automatically generated on 2022-02-07 20:09:42 from querying `module avail` and `module spider`._


<style>
dl {
  display: block;
}
dt {
  font-family: Menlo, Monaco, Consolas, "Courier New", monospace;
  font-weight: bold;
  font-size: 120%;
  margin-top: 1ex;
  text-decoration: underline;
}
dt:after {
  content: "";
}
</style>

[core software]: {{ '/software/core-software.html' | relative_url }}
