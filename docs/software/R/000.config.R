module_repositories <- list(
  "built-in" = list(
    name        = "built-in",
    maintainer  = "{{ site.cluster.nickname }} Systems Administrators",
    group       = "{{ site.cluster.name }}",
    url         = "{{ '/about/contact.html' | relative_url }}",
    contributed = FALSE,
    module_path = c("/etc/modulefiles")
  ),
  
  CBI = list(
    name        = "CBI",
    maintainer  = "Henrik Bengtsson",
    group       = "Computational Biology and Informatics",
    url         = "https://cbi.ucsf.edu",
    contributed = TRUE,
    module_path = Sys.getenv("MODULE_ROOT_CBI", file.path(dirname(Sys.getenv("SOFTWARE_ROOT_CBI", "/software/c4/cbi/software")), "modulefiles"))
  ),

  WitteLab = list(
    name        = "WitteLab",
    maintainer  = "Taylor Cavazos",
    group       = "Witte Lab Software Repository",
    url         = "https://wittelab.ucsf.edu",
    contributed = TRUE,
    module_path = file.path(dirname(Sys.getenv("SOFTWARE_ROOT_WITTELAB", "/software/c4/wittelab/software")), "modulefiles")
  )
)
