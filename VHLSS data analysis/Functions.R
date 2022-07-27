#Name: Gia Mien Le
#Date: On-going
#File name: Functions.R

#Function: Loading existing dataframes into R
#' Title
#'
#' @param path_name 
#' @param file_name 
#'
#' @return
#' @export
#'
#' @examples
Load_DataFrame <- function(path_name, file_name) {
  setwd(path_name)
  getwd()
  load(file_name)
}


#Function: Package installation
Install_pkg <- function(pkg_name) {
  if(pkg_name %in% rownames(installed.packages()) == FALSE) {
    print("Package installing...")
    install.packages(pkg_name)
  }
  else {
    print("Package already installed")
  }
}


#Function: calling installed packages
call_pkg <- function() {
  library(labelled)
  library(haven)
  library(dplyr)
  library(tibble)
  library(visNetwork)
  library(usethis)
  library(targets)
  library(tidyr)
  library(sjlabelled)
  library(arsenal)
  library(janitor)
  library(diffdf)
  library(sjmisc)
  library(tidyverse)
  library(formattable)
  library(data.table)
  library(RColorBrewer)
  library(grid)
  library(tinytex)
  library(patchwork)
  library(pwt10)
  library(reshape)
}


#Function: Importing .dta files into an R dataframe
get_dta_files <- function(path_name) {
  setwd(path_name)

  file_list <- list.files(path = ".", pattern = "*.dta")
  
}

# Function: Importing .txt files into an R dataframe.
get_pop_data_txt <- function(file_path) {

  pop_data <- read.delim(file_path)
  
  return(pop_data)
}


# Function to get GDP data.
get_GDP_data <- function(Year) {
  GDP_df <- filter(pwt10.0, country == "Viet Nam" & year %in% Year )
  GDP_df <- select(GDP_df, c("year", "cgdpe"))
  
  return(GDP_df)
}
#--------------------------------------------Cleaning up data section------------------------------------------------------------------------------

#foreign::read.dta() does not work for Stata version 5-12 --> use haven::read_dta() instead.
import_dta_files <- function(file_list, file_path) {
    setwd(file_path)
    conv_file <- lapply(X = file_list, FUN = function(one_dta_file) {
      haven::read_dta(one_dta_file, .name_repair = "unique")
    })
}


#Naming data frames
name_dataframes <- function(data_list, conv_data_list) {
  if (length(data_list) != length(conv_data_list)) {
    stop("Why are the lengths different in name_dataframes()?")
  }
  conv_data_list %>%
    magrittr::set_names(data_list)
}

# Function to get all the sample households
Total_sample_household <- function(hh_list) {
  for (name in names(hh_list)) {
    if (name %in% c("wt2014.dta", "oldHO1.dta", "wrongcalculationHO3.dta", "Ho_79.dta", "Ho_87.dta", 
                    "Ho_92.dta", "Ho_89.dta", "MUC4D_VHLSS.dta", "HO1.dta", "HO3.dta", "HO4.dta")) {
      hh_list[[name]] <- NULL
    }
  }
  new_df <- select(hh_list[[1]], c("tinh", "huyen", "xa", "diaban", "hoso"))
  for (x in 2:length(hh_list)) {
    new_df <- unique(bind_rows(new_df, select(hh_list[[x]], c("tinh", "huyen", "xa", "diaban", "hoso"))))
  }
  new_df <- unique(new_df)
  
  return(new_df)
}


# Function to add expenditure rows to get the most complete sample data.
Add_exp_rows <- function(exp_list, folder_list) {
  new_df1 <- data.frame()
  
  for (x in 1:length(folder_list)) {
    if(tolower(names(folder_list[x])) %in% exp_list) {
      new_df1 <- bind_rows(new_df1, data.frame(select(folder_list[[x]], c("tinh", "huyen", "xa", "diaban", "hoso"))))
    }
  }
  new_df2 <- unique(drop_na(new_df1))
  
  print(paste(exp_list))
  print(nrow(new_df1))
  print(nrow(new_df2))
  print(percent((nrow(new_df1) - nrow(new_df2))/nrow(new_df1)))
  
  return(new_df2)
}

#Adding lists function
Add_list <- function(ex_list, add_list) {
  
  for (obj in add_list) {
    if (obj %in% ex_list) {
      print("Object already exists. Reject!")
    }else{
      print("Object does not exist. Commence addition...")
      ex_list <- append(ex_list, obj)
      print("Added!")
    }
  }
  return(ex_list)
}

# This functions deals with if it is a list of lists
make_list <- function(ex_list, Big_list) {
  for (obj in Big_list) {
      ex_list <- Add_list(ex_list, obj)
  }
  return(ex_list)
}

