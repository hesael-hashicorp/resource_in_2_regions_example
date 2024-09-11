### Terraform Example creating a resource in 2 different AWS regions

### Prerequisites

Requires terraform version 1.9.5 or higher.

HashiCorp Terraform Installation Instructions: 

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

Requires AWS CLI, AWS Account Access, Environmental Variables configured for AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and AWS_DEFAULT_REGION

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

https://docs.aws.amazon.com/cli/v1/userguide/cli-configure-envvars.html

### Requirements

Requires **terraform.tfvars** file in module root directory with the following:

```bash
ami_us_east_2 = <Desired AWS East-2 Region AMI>
ami_us_west_2 = <Desired AWS East-2 Region AMI>
```

.gitignore file with:

```bash
# Local .terraform dir
.terraform/*

# terraform state files
*.tfstate
*.tfstate.*

# terraform variable files
*.tfvars
```

### Instructions

```bash
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"

```

### Terrafrom Expected Verbose Example
```
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.west_instance: Creating...
aws_instance.east_instance: Creating...
aws_instance.west_instance: Still creating... [10s elapsed]
aws_instance.east_instance: Still creating... [10s elapsed]
aws_instance.east_instance: Creation complete after 13s [id=i-060afbe36041f0d0b]
aws_instance.west_instance: Still creating... [20s elapsed]
aws_instance.west_instance: Still creating... [30s elapsed]
aws_instance.west_instance: Still creating... [40s elapsed]
aws_instance.west_instance: Creation complete after 43s [id=i-06fe3f12ee6d48d60]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

east_instance_id = "i-060afbe36041f0d0b"
east_instance_public_ip = "3.22.164.61"
west_instance_id = "i-06fe3f12ee6d48d60"
west_instance_public_ip = "44.243.105.147"
```


### Post Cleanup
```bash
terraform destroy -var-file="terraform.tfvars"
```

### License

Copyright 2024 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
