#---------------------------------------------------------------------------Introduction------------------------------------------------------------------------------

# # Name: Gia Mien Le
# # Professor Matthew Heun
# # Starting Date: June 23, 2022
# # File name: Start_page.R

# # Description: This file should be the first to run when you open RStudio. You will see the sourcing at first hand "Source file from personal
# #              computer". Since Start_page.R uses a function in the Functions.R, sourcing calls the file through the provided address where it 
# #              could access the function. The current source is either from my own personal computer or the lab computer under my account so
# #              you might want to change the address into where you placed your R project.
# 
# #              dataframe_path is a string of this R project's address. The function setwd(dataframe_apth) makes sure that the directory you are accessing
# #              is the R project you are currently running. Make sure it is set up in the correct directory or else the code wouldn't run properly.
# #              Ignore the dataframe_file for now, I just left it there in cases of certain situations coming up that might make it useful.
# 
# #              pkg_List is a list of packages installed in this project. The function Install_pkg(pkg_List) will install any package that you include
# #              in the pkp_List.
# #              I installed and called the "easypackages" package separately since I wanted to use its function to call all packages at once after installation
# #              instead of going through and calling each of them using library(). At the bottom of this file, you'll find libraries(pkg_List) which loads all
# #              package names included in the pkg_List into the project.
# 
# #              The main part of the program runs on target (of course, after function). Target is a pipe-line toolkit with a parallel analysis function.  
# #              I included a separate installation for "target" from the pkg_List. You can see that I "did" include "target" in the pkg_List but it was 
# #              not called as I hope it would. Refer to this website for more information on "target": https://books.ropensci.org/targets/
# #              If you already have _targets.R (the main target page) file set up and ready, type "tar_make()" in the console. That's how you run
# #              the _targets.R file. 
# 
# #              And that's for the starting page.


#--------------------------------------------------------------------------------Main code------------------------------------------------------------------------------

#Source file from lab computer
# source("C:/Users/gvl2/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/VHLSS data analysis/Functions.R")

# Source file from personal computer
 source("C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/HWBTools/VHLSS data analysis/Functions.R")



 # dataframe_path = "C:/Users/gvl2/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/VHLSS data analysis"
dataframe_path = "C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/HWBTools/VHLSS data analysis/"
dataframe_file = "DataFrames.RData"

setwd(dataframe_path)

# Creating a DESCRIPTION file
use_description(check_name = FALSE)

# Installing packages that load the packages into the project
if("easypackages" %in% rownames(installed.packages()) == FALSE) {
  print("Package installing...")
  install.packages("easypackages")
}

library(easypackages)


#Target package installation
if("targets" %in% rownames(installed.packages()) == FALSE) {
  print("Package installing...")
  install.packages("targets")
}

library(targets)


#Roxygen package installation
if("roxygen2" %in% rownames(installed.packages()) == FALSE) {
  print("Package installing...")
  install.packages("roxygen2")
}

library(roxygen2)



# Installing and calling packages
pkg_List = c("labelled", "haven", "foreign", "tidyverse", "dplyr","tibble", "visNetwork", "usethis", "targets", "tidyr",
                "sjlabelled", "arsenal", "janitor", "diffdf", "sjmisc", "tidyverse", "formattable", "data.table", "RColorBrewer",
                "grid", "patchwork", "pwt10", "reshape", "devtools", "readxl", "XLConnect")
for (pkg in pkg_List) {
  if (pkg %in% rownames(installed.packages())) {
    print("Package already installed!")
  }else{
    print("Package installing...")
    Install_pkg(pkg)
  }
  
}

libraries(pkg_List)

devtools::load_all()



