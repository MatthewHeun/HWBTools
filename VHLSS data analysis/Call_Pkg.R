
# #Source file from lab computer
# source("C:/Users/gvl2.CALVINAD/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/VHLSS data analysis/Functions.R")

# Source file from personal computer
source("C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/HWBTools/VHLSS data analysis/Functions.R")


# dataframe_path = "C:/Users/gvl2.CALVINAD/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/VHLSS data analysis"
dataframe_path = "C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/HWBTools/VHLSS data analysis"
dataframe_file = "DataFrames.RData"

setwd(dataframe_path)

# Installing and calling packages
pkg_List = list("labelled", "haven", "foreign", "tidyverse", "dplyr","tibble", "visNetwork", "usethis", "targets", "tidyr",
                "sjlabelled", "arsenal", "janitor", "diffdf", "sjmisc", "tidyverse", "formattable", "data.table", "RColorBrewer",
                "grid", "patchwork", "pwt10", "reshape")
for (pkg in pkg_List) {
  if (pkg %in% rownames(installed.packages())) {
    print("Package already installed!")
  }else{
    print("Package installing...")
    Install_pkg(pkg)
  }
  
}

call_pkg()