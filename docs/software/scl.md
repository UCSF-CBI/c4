# CentOS Software Collections (SCL)

> [Software Collections (SCL)](https://en.wikipedia.org/wiki/CentOS#Add-ons_releases) is a CentOS repository that provides a set of dynamic programming languages, database servers, and various related packages. Provided software versions are [...] more recent than their equivalent versions included in the base CentOS distribution [...]  Packages available from the SCL [...] can be optionally enabled per application by using supplied `scl` utility.


## Available SCLs and their Packages

To list all Software Collections installed on the _development nodes_, use:

```sh
[alice@{{ site.devel.name }} ~]$ scl --list
devtoolset-7
devtoolset-8
devtoolset-9
llvm-toolset-7
rh-perl526
rh-python36
rh-ruby25
rh-ruby26
```

_Importantly_, only a subset of the above SCLs are available also on the _compute nodes_. Specifically, these are:
```sh
[alice@{{ site.devel.name }} ~]$ scl --list
rh-perl526
rh-python36
rh-ruby25
rh-ruby26
```


To list all the packages that are part of one or more of these SCLs, use:

```sh
[alice@{{ site.devel.name }} ~]$ scl --list rh-ruby26
$ scl --list rh-ruby26
rh-ruby26-rubygem-bson-doc-4.3.0-1.el7.noarch
rh-ruby26-ruby-devel-2.6.2-118.el7.x86_64
...
rh-ruby26-rubygem-test-unit-3.2.9-118.el7.noarch
```


## Using SCLs

### Interactive use

Neither the Ruby interpreter `ruby` nor the Ruby interactive `irb` tool is part of the [core-software] installation.  For example, if we would try to run `ruby`, we would get an error:

```sh
[alice@{{ site.devel.name }} ~]$ ruby --version
-bash: ruby: command not found
```

However, as we saw above, Ruby is available through an SCL.  For interactive work, the most natural way to use an SCL is maybe to launch a new shell (typically Bash) with the SCL enabled:

```sh
[alice@{{ site.devel.name }} ~]$ scl enable rh-ruby26 $SHELL

[alice@{{ site.devel.name }} ~]$ ruby --version
ruby 2.6.2p47 (2019-03-13 revision 67232) [x86_64-linux]

[alice@{{ site.devel.name }} ~]$ irb
irb(main):001:0> 1+2
=> 3
irb(main):002:0> exit

[alice@{{ site.devel.name }} ~]$ 
```

With this approach, `ruby` and `irb` behave as if they were part of the core software installation.

How to disable the SCL?  Above, we are actually launching another shell on top of the one we where already running.  The only difference is that the second shell is running with the SCL enabled.  Just like we can exit any shell by calling `exit` or `logout`, we can "unload" the enabled SCL and return to the previous shell by calling `exit`, i.e.

```sh
[alice@{{ site.devel.name }} ~]$ exit

[alice@{{ site.devel.name }} ~]$ ruby --version
-bash: ruby: command not found
```


An alternative approach to running the SCL-based Ruby, is to launch it directly instead of via the intermediate SCL-enabled shell.  For example, we can run a Ruby script as:

```sh
[alice@{{ site.devel.name }} ~]$ scl enable rh-ruby26 ruby hello.rb
Hello world!
```

or launch the interactive Ruby tool as:

```sh
[alice@{{ site.devel.name }} ~]$ scl enable rh-ruby26 irb
irb(main):006:0> puts "Hello world!";
Hello world!
=> nil
irb(main):007:0> exit
[alice@{{ site.devel.name }} ~]$ 
```


### Using SCLs in scripts

To use SCL-based software in script, including job scripts, we need to use the "direct" SCL approach as mentioned above.  Here is an example script that outputs the current timestamp and then runs two Ruby scripts after each other:

```sh
#!/usr/bin/env bash

echo "Started on: $(date --rfc-3339=seconds)"
scl enable rh-ruby26 ruby hello.rb
scl enable rh-ruby26 ruby main.rb
```



## See Also

* [Product Documentation for Red Hat Software Collections](https://access.redhat.com/documentation/en-us/red_hat_software_collections/)
* [Product Documentation for Red Hat Developer Toolset](https://access.redhat.com/documentation/en-us/red_hat_developer_toolset/)


[core-software]: {{ '/software/core-software.html' | relative_url }}
