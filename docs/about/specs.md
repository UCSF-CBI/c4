# Cluster Specifications

## Overview

<dl id="hosttable-summary" class="dl-horizontal">
  <dt>Compute nodes</dt><dd id="hosttable-summary-nodes">{{ site.data.specs.nodes }} (of which {{ site.data.specs.communal_nodes }} are communal)</dd>
  <dt>Logical cores</dt><dd id="hosttable-summary-cores">{{ site.data.specs.logical_cores }} (of which {{ site.data.specs.communal_logical_cores }} are communal)</dd>
<!--  
  <dt>GPUs</dt><dd>{{ site.data.specs.gpus }} GPUs on {{ site.data.specs.gpu_nodes }} GPU nodes ({{ site.data.specs.communal_gpus }}/{{ site.data.specs.communal_gpu_nodes }} GPUs/nodes are communal and {{ site.data.specs.gpus | minus: site.data.specs.communal_gpus }}/{{ site.data.specs.gpu_nodes | minus: site.data.specs.communal_gpu_nodes }} GPUs/nodes are prioritized for GPU contributors)</dd>
-->
  <dt>RAM</dt><dd id="hosttable-summary-ram">{{ site.data.specs.ram_min }}-{{ site.data.specs.ram_max }} GiB/node</dd>
  <dt>Local scratch</dt><dd id="hosttable-summary-local-scratch">{{ site.data.specs.local_scratch_size_min }}-{{ site.data.specs.local_scratch_size_max }} TiB/node</dd>
  <dt>Global scratch</dt><dd id="hosttable-summary-global-scratch">{{ site.data.specs.global_scratch_size_total }} TiB</dd>
  <dt>User home storage</dt><dd>1 TiB/user ({{ site.data.specs.home_size_total }} TiB in total)</dd>
<!--  
  <dt>Group storage</dt><dd>{{ site.data.specs.group_size_total | divided_by: 1000.0 }} PB</dd>
-->  
<!--  
  <dt>Number of accounts</dt><dd>{{ site.data.users.nbr_of_accounts }}</dd>
  <dt>Number of projects</dt><dd>{{ site.data.users.nbr_of_projects }}</dd>
-->
</dl>


## Summary of Compute Environment

| Feature     | Login Nodes | Transfer Nodes          | Development Nodes                                                                                                                          | Compute Nodes |
| ---- | ---------- | ----------------------- |--------------------------------------------------------------------------------------------------------------------------------------------| ---- |
| SSH access from outside of cluster | Within UCSF only, incl. UCSF VPN | Within UCSF only, incl. UCSF VPN | no                                                                                                                                         | no |
| SSH access from inside of cluster | ✓ | ✓ | ✓                                                                                                                                          | no |
| Outbound access | No restrictions | HTTP/HTTPS, FTP/FTPS, SSH, SFTP, GIT+SSH, Globus | No restrictions                                                                                                                            | no |
| Network speed | 1 Gbps | 10 Gbps | 1 Gbps                                                                                                                                     | 1,10 Gbps |
| Core software | Minimal | Minimal | Rocky packages, compilers and source-code packages                                                                                         | Same as development nodes |
| modules (software stacks) | Limited subset | Limited subset | ✓                                                                                                                                          | ✓ |
| Global file system | ✓ | ✓ | ✓                                                                                                                                          | ✓ |
| Job submission | ✓ | no | ✓                                                                                                                                          | ✓ |
| Purpose | Submit and query jobs. SSH to development nodes. File management. | Fast in- & outbound file transfers. File management. | Compile and install software. Prototype and test job scripts. Submit and query jobs. Version control (clone, pull, push). File management. | Running short and long-running job scripts. |                                                     

<!--(\*) GIT+SSH access on development nodes is restricted to git.bioconductor.org, bitbucket.org, gitea.com, github.com / gist.github.com, gitlab.com, and git.ucsf.edu. -->


<!--
cat /etc/os-release
sbatch --version
-->
All nodes on the cluster runs [Rocky] 8 which is updated on a regular basis.
The job scheduler is Slurm 21.08 ([Simple Linux Utility for Resource Management]) which provides [partitions]({{ '/scheduler/partitions.html' | relative_url }}) for both communal and lab-priority tasks.


## Details



### Login Nodes

The [cluster can be accessed]({{ '/get-started/access-cluster.html' | relative_url }}) via SSH to one of two login nodes:

1. `{{ site.login1.hostname }}`
2. `{{ site.login2.hostname }}`


### Data Transfer Nodes

For transferring large data files, it is recommended to use one of the dedicate data transfer nodes:

