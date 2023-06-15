# terraform-milestone-project-apache-superset
Learn &amp; practice terraform aws throught out terraform milestone project

## Intro
Using terraform create the infrastructure on AWS

Using Packer create a new AMI EC2 have Apache Superset container

## Install
Terraform 0.1.25

Packer

## Demo
- 1.Create Infrastructures by Terraform
![terraform init](images/01_terraform_init.png)
![terraform plan -var-file=values.json](images/02_terraform_plan_1.png)
![terraform apply -var-file=values.json -auto-approve](images/05_terraform_apply_2.png)

- 2.Create a new AMI have apache superset by Packer
![Execute file packer_build_ami.sh to create a custome AMI](images/07_Packer_build_new_ami_2.png)
Change the old AMI “ami-0efcfaf48fcb35dd9” to the new AMI “ami-0f947193a5dc92abf”

- 3.Terraform apply again to update the new infrastructure.
![terraform apply -var-file=values.json -auto-approve](images/08_terraform_apply_new_ami_1.png)

- 4.Access to Apache Superset and connect RDS MySQL to Apache Superset 
![Using SSH login to the EC2, check docker container](images/10_login_EC2_ssh.png)
Using Port forwarding technical to login to Apache Superset, connect from rds to apache superset
![ssh -i private_key.pem -N -L :8080:127.0.0.1:8080 ubuntu@18.141.137.22](images/11_port_forwarding_1.png)
![ssh -i private_key.pem -L 3306:terraform-20230607085848190600000001.ch2vw0y5itrx.ap-southeast-1.rds.amazonaws.com:3306 ubuntu@18.141.137.22  -N  ](images/12_port_forwarding_2.png)

## Login Apache Super and connect to RDS MySQL
![Apache Superset Dashboard](images/13_apache_dashboard.png)
![Connect to MySQL RDS](images/14_connected_rds_mysql.png)
![Demo dashboard](images/15_view.png)