# Initial Filtering population data
Sample_data <- function(data_list, name_list, exp_df1, exp_df2) {
  
  init_list1 <- list()
  
  for (x in seq(1, length(data_list))) {
    for (obj in name_list) {
      if (identical(tolower(names(data_list[x])), obj)==FALSE) {
        print("Skip object!")
      }else{
        init_list1 <- append(init_list1, data_list[x])
        print("Success")
      }
    }
  }
  
  sample_df <- Sample_ext(init_list1)
  
  print(c("BEFORE:", nrow(sample_df)))
  
  new_sample_df <- inner_join(inner_join(sample_df, exp_df1), exp_df2)
  
  print(c("AFTER:", nrow(new_sample_df)))
  
  return(new_sample_df)
  
  
}


# Combining all possible population data in the given list
Sample_ext <- function(WB_list) {
  new_list <- list()
  cnt = 1
  pop_data <- data.frame()
  
  for (obj in 1:length(WB_list)) {
    if (length(new_list) == 0) {
      new_list[[cnt]] <- data.frame(select(WB_list[[obj]], c(1:5)))
      cnt = cnt + 1
    } else {
      new_list[[cnt]] <- data.frame(select(WB_list[[obj]], c(1:5)))
      cnt = cnt + 1
    }
    
  }
  
  print(c("Before:", nrow(new_list[[1]])))
  pop_data <- drop_na(unique(new_list[[1]]))
  print(c("After:", nrow(pop_data)))
  
  print(length(new_list))

  for (x in 2:length(new_list)) {
    print(c("Before:", nrow(pop_data)))
    pop_data <- unique(drop_na(data.frame(inner_join(pop_data, new_list[[x]]))))
    print(c("After:", nrow(pop_data)))
  }

  print(length(new_list))
  print(length(WB_list))
  
  print(c("Finally,", nrow(pop_data)))
  return(pop_data)
  
}


# Column extraction for 2012 household data
HH_2012_data_ext <- function(dataframe, ind_min, ind_max, short_str) {
  v_df <- data.frame(subset(dataframe, select = c("tinh", "huyen", "xa", "diaban", "hoso")))
  emp_list = list()

  for (obj in colnames(dataframe)) {
    if (substr(obj,ind_min,ind_max) == short_str) {
      if (!substr(obj, ind_min, ind_max) %in% emp_list) {
        emp_list <- append(emp_list, obj)
      }
    }
  }

  for (obj in emp_list) {
    print(obj)
    v_df <- cbind(data.frame(v_df, subset(dataframe, select = obj)))
  }

  n_df <- pivot_longer(v_df, starts_with(short_str), names_to = "Code name", values_to = short_str)

  return(n_df)
}


#Function to clean up 2012 data
HH_2012_data_filter <- function(HH_data, WB_list, colname_list) {
  obj_str = " "
  df <- data.frame()
  ext_list <- list()
  ind_min = 1

  for (obj in names(HH_data)) {
    if (tolower(obj) %in% WB_list) {
      obj_str <- obj
      print(obj_str)
    }else{
      print("Object does not exist")
    }
  }

  df <- HH_data[[obj_str]]
  
  for (x in 1:length(colname_list)) {
    ext_list[[x]] <- HH_2012_data_ext(df, ind_min, nchar(colname_list[[x]]), colname_list[[x]])
    print("Last track")
  }

  v_df <- data.frame(subset(ext_list[[1]], select = c("tinh", "huyen", "xa", "diaban", "hoso")))
  for (x in 1:length(ext_list)) {
    v_df <- cbind(data.frame(v_df, ext_list[[x]] %>% select(last_col())))
  }
  
  print(c("Before:", nrow(v_df)))
  v_df2 <- unique(drop_na(v_df))
  print(c("After:", nrow(v_df2)))
  
  return(v_df2)
}


# Function to extract necessary columns for a dataframe
Ext_data <- function(HH_data, WB_list, colname_list) {
  
  for (obj in names(HH_data)) {
    if (tolower(obj) %in% WB_list) {
      new_df <- data.frame(cbind((select(HH_data[[obj]], c("tinh", "huyen", "xa", "diaban", "hoso"))),
                                 (select(HH_data[[obj]], colname_list))))
    }
  }
  
  return(new_df)
}


# Function that gets rid of all the empty cells and repeated rows of a dataframe.
Filter_data <- function(HH_data, WB_list, colname_list) {
  new_df <- Ext_data(HH_data, WB_list, colname_list)
  
  print(c("Before:", nrow(new_df)))
  new_df2 <- unique(drop_na(new_df))
  print(c("After:", nrow(new_df2)))
  
  return(new_df2)
}



# Function that combines household and education data
Comb_edu_hh <- function (Edu_data, HH_data) {
  Edu_hh <- data.frame(inner_join(HH_data, Edu_data, by = c("Province", "District", "Commune", "Territory", "House.code", "Member.code")))
  
  print(c("Before:", nrow(Edu_hh)))
  new_Edu_hh <- unique(drop_na(Edu_hh))
  print(c("After:", nrow(new_Edu_hh)))
  
  new_df <- filter(new_Edu_hh, Relationship %in% c(1,2))
  
  return(new_df)

}