1. `{{ site.transfer1.hostname }}`
2. `{{ site.transfer2.hostname }}`

which have 10 Gbps connection - providing a file transfer speed of up to (theoretical) 1.25 GB/s = 4.5 TB/h.  Please note, as is true for all ethernet, 80% of line speed is doing pretty good. As for the login nodes, the transfer nodes can be accessed via SSH.

_Comment_: You can also transfer data via the login nodes, but since those only have 1 Gbps connections, you will see much lower transfer rates.


### Development Nodes

The cluster has development nodes for the purpose of validating scripts, prototyping pipelines, compiling software, and more.  Development nodes [can be accessed from the login nodes]({{ '/get-started/development-prototyping.html' | relative_url }}).

Node                        | Logical Cores |      RAM | Local `/scratch` | CPU x86-64 level |           CPU |                GPU |
----------------------------|--------------:|---------:|-----------------:|:-----------------|:---------------------------------|:-------------------|
{{ site.dev2.hostname }}    |            48 |  512 GiB |         1.1  TiB | x86-64-v1        | AMD Opteron Processor 6176       |                    |
{{ site.dev3.hostname }}    |            38 |  128 GiB |         5.4  TiB | x86-64-v3        | Intel Xeon E5-2640 v4 2.40GHz    |                    |
{{ site.gpudev1.hostname }} |           104 | 1024 GiB |          3.4 TiB | x86-64-v4        | Intel Xeon Gold 5320 2.20GHz     | Nvidia A40 GPU     |

_Comment:_
Please use the GPU development node only if you need to build or prototype GPU software.
The CPU x86-64 level is the [x86-64 microarchitecture levels] supported by the nodes CPU.


### Compute Nodes

The majority of the compute nodes have Intel processors, while a few have AMD processes.  Each compute node has a local `/scratch` drive (see below for size), which is either a hard disk drive (HDD), a solid state drive (SSD), or a Non-Volatile Memory Express (NVMe) drive. Each node has a tiny `/tmp` drive ({{ site.data.specs.local_tmp_size_min }}-{{ site.data.specs.local_tmp_size_max }} GiB).

