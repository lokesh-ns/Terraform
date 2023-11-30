Creation of S3 bucket and dynamodb_table:

S3 bucket is created to maintiane the version of terraform.tfstate and making it as a private file and it is accessible only for the people who have access to s3 bucket

dynamodb_table is created to lock the state file of terraform to avoid the confusion for terraform and aws when 2 peoples are working on smae state file.

>   when a person about to execute terraform apply, the terraform state file will be locked to that person and it won't let another person to execute terraform apply command unless the state file is unlocked.