# Function that combines electricity and all types of fuels together
Comb_fuel <- function(Fuel_data, fuel_list, code_list, Elec_data) {
  sub_Fuel_data <- data.frame(drop_na(unique(subset(Fuel_data, select = c("Province", "District", "Commune", "Territory", "House.code")))))
  sub_Elec_data <- data.frame(drop_na(unique(subset(Elec_data, select = c("Province", "District", "Commune", "Territory", "House.code")))))
  
  new_sub_Elec_data <- data.frame(inner_join(sub_Fuel_data, sub_Elec_data))
  new_Elec_data <- data.frame(inner_join(new_sub_Elec_data, Elec_data, by = c("Province", "District", "Commune", "Territory", "House.code")))
  
  new_Fuel_data <- data.frame(inner_join(new_sub_Elec_data, Fuel_data, by = c("Province", "District", "Commune", "Territory", "House.code")))
  new_Fuel_data <- filter(new_Fuel_data, Product.code %in% code_list)

  new_Fuel_data$Product.code <- as.character(new_Fuel_data$Product.code)

  for (x in 1:length(code_list)) {

    new_Fuel_data$Product.code[new_Fuel_data$Product.code == code_list[x]] <- fuel_list[x]
  }

  new_fuel_df <- as.data.frame(pivot_wider(new_Fuel_data, names_from = "Product.code", values_from = "Expenditure"))
  new_fuel_df <- unique(unnest(new_fuel_df, fuel_list))
  
  new_fuel_df[is.na(new_fuel_df)] <- 0

  comb_fuel_df <- unique(inner_join(new_fuel_df, new_Elec_data, by = c("Province", "District", "Commune", "Territory", "House.code")))
  comb_fuel_df[is.na(comb_fuel_df)] <- 0
    
  return(comb_fuel_df)
}


#Filter Food data for 2012 and 2014
Food_data_filter <- function (Food_data) {
  Food_data$Food.aid <- as.numeric(Food_data$Food.aid)
  
  print(c("Before:", nrow(Food_data)))
  Food_data <- drop_na(Food_data)
  
  for (x in 1:nrow(Food_data)) {
    val <- Food_data$Food.aid[x]%%(round(Food_data$Food.aid[x]/11, digits = 0)*10) 
    Food_data$Food.aid[x] <- val
  }
  
  print(c("After:", nrow(Food_data)))
  return(Food_data)
}


# Function exclusive to 2016 and 2018 food data.
Filter_2016_food_data <- function(HH_data, WB_list, colname_list, food_df1) {
  food_df2 <- Ext_data(HH_data, WB_list, colname_list)
  print(c("Before:", nrow(food_df2)))
  
  food_df2$m8c1a[is.na(food_df2$m8c1a)] <- 0
  
  food_df <- unique(drop_na(inner_join(food_df1, food_df2, by = c("tinh", "huyen", "xa", "diaban", "hoso"))))
  
  print(c("After:", nrow(food_df)))
  return(food_df)
}


# Filter Food data for 2016
Food_2016_data_filter <- function(Food_2016_data) {
  print(c("Before:", nrow(Food_2016_data)))
  new_food_df <- data.frame(unique(drop_na(filter(Food_2016_data, m8c2maso == 218))))
  new_food_df$m8c2maso <- NULL
  
  print(c("After:", nrow(new_food_df)))
  return(new_food_df)
}


# Dealing with fuel expenditures
Add_fuel_exp <- function (fuel_data) {
  fuel_data$'Expenditure 1'[is.na(fuel_data$'Expenditure 1')] <- 0
  fuel_data$'Expenditure 2'[is.na(fuel_data$'Expenditure 2')] <- 0
  fuel_data$'Expenditure 3'[is.na(fuel_data$'Expenditure 3')] <- 0
  
  print(c("Before:", nrow(fuel_data)))
  fuel_data$Expenditure <- rowSums(fuel_data[, c("Expenditure 1", "Expenditure 2", "Expenditure 3")])
  
  fuel_data$'Expenditure 1' <- NULL
  fuel_data$'Expenditure 2' <- NULL
  fuel_data$'Expenditure 3' <- NULL
  
  new_df <- drop_na(fuel_data)
  print(c("After:", nrow(fuel_data)))
  
  return(fuel_data)
}

# Function to inner_join urban/rural data with normal population data
join_area_sample <- function(area_data, sample_data) {
  new_df <- inner_join(area_data, sample_data, by = c("Province", "District", "Commune", "Territory", "House.code"))
  
  print(c("Before:", nrow(new_df)))
  new_df2 <- unique(drop_na(new_df))
  print(c("After:", nrow(new_df2)))
  
  return(new_df2)
}
#---------------------------------------------Cleaning up data section II-------------------------------------------------------------------

