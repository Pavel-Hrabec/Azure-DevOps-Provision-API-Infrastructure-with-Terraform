# Azure DevOps: Provision API Infrastructure with Terraform

## Description

- API, Docker and Terraform files developed locally with Visual Studio Code pushed to GitHub will trigger pipeline in Azure DevOps, which will build and push docker image to Docker Hub and provision services to Azure with Terraform.
- Key objectives:
    - Develop API code and run it in Docker container
    - Create Terraform file to provision services in Azure cloud
    - Create Azure DevOps Pipeline to trigger on changes in GitHub repository to build, publish, provision and deploy developed code

## API development

- Install [Visual Studio Code](https://code.visualstudio.com/download) (VSC)
- Create project in [GitHub](https://github.com/join) and clone repository locally with VSC
- Install [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- Download .NET Core [SDK package](https://dotnet.microsoft.com/en-us/download/dotnet/3.1), install it and verify
    
    ```
    dotnet --version 
    ```
    
- Create your [API project with template](https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-new)
    
    ```
    dotnet new
    ```
    
- Create account at [Docker](https://www.docker.com/) and [install Docker Desktop](https://www.docker.com/products/docker-desktop/)
- Create [Docker file](https://hugs4bugs.me/Docker-101/#what-is-a-dockerfile) with instructions to build image
- Build your [docker image](https://docs.docker.com/engine/reference/commandline/build/)
    
    ```
    docker build -t <path>
    ```
    
- [Run](https://docs.docker.com/engine/reference/run/) your API in docker container
    
    ```
    docker run -p <port> <path>
    ```
    

## Terraform file

- Install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) and add [extension](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform) to VSC
- Create your [Terraform file](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs) to provision Azure resources
    - [Resource group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) to hold container with API
    - [Container group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_group) for Docker
- Create service [principal account](https://docs.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals)
- Assign Azure role to [service principal](https://docs.microsoft.com/en-us/azure/role-based-access-control/role-assignments-steps)
- Create [storage account](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-create?tabs=azure-portal) in Azure to store Terraform state file remotely
- Create [Azure Key Vault](https://docs.microsoft.com/en-us/azure/key-vault/general/quick-create-portal) to store your secrets
- [Store your secrets](https://docs.microsoft.com/en-us/azure/key-vault/secrets/quick-create-portal#add-a-secret-to-key-vault) in Azure Key Vault
    - [Tenant ID](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-how-to-find-tenant), [Subscription ID, Client ID, Client Secret](https://www.cloudsnooze.com/news/view/29), [Storage Key](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-keys-manage?tabs=azure-portal#view-account-access-keys)

## Azure DevOps Pipeline

- Create private [Azure DevOps project](https://docs.microsoft.com/en-us/azure/devops/organizations/projects/create-project?view=azure-devops&tabs=browser)
    - Initialize Azure DevOps repo from existing repository in GitHub
- Create Azure, Docker and GitHub [service connections](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml) in Azure DevOps
- Integrate [Azure Key Vault with Azure Pipelines](https://thomasthornton.cloud/2021/06/24/storing-and-retrieving-secrets-in-azure-keyvault-with-variable-groups-in-azure-devops-pipelines/) to retrieve secrets in your pipelines
- Create your [pipeline with GitHub](https://docs.microsoft.com/en-us/azure/devops/pipelines/repos/github?view=azure-devops&tabs=yaml) to build and push [Docker image](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/build/docker?view=azure-devops) and leverage [Terraform file](https://learn.hashicorp.com/tutorials/terraform/automate-terraform)