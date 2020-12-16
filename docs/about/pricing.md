<!--> 2020-11-04 HGP Suggest we lose this page. -->

<div class="alert alert-danger" role="alert">
2018-10-06: This is a mockup page with mockup information.
</div>

# {{ site.cluster.name }} Compute and Storage Pricing

The {{ site.cluster.name }} cluster combines both communal and lab-owned compute & storage resources. Any user is free to use the /c4/home and /c4/scratch storage at no cost. /c4/home is backed up to tape and restores are available upon request. We have a common partition made up of communal compute nodes that any user is free to run jobs on. Many of our Labs have also purchased their own storage and compute nodes. The storage nodes are mounted on the cluster but their use is restricted to the Lab who purchased them. Similarly, some of our Labs have purchased compute nodes. These nodes make up private partitions. The use of those partitions are restricted to the purchasing labs.

<!--| Description                                          | Free | Compute contributor | Storage contributor
|------------------------------------------------------|:----:|:-------------------:|:-------------------:
| **Compute:**                                         |     |     |             
| • Baseline compute ([short.q & long.q])              |  ✔  |  ✔  |  ✔
| • Priority compute ([member.q])                      |     |  ✔  |      
| • GPU compute ([gpu.q]<sup>1</sup>)                  |     |  ✔  |
| **Storage:**                                         |     |     |             
| • Home storage ([200 GiB]<sup>2</sup>)               |  ✔  |  ✔  |  ✔
| • Global scratch storage ([unlimited]<sup>3</sup>)   |  ✔  |  ✔  |  ✔
| • Extra storage<sup>4</sup>                         |     |     |  ✔ -->


<small>
_Footnote_:
<!--<sup>1</sup> GPUs are currently only available to groups who have contributed with their own GPU-equipped compute nodes but there is [a plan] to provide baseline GPUs for all users. 
<sup>2</sup> There is [a plan] to increase the included amount of storage for all users. -->
<sup>1</sup> Non-modified files older than two weeks are automatically removed from the global scratch storage.
<!--<sup>2</sup> We are currently [in the process]({{ '/about/roadmap.html' | relative_url }}) of defining the _storage_ pricing model. -->
</small>


## Compute pricing

Users using the common partition will be limited by the number of concurrent cores.  see [Available queues]({{ '/scheduler/queues.html' | relative_url }}).


### Buy new compute

Please see the {{ site.cluster.name }} System Administrators and Managers by email and for other support options, please refer to [the Support page]({{'/support/index.html' | relative_url }}).

### Bring your own compute

As of October 2018, the **minimal requirement for hardware contributions is 8 cores, 16 GiB RAM, and 1 Gbps networking**.  Please note that contributed hardware will be placed on {{ site.cluster.nickname }}'s private network, wiped, and reinstalled with the standard {{ site.cluster.name }} image.


<!--## Storage pricing

We are currently [in the process]({{ '/about/roadmap.html' | relative_url }}) of defining the _storage_ pricing model, which will be available as soon as we have identified all the costs involved.



<style>
table {
  width: auto;
  margin-top: 1.5ex;
  margin-bottom: 1.5ex;
}
</style>

[200 GiB]: {{ '/about/specs.html' | relative_url }}
[unlimited]: {{ '/about/specs.html' | relative_url }}
[a plan]: {{ '/about/roadmap.html' | relative_url }}
[short.q & long.q]: {{ '/scheduler/queues.html' | relative_url }}
[member.q]: {{ '/scheduler/queues.html' | relative_url }}
[gpu.q]: {{ '/scheduler/queues.html' | relative_url }} -->
