# Install latex packages on Fedora 28

pkgs <- c(
  "ctex", "fandol", "multirow", "wrapfig",
  "float", "oberdiek", "tabu", "ulem", "makecell",
  "threeparttable", "threeparttablex", "tocloft",
  "subfig", "alegreya", "sourcecodepro"
)

con_tex_fedora <- file("latex/TeXLive-fedora.pkgs")
writeLines(sort(paste0("texlive-", pkgs)), con = con_tex_fedora)
close(con_tex_fedora)

# 列出已安装的 latex 包
# yum list installed | grep texlive-\*
# sudo yum install yum-utils
# sudo yum-builddep octave
# yum deplist octave

# 重装 R 包
db <- installed.packages()
db <- as.data.frame(db, stringsAsFactors = FALSE)
db[db$Built < "3.5.1", "Package"]

# 查询 repos
rforge <- available.packages(repos = "https://r-forge.r-project.org/")
cran <- available.packages(repos = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/")
setdiff(rforge[, "Package"], cran[, "Package"])

# 排序 LaTeX 包
con_tex <- file("latex/TeXLive.pkgs")
writeLines(sort(readLines(con_tex), decreasing = FALSE), con = con_tex)
close(con_tex)
