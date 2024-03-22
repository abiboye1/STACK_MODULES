data "template_file" "bootstrap" {
  template = file(format("%s/bootstrap.tpl", path.module))
  vars={
    GIT_REPO="https://github.com/stackitgit/CliXX_Retail_Repository.git"
  }
}