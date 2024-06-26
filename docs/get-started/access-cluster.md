---
context:
  - login
---


<div class="alert alert-danger" role="alert" style="margin-top: 3ex" markdown="1">
**Account are personal and login credentials must not be shared with others**. If detected, access to the account will be automatically disabled.  It is still possible and easy for multiple users to share and collaborate on the same folders and scripts.  Don't hesitate to ask if you don't know how to do this - we're here to help.
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
Access to {{ site.cluster.name }} is only available from the UCSF network. If you are outside the UCSF network you must first connect via the UCSF VPN.
</div>

# Login

To access the {{ site.cluster.name }} cluster you need an account - any UCSF Cancer Center member can [get an account upon request]({{ '/about/join.html' | relative_url }}).  Anyone with a {{ site.cluster.name }} account, can access the cluster via _Secure Shell (SSH)_.


## Prerequisites

The instructions below requires:

* An SSH client available on your local computer

* A {{ site.cluster.name }} account with valid authentication credentials

Users on Linux, macOS, and MS Windows have an SSH client built-in, which is available from the terminal as `ssh`. We will use that one in all our examples. You can also use other SSH clients if you prefer, include [PuTTY] on MS Windows. If you choose to use another SSH client, consult that program's documentation for further instructions. Another alternative, which some might find easier, is to connect to the cluster using the [X2Go] software.


## Instructions

To log into the cluster, assuming your user name on {{ site.cluster.name }} is `alice` (case sensitive), do the following:

1. Make sure you are on the UCSF network or the UCSF VPN

2. open a terminal ('Terminal' on macOS and most Linux distributions, and 'Windows Console' [old] or 'Windows Terminal' [modern] on MS Windows),

3. At the terminal prompt, type `ssh alice@{{ site.login.hostname }}` and press <kbd>ENTER</kbd>

4. When prompted, enter your {{ site.cluster.name }} password and press <kbd>ENTER</kbd>

The {{ site.cluster.name }} cluster has two login servers, (i) {{ site.login1.hostname }} and (ii) {{ site.login2.hostname }}.  Feel free to use either.


### Example

When logging in from your local computer while on the UCSF VPN, you should see something like:

```sh
{local}$ ssh alice@{{ site.login.hostname }}
alice1@{{ site.login.name }}:s password: XXXXXXXXXXXXXXXXXXX
[alice@{{ site.login.name }} ~]$ 
```

If you get `Permission denied, please try again.` when you enter your password, make sure you use the correct {{ site.cluster.name }} username (case sensitive) and the correct password.


<div class="alert alert-info" role="alert" markdown="1">
It is possible to set up password-less authentication via a public-private SSH key pair.  For details, see the how-to page [Log in without Password].
</div>


# What is available on the login node?

The login node is dedicated solely to very basic tasks such as copying and moving files on the shared file system, submitting jobs, and checking the status on existing jobs.  Note that most software tools are _not_ available on the login node, which means you can neither use it for prototyping scripts nor build software.  Instead, for such tasks, use a [development node], which is configured identically to the compute nodes.


# Logout

Like for all Unix-based system, to log out from {{ site.cluster.name }}, type `exit` or `logout` (standard Unix commands) and press <kbd>ENTER</kbd>.  For example,

```sh
[alice@{{ site.login.name }} ~]$ exit
Connection to {{ site.login.hostname }} closed.
{local}$ 
```

An alternative is to press <kbd>Ctrl-D</kbd> (sends "End-Of-File" [EOF]) at the command-line prompt.

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
Any shell session that has been idle for more than 24 hours will timeout and exit automatically.
</div>


[PuTTY]: https://www.putty.org/
[development node]: {{ '/get-started/development-prototyping.html' | relative_url }}
[X2Go]: {{ 'howto/gui-x11fwd.html' | relative_url }}
[Log in without Password]: {{ 'howto/log-in-without-pwd.html' | relative_url }}
