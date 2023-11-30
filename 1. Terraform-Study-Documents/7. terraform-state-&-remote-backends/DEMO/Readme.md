Creation of backend.tf file

backend.tf file is created on specific folder or module to avoid the creation of terraform state file and also locking the terraform state file using dynamo_db_table

Reason for the creation is:
When ever a developer who try to push the changes of main.tf file into repository he may forgot to push the changes done on terraform.tfstate file. If he forgots then the changes done on state file is gone and whenever terraform try to execute new operations it always look into state file when there is no date of previous changes on main.tf file then that old data will get exhausted.



With this demo,

We have observed that there is no state file is created locally and it is created on s3 bucket mentioned in backend.tf file and you can view that state file using "terraform show"

And also when you execute the "terraform apply" command, the state file will be locked and it will be unlocked and available for others only after the completion of operation