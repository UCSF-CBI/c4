<!-- markdownlint-disable-file MD034 -->

<div class="alert alert-warning" role="alert" markdown="1">

**The below instructions only work on _data transfer nodes_.**

</div>


# Amazon Web Services S3

S3 is a for-profit service for moving, syncing, and sharing data. Users should be aware that there are AWS charges any time data is downloaded or uploaded to an AWS S3 bucket. This document is accurate as of publishing. Please be aware that Amazon AWS is ever evolving. Please check the online documentation for current syntax.

## Setup of AWS Command Line Interface

### Set up AWS credentials in your $HOME directory on either of the data transfer servers

If you want to transfer files from or to your {{ site.cluster.nickname }} account, you need to set up your S3 credentials.  Below is an outline on how to do this.

1. Ensure you have both the AWS Access Key ID and the AWS Secret Access Key. The Secret Access Key is downloaded at the time the Access Key is created. If you have skipped this step or lost the Secret Access Key, another will have to be created via the AWS IAM Console by someone with admin permissions. Please see the maintainer of your S3 bucket for this. You will also need to know which AWS region your S3 bucket lives in.

2. Log in to either data transfer server with your {{ site.cluster.nickname }} account.

3. Run the aws configure command `aws configure`

```sh
[carol@{{ site.transfer.name }} ~]$ aws configure
AWS Access Key ID [None]: AWS-ACCESS-KEY-ID-GOES-HERE
AWS Secret Access Key [None]: AWS-SECRET-ACCESS-KEY-GOES-HERE
Default region name [None]: AWS-REGION-GOES-HERE
Default output format [None]: 
```

4. You have now completed the AWS setup. If you need to access buckets from different AWS accounts, you would re-do the above steps with the appropriate Access Key ID, Secret Access Key, and AWS region.

## Accessing the S3 bucket from your {{ site.cluster.nickname }} account

### List all buckets the credentials allow you to access

```sh
[carol@{{ site.transfer.name }} ~]$ aws s3 ls
2021-05-13 09:05:36 my-test-bucket
```

The above shows that carol has access to one S3 bucket called test-bucket with the credentials she used in the configuration stage.

### List all files contained within an S3 bucket

```sh
[carol@{{ site.transfer.name }} ~]$ aws s3 ls test-bucket
2021-05-13 09:13:29        364 eratosthenes.r
```

The above shows that the S3 bucket called test-bucket contains one file called eratosthenes.r which is 364 bytes in size. Pay attention to the sizes, AWS charges by the gigabyte for transfers.

## Transferring files

To transfer files between AWS S3 and {{ site.cluster.nickname }}:

### aws s3 cp 

This is very similar to Linux cp. You can use this to copy files from your C4 account to S3 or from S3 to your C4 storage. Be very careful with wildcards here, remember everything has a cost. When using `aws s3 cp` we reference the S3 bucket as s3://name-of-bucket 

Example:

**Copy eratosthenes.r from {{ site.cluster.nickname }} to S3**

```sh
[carol@{{ site.transfer.name }} ~]$ aws s3 cp $HOME/eratosthenes.r s3://test-bucket
upload: ./eratosthenes.r to s3://test-bucket/eratosthenes.r
```

Example:

**Copy eratosthenes.r from S3 to {{ site.cluster.nickname }} current working directory**

```sh
[carol@{{ site.transfer.name }} ~]$ aws s3 cp s3://test-bucket/eratosthenes.r ./
download: s3://test-bucket/eratosthenes.r to ./eratosthenes.r
```

### aws s3 sync 

This can be quite useful for when you want to download the entire contents of an S3 bucket to your {{ site.cluster.nickname }} storage. Remember to assess the size and calculate costs before proceeding

Example:

**Synchronize the contents of s3://test-bucket with a directory called $HOME/test-bucket-local**

```sh
[carol@{{ site.transfer.name }} ~]$ aws s3 sync s3://test-bucket $HOME/test-bucket-local/
download: s3://test-bucket/eratosthenes.r to test-bucket-local/eratosthenes.r
```


[AWS Documentation]: https://docs.aws.amazon.com/index.html
[AWS Configuration]: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html
[High Level S3 Commands]: https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-commands.html
