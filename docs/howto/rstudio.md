# Work with RStudio

R is available on {{ site.cluster.name }} via a [contributed
environment module]({{ '/software/software-repositories.html' |
relative_url }}).  It can be run interactively in the terminal via `R`
on a development node, as explain on the how-to '[Work with R]' page.
To run R via the RStudio IDE, there are three options:

1. ~~The **RStudio Server** in the web browser via [OnDemand]~~
   (temporarily retired as of 2022-12-28)

2. The **RStudio Server** in the web browser over SSH (recommended)

3. The **RStudio Desktop** over X11 Forwarding

Running desktop applications over X11 forwarding works, but depending
on your network connection, you will experience more or less lag. For
instance, you might see a small delay between a key is pressed and it
is echoed at the R prompt. Similarly, plotted graphics might take some
time to render. This is also true for the RStudio Desktop. Because of
this, we recommend running a personal RStudio Server instance, either
via OnDemand or over SSH, because that is designed to run remotely.

Regardless which one you use, you will be running the same version of
R as you would when running from the terminal and all your installed
packages will be available in either.


## Alt 1. Personal RStudio Server via OnDemand

Please see the [OnDemand] page on how to access OnDemand.


## Alt 2. Personal RStudio Server via SSH

You can run a personal RStudio Server instance, which you, and only
you, can access via your local web browser.  Contrary to RStudio
Desktop, this approach does not require X11 forwarding. Instead, it
does require running _two_ separate SSH connections to the cluster:
(i) one to launch RStudio Server, and (ii) one to connect to it.

### Step 1. Launch your own RStudio Server instance

Assuming you are already logged on to a development node, launch your
personal RStudio Server instance as:

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI rstudio-server-controller
[alice@{{ site.devel.name }} ~]$ rsc start
alice, your personal RStudio Server 2023.03.0+386 running R 4.2.2 is available on:

  <http://127.0.0.1:20612>

Importantly, if you are running from a remote machine without direct access
to {{ site.devel.name }}, you need to set up SSH port forwarding first, which you can do by
running:

  ssh -L 20612:{{ site.devel.name }}:20612 alice@{{ site.login.hostname }}

in a second terminal from you local computer.

Any R session started times out after being idle for 120 minutes.
WARNING: You now have 10 minutes, until 2023-03-31 11:04:13-07:00, to
connect and log in to the RStudio Server before everything times out.
```

There is one things you should pay extra attention to here:

1. The instructions how to log in to the cluster with SSH port
   forwarding

You will need it below.



### Step 2. Connect to your personal RStudio Server instance

On your local computer, log into the cluster in a second terminal
following the instruction above.  Make sure to use your own username
and make sure to use the port number (e.g. `20612`) that was assigned
to you.

```sh
{local}$ ssh -L 20612:{{ site.devel.hostname}}:20612 alice@{{ site.login.hostname }}
alice1@{{site.login.hostname }}:s password: XXXXXXXXXXXXXXXXXXX
[alice@{{site.login.name }} ~]$ 
```

### Step 3. Open RStudio Server in your local web browser

If you successfully completed the above two steps, and you made sure
to use the correct port, then you should be able to open your personal
RStudio Server in your local web browser by going to:

* <http://127.0.0.1:20612/> (note, your port is different)

You will be presented with a 'Sign in to RStudio' web page. Use your
{{ site.cluster.nickname }} credentials to log in.

After clicking 'Sign In', you should be redirected to the RStudio
interface.

To terminate the RStudio Server, start by exiting R by typing `quit()`
at the R prompt. Then press <kbd>Ctrl-C</kbd> in the terminal where
you called `rsc start`.  Alternatively, run `rsc stop` in another
terminal, e.g. the second one used in Step 2.


#### Stuck at "R is taking longer to start than usual"?

Some users report that they stuck when they try to log in to RStudio.
After they enter their username and password, and click 'Sign In',
they get to a page "R is taking longer to start than usual" with a
spinner that never ends.  The user is presented with three options
'Reload', 'Safe Mode', and 'Terminate R'.  Ideally, 'Safe Mode' or
'Terminate R' would solve the problem and let the user access the
RStudio GUI.  Unfortunately, for some users, none of these options
help.  Consecutive attempts to use `rsc stop` and `rsc start` fail for
same reasons.

As of 2023-12-04, it is not clear why and when this happens.  The
one workaround we have found is to wipe the user's RStudio set up.
For this, we recommend the to use:

```sh
$ rsc reset --which=sessions
```

This will create a local copy of your problematic RStudio set up in
file `rstudio-config_<timestamp>.tar`, and, only then, remove the
actually settings.  The next time you call `rsc start`, you should
start out with a fresh RStudio set up, and the login issue should be
gone.




## Alt 3. RStudio Desktop over X11 Forwarding

<div class="alert alert-warning" role="alert" markdown="1"> It is
_not_ possible to run RStudio Desktop via X2Go, because X2Go does not
support the modern graphical protocols that RStudio Desktop requires.
</div>

To run the RStudio Desktop client, you must be logged via [SSH with
X11 forwarding enabled]. Then load the `rstudio` (Desktop) module from
the CBI stack and launch `rstudio`:

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI rstudio
[alice@{{ site.devel.name }} ~]$ rstudio
TTY detected. Printing informational message about logging configuration.
Logging configuration loaded from '/etc/rstudio/logging.conf'. Logging to
'{{ site.user.home }}/.local/share/rstudio/log/rdesktop.log'.
```

You should see the RStudio Desktop interface appear after a few
seconds.  If you get a blank window, which some macOS users have
reported, retry with:

```sh
[alice@{{ site.devel.name }} ~]$ QMLSCENE_DEVICE=softwarecontext rstudio
```

To exit the RStudio Desktop, type `quit()` at the R prompt, or press
<kbd>Ctrl-C</kbd> in the above terminal.


[CBI software stack]: {{ '/software/software-repositories.html' | relative_url }}
[OnDemand]: {{ '/howto/ondemand.html' | relative_url }}
[Work with R]: {{ '/howto/r.html' | relative_url }}
[SSH with X11 forwarding enabled]: {{ '/howto/gui-x11fwd.html#x11-forwarding-over-ssh' | relative_url }}