Node      | Logical Cores |       RAM | Local `/scratch/` | CPU x86-64 level |      CPU  | Notes                                              | Priority
----------|--------------:|----------:|------------------:|:-----------------|----------:-----------------------------------|:-----------
c4-n1     |            64 |   512 GiB |           1.8 TiB | x86-64-v4        |   2.1 GHz | SSD /scratch,  10 Gbps ethernet                      | communal
c4-n2     |            64 |   512 GiB |           1.8 TiB | x86-64-v4        |   2.1 GHz | SSD /scratch,  10 Gbps ethernet                      | communal
c4-n3     |            64 |   512 GiB |           1.8 TiB | x86-64-v4        |   2.1 GHz | SSD /scratch,  10 Gbps ethernet                      | communal
c4-n4     |            64 |   512 GiB |           1.8 TiB | x86-64-v4        |   2.1 GHz | SSD /scratch,  10 Gbps ethernet                      | communal
c4-n5     |            64 |   512 GiB |           2.6 TiB | x86-64-v4        |   2.1 GHz | SSD /scratch,  10 Gbps ethernet                      | communal
c4-n6     |           112 |   768 GiB |          11.0 TiB | x86-64-v4        |   2.2 GHz | NVMe /scratch, 10 Gbps ethernet                      | Witte Lab
c4-n7     |           112 |   768 GiB |          11.0 TiB | x86-64-v4        |   2.2 GHz | NVMe /scratch, 10 Gbps ethernet                      | Witte Lab
c4-n8     |           112 |   768 GiB |          11.0 TiB | x86-64-v4        |   2.2 GHz | NVMe /scratch, 10 Gbps ethernet                      | Witte Lab
c4-n9     |           112 |   768 GiB |          11.0 TiB | x86-64-v4        |   2.2 GHz | NVMe /scratch, 10 Gbps ethernet                      | Witte Lab
c4-n10    |            48 |   512 GiB |           2.3 TiB | x86-64-v2        |   2.1 GHz | SATA /scratch, 10 Gbps ethernet                      | communal
c4-n11    |           128 |  1024 GiB |           5.2 TiB | x86-64-v4        |   2.8 GHz | SSD  /scratch, 10 Gbps ethernet                      | Costello Lab
c4-n12    |            64 |   512 GiB |           3.6 TiB | x86-64-v2        |   2.6 GHz | SATA /scratch, 10 Gbps ethernet                      | CBI Core
c4-n13    |            64 |   512 GiB |           3.6 TiB | x86-64-v2        |   2.6 GHz | SATA /scratch, 10 Gbps ethernet                      | CBI Core 
c4-n14    |            24 |   128 GiB |           0.9 TiB | x86-64-v2        |   3.5 GHz | SATA /scratch, 10 Gbps ethernet                      | Witte Lab
c4-n15    |            64 |   256 GiB |           1.8 TiB | x86-64-v2        |   2.6 GHz | SATA /scratch, 10 Gbps ethernet                      | Witte Lab
c4-n16    |            64 |   512 GiB |           3.3 TiB | x86-64-v4        |   3.7 GHz | SATA /scratch, 10 Gbps ethernet                      | Blelloch Lab
c4-n17    |            64 |   512 GiB |           2.6 TiB | x86-64-v4        |   3.7 GHz | SAS  /scratch, 10 Gbps ethernet                      | Francis Lab
c4-n18    |            64 |   512 GiB |           3.2 TiB | x86-64-v3        |   2.1 GHz | SAS  /scratch, 10 Gbps ethernet                      | Krummel Lab
c4-n19    |            64 |   768 GiB |           4.9 TiB | x86-64-v4        |   3.7 GHz | SAS  /scratch, 10 Gbps ethernet                      | Ziv Lab
c4-n20    |            48 |   384 GiB |           7.0 TiB | x86-64-v3        |   2.4 GHz | SATA /scratch, 10 Gbps ethernet                      | Krummel Lab
c4-n21    |            64 |   512 GiB |          11.0 TiB | x86-64-v3        |   2.6 GHz | SAS  /scratch, 10 Gbps ethernet                      | Witte Lab
c4-n22    |           128 |   512 GiB |           2.6 TiB | x86-64-v4        |   3.7 GHz | SSD  /scratch, 10 Gbps ethernet                      | Kim Lab 
c4-n23    |            64 |   512 GiB |           2.7 TiB | x86-64-v3        |   2.3 GHz | SSD  /scratch, 10 Gbps ethernet                      | Shannon Lab 
c4-n24    |            64 |   512 GiB |           2.6 TiB | x86-64-v4        |   3.7 GHz | SSD  /scratch, 10 Gbps ethernet                      | Shannon Lab 
c4-n25    |            64 |   512 GiB |           2.6 TiB | x86-64-v4        |   3.7 GHz | SSD  /scratch, 10 Gbps ethernet                      | Bastian Lab 
c4-n27    |            64 |   512 GiB |           3.2 TiB | x86-64-v4        |   2.1 GHz | SAS  /scratch, 10 Gbps ethernet                      | Kriegstein Lab 
c4-n28    |            48 |   384 GiB |           5.4 TiB | x86-64-v3        |   2.8 GHz | SATA /scratch, 10 Gbps ethernet                      | Molinaro Lab
c4-n29    |            48 |   384 GiB |           5.4 TiB | x86-64-v3        |   2.8 GHz | SATA /scratch, 10 Gbps ethernet                      | Molinaro Lab
c4-n30    |            32 |   192 GiB |          0.05 TiB | x86-64-v3        |   1.2 GHz | SAS  /scratch, 2x1 Gbps ethernet                      | Oldham Lab
c4-n31    |            64 |   512 GiB |           3.2 TiB | x86-64-v4        |   2.1 GHz | SAS  /scratch, 10 Gbps ethernet                      | Diaz Lab
c4-n32    |            64 |   512 GiB |           5.4 TiB | x86-64-v3        |   2.6 GHz | SATA /scratch, 10 Gbps ethernet                      | Costello Lab, Diaz Lab, Fung Lab
c4-n33    |            64 |   512 GiB |           5.4 TiB | x86-64-v3        |   2.6 GHz | SATA /scratch, 10 Gbps ethernet                      | Costello Lab, Diaz Lab, Fung Lab
c4-n34    |            64 |   512 GiB |           5.4 TiB | x86-64-v3        |   2.6 GHz | SATA /scratch, 10 Gbps ethernet                      | Costello Lab, Diaz Lab, Fung Lab
c4-n35    |            64 |   512 GiB |           2.6 TiB | x86-64-v4        |   2.1 GHz | SSD  /scratch, 10 Gbps ethernet                      | Krummel Lab
c4-n36    |            48 |   384 GiB |           5.4 TiB | x86-64-v3        |   1.4 GHz | SATA /scratch, 10 Gbps ethernet                      | Costello Lab
c4-n37    |           104 |  1024 GiB |           3.4 TiB | x86-64-v4        |   3.4 GHz | SSD /scratch,  10 Gbps ethernet                      | communal
c4-n38    |           104 |  1024 GiB |           3.4 TiB | x86-64-v4        |   3.4 GHz | SSD /scratch,  10 Gbps ethernet Nvidia A100 GPU      | communal
c4-n39    |           104 |  1024 GiB |           3.4 TiB | x86-64-v4        |   3.4 GHz | SSD /scratch,  10 Gbps ethernet Nvidia A100 GPU      | communal
c4-n40    |           160 |  1024 GiB |           3.5 TiB | x86-64-v4        |   2.3 GHz | SATA /scratch, 10 Gbps ethernet                      | Krummel Lab
c4-n41    |           128 |  1024 GiB |           5.2 TiB | x86-64-v4        |   2.0 GHz | SATA /scratch, 10 Gbps ethernet                      | Krummel Lab
c4-n42    |           160 |   768 GiB |           5.4 TiB | x86-64-v4        |   2.3 GHz | SATA /scratch, 10 Gbps ethernet                      | Vantveer Lab
c4-n43    |           256 |  1024 GiB |           30  TiB | AMD EPYC 9554    |   3.1 GHz | SSD /scratch,  10 Gbps ethernet                      | Sweet-Cordero Lab

