---
context:
  - login
---

<!-- markdownlint-disable-file MD034 -->

# Change Password


The {{ site.cluster.name }} cluster uses a technology called LDAP to manage Linux accounts and passwords. The maximum age for a password is 365 days. When your password is within 30 days of expiring, you will start to receive system generated emails warning you to change the password.


## Password complexity rules

Passwords are subject to the following complexity rules:

- At least eight (8) total characters
- At least three of the following four categories:
  - Lowercase letters (a b ... z)
  - Uppercase letters (A B ... Z)
  - Digits  (0 1 ... 9)
  - Special characters (@ # $ & % ^ * _ - + = \| \ / ( ) { } < > " ' ` : ; , . ! ?)
- You cannot update to a password that you already used in the past


## Update password

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

If you get an error saying "Password change failed. Server message:
Old password not accepted. passwd: Authentication token manipulation
error" when you enter your current password, then your password has
already _expired_. If so, you need to request a password reset.


## Verify password

To test your {{ site.cluster.nickname }} credentials, try to [log in to {{ site.cluster.name }} via SSH]({{ '/get-started/access-cluster.html' | relative_url }}).  If you have SSH keys set up, you can force SSH to ignore those and only accept password entries by using:

```sh
{local}$ ssh -o PreferredAuthentications=password alice@{{ site.login.hostname }}
```


## Reset password

To reset your _{{ site.cluster.nickname }}_ password, for instance if you forgot your password or your password expired, contact your friendly neighborhood sysadmin at [{{ site.cluster.email_admin }}](mailto:{{ site.cluster.email_admin }}).

<div class="alert alert-danger" role="alert" style="margin-top: 3ex" markdown="1">
**Account are personal and login credentials must not be shared with others**. If detected, access to the account will be automatically disabled.  It is still possible and easy for multiple users to share and collaborate on the same folders and scripts.  Don't hesitate to ask if you don't know how to do this - we're here to help.
</div>
