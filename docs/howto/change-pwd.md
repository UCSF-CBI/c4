<!-- markdownlint-disable-file MD034 -->

# C4 Credentials

## Change password


You can change your password from the C4 command line using the standard passwd command.  



### From the C4 command line

If you can log in to C4, then you can change your credentials by calling `passwd` from one of the _login_ nodes, e.g.

```sh
[alice@c4-log1 ~]$ passwd
Changing password for user alice.
Current Password:
New password: 
Retype new password: 
passwd: all authentication tokens updated successfully.
[alice@c4-log1 ~]$ 
```


## Verify credentials

To test your C4 credentials, try to [login to C4 via SSH]({{ '/get-started/access-cluster.html' | relative_url }}).  


## Reset password

To reset your _C4_ password, contact your friendly neighborhood sysadmin at harry.putnam@ucsf.edu

<div class="alert alert-danger" role="alert" style="margin-top: 3ex">
<strong>Account are personal and login credentials must not be shared with others</strong>. If detected, access to the account will be automatically disabled.  It is still possible and easy for multiple users to share and collaborate on the same folders and scripts.  Don't hesitate to ask if you don't know how to do this - we're here to help.
</div>


[RBVI Kerberos web interface]: https://www.cgl.ucsf.edu/admin/chpass.py
[UCSF Enterprise Password Standard]: https://wiki.library.ucsf.edu/pages/viewpage.action?spaceKey=ITSI&title=Unified+UCSF+Enterprise+Password+Standard
