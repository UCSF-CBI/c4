<!-- markdownlint-disable-file MD034 -->

# {{ site.cluster.name }} Credentials

## Change password


You can change your password from the C4 command line using the standard passwd command.  



### From the {{ site.cluster.nickname }} command line

If you can log in to {{ site.cluster.name }}, then you can change your credentials by calling `passwd` from one of the _login_ nodes, e.g.

```sh
[alice@{{ site.login.name }} ~]$ passwd
Changing password for user alice.
Current Password:
New password: 
Retype new password: 
passwd: all authentication tokens updated successfully.
[alice@{{ site.login.name }} ~]$ 
```


## Verify credentials

To test your {{ site.cluster.nickname }} credentials, try to [login to {{ site.cluster.name }} via SSH]({{ '/get-started/access-cluster.html' | relative_url }}).  


## Reset password

To reset your _{{ site.cluster.nickname }}_ password, contact your friendly neighborhood sysadmin at [{{ site.cluster.email_admin }}](mailto:{{ site.cluster.email_admin }})

<div class="alert alert-danger" role="alert" style="margin-top: 3ex">
<strong>Account are personal and login credentials must not be shared with others</strong>. If detected, access to the account will be automatically disabled.  It is still possible and easy for multiple users to share and collaborate on the same folders and scripts.  Don't hesitate to ask if you don't know how to do this - we're here to help.
</div>


[RBVI Kerberos web interface]: https://www.cgl.ucsf.edu/admin/chpass.py
[UCSF Enterprise Password Standard]: https://wiki.library.ucsf.edu/pages/viewpage.action?spaceKey=ITSI&title=Unified+UCSF+Enterprise+Password+Standard
