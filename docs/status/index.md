<!-- markdownlint-disable-file MD024 -->

# UCSF {{ site.cluster.name }} Status

<!-- To display the 'broadcast' icon in the navbar, edit assets/css/broadcast.css -->

{% if site.cluster.status == "inaccessible" %}
<div class="alert alert-danger" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;" markdown="1">
**{{ site.cluster.name }} is experiencing significant issues**
</div>
{% elsif site.cluster.status == "problematic" %}
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;" markdown="1">
**{{ site.cluster.name }} is experiencing significant issues**
</div>
{% elsif site.cluster.status == "recovering" %}
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;" markdown="1">
**{{ site.cluster.name }} is operational with parts of the compute resources being recovered**
</div>
{% elsif site.cluster.status == "kernel-upgrade" %}
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;" markdown="1">
**{{ site.cluster.name }} has fewer slots available than usual due to kernel upgrades**<br>
</div>
{% elsif site.cluster.status == "full-outage" %}
<div class="alert alert-danger" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;" markdown="1">
**{{ site.cluster.name }} environment non-operational**<br>
_Complete outage due to scheduled maintenance for August 10-13, 2020_
</div>
{% elsif site.cluster.status == "part-outage" %}
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;" markdown="1">
**{{ site.cluster.name }} is operational but experiencing partial problems**<br>
_Several GPU compute nodes are down._
</div>
</div>
{% elsif site.cluster.status == "notice" %}
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;" markdown="1">
**{{ site.cluster.name }} environment operational**<br>
_The cluster will be shut down completely during August 10-12, 2020 due to major upgrades._<br>
</div>
{% else %}
<div class="alert alert-info" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;" markdown="1">
**{{ site.cluster.name }} environment operational**
</div>
{% endif %}



## Current Incidents

{% include_relative incidents-current.md %}


## Upcoming incidents

{% include_relative incidents-upcoming.md %}


## Past Incidents

<ul class="nav nav-pills">
  <li class="active"><a data-toggle="pill" href="#2021"><span style="font-weight: bold;">2021</span></a></li>
</ul>

<div class="tab-content" style="margin-top: 1ex;">
<div id="2021" class="tab-pane fadein active">
<section markdown="1">
{% include_relative incidents-2021.md %}
</section>
</div>
</div>

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
