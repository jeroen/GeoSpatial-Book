local({
  options(
    bitmapType = "cairo",
    citation.bibtex.max = 999,
    BioC_mirror = "https://mirrors.tuna.tsinghua.edu.cn/bioconductor",
    repos = c(
      CRAN = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/",
      RForge = "https://r-forge.r-project.org",
      inla = "https://inla.r-inla-download.org/R/stable"
    )    
  )
  # Sys.getenv('RSTUDIO_PANDOC') 
  # Ugly hacker for Pandoc on MY CentOS
  if(file.exists('/etc/centos-release')){
    Sys.setenv(CENTOS_PANDOC = "~/.local/bin") # $HOME/.local/bin does not work here
    if (Sys.which('pandoc') == '') Sys.setenv(PATH = paste(
      Sys.getenv('PATH'), Sys.getenv('CENTOS_PANDOC'), 
      sep = if (.Platform$OS.type == 'unix') ':' else ';'
    ))    
  }
  .libPaths(c("/usr/lib64/R/site-library/", "/usr/lib64/R/library", "/usr/share/R/library"))
})