<!--
For additional details on the compute nodes, see the <a href="#details">Details</a> section below.
-->

The compute nodes can only be utilized by [submitting jobs via the scheduler]({{ '/scheduler/submit-jobs.html' | relative_url }}).
<!-- it is _not_ possible to explicitly log in to compute nodes. -->


## File System

### Scratch Storage

The {{ site.cluster.name }} cluster provides two types of scratch storage:

 * Local `/scratch/` - <span id="hosttable-summary-local-scratch2">{{ site.data.specs.local_scratch_size_min }}-{{ site.data.specs.local_scratch_size_max }} TiB/node</span> storage unique to each compute node (can only be accessed from the specific compute node).
 * Global `/c4/scratch/` - {{ site.data.specs.global_scratch_size_total }} TiB storage accessible from everywhere.

There are no per-user quotas in these scratch spaces.  **Files not added or modified during the last two weeks will be automatically deleted** on a nightly basis.  Note, files with old timestamps that were "added" to the scratch place during this period will _not_ be deleted, which covers the use case where files with old timestamps are extracted from tar.gz file.  (Details: `tmpwatch --ctime --dirmtime --all --force` is used for the cleanup.)


### User and Lab Storage

 * `/c4/home`: {{ site.data.specs.home_size_total }} TiB storage space

Each user may use up to 1 TiB disk space in the home directory.  It is _not_ possible to expand user's home directory.  Many labs have purchased their own storage servers which were then mounted on the cluster. If you'd like more information please contact Adam Olshen or Harry Putnam.

<!--<div class="alert alert-info" role="alert" style="margin-top: 3ex; margin-bottom: 3ex;" markdown="1">
While waiting to receive purchased storage, users may use the global scratch space, which is "unlimited" in size with the important limitation that files older than two weeks will be deleted automatically.
</div>-->

<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex;" markdown="1">
<span>⚠️</span> Importantly, note that, aside from /c4/home, **the {{ site.cluster.name }} storage is not backed up**.  Users and labs are responsible to back up their own data outside of {{ site.cluster.name }}.
</div>


## Network

The  compute nodes are connected to the local network with 1 Gbps and 10 Gbps network cards.


<!--

## Details

### All Compute Nodes

<script src="https://d3js.org/d3.v3.min.js"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"/>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"/>

<table id="hosttable" style="visibility: hidden">
</table>


