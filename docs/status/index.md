<!-- markdownlint-disable-file MD024 -->

# UCSF {{ site.cluster.name }} Status

<!-- To display the 'broadcast' icon in the navbar, edit assets/css/broadcast.css -->

{% assign status = "ok" %}

{% if status == "inaccessible" %}
<div class="alert alert-danger" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} is experiencing significant issues</strong>
</div>
{% elsif status == "problematic" %}
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} is experiencing significant issues</strong>
</div>
{% elsif status == "recovering" %}
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} is operational with parts of the compute resources being recovered</strong>
</div>
{% elsif status == "kernel-upgrade" %}
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} has fewer slots available than usual due to kernel upgrades</strong><br>
</div>
{% elsif status == "full-outage" %}
<div class="alert alert-danger" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} environment non-operational</strong><br>
<em>Complete outage due to scheduled maintenance for August 10-13, 2020</em>
</div>
{% elsif status == "part-outage" %}
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} is operational but experiencing partial problems</strong><br>
<em>Several GPU compute nodes are down.</em>
</div>
</div>
{% elsif status == "notice" %}
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} environment operational</strong><br>
<em>The cluster will be shut down completely during August 10-12, 2020 due to major upgrades.</em><br>
</div>
{% else %}
<div class="alert alert-info" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} environment operational</strong>
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
