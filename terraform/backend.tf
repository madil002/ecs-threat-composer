terraform {
  backend "s3" {
    bucket       = "terraform-state-adil"
    key          = "terraform.state"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}