<script type="text/javascript" charset="utf-8">
d3.text("{{ '/assets/data/host_table.tsv' | relative_url }}", "text/csv", function(host_table) {
  // extract date from header comments
  var timestamp = host_table.match(/^[#] Created on: [^\r\n]*[\r\n]+/mg, '')[0];
  timestamp = timestamp.replace(/^[#] Created on: /g, '');
  timestamp = timestamp.replace(/ [^ ]+/g, ''); // keep only the date
  timestamp = timestamp.trim();
  d3.select("#hosttable-timestamp").text(timestamp);

  // drop header comments
  host_table = host_table.replace(/^[#][^\r\n]*[\r\n]+/mg, '');
  host_table = d3.tsv.parse(host_table);

  d3.text("https://raw.githubusercontent.com/UCSF-HPC/wynton-slash2/master/status/qstat_nodes_in_state_au.tsv", "text/csv", function(host_status) {
    
    // drop header comments
    host_status = host_status.replace(/^[#][^\r\n]*[\r\n]+/mg, '');
    host_status = d3.tsv.parse(host_status);

    var table = d3.select("#hosttable");
    var thead, tbody, tfoot, tr, td, td_status;
    var value, value2, has_issue;
    var cores = 0, coreMin = 1e9, coreMax = -1e9;
    var ram = 0, ramMin = 1e9, ramMax = -1e9;
    var scratch = 0, scratchMin = 1e9, scratchMax = -1e9;
    var nodes_with_issue = 0, cores_with_issue = 0, ram_with_issue = 0;
  
    /* For each row */
    var nodes = 0;
    host_table.forEach(function(row) {
      /* Ignore column on /tmp size, iff it exists */
      delete row["Local `/tmp`"];

      if (nodes == 0) {
        tr = table.append("thead").append("tr");
        tr.append("th").text("Status");
        for (key in row) {
          value = key.replace(/\`/g, "");
          tr.append("th").text(value);
        }
        tbody = table.append("tbody");
      }
      tr = tbody.append("tr");

      td_status = tr.append("td");
      has_issue = (host_status.filter(function(d) { return d.queuename == row["Node"] }).length > 0);
      if (has_issue) {
        td_status.text("⚠");  // "⚠" or "✖"
        nodes_with_issue += 1;
      }

      for (key in row) td = tr.append("td").text(row[key]);
      
      /* Cores */
      value = parseInt(row["Physical Cores"]);
      cores += value;
      if (value <= coreMin) coreMin = value;
      if (value >= coreMax) coreMax = value;
      if (has_issue) cores_with_issue += value;

      /* RAM */
      value = parseFloat(row["RAM"].match(/[\d.]+/));
      ram += value;
      if (value <= ramMin) ramMin = value;
      if (value >= ramMax) ramMax = value;
      if (has_issue) ram_with_issue += value;

      /* Scratch */
      value = parseFloat(row["Local `/scratch`"].match(/[\d.]+/));
      scratch += value;
      if (value <= scratchMin) scratchMin = value;
      if (value >= scratchMax) scratchMax = value;
      
      nodes += 1;
    });
  
    var addFooter = false;
    if (addFooter) tr = table.append("tfoot").append("tr");
    value = nodes + " nodes";
    if (addFooter) tr.append("td").text(value);
    d3.select("#hosttable-summary-nodes").text(value);
  
    value = cores + " cores (" + coreMin + "-" + coreMax + " cores/node, avg. " + (cores/nodes).toFixed(1) + " cores/node)";
    if (addFooter) tr.append("td").text(value);
    d3.select("#hosttable-summary-cores").text(value);
  
    value = ramMin + "-" + ramMax + " GiB/node (" + (ram/1024).toFixed(1) + " TiB in total, avg. " + (ram/nodes).toFixed(1) + " GiB/node or " + (ram/cores).toFixed(1) + " GiB/core)";
    if (addFooter) tr.append("td").text(value);
    d3.select("#hosttable-summary-ram").text(value);
  
    value = scratchMin + "-" + scratchMax + " TiB/node";
    if (addFooter) tr.append("td").text(value);
    d3.select("#hosttable-summary-local-scratch2").text(value);
    value += " (avg. " + (scratch/nodes).toFixed(2) + " TiB/node or " + (scratch/cores).toFixed(3) + " TiB/core)";
    d3.select("#hosttable-summary-local-scratch").text(value);

/*
    value = "{{ site.data.specs.global_scratch_size }}";
    var global_scratch = parseFloat(value.split(" ")[0]);
    value += " (corresponding to " + (global_scratch/nodes).toFixed(2) + " TiB/node or " + (global_scratch/cores).toFixed(3) + " TiB/core)";
    d3.select("#hosttable-summary-global-scratch").text(value);
*/

    $(document).ready(function() {
      $('#hosttable').DataTable({
        "pageLength": 25
/*        "order": [[ 1, "asc" ]]  */
      });
    });
  });
});
</script>

Source: [host_table.tsv] produced on <span id="hosttable-timestamp"></span> using [wyntonquery] and [qstat_nodes_in_state_au.tsv](https://github.com/UCSF-HPC/wynton-slash2/blob/master/status/qstat_nodes_in_state_au.tsv).

-->

<style>
table {
  margin-top: 2ex;
  margin-bottom: 2ex;
}
tfoot {
  border-top: 2px solid #000;
  font-weight: bold;
}
ttr:last-child { border-top: 2px solid #000; }
</style>

[Rocky]: https://rockylinux.org/
[Simple Linux Utility for Resource Management]: https://slurm.schedmd.com/
[x86-64 microarchitecture levels]: https://www.wikipedia.org/wiki/X86-64#Microarchitecture_levels
[host_table.tsv]: {{ '/assets/data/host_table.tsv' | relative_url }}
