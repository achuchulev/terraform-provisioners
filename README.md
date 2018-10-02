# Sample repo with example of terraform provisioners usage

### Prerequisits

* git
* terraform
* AWS subscription

### Download the repo and go to the repo directory

```
https://github.com/achuchulev/terraform-provisioners.git
cd terraform-provisioners/
```

### Create a terraform.tfvars file and reflect your setup there

```
ami = "ami-id"
instance_type = "t2.micro"
subnet_id = "subnet-id"
vpc_security_group_ids = ["sg-id"]
tag_name = "tag-name"
identity = "new-key-pair-name"
region = "aws-region"
```

### Export your AWS access key and secret key as enviroment variables

```
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
```

### Build/destroy AWS instance

```
terraform plan
terraform apply
terraform destroy
```


