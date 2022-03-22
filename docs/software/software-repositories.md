<!--
WARNING: Do _not_ update this file; it is automatically generated from software-respository.md.rsp.
-->

<!-- Disable several check that otherwise the Lua module code triggers -->
<!-- markdownlint-disable-file MD010 -->
<!-- markdownlint-disable-file MD012 -->
<!-- markdownlint-disable-file MD022 -->
<!-- markdownlint-disable-file MD023 -->





# Software Repositories

In addition to the [core software] tools that are available by default, additional software is available via _environment modules_.  For example, although MATLAB is installed on the system, it is not available by default. Instead, we need to "load" its module first, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ module load matlab
[alice@{{ site.devel.name }} ~]$ module list

Currently Loaded Modules:
  1) matlab/2021a
```
Then we can launch MATLAB using:
```sh
[alice@{{ site.devel.name }} ~]$ matlab -nosplash -nodesktop
```

To see what other "built-in" modules are available, use:

```sh
[alice@{{ site.devel.name }} ~]$ module avail
```


In additional a set of built-in environment modules, there are also modules for software tools that are installed and maintained by other users or research groups.  To access these, we first need to load the corresponding "Software Repository" module.  For example, to get access to the repository and the software shared by the UCSF Computation Biology and Informatics core (CBI), make sure to load ("enable") the repository first, e.g.

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
<li class="active"><a data-toggle="pill" href="#button_repository_built-in"><span style="font-weight: bold;">built-in</span>&nbsp;(4)</a></li>
<li><a data-toggle="pill" href="#button_repository_cbi"><span style="font-weight: bold;">CBI</span>&nbsp;(48)</a></li>
<li><a data-toggle="pill" href="#button_repository_wittelab"><span style="font-weight: bold;">WitteLab</span>&nbsp;(17)</a></li>
</ul>

<div class="tab-content" style="margin-top: 1ex;">
<div id="button_repository_built-in" class="tab-pane fadein active">

<h2 id="repository_built-in">Module Software Repository: built-in (4)</h2>

Maintained by: {{ site.cluster.nickname }} Systems Administrators, <a href="{{ '/about/contact.html' | relative_url }}">{{ site.cluster.name }}</a><br>
Enable repository: <em>this software repository is always enabled</em><br>

<h3 id="module_built-in_matlab" class="module-name">matlab</h3>
<dl>
  <dd class="module-details">
Versions: <span class="module-version"><em>2021a</em></span><br>
  </dd>
</dl>
<h3 id="module_built-in_mpi" class="module-name">mpi</h3>
<dl>
  <dd class="module-details">
Versions: <span class="module-version">openmpi3-x86_64, <em>openmpi-x86_64</em></span><br>
  </dd>
</dl>
<h3 id="module_built-in_openjdk" class="module-name">openjdk</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">openjdk: Open Java Development Kit</strong><br>
<span class="module-description">OpenJDK is a free and open-source implementation of the Java Platform, Standard Edition. It is the result of an effort Sun Microsystems began in 2006.</span><br>
Example: <span class="module-example"><code>java -version</code> and <code>javac -version</code>.</span><br>
URL: <span class="module-url"><a href="https://openjdk.java.net/">https://openjdk.java.net/</a></span><br>
Versions: <span class="module-version">1.6.0, 1.8.0, <em>11</em></span><br>
  </dd>
</dl>
<h3 id="module_built-in_scl-python" class="module-name">scl-python</h3>
<dl>
  <dd class="module-details">
Versions: <span class="module-version"><em>3.6</em></span><br>
  </dd>
</dl>
</div> 

<div id="button_repository_cbi" class="tab-pane fade">

<h2 id="repository_cbi">Module Software Repository: CBI (48)</h2>

Maintained by: Henrik Bengtsson, <a href="https://cbi.ucsf.edu">Computational Biology and Informatics</a><br>
Enable repository: <code>module load CBI</code><br>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
Please note that this software stack is maintained and contributed by a research group on a voluntary basis. It is <em>not</em> maintained by the {{ site.cluster.name }} admins. Please reach out to the corresponding maintainer for bug reports, feedback, or questions.
</div>

<h3 id="module_cbi_bash" class="module-name">bash</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">GNU Bash: The Bourne Again SHell</strong><br>
<span class="module-description">Bash is the GNU Project's shell—the Bourne Again SHell. This is an sh-compatible shell that incorporates useful features from the Korn shell (ksh) and the C shell (csh). It is intended to conform to the IEEE POSIX P1003.2/ISO 9945.2 Shell and Tools standard. It offers functional improvements over sh for both programming and interactive use. In addition, most sh scripts can be run by Bash without modification.</span><br>
Example: <span class="module-example"><code>bash --version</code>, <code>bash --help</code>, and <code>bash</code>.</span><br>
URL: <span class="module-url"><a href="https://www.gnu.org/software/bash/">https://www.gnu.org/software/bash/</a>, <a href="https://www.gnu.org/software/bash/manual/bash.html">https://www.gnu.org/software/bash/manual/bash.html</a> (docs), <a href="https://git.savannah.gnu.org/cgit/bash.git/tree/?h=devel">https://git.savannah.gnu.org/cgit/bash.git/tree/?h=devel</a> (changelog), <a href="https://ftp.gnu.org/gnu/bash/">https://ftp.gnu.org/gnu/bash/</a> (download)</span><br>
Versions: <span class="module-version">4.2, 4.2.53, 4.3, 4.3.30, <em>4.4</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
GNU Bash: The Bourne Again SHell
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: files, utility&quot;)
whatis(&quot;URL: https://www.gnu.org/software/bash/, https://www.gnu.org/software/bash/manual/bash.html (docs), https://git.savannah.gnu.org/cgit/bash.git/tree/?h=devel (changelog), https://ftp.gnu.org/gnu/bash/ (download)&quot;)
whatis([[
Description: Bash is the GNU Project's shell—the Bourne Again SHell. This is an sh-compatible shell that incorporates useful features from the Korn shell (ksh) and the C shell (csh). It is intended to conform to the IEEE POSIX P1003.2/ISO 9945.2 Shell and Tools standard. It offers functional improvements over sh for both programming and interactive use. In addition, most sh scripts can be run by Bash without modification.
Examples: `bash --version`, `bash --help`, and `bash`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
prepend_path(&quot;PKG_CONFIG_PATH&quot;, pathJoin(home, &quot;lib&quot;, &quot;pkgconfig&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_bat" class="module-name">bat</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">bat: A cat(1) Clone with Syntax Highlighting and Git Integration</strong><br>
<span class="module-description">A cat(1) clone with syntax highlighting and Git integration.</span><br>
Example: <span class="module-example"><code>bat README.md</code>, <code>bat scripts/*.sh</code>, and <code>bat src/*.c</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/sharkdp/bat">https://github.com/sharkdp/bat</a>, <a href="https://github.com/sharkdp/bat/blob/master/CHANGELOG.md">https://github.com/sharkdp/bat/blob/master/CHANGELOG.md</a> (changelog)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>0.20.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
bat: A cat(1) Clone with Syntax Highlighting and Git Integration
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utility, file viewer&quot;)
whatis(&quot;URL: https://github.com/sharkdp/bat, https://github.com/sharkdp/bat/blob/master/CHANGELOG.md (changelog)&quot;)
whatis([[
Description: A cat(1) clone with syntax highlighting and Git integration.
Examples: `bat README.md`, `bat scripts/*.sh`, and `bat src/*.c`.
Warning: Only the most recent version of this software will be kept.
]])

-- Local variables
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;man&quot;, &quot;man1&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_bats-core" class="module-name">bats-core</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">bats: Bash Automated Testing System</strong><br>
<span class="module-description">Bats is a TAP-compliant testing framework for Bash. It provides a simple way to verify that the UNIX programs you write behave as expected.</span><br>
Example: <span class="module-example"><code>bats --version</code>, <code>bats --help</code>, <code>man bats</code>, <code>man 7 bats</code>, and <code>bats tests/</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/bats-core/bats-core">https://github.com/bats-core/bats-core</a>, <a href="https://github.com/bats-core/bats-core/blob/master/docs/CHANGELOG.md">https://github.com/bats-core/bats-core/blob/master/docs/CHANGELOG.md</a> (changelog), <a href="https://bats-core.readthedocs.io/en/stable/">https://bats-core.readthedocs.io/en/stable/</a> (documentation)</span><br>
Versions: <span class="module-version"><em>1.6.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
bats: Bash Automated Testing System
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: bash, shell, testing&quot;)
whatis(&quot;URL: https://github.com/bats-core/bats-core, https://github.com/bats-core/bats-core/blob/master/docs/CHANGELOG.md (changelog), https://bats-core.readthedocs.io/en/stable/ (documentation)&quot;)
whatis([[
Description: Bats is a TAP-compliant testing framework for Bash. It provides a simple way to verify that the UNIX programs you write behave as expected.
Examples: `bats --version`, `bats --help`, `man bats`, `man 7 bats`, and `bats tests/`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_bcftools" class="module-name">bcftools</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">BCFtools: Utilities for Variant Calling and Manipulating VCFs and BCFs</strong><br>
<span class="module-description">BCFtools is a set of utilities that manipulate variant calls in the Variant Call Format (VCF) and its binary counterpart BCF. All commands work transparently with both VCFs and BCFs, both uncompressed and BGZF-compressed.</span><br>
Example: <span class="module-example"><code>bcftools --version</code></span><br>
URL: <span class="module-url"><a href="http://www.htslib.org/">http://www.htslib.org/</a></span><br>
Versions: <span class="module-version">1.10.2, <em>1.11</em>, 1.11.0</span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
BCFtools: Utilities for Variant Calling and Manipulating VCFs and BCFs
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: http://www.htslib.org/&quot;)
whatis(&quot;Description: BCFtools is a set of utilities that manipulate variant calls in the Variant Call Format (VCF) and its binary counterpart BCF. All commands work transparently with both VCFs and BCFs, both uncompressed and BGZF-compressed.  Example: `bcftools --version`&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
pushenv(&quot;BCFTOOLS_PLUGINS&quot;, pathJoin(home, &quot;libexec&quot;, name))


-- Warn about bug https://github.com/samtools/htslib/issues/1236
if (mode() == &quot;load&quot; and version == &quot;1.11&quot;) then
  LmodMessage(&quot;MODULE WARNING: &quot; .. name .. &quot; &quot; .. version .. &quot; has a bug that results in valid but incorrect CIGAR strings. Because of this, it is recommended to use an older or a new version instead. For details, see https://github.com/samtools/htslib/issues/1236&quot;)
end
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_bowtie2" class="module-name">bowtie2</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">Bowtie 2: A Fast and Sensitive Gapped Read Aligner</strong><br>
<span class="module-description">Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequences.</span><br>
Example: <span class="module-example"><code>bowtie2 --version</code></span><br>
URL: <span class="module-url"><a href="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml">http://bowtie-bio.sourceforge.net/bowtie2/index.shtml</a></span><br>
Versions: <span class="module-version"><em>2.3.5.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
Bowtie 2: A Fast and Sensitive Gapped Read Aligner
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: http://bowtie-bio.sourceforge.net/bowtie2/index.shtml&quot;)
whatis(&quot;Description: Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequences.  Example: `bowtie2 --version`&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_browsh" class="module-name">browsh</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">browsh: The Modern Text-Based Browser</strong><br>
<span class="module-description">Browsh is a fully-modern text-based browser. It renders anything that a modern browser can; HTML5, CSS3, JS, video and even WebGL. Its main purpose is to be run on a remote server and accessed via SSH/Mosh or the in-browser HTML service in order to significantly reduce bandwidth and thus both increase browsing speeds and decrease bandwidth costs.</span><br>
Example: <span class="module-example"><code>browsh --version</code> and <code>browsh --help</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/junegunn/fzf">https://github.com/junegunn/fzf</a>, <a href="https://github.com/junegunn/fzf/blob/master/CHANGELOG.md">https://github.com/junegunn/fzf/blob/master/CHANGELOG.md</a> (changelog) <a href="https://github.com/junegunn/fzf/wiki">https://github.com/junegunn/fzf/wiki</a> (documentation)</span><br>
Versions: <span class="module-version"><em>1.6.4</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
browsh: The Modern Text-Based Browser
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: cli, shell&quot;)
whatis(&quot;URL: https://github.com/junegunn/fzf, https://github.com/junegunn/fzf/blob/master/CHANGELOG.md (changelog) https://github.com/junegunn/fzf/wiki (documentation)&quot;)
whatis([[
Description: Browsh is a fully-modern text-based browser. It renders anything that a modern browser can; HTML5, CSS3, JS, video and even WebGL. Its main purpose is to be run on a remote server and accessed via SSH/Mosh or the in-browser HTML service in order to significantly reduce bandwidth and thus both increase browsing speeds and decrease bandwidth costs.
Examples: `browsh --version` and `browsh --help`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_cmake" class="module-name">cmake</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">CMake: Open-source, Cross-platform Family of Tools Designed to Build, Test and Package Software</strong><br>
<span class="module-description">CMake is cross-platform free and open-source software for managing the build process of software using a compiler-independent method. It supports directory hierarchies and applications that depend on multiple libraries.</span><br>
Example: <span class="module-example"><code>cmake --version</code>.</span><br>
URL: <span class="module-url"><a href="https://cmake.org/">https://cmake.org/</a></span><br>
Versions: <span class="module-version">3.12.0, 3.12.4, 3.13.0, 3.14.0, 3.14.5, 3.15.0, 3.16.0, 3.18.0, 3.19.0, 3.19.2, 3.19.3, 3.19.4, 3.19.5, 3.19.6, 3.19.7, 3.19.8, 3.21.3, <em>3.22.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
CMake: Open-source, Cross-platform Family of Tools Designed to Build, Test and Package Software
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: development, make&quot;)
whatis(&quot;URL: https://cmake.org/&quot;)
whatis(&quot;Description: CMake is cross-platform free and open-source software for managing the build process of software using a compiler-independent method. It supports directory hierarchies and applications that depend on multiple libraries. Example: `cmake --version`.&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;,  pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;,  pathJoin(home, &quot;share&quot;, &quot;man&quot;))

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_cutadapt" class="module-name">cutadapt</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">Cutadapt: Remove Adapter Sequences from Sequencing Reads</strong><br>
<span class="module-description">Cutadapt finds and removes adapter sequences, primers, poly-A tails and other types of unwanted sequence from your high-throughput sequencing reads.</span><br>
Example: <span class="module-example"><code>cutadapt --version</code> and <code>cutadapt --help</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/marcelm/cutadapt">https://github.com/marcelm/cutadapt</a>, <a href="https://github.com/marcelm/cutadapt/blob/main/CHANGES.rst">https://github.com/marcelm/cutadapt/blob/main/CHANGES.rst</a> (changelog)</span><br>
Versions: <span class="module-version">1.2.1, <em>3.4</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
Cutadapt: Remove Adapter Sequences from Sequencing Reads 
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing, genome&quot;)
whatis(&quot;URL: https://github.com/marcelm/cutadapt, https://github.com/marcelm/cutadapt/blob/main/CHANGES.rst (changelog)&quot;)
whatis([[
Description: Cutadapt finds and removes adapter sequences, primers, poly-A tails and other types of unwanted sequence from your high-throughput sequencing reads.
Examples: `cutadapt --version` and `cutadapt --help`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)
prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))




</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_dmtcp" class="module-name">dmtcp</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">DMTCP: Distributed MultiThreaded CheckPointing</strong><br>
<span class="module-description">DMTCP is a tool to transparently checkpoint the state of multiple simultaneous applications, including multi-threaded and distributed applications. It operates directly on the user binary executable, without any Linux kernel modules or other kernel modifications. Among the applications supported by DMTCP are MPI (various implementations), OpenMP, MATLAB, Python, Perl, R, and many programming languages and shell scripting languages. DMTCP also supports GNU screen sessions, including vim/cscope and emacs.</span><br>
Example: <span class="module-example"><code>dmtcp_launch R</code>, <code>dmtcp_launch matlab -nodisplay -nojvm</code></span><br>
URL: <span class="module-url"><a href="http://dmtcp.sourceforge.net/">http://dmtcp.sourceforge.net/</a>, <a href="https://github.com/dmtcp/dmtcp">https://github.com/dmtcp/dmtcp</a>, <a href="https://docs.nersc.gov/development/checkpoint-restart/dmtcp/">https://docs.nersc.gov/development/checkpoint-restart/dmtcp/</a></span><br>
Versions: <span class="module-version"><em>2.6.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
DMTCP: Distributed MultiThreaded CheckPointing
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: hpc, checkpointing&quot;)
whatis(&quot;URL: http://dmtcp.sourceforge.net/, https://github.com/dmtcp/dmtcp, https://docs.nersc.gov/development/checkpoint-restart/dmtcp/&quot;)
whatis(&quot;Description: DMTCP is a tool to transparently checkpoint the state of multiple simultaneous applications, including multi-threaded and distributed applications. It operates directly on the user binary executable, without any Linux kernel modules or other kernel modifications. Among the applications supported by DMTCP are MPI (various implementations), OpenMP, MATLAB, Python, Perl, R, and many programming languages and shell scripting languages. DMTCP also supports GNU screen sessions, including vim/cscope and emacs. Example: `dmtcp_launch R`, `dmtcp_launch matlab -nodisplay -nojvm`&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

-- Runtime
prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;))
prepend_path(&quot;MANPATH_PATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))

-- Build time
--prepend_path(&quot;CPATH&quot;, pathJoin(home, &quot;include&quot;))
--prepend_path(&quot;LDFLAGS&quot;, &quot;-L&quot; .. pathJoin(home, &quot;lib&quot;), &quot; &quot;)
--prepend_path(&quot;PKG_CONFIG_PATH&quot;, pathJoin(home, &quot;lib&quot;, &quot;pkgconfig&quot;))

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_easycatfs" class="module-name">easycatfs</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">easycatfs: Easy Read-Only Mounting of Slow Folders onto a Local Drive</strong><br>
<span class="module-description">This is Linux command-line tool for mounting one or more folders on a network file system on a local disk such that the local-disk folders mirrors everything (read-only) on the network folder. This will result in (i) faster repeated access to files, and (ii) decreased load on the network file system. This is particularly beneficial when working on high-performance compute (HPC) clusters used by hundreds and thousands of processes and users simultaneously..</span><br>
Example: <span class="module-example"><code>easycatfs --help</code> and <code>easycatfs mount /shared/data</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/HenrikBengtsson/easycatfs">https://github.com/HenrikBengtsson/easycatfs</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>0.1.5</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
easycatfs: Easy Read-Only Mounting of Slow Folders onto a Local Drive
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utility, files, hpc&quot;)
whatis(&quot;URL: https://github.com/HenrikBengtsson/easycatfs&quot;)
whatis(&quot;Description: This is Linux command-line tool for mounting one or more folders on a network file system on a local disk such that the local-disk folders mirrors everything (read-only) on the network folder. This will result in (i) faster repeated access to files, and (ii) decreased load on the network file system. This is particularly beneficial when working on high-performance compute (HPC) clusters used by hundreds and thousands of processes and users simultaneously..  Example: `easycatfs --help` and `easycatfs mount /shared/data`. Warning: Only the most recent version of this software will be kept.&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_emacs" class="module-name">emacs</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">GNU Emacs: An Extensible, Customizable, Free/Libre Text Editor</strong><br>
<span class="module-description">At its core is an interpreter for Emacs Lisp, a dialect of the Lisp programming language with extensions to support text editing.</span><br>
Example: <span class="module-example"><code>emacs --version</code> and <code>emacs -nw</code>.</span><br>
URL: <span class="module-url"><a href="https://www.gnu.org/software/emacs/">https://www.gnu.org/software/emacs/</a>, <a href="https://www.gnu.org/savannah-checkouts/gnu/emacs/emacs.html#Releases">https://www.gnu.org/savannah-checkouts/gnu/emacs/emacs.html#Releases</a> (changelog)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">26.3, <em>27.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
GNU Emacs: An Extensible, Customizable, Free/Libre Text Editor
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: editor, text&quot;)
whatis(&quot;URL: https://www.gnu.org/software/emacs/, https://www.gnu.org/savannah-checkouts/gnu/emacs/emacs.html#Releases (changelog)&quot;)
whatis([[
Description: At its core is an interpreter for Emacs Lisp, a dialect of the Lisp programming language with extensions to support text editing.
Examples: `emacs --version` and `emacs -nw`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_expect" class="module-name">expect</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">expect:</strong><br>
<span class="module-description">Expect is a tool for automating interactive applications such as telnet, ftp, passwd, fsck, rlogin, tip, etc. Expect really makes this stuff trivial. Expect is also useful for testing these same applications.</span><br>
Example: <span class="module-example"><code>expect -version</code>, and <code>man expect</code>.</span><br>
URL: <span class="module-url"><a href="https://core.tcl-lang.org/expect/index">https://core.tcl-lang.org/expect/index</a>, <a href="https://core.tcl-lang.org/expect/file?name=ChangeLog&amp;ci=tip">https://core.tcl-lang.org/expect/file?name=ChangeLog&amp;ci=tip</a> (changelog), <a href="https://sourceforge.net/projects/expect/files/Expect/">https://sourceforge.net/projects/expect/files/Expect/</a> (download), <a href="https://core.tcl-lang.org/expect/dir?ci=tip">https://core.tcl-lang.org/expect/dir?ci=tip</a> (source code)</span><br>
Versions: <span class="module-version"><em>5.45.4</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
expect: 
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: programming, R, GUI&quot;)
whatis(&quot;URL: https://core.tcl-lang.org/expect/index, https://core.tcl-lang.org/expect/file?name=ChangeLog&amp;ci=tip (changelog), https://sourceforge.net/projects/expect/files/Expect/ (download), https://core.tcl-lang.org/expect/dir?ci=tip (source code)&quot;)
whatis([[
Description: Expect is a tool for automating interactive applications such as telnet, ftp, passwd, fsck, rlogin, tip, etc. Expect really makes this stuff trivial. Expect is also useful for testing these same applications.
Example: `expect -version`, and `man expect`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;libs&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_fastqc" class="module-name">fastqc</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">FastQC: A Quality Control Analysis Tool for High Throughput Sequencing Data</strong><br>
<span class="module-description">FastQC is a program designed to spot potential problems in high throughput sequencing datasets. It runs a set of analyses on one or more raw sequence files in fastq or bam format and produces a report which summarises the results.</span><br>
Example: <span class="module-example"><code>fastqc --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.bioinformatics.babraham.ac.uk/projects/fastqc/">https://www.bioinformatics.babraham.ac.uk/projects/fastqc/</a>, <a href="https://raw.githubusercontent.com/s-andrews/FastQC/master/RELEASE_NOTES.txt">https://raw.githubusercontent.com/s-andrews/FastQC/master/RELEASE_NOTES.txt</a> (changelog), <a href="https://github.com/s-andrews/FastQC/">https://github.com/s-andrews/FastQC/</a> (source code)</span><br>
Versions: <span class="module-version"><em>0.11.9</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
FastQC: A Quality Control Analysis Tool for High Throughput Sequencing Data
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing, qc&quot;)
whatis(&quot;URL: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/, https://raw.githubusercontent.com/s-andrews/FastQC/master/RELEASE_NOTES.txt (changelog), https://github.com/s-andrews/FastQC/ (source code)&quot;)
whatis([[
Description: FastQC is a program designed to spot potential problems in high throughput sequencing datasets. It runs a set of analyses on one or more raw sequence files in fastq or bam format and produces a report which summarises the results.
Example: `fastqc --version`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, &quot;FastQC&quot; .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_fzf" class="module-name">fzf</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">fzf: A Command-Line Fuzzy Finder</strong><br>
<span class="module-description">fzf is a general-purpose command-line fuzzy finder. It's an interactive Unix filter for command-line that can be used with any list; files, command history, processes, hostnames, bookmarks, git commits, etc.</span><br>
Example: <span class="module-example"><code>fzf --version</code> and <code>emacs &quot;$(fzf)&quot;</code>.</span><br>
Note: <span class="module-note">To install tab completions and key bindinds to your shell, call <code>$FZF_HOME/install</code>. To uninstall, use <code>$FZF_HOME/uninstall</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/junegunn/fzf">https://github.com/junegunn/fzf</a>, <a href="https://github.com/junegunn/fzf/blob/master/CHANGELOG.md">https://github.com/junegunn/fzf/blob/master/CHANGELOG.md</a> (changelog) <a href="https://github.com/junegunn/fzf/wiki">https://github.com/junegunn/fzf/wiki</a> (documentation)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">0.19.0, <em>0.29.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
fzf: A Command-Line Fuzzy Finder
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: cli, shell&quot;)
whatis(&quot;URL: https://github.com/junegunn/fzf, https://github.com/junegunn/fzf/blob/master/CHANGELOG.md (changelog) https://github.com/junegunn/fzf/wiki (documentation)&quot;)
whatis([[
Description: fzf is a general-purpose command-line fuzzy finder. It's an interactive Unix filter for command-line that can be used with any list; files, command history, processes, hostnames, bookmarks, git commits, etc.
Examples: `fzf --version` and `emacs &quot;$(fzf)&quot;`. Note: To install tab completions and key bindinds to your shell, call `$FZF_HOME/install`. To uninstall, use `$FZF_HOME/uninstall`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;man&quot;))

-- Custom
pushenv(&quot;FZF_HOME&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_gatk" class="module-name">gatk</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">Genome Analysis Toolkit (GATK): Variant Discovery in High-Throughput Sequencing Data</strong><br>
<span class="module-description">Developed in the Data Sciences Platform at the Broad Institute, the toolkit offers a wide variety of tools with a primary focus on variant discovery and genotyping. Its powerful processing engine and high-performance computing features make it capable of taking on projects of any size.</span><br>
Example: <span class="module-example"><code>gatk --help</code> and <code>gatk --list</code>.</span><br>
URL: <span class="module-url"><a href="https://software.broadinstitute.org/gatk/">https://software.broadinstitute.org/gatk/</a>, <a href="https://github.com/broadinstitute/gatk">https://github.com/broadinstitute/gatk</a> (source code), <a href="https://github.com/broadinstitute/gatk/releases">https://github.com/broadinstitute/gatk/releases</a> (change log), <a href="https://github.com/broadgsa/gatk">https://github.com/broadgsa/gatk</a> (legacy), <a href="https://console.cloud.google.com/storage/browser/gatk-software/package-archive">https://console.cloud.google.com/storage/browser/gatk-software/package-archive</a> (legacy), <a href="ftp://ftp.broadinstitute.org/pub/gsa/GenomeAnalysisTK/">ftp://ftp.broadinstitute.org/pub/gsa/GenomeAnalysisTK/</a> (legacy)</span><br>
Versions: <span class="module-version">1.1-37-ge63d9d8, 1.5, 1.5-12-gd0056d6, 1.6-5-g557da77, 4.2.2.0, 4.2.4.1, <em>4.2.5.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
Genome Analysis Toolkit (GATK): Variant Discovery in High-Throughput Sequencing Data
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing, genome&quot;)
whatis(&quot;URL: https://software.broadinstitute.org/gatk/, https://github.com/broadinstitute/gatk (source code), https://github.com/broadinstitute/gatk/releases (change log), https://github.com/broadgsa/gatk (legacy), https://console.cloud.google.com/storage/browser/gatk-software/package-archive (legacy), ftp://ftp.broadinstitute.org/pub/gsa/GenomeAnalysisTK/ (legacy)&quot;)
whatis([[
Description: Developed in the Data Sciences Platform at the Broad Institute, the toolkit offers a wide variety of tools with a primary focus on variant discovery and genotyping. Its powerful processing engine and high-performance computing features make it capable of taking on projects of any size.
Example: `gatk --help` and `gatk --list`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

local version_x = string.gsub(version, &quot;[.].*&quot;, &quot;&quot;)
if (version_x == &quot;1&quot;) then
  -- GATK v1.* requires Java (&lt;= 1.7)
  local cluster = os.getenv(&quot;CLUSTER&quot;) or &quot;&quot;
  if (cluster == &quot;tipcc&quot;) then
    load(&quot;jdk/1.7.0&quot;)
  else
    depends_on(&quot;openjdk/1.6.0&quot;)
  end
  pushenv(&quot;GATK_HOME&quot;, home)
else
  prepend_path(&quot;PATH&quot;, home)
end

load(&quot;java-tweaks&quot;)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_gistic2" class="module-name">gistic2</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">GISTIC2: Genomic Identification of Significant Targets in Cancer (GISTIC), version 2</strong><br>
<span class="module-description">GISTIC2.0 facilitates sensitive and confident localization of the targets of focal somatic copy-number alteration in human cancers.</span><br>
Example: <span class="module-example"><code>gistic2</code>.</span><br>
URL: <span class="module-url"><a href="https://software.broadinstitute.org/cancer/cga/gistic">https://software.broadinstitute.org/cancer/cga/gistic</a>, <a href="https://github.com/broadinstitute/gistic2/blob/master/support/README.txt">https://github.com/broadinstitute/gistic2/blob/master/support/README.txt</a> (changelog), <a href="https://github.com/broadinstitute/gistic2">https://github.com/broadinstitute/gistic2</a> (source code), <a href="https://www.genepattern.org/modules/docs/GISTIC_2.0/7">https://www.genepattern.org/modules/docs/GISTIC_2.0/7</a></span><br>
Versions: <span class="module-version"><em>2.0.23</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
GISTIC2: Genomic Identification of Significant Targets in Cancer (GISTIC), version 2
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://software.broadinstitute.org/cancer/cga/gistic, https://github.com/broadinstitute/gistic2/blob/master/support/README.txt (changelog), https://github.com/broadinstitute/gistic2 (source code), https://www.genepattern.org/modules/docs/GISTIC_2.0/7&quot;)
whatis([[
Description: GISTIC2.0 facilitates sensitive and confident localization of the targets of focal somatic copy-number alteration in human cancers.
Examples: `gistic2`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_git-flow" class="module-name">git-flow</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">git-flow: Git Extension Git Flow (AVH Edition)</strong><br>
<span class="module-description">A collection of Git extensions to provide high-level repository operations for Vincent Driessen's branching model.</span><br>
Example: <span class="module-example"><code>git flow</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/petervanderdoes/gitflow-avh">https://github.com/petervanderdoes/gitflow-avh</a>, <a href="https://github.com/nvie/gitflow">https://github.com/nvie/gitflow</a></span><br>
Versions: <span class="module-version"><em>1.12.3</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
git-flow: Git Extension Git Flow (AVH Edition)
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: version control&quot;)
whatis(&quot;URL: https://github.com/petervanderdoes/gitflow-avh, https://github.com/nvie/gitflow&quot;)
whatis(&quot;Description: A collection of Git extensions to provide high-level repository operations for Vincent Driessen's branching model. Example: `git flow`.&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_glow" class="module-name">glow</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">glow: Render Markdown on the CLI, with Pizzazz!</strong><br>
<span class="module-description">Glow is a terminal based markdown reader designed from the ground up to bring out the beauty—and power—of the CLI.  Use it to discover markdown files, read documentation directly on the command line and stash markdown files to your own private collection so you can read them anywhere. Glow will find local markdown files in subdirectories or a local Git repository.</span><br>
Example: <span class="module-example"><code>glow README.md</code>, <code>glow --pager README.md</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/charmbracelet/glow">https://github.com/charmbracelet/glow</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>1.3.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
glow: Render Markdown on the CLI, with Pizzazz!
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utility, file viewer, pager, markdown&quot;)
whatis(&quot;URL: https://github.com/charmbracelet/glow&quot;)
whatis(&quot;Description: Glow is a terminal based markdown reader designed from the ground up to bring out the beauty—and power—of the CLI.  Use it to discover markdown files, read documentation directly on the command line and stash markdown files to your own private collection so you can read them anywhere. Glow will find local markdown files in subdirectories or a local Git repository.  Examples: `glow README.md`, `glow --pager README.md`.  Warning: Only the most recent version of this software will be kept.&quot;)

-- Local variables
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_gsl" class="module-name">gsl</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">GSL: Gnu Scientific Library</strong><br>
<span class="module-description">The GNU Scientific Library (GSL) is a numerical library for C and C++ programmers. It is free software under the GNU General Public License. The library provides a wide range of mathematical routines such as random number generators, special functions and least-squares fitting. There are over 1000 functions in total with an extensive test suite.</span><br>
Example: <span class="module-example"><code>gsl-config --version</code></span><br>
URL: <span class="module-url"><a href="https://www.gnu.org/software/gsl/">https://www.gnu.org/software/gsl/</a></span><br>
Versions: <span class="module-version"><em>2.7</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
GSL: Gnu Scientific Library
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: library&quot;)
whatis(&quot;URL: https://www.gnu.org/software/gsl/&quot;)
whatis(&quot;Description: The GNU Scientific Library (GSL) is a numerical library for C and C++ programmers. It is free software under the GNU General Public License. The library provides a wide range of mathematical routines such as random number generators, special functions and least-squares fitting. There are over 1000 functions in total with an extensive test suite. Example: `gsl-config --version`&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;))
prepend_path(&quot;PKG_CONFIG_PATH&quot;, pathJoin(home, &quot;lib&quot;, &quot;pkgconfig&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_hisat2" class="module-name">hisat2</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">HISAT2: Graph-based Alignment of Next Generation Sequencing Reads to a Population of Genomes</strong><br>
<span class="module-description">HISAT2 is a fast and sensitive alignment program for mapping next-generation sequencing reads (both DNA and RNA) to a population of human genomes (as well as to a single reference genome). Based on an extension of BWT for graphs [Sirén et al. 2014], we designed and implemented a graph FM index (GFM), an original approach and its first implementation to the best of our knowledge. In addition to using one global GFM index that represents a population of human genomes, HISAT2 uses a large set of small GFM indexes that collectively cover the whole genome (each index representing a genomic region of 56 Kbp, with 55,000 indexes needed to cover the human population). These small indexes (called local indexes), combined with several alignment strategies, enable rapid and accurate alignment of sequencing reads. This new indexing scheme is called a Hierarchical Graph FM index (HGFM).</span><br>
Example: <span class="module-example"><code>hisat2 --version</code>.</span><br>
URL: <span class="module-url"><a href="https://daehwankimlab.github.io/hisat2/">https://daehwankimlab.github.io/hisat2/</a>, <a href="https://github.com/DaehwanKimLab/hisat2/releases">https://github.com/DaehwanKimLab/hisat2/releases</a> (changelog), <a href="https://github.com/DaehwanKimLab/hisat2/">https://github.com/DaehwanKimLab/hisat2/</a> (source code)</span><br>
Versions: <span class="module-version"><em>2.2.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
HISAT2: Graph-based Alignment of Next Generation Sequencing Reads to a Population of Genomes
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: Programming, Statistics&quot;)
whatis(&quot;URL: https://daehwankimlab.github.io/hisat2/, https://github.com/DaehwanKimLab/hisat2/releases (changelog), https://github.com/DaehwanKimLab/hisat2/ (source code)&quot;)
whatis([[
Description: HISAT2 is a fast and sensitive alignment program for mapping next-generation sequencing reads (both DNA and RNA) to a population of human genomes (as well as to a single reference genome). Based on an extension of BWT for graphs [Sirén et al. 2014], we designed and implemented a graph FM index (GFM), an original approach and its first implementation to the best of our knowledge. In addition to using one global GFM index that represents a population of human genomes, HISAT2 uses a large set of small GFM indexes that collectively cover the whole genome (each index representing a genomic region of 56 Kbp, with 55,000 indexes needed to cover the human population). These small indexes (called local indexes), combined with several alignment strategies, enable rapid and accurate alignment of sequencing reads. This new indexing scheme is called a Hierarchical Graph FM index (HGFM).
Examples: `hisat2 --version`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_htop" class="module-name">htop</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">htop: An Interactive Process Viewer for Unix</strong><br>
<span class="module-description"><code>htop</code> is an interactive process viewer for Unix systems. It is a text-mode application (for console or X terminals) and requires ncurses.</span><br>
Example: <span class="module-example"><code>htop</code>.</span><br>
URL: <span class="module-url"><a href="https://htop.dev">https://htop.dev</a>, <a href="https://github.com/htop-dev/htop">https://github.com/htop-dev/htop</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>3.1.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
htop: An Interactive Process Viewer for Unix
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: system, utility&quot;)
whatis(&quot;URL: https://htop.dev, https://github.com/htop-dev/htop&quot;)
whatis(&quot;Description: `htop` is an interactive process viewer for Unix systems. It is a text-mode application (for console or X terminals) and requires ncurses. Example: `htop`. Warning: Only the most recent version of this software will be kept.&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_htslib" class="module-name">htslib</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">HTSlib: C Library for High-Throughput Sequencing Data Formats</strong><br>
<span class="module-description">HTSlib is an implementation of a unified C library for accessing common file formats, such as SAM, CRAM and VCF, used for high-throughput sequencing data, and is the core library used by samtools and bcftools. HTSlib also provides the bgzip, htsfile, and tabix utilities.</span><br>
Example: <span class="module-example"><code>bgzip --version</code>, <code>htsfile --version</code>, and <code>tabix --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.htslib.org/">https://www.htslib.org/</a>, <a href="https://github.com/samtools/htslib">https://github.com/samtools/htslib</a></span><br>
Versions: <span class="module-version">1.2.1, 1.9, <em>1.13</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
HTSlib: C Library for High-Throughput Sequencing Data Formats
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing, programming&quot;)
whatis(&quot;URL: https://www.htslib.org/, https://github.com/samtools/htslib&quot;)
whatis(&quot;Description: HTSlib is an implementation of a unified C library for accessing common file formats, such as SAM, CRAM and VCF, used for high-throughput sequencing data, and is the core library used by samtools and bcftools. HTSlib also provides the bgzip, htsfile, and tabix utilities.  Example: `bgzip --version`, `htsfile --version`, and `tabix --version`.&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;))
prepend_path(&quot;PKG_CONFIG_PATH&quot;, pathJoin(home, &quot;lib&quot;, &quot;pkgconfig&quot;))


-- Warn about bug https://github.com/samtools/htslib/issues/1236
if (mode() == &quot;load&quot; and version == &quot;1.11&quot;) then
  LmodMessage(&quot;MODULE WARNING: &quot; .. name .. &quot; &quot; .. version .. &quot; has a bug that results in valid but incorrect CIGAR strings. Because of this, it is recommended to use an older or a newer version instead. For details, see https://github.com/samtools/htslib/issues/1236&quot;)
end
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_htstools" class="module-name">htstools</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">htstools: Tools to Process BAM Files for Downstream Copy-Number Analysis</strong><br>
<span class="module-description">Contains three tools (dnafrags, ppflag-fixer, snp-pileup) written by Alex Studer to process bam files for downstream copy number analysis.</span><br>
Example: <span class="module-example"><code>snp-pileup --help</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/mskcc/htstools">https://github.com/mskcc/htstools</a></span><br>
Versions: <span class="module-version"><em>0.1.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
htstools: Tools to Process BAM Files for Downstream Copy-Number Analysis
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://github.com/mskcc/htstools&quot;)
whatis(&quot;Description: Contains three tools (dnafrags, ppflag-fixer, snp-pileup) written by Alex Studer to process bam files for downstream copy number analysis.  Example: `snp-pileup --help`.&quot;)

--depends_on(&quot;htslib&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_igv" class="module-name">igv</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">IGV: The Integrative Genomics Viewer</strong><br>
<span class="module-description">The Integrative Genomics Viewer (IGV) is a high-performance visualization tool for interactive exploration of large, integrated genomic datasets. It supports a wide variety of data types, including array-based and next-generation sequence data, and genomic annotations.</span><br>
Example: <span class="module-example"><code>igv</code>.</span><br>
Note: <span class="module-note">IGV (&gt;= 2.5.0) requires Java 11. Coincidentally, <code>igvtools</code> is integrated with IGV (&gt;= 2.5.0).</span><br>
URL: <span class="module-url"><a href="https://software.broadinstitute.org/software/igv/">https://software.broadinstitute.org/software/igv/</a>, <a href="https://github.com/igvteam/igv/tags">https://github.com/igvteam/igv/tags</a> (changelog), <a href="https://github.com/igvteam/igv/">https://github.com/igvteam/igv/</a> (source code)</span><br>
Versions: <span class="module-version">2.11.0, <em>2.12.3</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
IGV: The Integrative Genomics Viewer
]])

-- local name = myModuleName()
local name = &quot;IGV&quot;
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://software.broadinstitute.org/software/igv/, https://github.com/igvteam/igv/tags (changelog), https://github.com/igvteam/igv/ (source code)&quot;)
whatis([[
Description: The Integrative Genomics Viewer (IGV) is a high-performance visualization tool for interactive exploration of large, integrated genomic datasets. It supports a wide variety of data types, including array-based and next-generation sequence data, and genomic annotations.
Examples: `igv`.  Note: IGV (&gt;= 2.5.0) requires Java 11. Coincidentally, `igvtools` is integrated with IGV (&gt;= 2.5.0).
]])

-- depends_on(&quot;jdk&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)
prepend_path(&quot;PATH&quot;, home)

set_alias(&quot;igv&quot;, home .. &quot;/igv.sh&quot;)

-- Tweak Java for the current environment
depends_on(&quot;java-tweaks&quot;)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_jupyterlab" class="module-name">jupyterlab</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">JupyterLab: Next-Generation Web-Based User Interface for Project Jupyter</strong><br>
<span class="module-description">Example: <code>jupyter --help</code>, <code>jupyter --version</code>, <code>jupyter lab</code>, and <code>man ipython</code>.</span><br>
URL: <span class="module-url"><a href="https://jupyter.org/">https://jupyter.org/</a>, <a href="https://jupyterlab.readthedocs.io/en/stable/getting_started/changelog.html">https://jupyterlab.readthedocs.io/en/stable/getting_started/changelog.html</a> (change log), <a href="https://github.com/jupyter/">https://github.com/jupyter/</a> (source code)</span><br>
Versions: <span class="module-version"><em>3.2.9</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
JupyterLab: Next-Generation Web-Based User Interface for Project Jupyter
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: programming, python&quot;)
whatis(&quot;URL: https://jupyter.org/, https://jupyterlab.readthedocs.io/en/stable/getting_started/changelog.html (change log), https://github.com/jupyter/ (source code)&quot;)
whatis([[
Description: 
Example: `jupyter --help`, `jupyter --version`, `jupyter lab`, and `man ipython`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))

-- Activate the virtual environment
-- Requires Lmod (&gt;= 8.6)
-- source_sh(&quot;bash&quot;, pathJoin(home, &quot;bin&quot;, &quot;activate&quot;))
-- Don't edit! Created using: 
-- /usr/share/lmod/lmod/libexec/sh_to_modulefile /home/hb/shared/software/CBI/jupyterlab-3.2.9/bin/activate
prepend_path(&quot;PATH&quot;,&quot;/tmp/hb/20220215/jupyterlab-3.2.9/bin&quot;)
setenv(&quot;VIRTUAL_ENV&quot;,&quot;/tmp/hb/20220215/jupyterlab-3.2.9&quot;)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_jupyternotebook" class="module-name">jupyternotebook</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">JupyterNotebook: Next-Generation Web-Based User Interface for Project Jupyter</strong><br>
<span class="module-description">Example: <code>jupyter --help</code>, <code>jupyter --version</code>, <code>jupyter lab</code>, and <code>man ipython</code>.</span><br>
URL: <span class="module-url"><a href="https://jupyter.org/">https://jupyter.org/</a>, <a href="https://jupyter-notebook.readthedocs.io/en/stable/">https://jupyter-notebook.readthedocs.io/en/stable/</a> (docs), <a href="https://jupyter-notebook.readthedocs.io/en/stable/changelog.html">https://jupyter-notebook.readthedocs.io/en/stable/changelog.html</a> (change log), <a href="https://github.com/jupyter/">https://github.com/jupyter/</a> (source code)</span><br>
Versions: <span class="module-version"><em>6.4.8</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
JupyterNotebook: Next-Generation Web-Based User Interface for Project Jupyter
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: programming, python&quot;)
whatis(&quot;URL: https://jupyter.org/, https://jupyter-notebook.readthedocs.io/en/stable/ (docs), https://jupyter-notebook.readthedocs.io/en/stable/changelog.html (change log), https://github.com/jupyter/ (source code)&quot;)
whatis([[
Description: 
Example: `jupyter --help`, `jupyter --version`, `jupyter lab`, and `man ipython`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_kallisto" class="module-name">kallisto</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">kallisto: Near-optimal RNA-Seq Quantification</strong><br>
<span class="module-description">kallisto is a program for quantifying abundances of transcripts from RNA-Seq data, or more generally of target sequences using high-throughput sequencing reads. It is based on the novel idea of pseudoalignment for rapidly determining the compatibility of reads with targets, without the need for alignment.</span><br>
Example: <span class="module-example"><code>kallisto version</code>.</span><br>
URL: <span class="module-url"><a href="https://pachterlab.github.io/kallisto/about.html">https://pachterlab.github.io/kallisto/about.html</a>, <a href="https://github.com/pachterlab/kallisto">https://github.com/pachterlab/kallisto</a></span><br>
Versions: <span class="module-version"><em>0.46.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
kallisto: Near-optimal RNA-Seq Quantification
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://pachterlab.github.io/kallisto/about.html, https://github.com/pachterlab/kallisto&quot;)
whatis(&quot;Description: kallisto is a program for quantifying abundances of transcripts from RNA-Seq data, or more generally of target sequences using high-throughput sequencing reads. It is based on the novel idea of pseudoalignment for rapidly determining the compatibility of reads with targets, without the need for alignment.  Example: `kallisto version`.&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_klib" class="module-name">klib</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">klib: A Generic Library in C</strong><br>
<span class="module-description">Klib is a standalone and lightweight C library distributed under MIT/X11 license. Most components are independent of external libraries, except the standard C library, and independent of each other. To use a component of this library, you only need to copy a couple of files to your source code tree without worrying about library dependencies.</span><br>
URL: <span class="module-url"><a href="https://github.com/attractivechaos/klib">https://github.com/attractivechaos/klib</a></span><br>
Versions: <span class="module-version"><em>0.1.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
klib: A Generic Library in C
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: spatial, library&quot;)
whatis(&quot;URL: https://github.com/attractivechaos/klib&quot;)
whatis(&quot;Description: Klib is a standalone and lightweight C library distributed under MIT/X11 license. Most components are independent of external libraries, except the standard C library, and independent of each other. To use a component of this library, you only need to copy a couple of files to your source code tree without worrying about library dependencies.&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

-- in-house environment variable
pushenv(&quot;KLIB_HOME&quot;, home)

-- building
prepend_path(&quot;CPATH&quot;,  home)
prepend_path(&quot;CFLAGS&quot;, &quot;-I&quot; .. home, &quot; &quot;)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_lazygit" class="module-name">lazygit</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">lazygit: Simple Terminal UI for Git Commands</strong><br>
<span class="module-description">A simple terminal UI for git commands, written in Go.</span><br>
Example: <span class="module-example"><code>lazygit --version</code>.</span><br>
URL: <span class="module-url">URL=<a href="https://github.com/jesseduffield/lazygit/">https://github.com/jesseduffield/lazygit/</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>0.31.4</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
lazygit: Simple Terminal UI for Git Commands
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: cli, git&quot;)
whatis(&quot;URL: URL=https://github.com/jesseduffield/lazygit/&quot;)
whatis(&quot;Description: A simple terminal UI for git commands, written in Go.  Example: `lazygit --version`. Warning: Only the most recent version of this software will be kept.&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_lmod" class="module-name">lmod</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">RStudio Desktop: The RStudio Desktop IDE for R</strong><br>
<span class="module-description">The RStudio Desktop is an integrated development environment (IDE) for R, a programming language for statistical computing and graphics.</span><br>
Example: <span class="module-example"><code>rstudio</code>.  If you get a blank window, retry with <code>QMLSCENE_DEVICE=softwarecontext rstudio</code>.</span><br>
URL: <span class="module-url"><a href="https://rstudio.com/products/rstudio/#rstudio-desktop">https://rstudio.com/products/rstudio/#rstudio-desktop</a>, <a href="https://www.rstudio.com/products/rstudio/release-notes/">https://www.rstudio.com/products/rstudio/release-notes/</a> (changelog), <a href="https://github.com/rstudio/rstudio/">https://github.com/rstudio/rstudio/</a> (source code)</span><br>
Warning: <span class="module-warning">This software works only on the development nodes. It requires an SSH connection with X11 Forwarding enabled. It does <em>not</em> work with X2Go (gives error &quot;GLX 1.3 or later is required&quot;). For best performance, use SSH compression when using X11 Forwarding, i.e. <code>ssh -X -C ...</code>.</span><br>
Versions: <span class="module-version"><em>8.6</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
RStudio Desktop: The RStudio Desktop IDE for R
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: programming, R, GUI&quot;)
whatis(&quot;URL: https://rstudio.com/products/rstudio/#rstudio-desktop, https://www.rstudio.com/products/rstudio/release-notes/ (changelog), https://github.com/rstudio/rstudio/ (source code)&quot;)
whatis([[
Description: The RStudio Desktop is an integrated development environment (IDE) for R, a programming language for statistical computing and graphics.
Examples: `rstudio`.  If you get a blank window, retry with `QMLSCENE_DEVICE=softwarecontext rstudio`.
Warning: This software works only on the development nodes. It requires an SSH connection with X11 Forwarding enabled. It does *not* work with X2Go (gives error \&quot;GLX 1.3 or later is required\&quot;). For best performance, use SSH compression when using X11 Forwarding, i.e. `ssh -X -C ...`.
]])

depends_on(&quot;r&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_miniconda3-py39" class="module-name">miniconda3-py39</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">Miniconda: A Free Minimal Installer for Conda</strong><br>
<span class="module-description">Miniconda is a free minimal installer for conda. It is a small, bootstrap version of Anaconda that includes only conda, Python, the packages they depend on, and a small number of other useful packages, including pip, zlib and a few others.</span><br>
Example: <span class="module-example"><code>conda --version</code>, <code>conda init &amp;&amp; conda config --set auto_activate_base false</code> (first time), <code>conda create --name=myenv</code>, <code>conda info</code>, <code>conda activate myenv</code>, and <code>conda deactive</code>.
WARNING: Use at your own peril! Software tools installed via Conda are known to cause conflicts with other software on the system, including core software provided by the operating system as well as other software from the CBI stack. For example, do not install R packages running R from the CBI stack, while conda is activated.</span><br>
URL: <span class="module-url"><a href="https://docs.conda.io/en/latest/">https://docs.conda.io/en/latest/</a>, <a href="https://docs.conda.io/en/latest/miniconda.html">https://docs.conda.io/en/latest/miniconda.html</a> (docs), <a href="https://github.com/conda/conda/blob/master/CHANGELOG.md">https://github.com/conda/conda/blob/master/CHANGELOG.md</a> (changelog), <a href="https://github.com/conda/conda">https://github.com/conda/conda</a> (source code)</span><br>
Versions: <span class="module-version"><em>4.11.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
Miniconda: A Free Minimal Installer for Conda
]])

local warning = &quot;Use at your own peril! Software tools installed via Conda are known to cause conflicts with other software on the system, including core software provided by the operating system as well as other software from the CBI stack. For example, do not install R packages running R from the CBI stack, while conda is activated.&quot;

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: files, utility&quot;)
whatis(&quot;URL: https://docs.conda.io/en/latest/, https://docs.conda.io/en/latest/miniconda.html (docs), https://github.com/conda/conda/blob/master/CHANGELOG.md (changelog), https://github.com/conda/conda (source code)&quot;)
whatis([[
Description: Miniconda is a free minimal installer for conda. It is a small, bootstrap version of Anaconda that includes only conda, Python, the packages they depend on, and a small number of other useful packages, including pip, zlib and a few others.
Examples: `conda --version`, `conda init &amp;&amp; conda config --set auto_activate_base false` (first time), `conda create --name=myenv`, `conda info`, `conda activate myenv`, and `conda deactive`.
]] .. &quot;WARNING: &quot; .. warning .. &quot;\n&quot;
)

-- Assert that user doesn't already have their own conda installation
if mode() == &quot;load&quot; and os.getenv(&quot;CONDA_EXE&quot;) then
  LmodError(&quot;Cannot load &quot; .. name .. &quot; module, because another conda installation is already active. Have you installed conda on your own? (detected environment variable CONDA_EXE)&quot;)
end


local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
prepend_path(&quot;PKG_CONFIG_PATH&quot;, pathJoin(home, &quot;lib&quot;, &quot;pkgconfig&quot;))

LmodMessage(&quot;WARNING: &quot; .. warning)

-- Don't edit! Created using: 
-- /home/hb/shared/software/CBI/lmod-8.6/lmod/lmod/libexec/sh_to_modulefile /home/hb/shared/software/CBI/miniconda3-py39-4.11.0/etc/profile.d/conda.sh
pushenv(&quot;CONDA_EXE&quot;,&quot;/home/hb/shared/software/CBI/miniconda3-py39-4.11.0/bin/conda&quot;)
pushenv(&quot;CONDA_PYTHON_EXE&quot;,&quot;/home/hb/shared/software/CBI/miniconda3-py39-4.11.0/bin/python&quot;)
pushenv(&quot;CONDA_SHLVL&quot;,&quot;0&quot;)
prepend_path(&quot;PATH&quot;,&quot;/home/hb/shared/software/CBI/miniconda3-py39-4.11.0/condabin&quot;)
pushenv(&quot;_CE_CONDA&quot;,&quot;&quot;)
pushenv(&quot;_CE_M&quot;,&quot;&quot;)
set_shell_function(&quot;__add_sys_prefix_to_path&quot;,&quot; \
    if [ -n \&quot;${_CE_CONDA}\&quot; ] &amp;&amp; [ -n \&quot;${WINDIR+x}\&quot; ]; then\
        SYSP=$(\\dirname \&quot;${CONDA_EXE}\&quot;);\
    else\
        SYSP=$(\\dirname \&quot;${CONDA_EXE}\&quot;);\
        SYSP=$(\\dirname \&quot;${SYSP}\&quot;);\
    fi;\
    if [ -n \&quot;${WINDIR+x}\&quot; ]; then\
        PATH=\&quot;${SYSP}/bin:${PATH}\&quot;;\
        PATH=\&quot;${SYSP}/Scripts:${PATH}\&quot;;\
        PATH=\&quot;${SYSP}/Library/bin:${PATH}\&quot;;\
        PATH=\&quot;${SYSP}/Library/usr/bin:${PATH}\&quot;;\
        PATH=\&quot;${SYSP}/Library/mingw-w64/bin:${PATH}\&quot;;\
        PATH=\&quot;${SYSP}:${PATH}\&quot;;\
    else\
        PATH=\&quot;${SYSP}/bin:${PATH}\&quot;;\
    fi;\
    \\export PATH\
&quot;,&quot;&quot;)
set_shell_function(&quot;__conda_activate&quot;,&quot; \
    if [ -n \&quot;${CONDA_PS1_BACKUP:+x}\&quot; ]; then\
        PS1=\&quot;$CONDA_PS1_BACKUP\&quot;;\
        \\unset CONDA_PS1_BACKUP;\
    fi;\
    \\local ask_conda;\
    ask_conda=\&quot;$(PS1=\&quot;${PS1:-}\&quot; __conda_exe shell.posix \&quot;$@\&quot;)\&quot; || \\return;\
    \\eval \&quot;$ask_conda\&quot;;\
    __conda_hashr\
&quot;,&quot;&quot;)
set_shell_function(&quot;__conda_exe&quot;,&quot; \
    ( __add_sys_prefix_to_path;\
    \&quot;$CONDA_EXE\&quot; $_CE_M $_CE_CONDA \&quot;$@\&quot; )\
&quot;,&quot;&quot;)
set_shell_function(&quot;__conda_hashr&quot;,&quot; \
    if [ -n \&quot;${ZSH_VERSION:+x}\&quot; ]; then\
        \\rehash;\
    else\
        if [ -n \&quot;${POSH_VERSION:+x}\&quot; ]; then\
            :;\
        else\
            \\hash -r;\
        fi;\
    fi\
&quot;,&quot;&quot;)
set_shell_function(&quot;__conda_reactivate&quot;,&quot; \
    \\local ask_conda;\
    ask_conda=\&quot;$(PS1=\&quot;${PS1:-}\&quot; __conda_exe shell.posix reactivate)\&quot; || \\return;\
    \\eval \&quot;$ask_conda\&quot;;\
    __conda_hashr\
&quot;,&quot;&quot;)
set_shell_function(&quot;conda&quot;,&quot; \
    \\local cmd=\&quot;${1-__missing__}\&quot;;\
    case \&quot;$cmd\&quot; in \
        activate | deactivate)\
            __conda_activate \&quot;$@\&quot;\
        ;;\
        install | update | upgrade | remove | uninstall)\
            __conda_exe \&quot;$@\&quot; || \\return;\
            __conda_reactivate\
        ;;\
        *)\
            __conda_exe \&quot;$@\&quot;\
        ;;\
    esac\
&quot;,&quot;&quot;)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_mutect" class="module-name">mutect</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">muTect: Identification of Somatic Point Mutations in Next Generation Sequencing Data of Cancer Genomes</strong><br>
<span class="module-description">MuTect is a method developed at the Broad Institute for the reliable and accurate identification of somatic point mutations in next generation sequencing data of cancer genomes.</span><br>
Example: <span class="module-example"><code>mutect</code>, which is short for <code>java -Xmx2g -jar &quot;$MUTECT_JAR&quot;</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/broadinstitute/mutect">https://github.com/broadinstitute/mutect</a>, <a href="https://software.broadinstitute.org/cancer/cga/mutect">https://software.broadinstitute.org/cancer/cga/mutect</a></span><br>
Versions: <span class="module-version">1.1.1, 1.1.4, <em>1.1.5</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
muTect: Identification of Somatic Point Mutations in Next Generation Sequencing Data of Cancer Genomes
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing, genome&quot;)
whatis(&quot;URL: https://github.com/broadinstitute/mutect, https://software.broadinstitute.org/cancer/cga/mutect&quot;)
whatis(&quot;Description: MuTect is a method developed at the Broad Institute for the reliable and accurate identification of somatic point mutations in next generation sequencing data of cancer genomes. Example: `mutect`, which is short for `java -Xmx2g -jar \&quot;$MUTECT_JAR\&quot;`.&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

name = &quot;muTect&quot;
pushenv(&quot;MUTECT_HOME&quot;, home)
local jarfile = pathJoin(home, name .. &quot;-&quot; .. version .. &quot;.jar&quot;)
pushenv(&quot;MUTECT_JAR&quot;, jarfile)
set_alias(&quot;mutect&quot;, &quot;java -Xmx2g -jar &quot; .. jarfile)



</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_pandoc" class="module-name">pandoc</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">Pandoc: A Universal Document Converter</strong><br>
<span class="module-description">Pandoc is a Haskell library and software tool for converting from one markup format to another, and a command-line tool that uses this library.</span><br>
Example: <span class="module-example"><code>pandoc --version</code>.</span><br>
URL: <span class="module-url"><a href="https://pandoc.org/">https://pandoc.org/</a>, <a href="https://github.com/jgm/pandoc">https://github.com/jgm/pandoc</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">2.11.4, <em>2.16.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
Pandoc: A Universal Document Converter
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: cli, shell&quot;)
whatis(&quot;URL: https://pandoc.org/, https://github.com/jgm/pandoc&quot;)
whatis(&quot;Description: Pandoc is a Haskell library and software tool for converting from one markup format to another, and a command-line tool that uses this library.  Example: `pandoc --version`. Warning: Only the most recent version of this software will be kept.&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_pindel" class="module-name">pindel</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">pindel: Detection of Indels and Structural Variations</strong><br>
<span class="module-description">Pindel can detect breakpoints of large deletions, medium sized insertions, inversions, tandem duplications and other structural variants at single-based resolution from next-gen sequence data. It uses a pattern growth approach to identify the breakpoints of these variants from paired-end short reads.</span><br>
Example: <span class="module-example"><code>pindel</code>.</span><br>
URL: <span class="module-url"><a href="https://www.sanger.ac.uk/science/tools/pindel">https://www.sanger.ac.uk/science/tools/pindel</a>, <a href="https://github.com/genome/pindel">https://github.com/genome/pindel</a></span><br>
Versions: <span class="module-version">0.2.4t, <em>0.2.5b8</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
pindel: Detection of Indels and Structural Variations
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://www.sanger.ac.uk/science/tools/pindel, https://github.com/genome/pindel&quot;)
whatis(&quot;Description: Pindel can detect breakpoints of large deletions, medium sized insertions, inversions, tandem duplications and other structural variants at single-based resolution from next-gen sequence data. It uses a pattern growth approach to identify the breakpoints of these variants from paired-end short reads.  Example: `pindel`.&quot;)

if (version == &quot;0.2.4t&quot;) then
  load(&quot;samtools/0.1.18&quot;)
else
  load(&quot;htslib&quot;)
end

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_r" class="module-name">r</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">R: The R Programming Language</strong><br>
<span class="module-description">The R programming language.</span><br>
Example: <span class="module-example"><code>R</code>, <code>R --version</code>, and <code>Rscript --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.r-project.org/">https://www.r-project.org/</a>, <a href="https://cran.r-project.org/doc/manuals/r-release/NEWS.html">https://cran.r-project.org/doc/manuals/r-release/NEWS.html</a> (changelog)</span><br>
Versions: <span class="module-version">3.5.3-gcc8, 3.6.0, 3.6.1, 4.0.4, 4.1.0, 4.1.2-gcc8, <em>4.1.3</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
R: The R Programming Language
]])

local name = myModuleName()
local version = &quot;4.1.2-gcc8&quot;
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: Programming, Statistics&quot;)
whatis(&quot;URL: https://www.r-project.org/&quot;)
whatis([[
Description: The R programming language.
Examples: `R --version` and `Rscript --version`.
]])

has_devtoolset = function(version)
  local path = pathJoin(&quot;/opt&quot;, &quot;rh&quot;, &quot;devtoolset-&quot; .. version)
  return(isDir(path))
end

local name = &quot;R&quot;
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;, &quot;R&quot;, &quot;lib&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))

local v = version
v = string.gsub(v, &quot;-.*&quot;, &quot;&quot;)

-- WORKAROUND: R 3.6.0 is not compatible with BeeGFS
if v == &quot;3.6.0&quot; then
  pushenv(&quot;R_INSTALL_STAGED&quot;, &quot;false&quot;)
else
  pushenv(&quot;R_INSTALL_STAGED&quot;, &quot;true&quot;)
end

local r_libs_user=&quot;~/R/%p-library/%v-CBI&quot;

if (v &gt;= &quot;4.1.0&quot;) then
  local gv = string.gsub(version, v, &quot;&quot;)
  gv = string.gsub(gv, &quot;-alpha&quot;, &quot;&quot;)
  gv = string.gsub(gv, &quot;-beta&quot;, &quot;&quot;)
  gv = string.gsub(gv, &quot;-gcc&quot;, &quot;&quot;)
  if (gv &gt; &quot;4&quot;) then
    r_libs_user = r_libs_user .. &quot;-gcc&quot; .. gv
    if has_devtoolset(gv) then
      depends_on(&quot;scl-devtoolset/&quot; .. gv)
    end
  end
end

-- Avoid R CMD build warning on &quot;invalid uid value replaced by that for user 'nobody'&quot;
-- https://stackoverflow.com/questions/30599326
pushenv(&quot;R_BUILD_TAR&quot;, &quot;tar&quot;)

-- In-house env var for R repositories mirrored locally
local r_repos_root = os.getenv(&quot;CBI_SHARED_ROOT&quot;)
if (r_repos_root) then
  LmodMessage(&quot;r_repos_root=&quot; .. r_repos_root)
  r_repos_root = pathJoin(r_repos_root, &quot;mirrors&quot;, &quot;r-mirrors&quot;)
  pushenv(&quot;R_REPOS_ROOT&quot;, r_repos_root)
  pushenv(&quot;R_REPOS_CRAN&quot;, &quot;file://&quot; .. pathJoin(r_repos_root, &quot;cran&quot;))
  pushenv(&quot;R_LOCAL_CRAN&quot;, &quot;file://&quot; .. pathJoin(r_repos_root, &quot;cran&quot;))
end

-- R packages built from native code and installed using R from EPEL is *not*
-- always compatible with ditto installed using R from the CBI software stack.
-- Because of this, we will use R_LIBS_USER specific to the CBI stack.
-- However, since some users has already installed to the built-in R_LIBS_USER
-- we will not change this for such users.  The heuristic is to check if the
-- built-in R_LIBS_USER folder already exists. If not, then it's safe to use
-- one specific to the CBI stack.
pushenv(&quot;R_LIBS_USER&quot;, r_libs_user)

-- WORKAROUND: utils::download.file(), which is for instance used by install.packages()
-- have a built-in timeout at 60 seconds.  This might be too short for some larger
-- Bioconductor annotation packages, e.g. 'SNPlocs.Hsapiens.dbSNP150.GRCh38' (2.10 GB).
pushenv(&quot;R_DEFAULT_INTERNET_TIMEOUT&quot;, &quot;180&quot;) -- 3 minutes timeout instead of 1 minute

-- WORKAROUND: gert 1.1.0 (2021-01-25) installs toward a static libgit2 that
-- gives 'Illegal instruction' on some hosts (with older CPUs?)
-- See https://github.com/r-lib/gert/issues/117
pushenv(&quot;USE_SYSTEM_LIBGIT2&quot;, &quot;true&quot;)

-- WORKAROUND: Package udunits2 does not install out of the box and requires
-- manually specifying 'configure.args' during install unless we set the
-- following environment variable
local path = &quot;/usr/include/udunits2&quot;
if (isDir(path)) then
  pushenv(&quot;UDUNITS2_INCLUDE&quot;, path)
end
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_rclone" class="module-name">rclone</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">rclone: Rsync for Cloud Storage and More</strong><br>
<span class="module-description">Rclone is a command line program to sync files and directories to and from a large number of end points on the local file system, or remote file systems, and in the cloud.</span><br>
Example: <span class="module-example"><code>rclone --version</code>, <code>rclone --help</code>, <code>rclone config</code>, and <code>info rclone</code>.</span><br>
URL: <span class="module-url"><a href="https://rclone.org/">https://rclone.org/</a>, <a href="https://rclone.org/changelog/">https://rclone.org/changelog/</a> (changelog) <a href="https://github.com/rclone/rclone">https://github.com/rclone/rclone</a> (source code)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>1.57.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help(&quot;rclone: Rsync for Cloud Storage and More&quot;)

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: files, transfers&quot;)
whatis(&quot;URL: https://rclone.org/, https://rclone.org/changelog/ (changelog) https://github.com/rclone/rclone (source code)&quot;)
whatis([[
Description: Rclone is a command line program to sync files and directories to and from a large number of end points on the local file system, or remote file systems, and in the cloud.
Example: `rclone --version`, `rclone --help`, `rclone config`, and `info rclone`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
prepend_path(&quot;MANPATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_restic" class="module-name">restic</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">restic: Fast, Secure, Efficient Backup Program</strong><br>
<span class="module-description">restic is a backup program that is fast, efficient and secure. It supports the three major operating systems (Linux, macOS, Windows) and a few smaller ones (FreeBSD, OpenBSD).</span><br>
Example: <span class="module-example"><code>restic --help</code> and <code>restic version</code></span><br>
URL: <span class="module-url"><a href="https://restic.net">https://restic.net</a>, <a href="https://restic.readthedocs.io/en/latest/">https://restic.readthedocs.io/en/latest/</a>, <a href="https://github.com/restic/restic">https://github.com/restic/restic</a></span><br>
Versions: <span class="module-version"><em>0.12.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
restic: Fast, Secure, Efficient Backup Program
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: cli, backup, files&quot;)
whatis(&quot;URL: https://restic.net, https://restic.readthedocs.io/en/latest/, https://github.com/restic/restic&quot;)
whatis(&quot;Description: restic is a backup program that is fast, efficient and secure. It supports the three major operating systems (Linux, macOS, Windows) and a few smaller ones (FreeBSD, OpenBSD).  Example: `restic --help` and `restic version`&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;man&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_ripgrep" class="module-name">ripgrep</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">ripgrep: Recursively Searches Directories for a Regex Pattern</strong><br>
<span class="module-description">ripgrep is a line-oriented search tool that recursively searches your current directory for a regex pattern. By default, ripgrep will respect your .gitignore and automatically skip hidden files/directories and binary files. ripgrep is similar to other popular search tools like The Silver Searcher, ack and grep.</span><br>
Example: <span class="module-example"><code>rg --version</code> and <code>rg -i 'lorem ipsum'</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/BurntSushi/ripgrep">https://github.com/BurntSushi/ripgrep</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>12.1.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
ripgrep: Recursively Searches Directories for a Regex Pattern
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utility, files, search&quot;)
whatis(&quot;URL: https://github.com/BurntSushi/ripgrep&quot;)
whatis(&quot;Description: ripgrep is a line-oriented search tool that recursively searches your current directory for a regex pattern. By default, ripgrep will respect your .gitignore and automatically skip hidden files/directories and binary files. ripgrep is similar to other popular search tools like The Silver Searcher, ack and grep.  Examples: `rg --version` and `rg -i 'lorem ipsum'`. Warning: Only the most recent version of this software will be kept.&quot;)

-- Local variables
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_rstudio" class="module-name">rstudio</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">rstudio: RStudio Desktop</strong><br>
<span class="module-description">The RStudio Desktop is an integrated development environment (IDE) for R, a programming language for statistical computing and graphics.</span><br>
Example: <span class="module-example"><code>rstudio</code>.  If you get a blank window, retry with <code>QMLSCENE_DEVICE=softwarecontext rstudio</code>.</span><br>
URL: <span class="module-url"><a href="https://rstudio.com/products/rstudio/#rstudio-desktop">https://rstudio.com/products/rstudio/#rstudio-desktop</a>, <a href="https://www.rstudio.com/products/rstudio/release-notes/">https://www.rstudio.com/products/rstudio/release-notes/</a> (changelog), <a href="https://github.com/rstudio/rstudio/">https://github.com/rstudio/rstudio/</a> (source code)</span><br>
Warning: <span class="module-warning">This software works only on the development nodes. It requires an SSH connection with X11 Forwarding enabled. It does <em>not</em> work with X2Go (gives error &quot;GLX 1.3 or later is required&quot;). For best performance, use SSH compression when using X11 Forwarding, i.e. <code>ssh -X -C ...</code>.</span><br>
Versions: <span class="module-version">1.4.1103, 2021.09.0+351, 2021.09.2-382, <em>2022.02.0-443</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
RStudio Desktop: The RStudio Desktop IDE for R
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: programming, R, GUI&quot;)
whatis(&quot;URL: https://rstudio.com/products/rstudio/#rstudio-desktop, https://www.rstudio.com/products/rstudio/release-notes/ (changelog), https://github.com/rstudio/rstudio/ (source code)&quot;)
whatis([[
Description: The RStudio Desktop is an integrated development environment (IDE) for R, a programming language for statistical computing and graphics.
Examples: `rstudio`.  If you get a blank window, retry with `QMLSCENE_DEVICE=softwarecontext rstudio`.
Warning: This software works only on the development nodes. It requires an SSH connection with X11 Forwarding enabled. It does *not* work with X2Go (gives error \&quot;GLX 1.3 or later is required\&quot;). For best performance, use SSH compression when using X11 Forwarding, i.e. `ssh -X -C ...`.
]])

depends_on(&quot;r&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_rstudio-server" class="module-name">rstudio-server</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">RStudio Server: The RStudio Server</strong><br>
<span class="module-description">The RStudio Server is an integrated development environment (IDE) for R that can be used from the web browser.</span><br>
Example: <span class="module-example"><code>rserver</code>.</span><br>
URL: <span class="module-url"><a href="https://rstudio.com/products/rstudio/#rstudio-server">https://rstudio.com/products/rstudio/#rstudio-server</a>, <a href="https://www.rstudio.com/products/rstudio/release-notes/">https://www.rstudio.com/products/rstudio/release-notes/</a> (changelog), <a href="https://github.com/rstudio/rstudio/">https://github.com/rstudio/rstudio/</a> (source code)</span><br>
Warning: <span class="module-warning">This is work under construction!</span><br>
Versions: <span class="module-version">2021.09.2-382, <em>2022.02.0-443</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
RStudio Server: The RStudio Server
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: programming, R, GUI&quot;)
whatis(&quot;URL: https://rstudio.com/products/rstudio/#rstudio-server, https://www.rstudio.com/products/rstudio/release-notes/ (changelog), https://github.com/rstudio/rstudio/ (source code)&quot;)
whatis([[
Description: The RStudio Server is an integrated development environment (IDE) for R that can be used from the web browser.
Examples: `rserver`.
Warning: This is work under construction!
]])

depends_on(&quot;r&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_rstudio-server-controller" class="module-name">rstudio-server-controller</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">RSC: An RStudio Server Controller</strong><br>
<span class="module-description">The RStudio Server Controller (RSC) is a tool for launching a personal instance of the RStudio Server on a Linux machine, which then can be access via the web browser, either directly or via SSH tunneling.</span><br>
Example: <span class="module-example"><code>rsc --help</code>, and <code>rsc start</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/UCSF-CBI/rstudio-server-controller">https://github.com/UCSF-CBI/rstudio-server-controller</a>, <a href="https://github.com/UCSF-CBI/rstudio-server-controller/blob/main/NEWS.md">https://github.com/UCSF-CBI/rstudio-server-controller/blob/main/NEWS.md</a> (changelog)</span><br>
Warning: <span class="module-warning">This is work under construction!</span><br>
Versions: <span class="module-version"><em>0.8.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
RSC: An RStudio Server Controller
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: programming, R, RStudio Server, GUI&quot;)
whatis(&quot;URL: https://github.com/UCSF-CBI/rstudio-server-controller, https://github.com/UCSF-CBI/rstudio-server-controller/blob/main/NEWS.md (changelog)&quot;)
whatis([[
Description: The RStudio Server Controller (RSC) is a tool for launching a personal instance of the RStudio Server on a Linux machine, which then can be access via the web browser, either directly or via SSH tunneling.
Examples: `rsc --help`, and `rsc start`.
Warning: This is work under construction!
]])

depends_on(&quot;r&quot;)
depends_on(&quot;rstudio-server&quot;)
try_load(&quot;expect&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_salmon" class="module-name">salmon</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">salmon: Salmon Provides Fast and Bias-Aware Quantification of Transcript Expression</strong><br>
<span class="module-description">Highly-accurate &amp; wicked fast transcript-level quantification from RNA-seq reads using selective alignment.</span><br>
Example: <span class="module-example"><code>salmon --version</code>.</span><br>
URL: <span class="module-url"><a href="https://combine-lab.github.io/salmon/">https://combine-lab.github.io/salmon/</a>, <a href="https://github.com/COMBINE-lab/salmon/releases">https://github.com/COMBINE-lab/salmon/releases</a> (changelog), <a href="https://github.com/COMBINE-lab/salmon">https://github.com/COMBINE-lab/salmon</a> (source code)</span><br>
Versions: <span class="module-version">1.7.0, <em>1.8.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
salmon: Salmon Provides Fast and Bias-Aware Quantification of Transcript Expression
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://combine-lab.github.io/salmon/, https://github.com/COMBINE-lab/salmon/releases (changelog), https://github.com/COMBINE-lab/salmon (source code)&quot;)
whatis([[
Description: Highly-accurate &amp; wicked fast transcript-level quantification from RNA-seq reads using selective alignment.
Examples: `salmon --version`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_samtools" class="module-name">samtools</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">SAMtools: Tools (written in C using htslib) for Manipulating Next-Generation Sequencing Data</strong><br>
<span class="module-description">SAMtools is a suite of programs for interacting with high-throughput sequencing data.</span><br>
Example: <span class="module-example"><code>samtools --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.htslib.org/">https://www.htslib.org/</a>, <a href="https://github.com/samtools/samtools">https://github.com/samtools/samtools</a></span><br>
Versions: <span class="module-version">0.1.18, <em>1.13</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
SAMtools: Tools (written in C using htslib) for Manipulating Next-Generation Sequencing Data
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://www.htslib.org/, https://github.com/samtools/samtools&quot;)
whatis(&quot;Description: SAMtools is a suite of programs for interacting with high-throughput sequencing data.  Example: `samtools --version`.&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))


-- Warn about bug https://github.com/samtools/htslib/issues/1236
if (mode() == &quot;load&quot; and version == &quot;1.11&quot;) then
  LmodMessage(&quot;MODULE WARNING: &quot; .. name .. &quot; &quot; .. version .. &quot; has a bug that results in valid but incorrect CIGAR strings. Because of this, it is recommended to use an older or a newer version instead. For details, see https://github.com/samtools/htslib/issues/1236&quot;)
end
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_shellcheck" class="module-name">shellcheck</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">ShellCheck: A Shell Script Static Analysis Tool</strong><br>
<span class="module-description">ShellCheck finds bugs in your shell scripts.</span><br>
Example: <span class="module-example"><code>shellcheck --version</code> and <code>shellcheck -x ~/.bashrc</code>.</span><br>
URL: <span class="module-url"><a href="https://www.shellcheck.net/">https://www.shellcheck.net/</a>, <a href="https://github.com/koalaman/shellcheck/">https://github.com/koalaman/shellcheck/</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">0.7.0, 0.7.1, 0.7.2, <em>0.8.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
ShellCheck: A Shell Script Static Analysis Tool
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: programming, shell, sh, bash, dash, ksh&quot;)
whatis(&quot;URL: https://www.shellcheck.net/, https://github.com/koalaman/shellcheck/&quot;)
whatis(&quot;Description: ShellCheck finds bugs in your shell scripts.  Example: `shellcheck --version` and `shellcheck -x ~/.bashrc`.  Warning: Only the most recent version of this software will be kept.&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_sratoolkit" class="module-name">sratoolkit</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">SRA Toolkit: Tools and Libraries for Using Data in the INSDC Sequence Read Archives</strong><br>
<span class="module-description">The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives.</span><br>
Example: <span class="module-example"><code>fastq-dump --help</code>.</span><br>
URL: <span class="module-url"><a href="https://ncbi.github.io/sra-tools/">https://ncbi.github.io/sra-tools/</a>, <a href="https://github.com/ncbi/sra-tools">https://github.com/ncbi/sra-tools</a></span><br>
Warning: <span class="module-warning">To work around a bug where <code>fasterq-dump</code> crashes the local machine, it has been tweaked such that it uses <code>$TMPDIR</code> rather than <code>$PWD</code> as the default temporary folder and it will only use two threads instead of six by default.</span><br>
Versions: <span class="module-version">2.10.9, 2.11.0, <em>2.11.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
SRA Toolkit: Tools and Libraries for Using Data in the INSDC Sequence Read Archives
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://ncbi.github.io/sra-tools/, https://github.com/ncbi/sra-tools&quot;)
whatis(&quot;Description: The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives. Example: `fastq-dump --help`. Warning: To work around a bug where `fasterq-dump` crashes the local machine, it has been tweaked such that it uses `$TMPDIR` rather than `$PWD` as the default temporary folder and it will only use two threads instead of six by default.&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)
prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))

-- WORKAROUND: fasterq-dump crashes machines!
-- Not sure exactly why, but one hypothesis is that the file system is
-- being hit too hard.  The workaround forces 'fasterq-dump' to use
-- 'TMPDIR' for temporary files rather than the current directory [2]
-- [1] https://github.com/ncbi/sra-tools/issues/463#issuecomment-824321890
-- [2] https://github.com/ncbi/sra-tools/issues/161#issuecomment-808294889
-- In-house tests shows that it's not sufficient to control TMPDIR but also
-- the number of parallel threads [Harry Putnam, 2021-08-20].  Ideally, we
-- would limit it to a single thread, but the tool will ignore '--threads 1'
-- and use the default six threads. [3]
-- [3] https://github.com/ncbi/sra-tools/issues/494
set_shell_function(&quot;fasterq-dump&quot;, 'command fasterq-dump --threads 2 --temp &quot;$(mktemp -d)&quot; &quot;$@&quot;', '')
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_star" class="module-name">star</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">STAR: Spliced Transcripts Alignment to a Reference</strong><br>
<span class="module-description">STAR (Spliced Transcripts Alignment to a Reference) is a fast NGS read aligner for RNA-seq data.</span><br>
Example: <span class="module-example"><code>STAR --help</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/alexdobin/STAR">https://github.com/alexdobin/STAR</a>, <a href="https://github.com/alexdobin/STAR/blob/master/CHANGES.md">https://github.com/alexdobin/STAR/blob/master/CHANGES.md</a> (changelog)</span><br>
Versions: <span class="module-version">2.7.1a, 2.7.4a, <em>2.7.10a</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help(&quot;STAR: Spliced Transcripts Alignment to a Reference&quot;)

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://github.com/alexdobin/STAR, https://github.com/alexdobin/STAR/blob/master/CHANGES.md (changelog)&quot;)
whatis([[
Description: STAR (Spliced Transcripts Alignment to a Reference) is a fast NGS read aligner for RNA-seq data.
Example: `STAR --help`.
]])

local name = &quot;STAR&quot;
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;, &quot;Linux_x86_64_static&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_tig" class="module-name">tig</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">tig: Text-Mode Interface for Git</strong><br>
<span class="module-description">Tig is an ncurses-based text-mode interface for git. It functions mainly as a Git repository browser, but can also assist in staging changes for commit at chunk level and act as a pager for output from various Git commands.</span><br>
Example: <span class="module-example"><code>tig --help</code>, <code>tig</code>,  <code>man tig</code> and <code>man tigrc</code>.</span><br>
URL: <span class="module-url"><a href="https://jonas.github.io/tig/">https://jonas.github.io/tig/</a></span><br>
Versions: <span class="module-version"><em>2.5.3</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
tig: Text-Mode Interface for Git
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utility, git&quot;)
whatis(&quot;URL: https://jonas.github.io/tig/&quot;)
whatis(&quot;Description: Tig is an ncurses-based text-mode interface for git. It functions mainly as a Git repository browser, but can also assist in staging changes for commit at chunk level and act as a pager for output from various Git commands. Example: `tig --help`, `tig`,  `man tig` and `man tigrc`.&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_up" class="module-name">up</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">up: The Ultimate Plumber</strong><br>
<span class="module-description">A tool for writing Linux pipes in a terminal-based UI interactively, with instant live preview of command results. Interactively and incrementally explore textual data in Linux using text-processing utils such as grep, sort, cut, paste, awk, wc, perl, etc.</span><br>
Example: <span class="module-example"><code>up --help</code>, <code>ls | up</code> (exit with Ctrl-C).</span><br>
URL: <span class="module-url"><a href="https://github.com/akavel/up">https://github.com/akavel/up</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>0.4</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
up: The Ultimate Plumber
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utility, cli&quot;)
whatis(&quot;URL: https://github.com/akavel/up&quot;)
whatis(&quot;Description: A tool for writing Linux pipes in a terminal-based UI interactively, with instant live preview of command results. Interactively and incrementally explore textual data in Linux using text-processing utils such as grep, sort, cut, paste, awk, wc, perl, etc.  Examples: `up --help`, `ls | up` (exit with Ctrl-C).  Warning: Only the most recent version of this software will be kept.&quot;)

-- Local variables
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
</div> 

<div id="button_repository_wittelab" class="tab-pane fade">

<h2 id="repository_wittelab">Module Software Repository: WitteLab (17)</h2>

Maintained by: Taylor Cavazos, <a href="https://wittelab.ucsf.edu">Witte Lab Software Repository</a><br>
Enable repository: <code>module load WitteLab</code><br>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
Please note that this software stack is maintained and contributed by a research group on a voluntary basis. It is <em>not</em> maintained by the {{ site.cluster.name }} admins. Please reach out to the corresponding maintainer for bug reports, feedback, or questions.
</div>

<h3 id="module_wittelab_ascp" class="module-name">ascp</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">ascp: Command line data transfer client</strong><br>
<span class="module-description">The IBM Aspera Command-Line Interface (CLI) is a lightweight shell scripting tool that be used to automate Faspex and Shares tasks without having to do additional coding. The CLI is for users and organizations that want to automate their transfer workflows; it provides an alternative to using the API for the same functionality.</span><br>
Example: <span class="module-example"><code>ascp --help</code>.</span><br>
URL: <span class="module-url"><a href="https://developer.asperasoft.com/desktop-advance/command-line-client">https://developer.asperasoft.com/desktop-advance/command-line-client</a></span><br>
Versions: <span class="module-version"><em>3.9.6</em></span><br>
  </dd>
</dl>
<h3 id="module_wittelab_bcftools" class="module-name">bcftools</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">bcftools: Command line suite for working with bgzipped vcf files, includes tabix and bgzip</strong><br>
<span class="module-description">BCFtools is a set of utilities that manipulate variant calls in the Variant Call Format (VCF) and its binary counterpart BCF. All commands work transparently with both VCFs and BCFs, both uncompressed and BGZF-compressed.</span><br>
Example: <span class="module-example"><code>bcftools --help</code>.</span><br>
URL: <span class="module-url"><a href="http://www.htslib.org/download/">http://www.htslib.org/download/</a></span><br>
Versions: <span class="module-version"><em>1.11</em></span><br>
  </dd>
</dl>
<h3 id="module_wittelab_charger" class="module-name">charger</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">charger: a software tool for interpreting and predicting clinical pathogenicity of germline variants.</strong><br>
<span class="module-description">CharGer gathers evidence from databases and annotations, provided by local tools and files or via ReST APIs, and classifies variants according to ACMG guidelines for assessing variant pathogenicity. User-designed pathogenicity criteria can be incorporated into CharGer’s flexible framework, thereby allowing users to create a customized classification protocol. If you use CharGer, please cite our publication so we can continue to support CharGer development: Adam D Scott, Kuan-Lin Huang, Amila Weerasinghe, R Jay Mashl, Qingsong Gao, Fernanda Martins Rodrigues, Matthew A Wyczalkowski, Li Ding, CharGer: clinical Characterization of Germline variants, Bioinformatics, Volume 35, Issue 5, 01 March 2019, Pages 865–867, <a href="https://doi.org/10.1093/bioinformatics/bty649">https://doi.org/10.1093/bioinformatics/bty649</a></span><br>
URL: <span class="module-url"><a href="https://github.com/ding-lab/CharGer/tree/7d7d2911b89261fa5dceea6395a5d188a82757f2">https://github.com/ding-lab/CharGer/tree/7d7d2911b89261fa5dceea6395a5d188a82757f2</a></span><br>
Versions: <span class="module-version"><em>0.5.4</em></span><br>
  </dd>
</dl>
<h3 id="module_wittelab_flashpca" class="module-name">flashpca</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">FlashPCA2: performs fast PCA of SNP data</strong><br>
<span class="module-description">FlashPCA performs fast principal component analysis (PCA) of single nucleotide polymorphism (SNP) data, similar to smartpca from EIGENSOFT (<a href="http://www.hsph.harvard.edu/alkes-price/software/">http://www.hsph.harvard.edu/alkes-price/software/</a>) and shellfish (<a href="https://github.com/dandavison/shellfish">https://github.com/dandavison/shellfish</a>). FlashPCA is based on the <a href="https://github.com/yixuan/spectra/">https://github.com/yixuan/spectra/</a> library.</span><br>
URL: <span class="module-url"><a href="https://github.com/gabraham/flashpca">https://github.com/gabraham/flashpca</a></span><br>
Versions: <span class="module-version"><em>2.0.0</em></span><br>
  </dd>
</dl>
<h3 id="module_wittelab_focus" class="module-name">focus</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">focus: a set of tools to finemap twas statistics</strong><br>
<span class="module-description">FOCUS (Fine-mapping Of CaUsal gene Sets) is software to fine-map transcriptome-wide association study statistics at genomic risk regions. The software takes as input summary GWAS data along with eQTL weights and outputs a credible set of genes to explain observed genomic risk.</span><br>
Example: <span class="module-example">source $ENV; focus --help; deactivate</span><br>
URL: <span class="module-url"><a href="https://github.com/bogdanlab/focus">https://github.com/bogdanlab/focus</a></span><br>
Versions: <span class="module-version"><em>0.7.0</em></span><br>
  </dd>
</dl>
<h3 id="module_wittelab_gcta" class="module-name">gcta</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">gcta: GCTA (Genome-wide Complex Trait Analysis) was initially designed to estimate the proportion of phenotypic variance explained by all genome-wide SNPs for complex traits (i.e., the GREML method). It has been subsequently extended for many other analyses to better understand the genetic architecture of complex traits. GCTA currently supports the following analyses.</strong><br>
<span class="module-description">Additional information can be found in the tutorial: <a href="https://cnsgenomics.com/software/gcta/#Tutorial">https://cnsgenomics.com/software/gcta/#Tutorial</a></span><br>
Versions: <span class="module-version"><em>1.93.2</em></span><br>
  </dd>
</dl>
<h3 id="module_wittelab_gfetch" class="module-name">gfetch</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">gfetch: Download multi-person genetic data for the UK Biobank</strong><br>
<span class="module-description">gfetch client has been developed to allow Approved researchers to download elements of it piecemeal to their local systems from secure online repositories outside the main UK Biobank showcase system</span><br>
URL: <span class="module-url"><a href="https://biobank.ndph.ox.ac.uk/ukb/refer.cgi?id=668">https://biobank.ndph.ox.ac.uk/ukb/refer.cgi?id=668</a></span><br>
Versions: <span class="module-version"><em>1.0.0</em></span><br>
  </dd>
</dl>
<h3 id="module_wittelab_gwama" class="module-name">gwama</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">GWAMA: Genome-Wide Association Meta Analysis</strong><br>
<span class="module-description">software has been developed to perform meta-analysis of the results of GWA studies of binary or quantitative phenotypes. The software incorporates error trapping facilities to identify strand alignment errors and allele flipping, and performs tests of heterogeneity of effects between studies.</span><br>
Example: <span class="module-example"><code>GWAMA --help</code>.</span><br>
URL: <span class="module-url"><a href="https://genomics.ut.ee/en/tools/gwama">https://genomics.ut.ee/en/tools/gwama</a></span><br>
Versions: <span class="module-version"><em>2.2.2</em></span><br>
  </dd>
</dl>
<h3 id="module_wittelab_gwastools" class="module-name">gwastools</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">gwastools: This repository contains tools to harmonize GWAS summary statistics to a given reference. The main application is harmonization of a public gwas' variants to those in the GTEx study, and allow imputation of summary statistics for missing variants.</strong><br>
<span class="module-description">Here you can find many python files for GWAS harmination and summary stat imputation. See github page for more details.</span><br>
Example: <span class="module-example">source $ENV; ls $GWAS_TOOLS/; python $GWAS_TOOLS/gwas_parsing.py --help; deactivate</span><br>
URL: <span class="module-url"><a href="https://github.com/hakyimlab/summary-gwas-imputation">https://github.com/hakyimlab/summary-gwas-imputation</a></span><br>
Versions: <span class="module-version"><em>0.0.0</em></span><br>
  </dd>
</dl>
<h3 id="module_wittelab_hess" class="module-name">hess</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">HESS: is a Python package that provides utilities for estimating and analyzing local SNP-heritability and genetic covariance from GWAS summary association data.</strong><br>
URL: <span class="module-url"><a href="https://github.com/huwenboshi/hess">https://github.com/huwenboshi/hess</a></span><br>
Versions: <span class="module-version"><em>0.5.4</em></span><br>
  </dd>
</dl>
<h3 id="module_wittelab_ldak" class="module-name">ldak</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">LDAK: program for running heritability, genetic correlation, and genetic prediction (BayesR, MultiBLUP) analyses</strong><br>
<span class="module-description">This is a command-line tool for analyses of individual-level and summary data (formatted accordingly: <a href="https://dougspeed.com/summary-statistics/">https://dougspeed.com/summary-statistics/</a>). Analyses of summary data require pre-computed tagging files (LD reference panels). You can generate these from individual-level data (<a href="https://dougspeed.com/calculate-taggings/">https://dougspeed.com/calculate-taggings/</a>) or use pre-computed files from external reference datasets (<a href="https://dougspeed.com/pre-computed-tagging-files/">https://dougspeed.com/pre-computed-tagging-files/</a>). Recommended tagging files for EUR/GBB and AFR populations have been downloaded.</span><br>
URL: <span class="module-url"><a href="https://dougspeed.com/ldak/">https://dougspeed.com/ldak/</a></span><br>
Versions: <span class="module-version"><em>5.1</em></span><br>
  </dd>
</dl>
<h3 id="module_wittelab_ldsc" class="module-name">ldsc</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">ldsc: a command line tool for estimating heritability and genetic correlation from GWAS summary statistics. ldsc also computes LD Scores.</strong><br>
<span class="module-description">Additional information can be found at the wiki: <a href="https://github.com/bulik/ldsc/wiki">https://github.com/bulik/ldsc/wiki</a></span><br>
URL: <span class="module-url"><a href="https://github.com/bulik/ldsc">https://github.com/bulik/ldsc</a></span><br>
Versions: <span class="module-version"><em>1.0.1</em></span><br>
  </dd>
</dl>
<h3 id="module_wittelab_liftover" class="module-name">liftOver</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">liftOver: program can be used to convert coordinate ranges between genome assemblies</strong><br>
<span class="module-description">This is a command-line tool, and supports forward/reverse conversions, batch conversions, and conversions between species. The LiftOver program requires a UCSC-generated over.chain file as input. Pre-generated files are available for selected assemblies here: <a href="http://hgdownload.cse.ucsc.edu/downloads.html">http://hgdownload.cse.ucsc.edu/downloads.html</a>.</span><br>
Example: <span class="module-example"><code>liftOver</code>.</span><br>
URL: <span class="module-url"><a href="https://genome-store.ucsc.edu/products/">https://genome-store.ucsc.edu/products/</a></span><br>
Versions: <span class="module-version"><em>1.0.0</em></span><br>
  </dd>
</dl>
<h3 id="module_wittelab_metaxcan" class="module-name">metaxcan</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">metaxcan: a set of tools to perform twas</strong><br>
<span class="module-description">Here you can find the latest implementation of PrediXcan: PrediXcan.py. This uses individual-level genotype and phenotype, along a mechanism's prediction model (e.g. models predicting expression or splicing quantification), to compute associations between omic features and a complex trait.</span><br>
Example: <span class="module-example">source $ENV; python ${METAXCAN_DIR}/SPrediXcan.py --help; deactivate</span><br>
URL: <span class="module-url"><a href="https://github.com/hakyimlab/MetaXcan/tree/master/software">https://github.com/hakyimlab/MetaXcan/tree/master/software</a></span><br>
Versions: <span class="module-version"><em>0.6.5</em></span><br>
  </dd>
</dl>
<h3 id="module_wittelab_paintor" class="module-name">paintor</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">liftOver: program can be used to fine map putative causal variants using GWAS summary statistics.</strong><br>
<span class="module-description">PAINTOR is a statistical fine-mapping method that integrates functional genomic data with association strength from potentially multiple populations (or traits) to prioritize variants for follow-up analysis. The software runs on multiple fine-mapping loci and/or populations/traits simultaneously and takes as input the following data for each set of SNPs at a locus. Examples can be found at <a href="https://github.com/gkichaev/PAINTOR_V3.0">https://github.com/gkichaev/PAINTOR_V3.0</a></span><br>
URL: <span class="module-url"><a href="https://github.com/gkichaev/PAINTOR_V3.0">https://github.com/gkichaev/PAINTOR_V3.0</a></span><br>
Versions: <span class="module-version"><em>3.0</em></span><br>
  </dd>
</dl>
<h3 id="module_wittelab_python3" class="module-name">python3</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">python3: programming language</strong><br>
<span class="module-description">Python is powerful... and fast; plays well with others; runs everywhere; is friendly &amp; easy to learn; is Open.Example: python3 --help</span><br>
URL: <span class="module-url"><a href="https://www.python.org/about/">https://www.python.org/about/</a></span><br>
Versions: <span class="module-version"><em>3.9.1</em></span><br>
  </dd>
</dl>
<h3 id="module_wittelab_regenie" class="module-name">regenie</h3>
<dl>
  <dd class="module-details">
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
<li class="active"><a data-toggle="pill" href="#button_repository_built-in"><span style="font-weight: bold;">built-in</span>&nbsp;(4)</a></li>
<li><a data-toggle="pill" href="#button_repository_cbi"><span style="font-weight: bold;">CBI</span>&nbsp;(48)</a></li>
<li><a data-toggle="pill" href="#button_repository_wittelab"><span style="font-weight: bold;">WitteLab</span>&nbsp;(17)</a></li>
</ul>

_The above information was automatically generated on 2022-03-20 12:20:47 from querying `module avail` and `module spider`._


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

<script type="text/javascript">
$(document).ready(function() {
  var hash = window.location.hash;
  var pattern;
  
  /* Linked to a module repository? */
  pattern = "#repository_";
  if (hash.startsWith(pattern)) {
    var repo = hash.substring(pattern.length);
    $('a[href="#button_repository_' + repo + '"]').click();
    return;
  }

  /* Linked to a module in a module repository? */
  pattern = "#module_";
  if (hash.startsWith(pattern)) {
    var repo_module = hash.substring(pattern.length);
    var repo = repo_module.replace(new RegExp("_.*$"), "");
    $('a[href="#button_repository_' + repo + '"]').click().delay(300);
    $('a[href="' + hash + '"]').focus();
    return;
  }

  /* Backward compatibility */
  pattern = "#module-software-repository-";
  if (hash.startsWith(pattern)) {
    var repo = hash.substring(pattern.length);
    $('a[href="#button_repository_' + repo + '"]').click();
    return;
  }

  pattern = "#module-";
  if (hash.startsWith(pattern)) {
    var repo_module = hash.substring(pattern.length);
    var repo = repo_module.replace(new RegExp("[-].*$"), "");
    $('a[href="#button_repository_' + repo + '"]').click().delay(300);
    $('a[href="' + hash + '"]').focus();
    return;
  }
})
</script>

[core software]: {{ '/software/core-software.html' | relative_url }}
