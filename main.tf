###-------------------Provider-------------------###
terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "~> 5.0"
    }
  }
}
# Configure the GitHub Provider 
###👇👇 Al estar vacias las credenciales buscara en variables de entorno
####solo sirve en mi PC :3

###actualizacion: se agrego token :v
provider "github" {
  token = "ghp_lS9kd********************************"
  owner = "arq-tics-labs"
}
# Add a user to the organization
resource "github_membership" "membership_for_user_icaseres" {
  username = "icaseres"
  role     = "member"
}



###-------------------Codebase-------------------###
resource "github_repository" "lab_terraform_codebase" {
  name = "lab-terraform-codebase"
  description = "My awesome codebase to learn Terraform for arch tics "
  visibility = "public"
  auto_init = true
  allow_update_branch = true
  /* template {
    owner = "github"
    repository = "terraform-template-module"
    include_all_branches = true
  } */
}


####-------------------Web Page-------------------####
resource "github_repository" "lab_terraform_web_page" {
  name = "lab-terraform-web-page"
  description = "My awesome web page to learn Terraform for arch tics "
  visibility = "public"
  ##private = false
  auto_init = true
  pages {
    source {
      branch = "main"
      path = "/docs"
    }
  }
}


###------------------Branch--Codebase-------------------###
resource "github_branch" "development_branch_codebase" {
  repository = github_repository.lab_terraform_codebase.name
  branch = "development"
  depends_on = [github_repository.lab_terraform_codebase]
}
resource "github_branch" "feature_branch_codebase" {
  repository = github_repository.lab_terraform_codebase.name
  branch = "feature"
  depends_on = [github_repository.lab_terraform_codebase]
}
resource "github_branch" "fix_branch_codebase" {
  repository = github_repository.lab_terraform_codebase.name
  branch = "fix"
  depends_on = [github_repository.lab_terraform_codebase]
}


####------------------Branch-Web Page-------------------####
resource "github_branch" "development_branch_web_page" {
  repository = github_repository.lab_terraform_web_page.name
  branch = "development"
  depends_on = [
    github_repository.lab_terraform_web_page
  ]
}
resource "github_branch" "feature_branch_web_page" {
  repository = github_repository.lab_terraform_web_page.name
  branch = "feature"
  depends_on = [
    github_repository.lab_terraform_web_page
    ]
}
resource "github_branch" "fix_branch_web_page" {
  repository = github_repository.lab_terraform_web_page.name
  branch = "fix"
   depends_on = [
    github_repository.lab_terraform_web_page
    ]
}