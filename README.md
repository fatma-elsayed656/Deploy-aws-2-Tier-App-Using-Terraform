# 🚀 Deploy Aws 2-Tier App Using Terraform

This Repo Uses Infrastructure as a code through Terraform to deploy 2-tier Web application on aws cloud.

## 🏠 Architecture

![architecture](https://github.com/fatma-elsayed656/Deploy-aws-2-Tier-App-Using-Terraform/assets/135543396/58da1b9d-84c7-4251-a411-ba37b6e2976b)

## 🖥️ Local Setup

### Generate a public-private key pair

use `ssh-keygen` command to generate customer managed public key and private key to access our instances 

```
cd modules/key/
ssh-keygen
```

## 🖥️ AWS Setup

you will need to create some aws resources before deploy your code you will need them as predefined resources

### 🚨 IAM Access key and Secret key

- Create Access key and secret key within your aws account to access the cloud using your cli
- you can configure the credentials using `aws configure` command make sure you have installed `AWS-CLI` , or write your credentials in `./aws`.

> [!IMPORTANT]
> make sure you download it because you won't be able to see it once you close your window.

### 📂 Create S3 Backend Bucket

Create an S3 bucket to store the .tfstate file in the remote backend

> [!NOTE]
> It is highly recommended that you enable `Bucket Versioning` on the S3 bucket to allow for state recovery in the case of accidental deletions and human error. 

![s3bucket](https://github.com/fatma-elsayed656/Deploy-aws-2-Tier-App-Using-Terraform/assets/135543396/f4550328-f0c0-442f-8eaf-c56cbcfa7563)

### 🔐 Create a Dynamo DB table for state file locking

- Create a Dynamo DB for state-locking so that you can keep tfstate file consistent while working on a collaborative project
- Make sure to add a `Partition key` with the name `LockID` and type as `String `

![dynamodblock](https://github.com/fatma-elsayed656/Deploy-aws-2-Tier-App-Using-Terraform/assets/135543396/be7239a6-5ef9-4a95-a3d3-6bd4940e93f3)

### 🌐 Route 53 Hosted Zone

Create a public hosted zone from AWS Console --> Route53 --> Hosted Zones 

![route53-hostedzone](https://github.com/fatma-elsayed656/Deploy-aws-2-Tier-App-Using-Terraform/assets/135543396/6e697243-e06c-47c7-9dc9-ee1695178c8f)

## ✈️ Deploy our application on the cloud 

1. install dependency and providers plugins
   This initializes Terraform in a directory, downloading any required providers. It should be run once when setting up a new Terraform config.

```
terraform init 
```
2. review the plan of the execution
   This generates an execution plan to show what Terraform will do when you call apply. You can use this to preview the changes Terraform will make.

 ```
terraform plan
```
3. deploy the application.
   This executes the actions proposed in the plan and actually provisions or changes your infrastructure.

 ```
terraform apply --auto-approve
```

## 🖥️ Outputs

- Record in route 53
  
  ![route53record](https://github.com/fatma-elsayed656/Deploy-aws-2-Tier-App-Using-Terraform/assets/135543396/129d66b6-412b-4c6a-a283-764438740758)

- Application load balancer
  
  ![alb](https://github.com/fatma-elsayed656/Deploy-aws-2-Tier-App-Using-Terraform/assets/135543396/bf74f8f8-9dc5-48db-9a44-4e88cd617534)

- RDS instance
  
  ![rds](https://github.com/fatma-elsayed656/Deploy-aws-2-Tier-App-Using-Terraform/assets/135543396/7a1d4ce2-cf69-41cd-b438-6a5264ea454e)

- The Website 
  
  ![website](https://github.com/fatma-elsayed656/Deploy-aws-2-Tier-App-Using-Terraform/assets/135543396/a2107efa-433a-49c4-b4b8-d75a85dbafa1)

## 🗑️ Clean up

After finishing don't forget to destroy terraform resources you created using 
```
terraform destroy --auto-approve
```




