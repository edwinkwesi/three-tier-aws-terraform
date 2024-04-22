# Three-Tier Architecture Deployment AWS 

This three-tier architecture will contain the following components:

Deploy a VPC with CIDR 10.0.0.0/16
Within the VPC we will have 2 public subnets with CIDR 10.0.0.0/28 and 10.0.0.16/28. 

Each public subnet will be in a different Availability Zone for high availability.

Create 4 private subnets with CIDR 10.0.0.32/28, 10.0.0.48/18 for the application tier and CIDR 10.0.0.64/28, 10.0.0.80/28 for the database tier and each will be in a different 
Availability Zone.

Deploy RDS MySQL instance.
An Application load balancer that will direct traffic to the public subnets and another application load balancer to handle traffic from the web tier to the app tier.

Deploy one EC2 auto-calling group in each public subnet(web tier)and private subnet (app tier) for high availability.

Internet Gateway, NAT gateway, and Elastic IPs for EC2 instance.


Bastion host for connecting direct app servers.

Create network resources.tf file
----------------------------------

The network_resources.tf file is an essential component of any Terraform project that aims to deploy a scalable and highly available infrastructure in AWS. This file contains all the necessary network blocks and resources required to create a robust networking layer for your applications. These resources include a Virtual Private Cloud (VPC), two public subnets, four private subnets, an Internet Gateway (IGW), a NAT Gateway, an Application Load Balancer (ALB), and two public and private route tables.

The VPC is the foundation of the networking infrastructure and provides a private and isolated environment for your resources to operate. The public subnets are designed to host resources that require public access, while the private subnets are used for resources that require restricted access. The IGW provides a path for incoming and outgoing traffic to and from the public subnets, while the NAT Gateway allows resources in the private subnets to access the internet. The ALB provides load balancing for your applications, distributing traffic across multiple instances to ensure optimal performance and scalability. Finally, the public and private route tables control the routing of traffic between the subnets and gateways, ensuring that traffic flows seamlessly through the network.

By using Terraform to manage these resources, you can easily create and maintain a highly available and scalable network infrastructure in AWS, allowing your applications to run smoothly and reliably.


Create Route Tables
--------------------

To enable communication between the web tier and the application tier, we need to create two route tables: one for each tier. Route tables define which subnet traffic is allowed to flow to and from. We’ll create a public route table for the web tier, which will contain the public subnet associated with our load balancer. We’ll also create a private route table for the application tier, which will contain the private subnets associated with our application servers. By associating these route tables with the appropriate subnets, we ensure that traffic flows only to the intended destination. The web servers and app servers are connected to these two route tables, enabling them to communicate with each other as needed.

Create a NAT gateway
--------------------

A NAT gateway allows instances from the private subnets to connect to resources outside of the VPC and the Internet (for necessary services such as patches or package updates).

It’s best practice to maintain a high availability and deploy two NAT gateways in our public subnets (one in each AZ) So however, for now, I will just deploy one.



Create EC2 Auto Scaling Group and Launch Template
--------------------------------------------------

To ensure the Web Tier is highly available and can handle traffic fluctuations, we will use an ASG to dynamically provision EC2 instances. The launch template will define what kind of EC2 instances will be created, including the instance size, AMI, and security group.

To ensure traffic is distributed evenly across our web servers and to provide high availability, we will use an Application Load Balancer. The ALB will monitor the health of our web servers and direct traffic to the available instances.

Finally, we will create a security group for our web servers. This security group will control inbound and outbound traffic to the instances, limiting access to only necessary ports and sources. This will help prevent unauthorized access and reduce the risk of security breaches.



To ensure high availability for the web app and limit single points of failure, we will create an ASG that will dynamically provision EC2 instances, as needed, across multiple AZs in our public subnets and create a template that will be used by our ASG to dynamically launch EC2 instances in our public subnets.

Create Application Load Balancer — App tier (network resources.tf)
------------------------------------------------------------------

We’ll need an ALB to distribute incoming HTTP traffic to the proper targets (our EC2s). The ALB needs to ‘listen’ over HTTP on port 80 and a target group that routes to our EC2 instances. We want to set a minimum and maximum number of instances the ASG can provision:

Desired capacity: 2
Minimum capacity: 2
Maximum capacity: 3


Database tier (Data storage & retrieval)
-----------------------------------------

The Database Tier is where our application will store all the important data, such as user login info, session data, transactions, and application content. Application servers need to be able to read and write to databases to perform necessary tasks and deliver proper content/services to the Web Tier and users. To accomplish this, we are going to use a Relational Database Service (RDS) that uses MySQL.


Database Tier

A database security group that allows outbound and inbound mySQL requests to and from our app servers.

A DB subnet group to ensure the database is created in the proper subnets.

An RDS database with MySql.
With these components in place, we can ensure that our Database Tier is secure and accessible to the other tiers of our application. Let’s move on to creating these components in our database resources.tf file.