# Function that sorts out education indicator based on well-being criteria.
Total_WB_edu_data <- function(Edu_hh_data, Pop_data, Mar_stat_list) {
  
  Edu_hh_data$Member.code <- NULL
  
  # new_df <- Edu_hh_data
  
  new_df <- inner_join(Edu_hh_data, Pop_data, by = c("Province", "District", "Commune", "Territory", "House.code"))
  if(length(Pop_data) == 6) {
    new_df <- new_df %>% relocate(Urban.Rural, .after = House.code)
  }
  print(nrow(Pop_data))
  print(nrow(new_df))
  
  new_df$Relationship <- as.character(new_df$Relationship)
  new_df$Relationship[new_df$Relationship == 1] <- "Household.head"
  new_df$Relationship[new_df$Relationship == 2] <- "Spouse"
  
  new_df$Marital.status <- as.character(new_df$Marital.status)
  new_df$Grade.completed <- as.numeric(new_df$Grade.completed)
  
  for (x in 1:length(c(1:5))) {
    new_df$Marital.status[new_df$Marital.status == c(1:5)[x]] <- Mar_stat_list[x]
  }
  
  #total_df <- as.data.frame(pivot_wider(new_df, names_from = "Relationship", values_from = "Grade.completed"))
  
  married_df <- as.data.frame(pivot_wider(filter(new_df, Marital.status == Mar_stat_list[2]),
                                    names_from = "Relationship", values_from = "Grade.completed"))

  print(c("Before:", length(married_df)))
  new_married_df <- drop_na(unnest(married_df, c(Household.head, Spouse)))
  print(c("After:", nrow(new_married_df)))
  
  WB_married_df <- filter(new_married_df, Household.head >= 9 & Spouse >= 9)
  WB_married_notmet_df <- filter(new_married_df, Household.head < 9 | Spouse < 9)

  other_marstat_df <- as.data.frame(pivot_wider(filter(new_df, Marital.status != Mar_stat_list[2]),
                                          names_from = "Relationship", values_from = "Grade.completed"))

  new_other_marstat_df <- unnest(other_marstat_df, Household.head)
  new_other_marstat_df$Spouse <- NULL
  print(c("Before:", nrow(new_other_marstat_df)))
  new_other_marstat_df <- drop_na(new_other_marstat_df)
  print((c("After:", nrow(new_other_marstat_df))))
  WB_other_marstat_df <- filter(new_other_marstat_df, Household.head >= 5)
  WB_other_marstat_notmet_df <- filter(new_other_marstat_df, Household.head < 5)
  
  total_df <- full_join(new_married_df, new_other_marstat_df)
  
  WB_edu_df <- full_join(WB_married_df, WB_other_marstat_df)
  WB_notmet_df <- full_join(WB_married_notmet_df, WB_other_marstat_notmet_df)
  

  final_list <- list(total_df, WB_edu_df, WB_notmet_df)
  
  return(final_list)
}


# Function that sorts out water indicator based on well-being criteria
Total_WB_water_data <- function(Water_data, Pop_data, safe_water, unsafe_water, safe_water_code, unsafe_water_code) {
  
  new_df <- inner_join(Water_data, Pop_data, by = c("Province", "District", "Commune", "Territory", "House.code"))
  print(c("Before:", nrow(new_df)))
  new_df <- unique(drop_na(new_df))
  print(c("After:", nrow(new_df)))
  
  if (length(Pop_data) == 6) {
    new_df <- new_df %>% relocate(Urban.Rural, .after = House.code)
    new_df[, 7] <- as.character(new_df[, 7])
    
    if(length(Water_data) == 6) {
      safe_water_df <- filter(new_df, Main.water.source %in% safe_water_code)
      unsafe_water_df <- filter(new_df, Main.water.source %in% unsafe_water_code)
      
    }else if (length(Water_data) == 7){
      new_df[, 8] <- as.character(new_df[, 8])
      safe_water_df <- filter(new_df, Main.water.source.for.food %in% safe_water_code & Main.water.source.for.activities %in% safe_water_code)
      unsafe_water_df <- filter(new_df, Main.water.source.for.food %in% unsafe_water_code | Main.water.source.for.activities %in% unsafe_water_code)
    }
  }else if (length(Pop_data) == 5){
  new_df[, 6] <- as.character(new_df[, 6])
  if(length(Water_data) == 6) {
    safe_water_df <- filter(new_df, Main.water.source %in% safe_water_code)
    unsafe_water_df <- filter(new_df, Main.water.source %in% unsafe_water_code)
    
  }else if (length(Water_data) == 7){
    new_df[, 7] <- as.character(new_df[, 7])
    safe_water_df <- filter(new_df, Main.water.source.for.food %in% safe_water_code & Main.water.source.for.activities %in% safe_water_code)
    unsafe_water_df <- filter(new_df, Main.water.source.for.food %in% unsafe_water_code | Main.water.source.for.activities %in% unsafe_water_code)
  }
  }
  
  final_list <- list(new_df, safe_water_df, unsafe_water_df)
  
  return(final_list)
  
}

