# 🚀 Deploy Aws 2-Tier App Using Terraform

This Repo Uses Infrastructure as a code through Terraform to deploy 2-tier Web application on aws cloud.

## 🏠 Architecture

![architecture](https://github.com/fatma-elsayed656/Deploy-aws-2-Tier-App-Using-Terraform/assets/135543396/569ab1ef-49b2-4e29-bb86-63135a343c4a)

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

![s3bucket](https://github.com/fatma-elsayed656/Deploy-aws-2-Tier-App-Using-Terraform/assets/135543396/ba57bb9b-d668-4a37-800f-1c11f975a755)

### 🔐 Create a Dynamo DB table for state file locking

- Create a Dynamo DB for state-locking so that you can keep tfstate file consistent while working on a collaborative project
- Make sure to add a `Partition key` with the name `LockID` and type as `String `

![ynamodblock](https://github.com/fatma-elsayed656/Deploy-aws-2-Tier-App-Using-Terraform/assets/135543396/8ccf8740-df83-40f3-9e2f-e047972031a2)

### 🌐 Route 53 Hosted Zone

Create a public hosted zone from AWS Console --> Route53 --> Hosted Zones 

![route53-hostedzone](https://github.com/fatma-elsayed656/Deploy-aws-2-Tier-App-Using-Terraform/assets/135543396/006eca56-fb09-4bf8-886c-a33cb29873da)

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
  
  ![route53record](https://github.com/fatma-elsayed656/Deploy-aws-2-Tier-App-Using-Terraform/assets/135543396/70856968-3d92-4782-b51c-58f4bbf37da3)

- Application load balancer
  
  ![alb](https://github.com/fatma-elsayed656/Deploy-aws-2-Tier-App-Using-Terraform/assets/135543396/07e3f0c8-4a8d-4467-a21f-301be5a46a0d)

- RDS instance
  
  ![rds](https://github.com/fatma-elsayed656/Deploy-aws-2-Tier-App-Using-Terraform/assets/135543396/fbb86efa-732e-47d4-a4fc-6bbaa13fc701)

- The Website 
  
  ![website](https://github.com/fatma-elsayed656/Deploy-aws-2-Tier-App-Using-Terraform/assets/135543396/321ee8a4-8a0e-4c30-b039-fbd4acb62815)

## 🗑️ Clean up

After finishing don't forget to destroy terraform resources you created using 
```
terraform destroy --auto-approve
```




