# Datadog-GCP Integration via Terraform

This repository contains Terraform scripts for automating the creation of a Google Cloud Platform (GCP) service account with specific roles for Datadog integration. The service account will be granted the following roles:

- Monitoring Viewer
- Compute Viewer
- Cloud Asset Viewer
- Browser
- Service Account Token Creator (for the Datadog principal)

## Files

- `variables.tf`: This file declares the variables used in the Terraform scripts.
- `main.tf`: This file contains the Terraform configuration for creating the GCP service account and assigning the necessary roles.
- `terraform.tfvars`: This file is where you should place your variable values, like the GCP project ID, GCP credentials file path, and Datadog principal.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- Google Cloud Platform account with appropriate permissions
- [Datadog](https://www.datadoghq.com/) account

## Setup Instructions

1. **Clone the Repository**: Clone this repository to your local machine.

    ```
    git clone https://github.com/your-repository.git
    ```

2. **Navigate to the Directory**: Navigate into the directory containing the Terraform scripts.

    ```
    cd path/to/your-repository
    ```

3. **Edit `terraform.tfvars`**: Open the `terraform.tfvars` file and replace the placeholders with your actual GCP project ID, path to your GCP credentials file, and Datadog principal.

    ```hcl
    gcp_project_id       = "your-gcp-project-id"
    ```

4. **Initialize Terraform**: Run the following command to initialize your Terraform workspace:

    ```
    terraform init
    ```

5. **Plan the Deployment**: Execute the following command to see what changes will be made:

    ```
    terraform plan
    ```

6. **Apply the Changes**: Finally, apply the changes to create the service account and assign the roles.

    ```
    terraform apply
    ```

    Confirm the changes by typing `yes` when prompted.

7. **Check the Output**: After the changes are applied, the email address of the newly created Datadog service account will be displayed. You'll use this email to complete the integration setup in Datadog.

## Manual Steps for Datadog Integration

After running the Terraform scripts, please follow the manual steps listed in the `main.tf` comments to complete the Datadog-GCP integration.