# Function that sorts out food aid indicator based on well-being criteria
Total_WB_food_data <- function(Food_data, Pop_data) {
  new_df <- inner_join(Food_data, Pop_data, by = c("Province", "District", "Commune", "Territory", "House.code"))
  
  print(c("Before:", nrow(new_df)))
  new_df <- unique(drop_na(new_df))
  print(c("After:", nrow(new_df)))
  
  if(length(Pop_data) == 6) {
    new_df <- new_df %>% relocate(Urban.Rural, .after = House.code)
  }
  
  if (length(Food_data) == 8) {
  
    new_df$Food.aid <- as.numeric(new_df$Food.aid)
    new_df$Food <- as.numeric(new_df$Food)
    new_df$Food.stuff <- as.numeric(new_df$Food.stuff)
    
    WB_food_df <- filter(new_df, Food.aid != 1 & Food >= 2 & Food.stuff >= 2 )
    food_pov_df <- filter(new_df, Food.aid == 1 | Food < 2 | Food.stuff < 2)
    

  }else if (length(Food_data) == 7) {
    
    new_df$Food.aid <- as.numeric(new_df$Food.aid)
    new_df$Enough.food <- as.numeric(new_df$Enough.food)
    
    WB_food_df <- filter(new_df, Food.aid != 1 & Enough.food == 0)
    food_pov_df <- filter(new_df, Food.aid == 1 | Enough.food != 0)
    
  }
  
  final_list <- list(new_df, WB_food_df, food_pov_df)
  
  return(final_list)
}


# Function that sorts out modern fuel indicator based on well-being criteria
Total_WB_fuel_data <- function(Fuel_data, Pop_data, fuel_list, modern_fuel, other_fuel) {
  new_df <- inner_join(Fuel_data, Pop_data, by = c("Province", "District", "Commune", "Territory", "House.code"))

  print(c("Before:", nrow(new_df)))
  new_df <- unique(drop_na(new_df))
  print(c("After:", nrow(new_df)))
  
  if(length(Pop_data) == 6) {
    new_df <- new_df %>% relocate(Urban.Rural, .after = House.code)
  }
  
  new_df$'All fuel Sum' = rowSums(new_df[,fuel_list])
  new_df$'Modern fuel' = rowSums(new_df[, modern_fuel])
  new_df$'Other fuel' = rowSums(new_df[, other_fuel])

  print(c("Before:", nrow(new_df)))
  
  for (x in 1: nrow(new_df)) {
    if (new_df[x, "All fuel Sum"] == 0) {
      new_df <- new_df[-c(x),]
    }
  }
  
  print(c("After:", nrow(new_df)))
  
  percent <- unlist(apply(new_df, 1, function(x) {round(x["Modern fuel"]/x["All fuel Sum"], 1)}))
  new_df$Percent <-percent

  WB_Fuel_data <- filter(new_df, Percent >= 0.5)
  other_fuel_data <- filter(new_df, Percent < 0.5)

  final_list <- list(new_df, WB_Fuel_data, other_fuel_data)
  
  return(final_list)

}

#-------------------------------------------------------------Urban/Rural/Population-------------------------------------------------------
# Function to filter urban or rural areas
urban_rural_filter <- function(data_list, string) {
  if (string == "urban") {
    for (x in 1:length(data_list)) {
      data_list[[x]] <- filter(data_list[[x]], Urban.Rural == 1)
    }
  }else if (string == "rural") {
    for (x in 1:length(data_list)) {
      data_list[[x]] <- filter(data_list[[x]], Urban.Rural == 2)
    }
  }else{
    print("Invalid answer")
  }
  return(data_list)
}


# Function to add member code to the well-being dataframes
add_member_code <- function(member_data, data_list) {
  member_data <- select(member_data, c("Province", "District", "Commune", "Territory", "House.code", "Member.code"))
  for (x in 1:length(data_list)) {
    data_list[[x]] <- unique(select(data_list[[x]], c("Province", "District", "Commune", "Territory", "House.code")))
    data_list[[x]] <- inner_join(data_list[[x]], member_data, by = c("Province", "District", "Commune", "Territory", "House.code"))
    data_list[[x]] <- data_list[[x]] %>% relocate(Member.code, .after = House.code)
  }
  
  return(data_list)
}
#---------------------------------------------------Results---------------------------------------------------------

# Function that picks out the necessary data sets
data_set_choice <- function(dataframe, colnames, year) {
  dataframe <- select(dataframe, colnames)
  dataframe <- filter(dataframe, dataframe$Year %in% as.numeric(year))
}


