## RDS MySQL with Bastion Host-Terraform Deployment
![Alt text](./diagram.svg)

### Prerequisites 
- Terraform installed
- AWS CLI configured
- An AWS key pair for SSH access
### Project Structure

```
bash
.
├── data
│   └── mysqlsampledatabase.sql        # SQL dump to initialize MySQL database
├── diagram.svg                        # Architecture diagram
├── scripts
│   └── setup.sh                       # Shell script to export Terraform environment variables
└── terraform
    ├── aws
    │   ├── main.tf                    # Root Terraform configuration
    │   ├── outputs.tf                 # Outputs like RDS endpoint and bastion IP
    │   ├── provider.tf                # AWS provider setup
    │   └── variables.tf              # Variable definitions
    └── modules
        ├── bastion
        │   ├── compute.tf             # Bastion EC2 instance definition
        │   ├── network.tf             # Bastion security group and networking
        │   ├── outputs.tf
        │   └── variables.tf
        ├── network
        │   ├── network.tf             # VPC, subnets, routing
        │   ├── outputs.tf
        │   └── variables.tf
        └── rds
            ├── network.tf            # RDS subnet group and security group
            ├── outputs.tf
            ├── rds.tf                # RDS instance configuration
            └── variables.tf
```

#### Network Module (VPC,Subnets,Routing)

The network module provisions the foundational networking layer for this infrastructure:

VPC: A custom Virtual Private Cloud to logically isolate all resources

Subnets:

1 public subnet for the bastion host, enabling SSH access from the internet

2 private subnets, each in a different Availability Zone, to meet RDS requirements for multi-AZ deployment and high availability

Internet Gateway & Routing:

The public subnet is connected to an internet gateway with a route table

The private subnets are isolated and not directly reachable from the internet

RDS Subnet Group:

A DB subnet group is created from the two private subnets

This allows RDS to span across multiple AZs, which is essential for fault tolerance and durability

By separating public and private subnets and using two AZs for RDS, the architecture ensures security, resilience, and scalability.

#### Step 1: Configure Environment Variables
Run the setup script to export necessary Terraform variables: 
```bash
source scripts/setup.sh
```
#### Step 2: Provision Infrastructure
Use Terraform to deploy the infrastructure:
```bash
cd /terraform/aws
terraform init
terraform plan
terraform apply
```
This will create: 
- A bastion EC2 instance
- A MySQL RDS instance in a private subnet
- Required security groups, IAM roles, and VPC resources

#### Step 3: Upload SQL File to Bastion Host 
``` bash
cd ../..
cat data/mysqlsampledatabase.sql | ssh -i ~/.ssh/new-key.pem ec2-user@<BASTION_PUBLIC_IP> 'cat > ~/mysqlsampledatabase.sql'
```
This uploads your SQL script to the bastion instance.


#### Step 4:  Connect to MySQL and Execute SQL Script
From the bastion host, run the following command to import the SQL data into your RDS instance:
```
mysql -h endpoint -u your_username -p < mysqlsampledatabase.sql
```
- Replace <RDS_ENDPOINT> with the endpoint of your RDS instance 
- Replace <USERNAME> with your MySQL username (e.g., admin)
- Enter the MySQL password when prompted

