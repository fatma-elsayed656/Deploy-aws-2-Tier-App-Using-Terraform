# 🚀 Deploy Aws 2-Tier App Using Terraform

This Repo Uses Infrastructure as a code through Terraform to deploy 2-tier Web application on aws cloud.

## 🏠 Architecture

![architecture]()

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

![s3bucket]()

### 🔐 Create a Dynamo DB table for state file locking

- Create a Dynamo DB for state-locking so that you can keep tfstate file consistent while working on a collaborative project
- Make sure to add a `Partition key` with the name `LockID` and type as `String `

![ynamodblock]()

### 🌐 Route 53 Hosted Zone

Create a public hosted zone from AWS Console --> Route53 --> Hosted Zones 

![route53-hostedzone]()

## ✈️ Deploy our application on the cloud 

1. install dependency and providers plugins

```
terraform init 
```
2. review the plan of the execution

 ```
terraform plan
```
3. deploy the application. 

 ```
terraform apply --auto-approve
```

## 🖥️ Outputs

- Record in route 53
  
  ![route53record]()

- Application load balancer
  
  ![alb]()

- RDS instance
  
  ![rds]()

- The Website 
  
  ![website]()


