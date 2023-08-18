# Infrastructure

## Introduction

In this lab, you will build the infrastructure that we will use to run the rest of the workshop.

Previous experience on Terraform is not required. Nevertheless, Terraform is an Open Source tool to write code that represents resources on the Cloud. Running that code will create those resources on Oracle Cloud, the same way you can create resources, Terraform keeps track of everything you create and can be easily removed from the Cloud.

Estimated Lab Time: XX minutes

### Objectives

In this lab, you will create the infrastructure to complete this workshop on Oracle Cloud. You will create several Oracle Databases and Database Management entities.

### Prerequisites

* An Oracle Free Tier, Paid or LiveLabs Cloud Account

## Task 1: Set up the environment

1. From the Oracle Cloud Console, click on **Cloud Shell**.

  ![xxx](images/xxx.png)

2. Clone the repository where all the terraform code is.

    ```bash
    <copy>git clone https://github.com/vmleon/oci-db-management.git</copy>
    ```

  ![xxx](images/xxx.png)

3. Change to the new cloned folder.

    ```bash
    <copy>cd oci-db-management</copy>
    ```

  ![xxx](images/xxx.png)

4. Install some dependencies needed for the scripts.


    ```bash
    <copy>cd scripts && npm install && cd ..</copy>
    ```

  ![xxx](images/xxx.png)

5. After a few seconds, you will see this message.

  ![xxx](images/xxx.png)

## Task 2: Create the Foundational Infrastructure

1. Terraform needs a configuration file called `terraform.tfvars` that you are going to create by running the `tfvars.mjs` script.

    ```bash
    <copy>npx zx scripts/tfvars.mjs env</copy>
    ```

2. During the execution of the script, it will ask for the compartment. You just type _**ENTER**_ to select the root compartment. If you are familiar with OCI compartments, then feel free to pick an existing compartment name.

  ![xxx](images/xxx.png)

3. From the **Cloud Shell**, run the following command to change to the terraform directory:

    ```bash
    <copy>cd terraform/env</copy>
    ```

4. Run the Terraform `init` to prepare Terraform.

    ```bash
    <copy>terraform init</copy>
    ```

5. Run the Terraform `apply` to create the infrastructure.

    ```bash
    <copy>terraform apply -auto-approve</copy>
    ```

6. Change the directory to the root.

    ```bash
    <copy>cd ../..</copy>
    ```

## Task 3: Create the Database Infrastructure

1. Terraform needs a configuration file called `terraform.tfvars` that you are going to create by running the `tfvars.mjs` script.

    ```bash
    <copy>npx zx scripts/tfvars.mjs db</copy>
    ```

2. During the execution of the script, it will ask for the compartment. You just type _**ENTER**_ to select the root compartment. If you are familiar with OCI compartments, then feel free to pick an existing compartment name.

  ![xxx](images/xxx.png)

3. From the **Cloud Shell**, run the following command to change to the terraform directory:

    ```bash
    <copy>cd terraform/db</copy>
    ```

4. Run the Terraform `init` to prepare Terraform.

    ```bash
    <copy>terraform init</copy>
    ```

5. Run the Terraform `apply` to create the infrastructure.

    ```bash
    <copy>terraform apply -auto-approve</copy>
    ```

6. Change the directory to the root.

    ```bash
    <copy>cd ../..</copy>
    ```

You may now [proceed to the next lab](#next).

## Acknowledgements

* **Author** - Priscila Iruela - Technology Product Strategy Director - EMEA
* **Author** - Victor Martin - Technology Product Strategy Director - EMEA
* **Last Updated By/Date** - October, 2023