# Function that displays the final results of well-being indicator
Results_WB <- function(WB_list, total_df, vcolnames) {
  
  cnt = 1
  
  for(obj in WB_list) {
    total <- nrow(obj[[1]])
    WB_met <- nrow(obj[[2]])
    WB_notmet <- nrow(obj[[3]])
    percentage <- round(WB_met/total, digits = 4)
    scale <- percentage*total_df[cnt, 2]
    
    total_df[cnt, 'Total'] <- total
    total_df[cnt, 'WB.met'] <- WB_met
    total_df[cnt, 'WB.not.met'] <- WB_notmet
    total_df[cnt, 'WB.Percent'] <- percentage
    total_df[cnt, "Pop scale"] <- scale
    
    cnt = cnt + 1
  }
  
  total_df$WB.Percent <- percent(total_df$WB.Percent)
  
  colnames(total_df) <- vcolnames
  
  return(total_df)
}


Combine_dataframe <- function(WB_list, total_df, number_or_sample) {
  if (number_or_sample == "sample") {
    total_df <- select(total_df, c("Year"))
    for (x in 1:length(WB_list)) {
      choice <- data.frame(select(WB_list[[x]], c(starts_with("Sample.Percent."), starts_with("Samples."))))
      total_df <- cbind(total_df, choice)
    }
  }else if (number_or_sample == "number") {
    for (x in 1:length(WB_list)) {
      choice <- data.frame(select(WB_list[[x]], c(contains("Number.Percent"), starts_with("Numbers."), last_col())))
      total_df <- cbind(total_df, choice)
    }
  }
  names(total_df)[names(total_df) == "Population"] <- "Total Population"
  return(total_df)
}

Add_total_population <- function (pop_df, Rural_list, Urban_list, number_or_sample) {
  
  if (number_or_sample == "sample") {
    total_df <- select(pop_df, c("Year"))
    for (x in 1:length(Rural_list)) {
    total_df <- cbind(total_df, select(Rural_list[[x]], c(3)) + select(Urban_list[[x]], c(3)))
    total_df <- cbind(total_df, (select(Rural_list[[x]], c(4)) + select(Urban_list[[x]], c(4)))/(select(Rural_list[[x]], c(3)) + select(Urban_list[[x]], c(3))))
    }

  } else if(number_or_sample == "number") {
    total_df <- pop_df
    for (x in 1:length(Rural_list)) {
      total_df <- cbind(total_df, select(Rural_list[[x]], c(3)) + select(Urban_list[[x]], c(3)))
      total_df <- cbind(total_df, (select(Rural_list[[x]], c(4)) + select(Urban_list[[x]], c(4)))/(select(Rural_list[[x]], c(3)) + select(Urban_list[[x]], c(3))))
      total_df <- cbind(total_df, select(Rural_list[[x]], c(7)) + select(Urban_list[[x]], c(7)))
    }
  }
  
  total_df <- data.table::setnames(total_df, c("Grade completed >= 9", "Safe Water", "Adequate Food", "Modern fuel met"), 
                       c("Percent.WB.Education", "Percent.WB.Water", "Percent.WB.Food", "Percent.WB.Fuel"))
  
  total_df$Percent.WB.Education <- percent(total_df$Percent.WB.Education)
  total_df$Percent.WB.Water <- percent(total_df$Percent.WB.Water)
  total_df$Percent.WB.Food <- percent(total_df$Percent.WB.Food)
  total_df$Percent.WB.Fuel <- percent(total_df$Percent.WB.Fuel)
  
  
  return(total_df)
}


Percent_all_WB_year <- function(pop_df, WB_list, member_data) {

  WB_df <- unique(select(WB_list[[1]][[2]], c("Province", "District", "Commune", "Territory", "House.code")))
  member_data <- select(member_data, c("Province", "District", "Commune", "Territory", "House.code", "Member.code"))

  for (obj in WB_list) {
    obj[[2]] <- unique(select(obj[[2]], c("Province", "District", "Commune", "Territory", "House.code")))
    WB_df <- inner_join(WB_df, obj[[2]], by = c("Province", "District", "Commune", "Territory", "House.code") )
  }
  
  WB_df <- inner_join(WB_df, member_data, by = c("Province", "District", "Commune", "Territory", "House.code")) 
  
  total_num <- nrow(WB_list[[2]][[1]])
  WB_num <- nrow(WB_df)
  percent <- percent(WB_num/total_num)
  scale <- pop_df*percent
  
  results <- c(total_num, WB_num, percent, scale)
  
  return(results)
}


Percent_all_WB <- function(pop_df, WB_all_list) {
  cnt = 1
  total_df <- data.frame()
  for (obj in WB_all_list) {
    total_df[cnt, "Total.WB"] <- obj[1]
    total_df[cnt, "Number.WB"] <- obj[2]
    total_df[cnt, "Percent.WB"] <- obj[3]
    total_df[cnt, "Population.scale"] <- obj[4]
    
    cnt = cnt + 1
  }
  
  total_df <- cbind(pop_df, total_df)
  total_df$Percent.WB <- percent(total_df$Percent.WB)
  
  return(total_df)
}


Add_all_WB_total <- function (pop_df, Rural_df, Urban_df) {
  total_df <- pop_df
  
  total_df$Total.WB <- Rural_df$Total.WB + Urban_df$Total.WB
  total_df$Number.WB <- Rural_df$Number.WB + Urban_df$Number.WB
  total_df$Percent.WB <- total_df$Number.WB/total_df$Total.WB
  total_df$Population.scale <- Rural_df$Population.scale + Urban_df$Population.scale
  
  total_df$Percent.WB <- percent(total_df$Percent.WB)
  
  return(total_df)
}


Percent_sample_dropped <- function(init_sample, final_sample) {
  new_df<- inner_join(init_sample, final_sample, by = c("Year"))
  
  new_df$Ideal.Complete.Sample <- c(9399, 9402, 9399, 9399, 9399)
  
  new_df$Percent.dropped <- percent((new_df$Total.households - new_df$Final.Sample)/new_df$Total.households)
  
  return(new_df)
}

#-------------------------------------------------Graphing functions-------------------------------------------------------------------
facet_graph <- function(total_df, text, coeff, WB_vector, WB_vector_year) {
  
  total_df$Year <- as.character(total_df$Year)
  
  alter_df <- select(total_df, c("Year", "Scale.Education", "Scale.Water", "Scale.Food", "Scale.Fuel")) %>%
    gather(key = "WB.Indicator", value = "Population", c("Scale.Education", "Scale.Water", "Scale.Food", "Scale.Fuel"))
  
  alter_df2 <- select(total_df, WB_vector_year) %>%
    gather(key = "Percent.WB", value = "Percent.value", WB_vector)
  
  final_df <- cbind(select(alter_df, c("Year", "WB.Indicator", "Population")), select(alter_df2, c("Percent.WB", "Percent.value")))
  
  ggplot(final_df, aes(x = Year, group = 1)) +
    ggtitle(text) +
    geom_col(aes(y = Population/1000000, fill = "Population"), width = 0.5, colour = "black") +
    facet_wrap(~WB.Indicator, labeller = as_labeller(c("Scale.Education" = "Education",
                                                       "Scale.Food" = "Food",
                                                       "Scale.Fuel" = "Fuel",
                                                       "Scale.Water" = "Water"))) +
    geom_line(aes(y = Percent.value*coeff, color = "Percentage"), size = 0.75, linetype = "solid") +
    
    scale_y_continuous(name = "Population (million people)",
                       sec.axis = sec_axis(~./coeff, name = "Well-being achieved (%)", labels = scales::label_percent(),
                                           breaks = seq(0, 1, 0.2)),
                       limits = c(0, coeff),
                       expand = c(0,0),
                       breaks = seq(0, coeff, 20)) +
    scale_fill_manual(values = c("light blue")) +
    scale_color_manual(values = c("red")) +
    theme_bw() +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
          axis.ticks.length.y = unit(-0.15, "cm"),
          axis.ticks.x = element_blank(),
          legend.position = "bottom",
          legend.title = element_blank(),
          strip.text = element_text(face = "bold"),
          plot.title = element_text(hjust = 0.5))
}


graph_4_WB <- function(total_df) {
  total_df$Year <- as.character(total_df$Year)
  total_df$Percent.WB <- as.numeric(total_df$Percent.WB)
  
  ggplot(total_df, aes(x = Year, group = 1)) +
    geom_col(aes(y = Population.scale/1000000, fill = "Population"), width = 0.25, colour = "black") +
    geom_line(aes(y = Percent.WB*35, color = "Percentage"), size = 0.75, linetype = "solid") +
    scale_y_continuous(name = "Population (million people)",
                       sec.axis = sec_axis(~./35, name = "Well-being achieved (%)", labels = scales::label_percent(),
                                           breaks = seq(0, 1, 0.2)),
                       limits = c(0, 35),
                       expand = c(0,0),
                       breaks = seq(0, 35, 5)) +
    scale_fill_manual(values = c("light blue")) +
    scale_color_manual(values = c("red")) +
    theme_bw() +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          axis.ticks.length.y = unit(-0.15, "cm"),
          axis.ticks.x = element_blank(),
          legend.title = element_blank(),
          legend.position = "bottom")
}

Sum_graph_4_WB <- function(total_df, urban_df, rural_df){
  total_df$Year <- as.character(total_df$Year)
  
  urban_df <- select(urban_df, c("Percent.WB", "Population.scale"))
  colnames(urban_df) <- c("Urban.WB", "Urban")
  
  rural_df <- select(rural_df, c("Percent.WB", "Population.scale"))
  colnames(rural_df) <- c("Rural.WB", "Rural")
  
  total_df <- select(total_df, c("Year", "Percent.WB", "Population.scale"))
  colnames(total_df) <- c("Year","Total.WB", "Total")
  
  final_df <- cbind(cbind(total_df, urban_df), rural_df)
  
  alter_df <- gather(final_df, key = "Area", value = "Population", c("Total", "Urban", "Rural")) %>% select(c("Year", "Area", "Population"))
  alter_df2 <- gather(final_df, key = "Area", value = "Percent", c("Total.WB", "Urban.WB", "Rural.WB")) %>% select("Percent")
  
  sum_df <- cbind(alter_df, alter_df2)
  
  sum_df$Area <- factor(sum_df$Area, levels = c("Rural", "Urban", "Total"))
  
  ggplot(sum_df, aes(x = Year, group = 1)) +
    geom_col(aes(y = Population/1000000, fill = "Population"), width = 0.25, colour = "black", color = "black") +
    geom_line(aes(y = Percent*35, color = "Percentage"), size = 0.75, linetype = "solid") +
    facet_wrap(~Area, ncol = 3) +
    scale_y_continuous(name = "Population (million people)",
                       sec.axis = sec_axis(~./35, name = "Well-being achieved (%)", labels = scales::label_percent(),
                                           breaks = seq(0, 1, 0.2)),
                       limits = c(0, 35),
                       expand = c(0,0),
                       breaks = seq(0, 35, 5)) +
    scale_fill_manual(values = "light blue") +
    scale_color_manual(values = "red") +
    theme_bw() +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          axis.ticks.length.y = unit(-0.15, "cm"),
          axis.ticks.x = element_blank(),
          strip.text = element_text(face = "bold"),
          legend.title = element_blank(),
          legend.position = "bottom")
}


sample_graph <- function(percent_sample_df) {
  percent_sample_df$Year <- as.character(percent_sample_df$Year)
  ggplot(percent_sample_df, aes(x = Year, group = 1)) +
    geom_line(aes(y = Final.Sample/1000, linetype = "Analyzed household samples"), size = 1) +
    geom_line(aes(y = Total.households/1000, linetype = "Total household samples"), size = 1) +
    theme_bw() +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          axis.ticks.length = unit(-0.15, "cm"),
          plot.title = element_text(hjust = 0.5),
          legend.title = element_blank(),
          legend.position = "bottom") +
    scale_y_continuous(breaks = seq(0, 120, 20),
                       limits = c(0, 120),
                       expand = c(0,0)) +
    ggtitle("Total vs. Analyzed Household Samples") +
    ylab("Number of households (thousands)")
}



total_population_graph <- function(Pop_data) {
  pop_df <- filter(Pop_data, Year %in% c(2010:2018))
  pop_df$Year <- as.character(pop_df$Year)
  
  pop_df <- gather(pop_df, key = "Area.type", value = "Population", c("Population", "Urban.Population", "Rural.Population"))
  pop_df$Area.type <- factor(pop_df$Area.type, level = c("Rural.Population", "Urban.Population", "Population"))
  
  ggplot(pop_df, aes(x = Year, y = Population/1000000)) +
    geom_col(width = 0.5, fill = "orange", color = "black") +
    facet_wrap(~ Area.type, labeller = as_labeller(c("Population" = "Total",
                                                     "Rural.Population" = "Rural",
                                                     "Urban.Population" = "Urban"))) +
    theme_bw() +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          axis.ticks.length = unit(-0.15, "cm"),
          axis.ticks.x = element_blank(),
          strip.text = element_text(face = "bold"),
          plot.title = element_text(hjust = 0.5)) +
    scale_y_continuous(name = "Population (million)",
                       limits = c(0, 100),
                       expand = c(0, 0),
                       breaks = seq(0, 100, 20)) +
    ggtitle("Vietnam's total, urban, and rural population")
}


GDP_growth_graph <- function(GDP_WB) {
  sum_df <- GDP_WB
  for (y in 2:length(GDP_WB)) {
    for (x in 1:nrow(GDP_WB)) {
      sum_df[x, y] <- round(sum_df[x, y]/GDP_WB[1, y], 2)
    }
  }
  
  alter_df <- melt(sum_df, id.vars = 'year')
  alter_df$variable <- factor(alter_df$variable, level = c("cgdpe", "Population.scale", "Scale.Education",
                                                           "Scale.Water", "Scale.Food", "Scale.Fuel"))
  
  ggplot(alter_df, aes(x = year, y = value)) +
    geom_line(aes(color = variable, linetype = variable), size = 0.75) +
    scale_y_continuous(name = "Growth rate",
                       breaks = seq(0, 2.2, 0.2),
                       limits = c(0, 2.2),
                       expand = c(0,0)) +
    scale_linetype_manual(labels = c("GDP", 'All Well-being indicators', 'Education', 'Water', 'Food', 'Fuel'),
                          values = c("solid", "solid", "dashed", "dashed", "dashed", "dashed")) +
    scale_color_manual(labels = c("GDP", 'All Well-being indicators', 'Education', 'Water', 'Food', 'Fuel'),
                       values = c("black", "red", "blue", "orange", "green", "maroon")) +
    theme_bw() +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          axis.ticks.length = unit(-0.15, "cm"),
          legend.title = element_blank(),
          plot.title = element_text(hjust = 0.5)) +
    ggtitle("GDP growth rate vs. Human well-being growth rate in Vietnam")+
    xlab("Year")
}
