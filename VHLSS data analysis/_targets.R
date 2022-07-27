#Name: Gia Mien Le
#Date: On-going
#File name: _targets.R


# #Source file lab computer
# source("C:/Users/gvl2.CALVINAD/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/VHLSS data analysis/Functions.R")
# source("C:/Users/gvl2.CALVINAD/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/VHLSS data analysis/Column_label.R")
# source("C:/Users/gvl2.CALVINAD/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/VHLSS data analysis/List.R")

# Source file personal computer
source("C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/VHLSS data analysis/Functions.R")
source("C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/VHLSS data analysis/Column_label.R")
source("C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/VHLSS data analysis/List.R")

#Target package installation
install.packages("targets")
library(targets)

#Required packages for analysis
tar_option_set(packages = c("labelled", "haven", "foreign", "tidyverse", "dplyr","tibble",
                            "visNetwork", "usethis", "sjlabelled", "formattable", "RColorBrewer",
                            "patchwork", "pwt10", "reshape"))

#.dta file paths in lab computer
# hh_2010_path = "C:/Users/gvl2/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/VHLSS Raw data/6 - VHLSS2010/2 - Data/1 - Household"
# hh_2012_path = "C:/Users/gvl2/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/VHLSS Raw data/7 - VHLSS 2012/3 - Raw Data/2 - Household 2012"
# hh_2014_path = "C:/Users/gvl2/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/VHLSS Raw data/8 - VHLSS 2014/2 - Data/2 - Households"
# hh_2016_path = "C:/Users/gvl2/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/VHLSS Raw data/9 - VHLSS 2016/Data/Household"
# pop_path = "C:/Users/gvl2/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/VHLSS data analysis/Population data.txt"

# .dta file path in personal computer
hh_2010_path = "C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/VHLSS Raw data/6 - VHLSS2010/2 - Data/1 - Household"
hh_2012_path = "C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/VHLSS Raw data/7 - VHLSS 2012/3 - Raw Data/2 - Household 2012"
hh_2014_path = "C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/VHLSS Raw data/8 - VHLSS 2014/2 - Data/2 - Households"
hh_2016_path = "C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/VHLSS Raw data/9 - VHLSS 2016/Data/Household"
hh_2018_path = "C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/VHLSS Raw data/10 - VHLSS 2018/2 - Data/1 - Households"
pop_path = "C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/VHLSS data analysis/Population data.txt"
urban_rural_path_2012 = "C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/VHLSS Raw data/7 - VHLSS 2012/2 - Data_household/ho11.dta"

#List of target objects
list(
  
#-----------------------------------------------------------Variables for calculations--------------------------------------------------------------------
  tar_target(Init_2010_List, list(Init_Sample_2010, Edu_hh_2010, Water_2010, Food_2010, Comb_Fuel_2010)),
  tar_target(Init_2012_List, list(Init_Sample_2012, Edu_hh_2012, Water_2012, Food_2012, Comb_Fuel_2012)),
  tar_target(Init_2014_List, list(Init_Sample_2014, Edu_hh_2014, Water_2014, Food_2014, Comb_Fuel_2014)),
  tar_target(Init_2016_List, list(Init_Sample_2016, Edu_hh_2016, Water_2016, Food_2016, Comb_Fuel_2016)),
  tar_target(Init_2018_List, list(Init_Sample_2018, Edu_hh_2018, Water_2018, Food_2018, Comb_Fuel_2018)),

  
  
  tar_target(List_2010, list(WB_Edu_2010[[1]], WB_Water_2010[[1]], WB_Food_2010[[1]], WB_Fuel_2010[[1]])),
  tar_target(List_2012, list(WB_Edu_2012[[1]], WB_Water_2012[[1]], WB_Food_2012[[1]], WB_Fuel_2012[[1]])),
  tar_target(List_2014, list(WB_Edu_2014[[1]], WB_Water_2014[[1]], WB_Food_2014[[1]], WB_Fuel_2014[[1]])),
  tar_target(List_2016, list(WB_Edu_2016[[1]], WB_Water_2016[[1]], WB_Food_2016[[1]], WB_Fuel_2016[[1]])),
  tar_target(List_2018, list(WB_Edu_2018[[1]], WB_Water_2018[[1]], WB_Food_2018[[1]], WB_Fuel_2018[[1]])),
  
  
  
  tar_target(Total_Household_2010, Total_sample_household(Named_HH_2010)),
  tar_target(Total_Household_2012, Total_sample_household(Named_HH_2012)),
  tar_target(Total_Household_2014, Total_sample_household(Named_HH_2014)),
  tar_target(Total_Household_2016, Total_sample_household(Named_HH_2016)),
  tar_target(Total_Household_2018, Total_sample_household(Named_HH_2018)),

  tar_target(Nrows_total_households, data.frame(Year = Year, Total.households = c(nrow(Total_Household_2010), nrow(Total_Household_2012), nrow(Total_Household_2014),
                                                                                  nrow(Total_Household_2016), nrow(Total_Household_2018)))),
  
    
  tar_target(Area_2010, Table_label_pop(Ext_data(Named_HH_2010, area_2010_list, area_colnames1))),
  tar_target(Area_2012, Table_label_pop(select(haven::read_dta(urban_rural_path_2012), area_colnames2))),
  tar_target(Area_2014, Table_label_pop(Ext_data(Named_HH_2014, area_2014_list, area_colnames1))),
  tar_target(Area_2016, Table_label_pop(Ext_data(Named_HH_2016, area_2016_list, area_colnames1))),
  tar_target(Area_2018, Table_label_pop(Ext_data(Named_HH_2018, area_2018_list, area_colnames1))),

 
     
  tar_target(File_2010, get_dta_files(hh_2010_path)),
  tar_target(File_2012, get_dta_files(hh_2012_path)),
  tar_target(File_2014, get_dta_files(hh_2014_path)),
  tar_target(File_2016, get_dta_files(hh_2016_path)),
  tar_target(File_2018, get_dta_files(hh_2018_path)),
 
  
   
  tar_target(Pop_data, get_pop_data_txt(pop_path)),
  tar_target(GDP_data, get_GDP_data(Year)),
  
  
  
  tar_target(Data_2010, import_dta_files(File_2010, hh_2010_path)),
  tar_target(Data_2012, import_dta_files(File_2012, hh_2012_path)),
  tar_target(Data_2014, import_dta_files(File_2014, hh_2014_path)),
  tar_target(Data_2016, import_dta_files(File_2016, hh_2016_path)),
  tar_target(Data_2018, import_dta_files(File_2018, hh_2018_path)),
  
  
  
  tar_target(Named_HH_2010, name_dataframes(File_2010, Data_2010)),
  tar_target(Named_HH_2012, name_dataframes(File_2012, Data_2012)),
  tar_target(Named_HH_2014, name_dataframes(File_2014, Data_2014)),
  tar_target(Named_HH_2016, name_dataframes(File_2016, Data_2016)),
  tar_target(Named_HH_2018, name_dataframes(File_2018, Data_2018)),
  
  
  
  tar_target(Edu_exp_2010, Add_exp_rows(edu_exp_2010_list, Named_HH_2010)),
  tar_target(Edu_exp_2012, Add_exp_rows(edu_exp_2012_list, Named_HH_2012)),
  tar_target(Edu_exp_2014, Add_exp_rows(edu_exp_2014_list, Named_HH_2014)),
  tar_target(Edu_exp_2016, Add_exp_rows(edu_exp_2016_list, Named_HH_2016)),
  tar_target(Edu_exp_2018, Add_exp_rows(edu_exp_2018_list, Named_HH_2018)),

  tar_target(Nrows_Edu_exp, data.frame(Year = Year, Rows = c(nrow(Edu_exp_2010), nrow(Edu_exp_2012), nrow(Edu_exp_2014),
                         nrow(Edu_exp_2016), nrow(Edu_exp_2018)))),

  
  
  tar_target(Muc3_exp_2010, Add_exp_rows(muc3_exp_2010_list, Named_HH_2010)),
  tar_target(Muc3_exp_2012, Add_exp_rows(muc3_exp_2012_list, Named_HH_2012)),
  tar_target(Muc3_exp_2014, Add_exp_rows(muc3_exp_2014_list, Named_HH_2014)),
  tar_target(Muc3_exp_2016, Add_exp_rows(muc3_exp_2016_list, Named_HH_2016)),
  tar_target(Muc3_exp_2018, Add_exp_rows(muc3_exp_2018_list, Named_HH_2018)),
  
  tar_target(Nrows_Muc3_exp, data.frame(Year = Year, Rows = c(nrow(Muc3_exp_2010), nrow(Muc3_exp_2012), nrow(Muc3_exp_2014),
                                                             nrow(Muc3_exp_2016), nrow(Muc3_exp_2018)))),
  
  
  
  tar_target(Sample_var_2010_list, make_list(exp_2010_list, Folder_2010)),
  tar_target(Sample_var_2012_list, make_list(exp_2012_list, Folder_2012)),
  tar_target(Sample_var_2014_list, make_list(exp_2014_list, Folder_2014)),
  tar_target(Sample_var_2016_list, make_list(exp_2016_list, Folder_2016)),
  tar_target(Sample_var_2018_list, make_list(exp_2018_list, Folder_2018)),

  
  
  tar_target(Init_Sample_2010, Table_label_pop(Sample_data(Named_HH_2010, Sample_var_2010_list, Edu_exp_2010, Muc3_exp_2010))),
  tar_target(Init_Sample_2012, Table_label_pop(Sample_data(Named_HH_2012, Sample_var_2012_list, Edu_exp_2012, Muc3_exp_2012))),
  tar_target(Init_Sample_2014, Table_label_pop(Sample_data(Named_HH_2014, Sample_var_2014_list, Edu_exp_2014, Muc3_exp_2014))),
  tar_target(Init_Sample_2016, Table_label_pop(Sample_data(Named_HH_2016, Sample_var_2016_list, Edu_exp_2016, Muc3_exp_2016))),
  tar_target(Init_Sample_2018, Table_label_pop(Sample_data(Named_HH_2018, Sample_var_2018_list, Edu_exp_2018, Muc3_exp_2018))),
  
  tar_target(Nrows_Init_Sample, data.frame(Year = Year, Rows = c(nrow(Init_Sample_2010), nrow(Init_Sample_2012),
                                                                 nrow(Init_Sample_2014), nrow(Init_Sample_2016), nrow(Init_Sample_2018)))),

  
  
  tar_target(HH_2010, Table_label_hh(Ext_data(Named_HH_2010, Folder_2010[["hh_2010_list"]], hh_2010_colnames))),
  tar_target(HH_2012, Table_label_hh(HH_2012_data_filter(Named_HH_2012, Folder_2012[["hh_2012_list"]], hh_2012_colnames))),
  tar_target(HH_2014, Table_label_hh(Ext_data(Named_HH_2014, Folder_2014[["hh_2014_list"]], hh_2014_colnames))),
  tar_target(HH_2016, Table_label_hh(Ext_data(Named_HH_2016, Folder_2016[["hh_2016_list"]], hh_2016_colnames))),
  tar_target(HH_2018, Table_label_hh(Ext_data(Named_HH_2018, Folder_2018[["hh_2018_list"]], hh_2018_colnames))),
  
  tar_target(Nrows_HH, data.frame(Year = Year, Rows = c(nrow(HH_2010), nrow(HH_2012), nrow(HH_2014), nrow(HH_2016), nrow(HH_2018)))),
  
  tar_target(Edu_2010, Table_label_edu(Ext_data(Named_HH_2010, Folder_2010[["edu_2010_list"]], edu_2010_colnames))),
  tar_target(Edu_2012, Table_label_edu(HH_2012_data_filter(Named_HH_2012, Folder_2012[["edu_2012_list"]], edu_2012_colnames))),
  tar_target(Edu_2014, Table_label_edu(Ext_data(Named_HH_2014, Folder_2014[["edu_2014_list"]], edu_2014_colnames))),
  tar_target(Edu_2016, Table_label_edu(Ext_data(Named_HH_2016, Folder_2016[["edu_2016_list"]], edu_2016_colnames))),
  tar_target(Edu_2018_1, Table_label_edu(Ext_data(Named_HH_2018, edu_2018_list1, edu_2018_colnames1))),
  tar_target(Edu_2018_2, Table_label_edu(Ext_data(Named_HH_2018, edu_2018_list2, edu_2018_colnames2))),
  tar_target(Edu_2018, full_join(Edu_2018_1, Edu_2018_2)),

  tar_target(Nrows_Edu, data.frame(Year = Year, Rows = c(nrow(Edu_2010), nrow(Edu_2012), nrow(Edu_2014), nrow(Edu_2016), nrow(Edu_2018)))),
  
  tar_target(Water_2010, Table_label_H2O(Ext_data(Named_HH_2010, Folder_2010[["safeH2O_2010_list"]], safeH2O_2010_colnames))),
  tar_target(Water_2012, Table_label_H2O(HH_2012_data_filter(Named_HH_2012, Folder_2012[["safeH2O_2012_list"]], safeH2O_2012_colnames))),
  tar_target(Water_2014, Table_label_H2O(Ext_data(Named_HH_2014, Folder_2014[["safeH2O_2014_list"]], safeH2O_2014_colnames))),
  tar_target(Water_2016, Table_label_H2O(Ext_data(Named_HH_2016, Folder_2016[["safeH2O_2016_list"]], safeH2O_2016_colnames))),
  tar_target(Water_2018, Table_label_H2O(Ext_data(Named_HH_2018, Folder_2018[["safeH2O_2018_list"]], safeH2O_2018_colnames))),
  
  tar_target(Nrows_Water, data.frame(Year = Year, Rows = c(nrow(Water_2010), nrow(Water_2012), nrow(Water_2014), nrow(Water_2016), nrow(Water_2018)))),

  tar_target(Food_2010, Table_label_food(Ext_data(Named_HH_2010, Folder_2010[["food_2010_list"]], food_2010_colnames))),
  tar_target(Food_2012, Food_data_filter(Table_label_food(HH_2012_data_filter(Named_HH_2012, Folder_2012[["food_2012_list"]], food_2012_colnames)))),
  tar_target(Food_2014, Food_data_filter(Table_label_food(Ext_data(Named_HH_2014, Folder_2014[["food_2014_list"]], food_2014_colnames)))),
  tar_target(Food_2016_1, Food_2016_data_filter(Ext_data(Named_HH_2016, Folder_2016[["food_2016_list1"]], food_2016_colnames1))),
  tar_target(Food_2018_1, Food_2016_data_filter(Ext_data(Named_HH_2018, Folder_2018[["food_2018_list1"]], food_2018_colnames1))),
  tar_target(Food_2016, Table_label_food(Filter_2016_food_data(Named_HH_2016, Folder_2016[["food_2016_list2"]], food_2016_colnames2, Food_2016_1))),
  tar_target(Food_2018, Table_label_food(Filter_2016_food_data(Named_HH_2018, Folder_2018[["food_2018_list2"]], food_2018_colnames2, Food_2018_1))),
  
  tar_target(Nrows_Food, data.frame(Year = Year, Rows = c(nrow(Food_2010), nrow(Food_2012), nrow(Food_2014), nrow(Food_2016), nrow(Food_2018)))),
  
  tar_target(Fuel_2010, Add_fuel_exp(Table_label_fuel(Ext_data(Named_HH_2010, Folder_2010[["fuel_2010_list"]], fuel_2010_colnames)))),
  tar_target(Fuel_2012, Add_fuel_exp(Table_label_fuel(HH_2012_data_filter(Named_HH_2012, Folder_2012[["fuel_2012_list"]], fuel_2012_colnames)))),
  tar_target(Fuel_2014, Add_fuel_exp(Table_label_fuel(Ext_data(Named_HH_2014, Folder_2014[["fuel_2014_list"]], fuel_2014_colnames)))),
  tar_target(Fuel_2016, Add_fuel_exp(Table_label_fuel(Ext_data(Named_HH_2016, Folder_2016[["fuel_2016_list"]], fuel_2016_colnames)))),
  tar_target(Fuel_2018, Add_fuel_exp(Table_label_fuel(Ext_data(Named_HH_2018, Folder_2018[["fuel_2018_list"]], fuel_2018_colnames)))),
  
  tar_target(Nrows_Fuel, data.frame(Year = Year, Rows = c(nrow(Fuel_2010), nrow(Fuel_2012), nrow(Fuel_2014), nrow(Fuel_2016), nrow(Fuel_2018)))),

  tar_target(Diff_Fuel_List, list(Fuel_2014, Fuel_2016, Fuel_2018)),

  tar_target(Electricity_2010, Table_label_elec(Ext_data(Named_HH_2010, Folder_2010[["electricity_2010_list"]], electricity_2010_colnames))),
  tar_target(Electricity_2012, Table_label_elec(HH_2012_data_filter(Named_HH_2012, Folder_2012[["electricity_2012_list"]], electricity_2012_colnames))),
  tar_target(Electricity_2014, Table_label_elec(Ext_data(Named_HH_2014, Folder_2014[["electricity_2014_list"]], electricity_2014_colnames))),
  tar_target(Electricity_2016, Table_label_elec(Ext_data(Named_HH_2016, Folder_2016[["electricity_2016_list"]], electricity_2016_colnames))),
  tar_target(Electricity_2018, Table_label_elec(Ext_data(Named_HH_2018, Folder_2018[["electricity_2018_list"]], electricity_2018_colnames))),
  
  tar_target(Nrows_Electricity, data.frame(Year = Year, Rows = c(nrow(Electricity_2010), nrow(Electricity_2012), nrow(Electricity_2014), 
                                                                 nrow(Electricity_2016), nrow(Electricity_2018)))),

  tar_target(Edu_hh_2010, Comb_edu_hh(Edu_2010, HH_2010)),
  tar_target(Edu_hh_2012, Comb_edu_hh(Edu_2012, HH_2012)),
  tar_target(Edu_hh_2014, Comb_edu_hh(Edu_2014, HH_2014)),
  tar_target(Edu_hh_2016, Comb_edu_hh(Edu_2016, HH_2016)),
  tar_target(Edu_hh_2018, Comb_edu_hh(Edu_2018, HH_2018)),
  
  tar_target(Nrows_Edu_hh, data.frame(Year = Year, Rows = c(nrow(Edu_hh_2010), nrow(Edu_hh_2012), nrow(Edu_hh_2014),
                                                            nrow(Edu_hh_2016), nrow(Edu_hh_2018)))),
  
  tar_target(Comb_Fuel_2010, Comb_fuel(Fuel_2010, fuel_name1, code1, Electricity_2010)),
  tar_target(Comb_Fuel_2012, Comb_fuel(Fuel_2012, fuel_name1, code1, Electricity_2012)),
  tar_target(Comb_Fuel_2014, Comb_fuel(Fuel_2014, fuel_name2, code2, Electricity_2014)),
  tar_target(Comb_Fuel_2016, Comb_fuel(Fuel_2016, fuel_name2, code2, Electricity_2016)),
  tar_target(Comb_Fuel_2018, Comb_fuel(Fuel_2018, fuel_name2, code2, Electricity_2018)),
  
  tar_target(Nrows_Comb_Fuel, data.frame(Year = Year, Rows = c(nrow(Comb_Fuel_2010), nrow(Comb_Fuel_2012), nrow(Comb_Fuel_2014),
                                                            nrow(Comb_Fuel_2016), nrow(Comb_Fuel_2018)))),

#-------------------------------------------------------Calculating Well-being----------------------------------------------------------------------------------------  
  
  tar_target(WB_Edu_2010, Total_WB_edu_data(Edu_hh_2010, Mid_Sample_2010, Mar_stat)),
  tar_target(WB_Edu_2012, Total_WB_edu_data(Edu_hh_2012, Mid_Sample_2012, Mar_stat)),
  tar_target(WB_Edu_2014, Total_WB_edu_data(Edu_hh_2014, Mid_Sample_2014, Mar_stat)),
  tar_target(WB_Edu_2016, Total_WB_edu_data(Edu_hh_2016, Mid_Sample_2016, Mar_stat)),
  tar_target(WB_Edu_2018, Total_WB_edu_data(Edu_hh_2018, Mid_Sample_2018, Mar_stat)),
  
  tar_target(WB_Water_2010, Total_WB_water_data(Water_2010, Mid_Sample_2010, safe_water1, unsafe_water1, safe_water_code1, unsafe_water_code1)),
  tar_target(WB_Water_2012, Total_WB_water_data(Water_2012, Mid_Sample_2012, safe_water1, unsafe_water1, safe_water_code1, unsafe_water_code1)),
  tar_target(WB_Water_2014, Total_WB_water_data(Water_2014, Mid_Sample_2014, safe_water1, unsafe_water1, safe_water_code1, unsafe_water_code1)),
  tar_target(WB_Water_2016, Total_WB_water_data(Water_2016, Mid_Sample_2016, safe_water1, unsafe_water1, safe_water_code1, unsafe_water_code1)),
  tar_target(WB_Water_2018, Total_WB_water_data(Water_2018, Mid_Sample_2018, safe_water2, unsafe_water2, safe_water_code2, unsafe_water_code2)),

  tar_target(WB_Food_2010, Total_WB_food_data(Food_2010, Mid_Sample_2010)),
  tar_target(WB_Food_2012, Total_WB_food_data(Food_2012, Mid_Sample_2012)),
  tar_target(WB_Food_2014, Total_WB_food_data(Food_2014, Mid_Sample_2014)),
  tar_target(WB_Food_2016, Total_WB_food_data(Food_2016, Mid_Sample_2016)),
  tar_target(WB_Food_2018, Total_WB_food_data(Food_2018, Mid_Sample_2018)),

  tar_target(WB_Fuel_2010, Total_WB_fuel_data(Comb_Fuel_2010, Mid_Sample_2010, full_fuel1, modern_fuel, other_fuel1)),
  tar_target(WB_Fuel_2012, Total_WB_fuel_data(Comb_Fuel_2012, Mid_Sample_2012, full_fuel1, modern_fuel, other_fuel1)),
  tar_target(WB_Fuel_2014, Total_WB_fuel_data(Comb_Fuel_2014, Mid_Sample_2014, full_fuel2, modern_fuel, other_fuel2)),
  tar_target(WB_Fuel_2016, Total_WB_fuel_data(Comb_Fuel_2016, Mid_Sample_2016, full_fuel2, modern_fuel, other_fuel2)),
  tar_target(WB_Fuel_2018, Total_WB_fuel_data(Comb_Fuel_2018, Mid_Sample_2018, full_fuel2, modern_fuel, other_fuel2)),

  tar_target(Mid_Sample_2010, Sample_ext(Init_2010_List)),
  tar_target(Mid_Sample_2012, Sample_ext(Init_2012_List)),
  tar_target(Mid_Sample_2014, Sample_ext(Init_2014_List)),
  tar_target(Mid_Sample_2016, Sample_ext(Init_2016_List)),
  tar_target(Mid_Sample_2018, Sample_ext(Init_2018_List)),
  
  tar_target(Nrows_Mid_Sample, data.frame(Year = Year, Rows = c(nrow(Mid_Sample_2010), nrow(Mid_Sample_2012),
                                                                 nrow(Mid_Sample_2014), nrow(Mid_Sample_2016), nrow(Mid_Sample_2018)))),
  
  
  
  tar_target(Sample_2010, Sample_ext(List_2010)),
  tar_target(Sample_2012, Sample_ext(List_2012)),
  tar_target(Sample_2014, Sample_ext(List_2014)),
  tar_target(Sample_2016, Sample_ext(List_2016)),
  tar_target(Sample_2018, Sample_ext(List_2018)),
  
  tar_target(Nrows_Sample, data.frame(Year = Year, Rows = c(nrow(Sample_2010), nrow(Sample_2012),
                                                                nrow(Sample_2014), nrow(Sample_2016), nrow(Sample_2018)))),
  
  tar_target(Area_Sample_2010, join_area_sample(Area_2010, Sample_2010)),
  tar_target(Area_Sample_2012, join_area_sample(Area_2012, Sample_2012)),
  tar_target(Area_Sample_2014, join_area_sample(Area_2014, Sample_2014)),
  tar_target(Area_Sample_2016, join_area_sample(Area_2016, Sample_2016)),
  tar_target(Area_Sample_2018, join_area_sample(Area_2018, Sample_2018)),
  
  tar_target(Nrows_Area_Sample, data.frame(Year = Year, Final.Sample = c(nrow(Area_Sample_2010), nrow(Area_Sample_2012),
                                                            nrow(Area_Sample_2014), nrow(Area_Sample_2016), nrow(Area_Sample_2018)))),
  
  tar_target(Final_WB_Edu_2010, Total_WB_edu_data(Edu_hh_2010, Area_Sample_2010, Mar_stat)),
  tar_target(Final_WB_Edu_2012, Total_WB_edu_data(Edu_hh_2012, Area_Sample_2012, Mar_stat)),
  tar_target(Final_WB_Edu_2014, Total_WB_edu_data(Edu_hh_2014, Area_Sample_2014, Mar_stat)),
  tar_target(Final_WB_Edu_2016, Total_WB_edu_data(Edu_hh_2016, Area_Sample_2016, Mar_stat)),
  tar_target(Final_WB_Edu_2018, Total_WB_edu_data(Edu_hh_2018, Area_Sample_2018, Mar_stat)),

  tar_target(Final_WB_Water_2010, Total_WB_water_data(Water_2010, Area_Sample_2010, safe_water1, unsafe_water1, safe_water_code1, unsafe_water_code1)),
  tar_target(Final_WB_Water_2012, Total_WB_water_data(Water_2012, Area_Sample_2012, safe_water1, unsafe_water1, safe_water_code1, unsafe_water_code1)),
  tar_target(Final_WB_Water_2014, Total_WB_water_data(Water_2014, Area_Sample_2014, safe_water1, unsafe_water1, safe_water_code1, unsafe_water_code1)),
  tar_target(Final_WB_Water_2016, Total_WB_water_data(Water_2016, Area_Sample_2016, safe_water1, unsafe_water1, safe_water_code1, unsafe_water_code1)),
  tar_target(Final_WB_Water_2018, Total_WB_water_data(Water_2018, Area_Sample_2018, safe_water2, unsafe_water2, safe_water_code2, unsafe_water_code2)),
  
  tar_target(Final_WB_Food_2010, Total_WB_food_data(Food_2010, Area_Sample_2010)),
  tar_target(Final_WB_Food_2012, Total_WB_food_data(Food_2012, Area_Sample_2012)),
  tar_target(Final_WB_Food_2014, Total_WB_food_data(Food_2014, Area_Sample_2014)),
  tar_target(Final_WB_Food_2016, Total_WB_food_data(Food_2016, Area_Sample_2016)),
  tar_target(Final_WB_Food_2018, Total_WB_food_data(Food_2018, Area_Sample_2018)),

  tar_target(Final_WB_Fuel_2010, Total_WB_fuel_data(Comb_Fuel_2010, Area_Sample_2010, full_fuel1, modern_fuel, other_fuel1)),
  tar_target(Final_WB_Fuel_2012, Total_WB_fuel_data(Comb_Fuel_2012, Area_Sample_2012, full_fuel1, modern_fuel, other_fuel1)),
  tar_target(Final_WB_Fuel_2014, Total_WB_fuel_data(Comb_Fuel_2014, Area_Sample_2014, full_fuel2, modern_fuel, other_fuel2)),
  tar_target(Final_WB_Fuel_2016, Total_WB_fuel_data(Comb_Fuel_2016, Area_Sample_2016, full_fuel2, modern_fuel, other_fuel2)),
  tar_target(Final_WB_Fuel_2018, Total_WB_fuel_data(Comb_Fuel_2018, Area_Sample_2018, full_fuel2, modern_fuel, other_fuel2)),
  
#------------------------------------------------------------------Urban/Rural Split-------------------------------------------------------------------------------  
  
  tar_target(Urban_Edu_2010, urban_rural_filter(Final_WB_Edu_2010, "urban")),
  tar_target(Urban_Edu_2012, urban_rural_filter(Final_WB_Edu_2012, "urban")),
  tar_target(Urban_Edu_2014, urban_rural_filter(Final_WB_Edu_2014, "urban")),
  tar_target(Urban_Edu_2016, urban_rural_filter(Final_WB_Edu_2016, "urban")),
  tar_target(Urban_Edu_2018, urban_rural_filter(Final_WB_Edu_2018, "urban")),
  
  tar_target(Urban_Water_2010, urban_rural_filter(Final_WB_Water_2010, "urban")),
  tar_target(Urban_Water_2012, urban_rural_filter(Final_WB_Water_2012, "urban")),
  tar_target(Urban_Water_2014, urban_rural_filter(Final_WB_Water_2014, "urban")),
  tar_target(Urban_Water_2016, urban_rural_filter(Final_WB_Water_2016, "urban")),
  tar_target(Urban_Water_2018, urban_rural_filter(Final_WB_Water_2018, "urban")),
  
  tar_target(Urban_Food_2010, urban_rural_filter(Final_WB_Food_2010, "urban")),
  tar_target(Urban_Food_2012, urban_rural_filter(Final_WB_Food_2012, "urban")),
  tar_target(Urban_Food_2014, urban_rural_filter(Final_WB_Food_2014, "urban")),
  tar_target(Urban_Food_2016, urban_rural_filter(Final_WB_Food_2016, "urban")),
  tar_target(Urban_Food_2018, urban_rural_filter(Final_WB_Food_2018, "urban")),
  
  tar_target(Urban_Fuel_2010, urban_rural_filter(Final_WB_Fuel_2010, "urban")),
  tar_target(Urban_Fuel_2012, urban_rural_filter(Final_WB_Fuel_2012, "urban")),
  tar_target(Urban_Fuel_2014, urban_rural_filter(Final_WB_Fuel_2014, "urban")),
  tar_target(Urban_Fuel_2016, urban_rural_filter(Final_WB_Fuel_2016, "urban")),
  tar_target(Urban_Fuel_2018, urban_rural_filter(Final_WB_Fuel_2018, "urban")),
  
  
  
  tar_target(Rural_Edu_2010, urban_rural_filter(Final_WB_Edu_2010, "rural")),
  tar_target(Rural_Edu_2012, urban_rural_filter(Final_WB_Edu_2012, "rural")),
  tar_target(Rural_Edu_2014, urban_rural_filter(Final_WB_Edu_2014, "rural")),
  tar_target(Rural_Edu_2016, urban_rural_filter(Final_WB_Edu_2016, "rural")),
  tar_target(Rural_Edu_2018, urban_rural_filter(Final_WB_Edu_2018, "rural")),
  
  tar_target(Rural_Water_2010, urban_rural_filter(Final_WB_Water_2010, "rural")),
  tar_target(Rural_Water_2012, urban_rural_filter(Final_WB_Water_2012, "rural")),
  tar_target(Rural_Water_2014, urban_rural_filter(Final_WB_Water_2014, "rural")),
  tar_target(Rural_Water_2016, urban_rural_filter(Final_WB_Water_2016, "rural")),
  tar_target(Rural_Water_2018, urban_rural_filter(Final_WB_Water_2018, "rural")),
  
  tar_target(Rural_Food_2010, urban_rural_filter(Final_WB_Food_2010, "rural")),
  tar_target(Rural_Food_2012, urban_rural_filter(Final_WB_Food_2012, "rural")),
  tar_target(Rural_Food_2014, urban_rural_filter(Final_WB_Food_2014, "rural")),
  tar_target(Rural_Food_2016, urban_rural_filter(Final_WB_Food_2016, "rural")),
  tar_target(Rural_Food_2018, urban_rural_filter(Final_WB_Food_2018, "rural")),
  
  tar_target(Rural_Fuel_2010, urban_rural_filter(Final_WB_Fuel_2010, "rural")),
  tar_target(Rural_Fuel_2012, urban_rural_filter(Final_WB_Fuel_2012, "rural")),
  tar_target(Rural_Fuel_2014, urban_rural_filter(Final_WB_Fuel_2014, "rural")),
  tar_target(Rural_Fuel_2016, urban_rural_filter(Final_WB_Fuel_2016, "rural")),
  tar_target(Rural_Fuel_2018, urban_rural_filter(Final_WB_Fuel_2018, "rural")),
  
#--------------------------------------------------------------Number of people per household added------------------------------------------------------------  
    tar_target(Urban_Member_Edu_2010, add_member_code(Edu_2010, Urban_Edu_2010)),
  tar_target(Urban_Member_Edu_2012, add_member_code(Edu_2012, Urban_Edu_2012)),
  tar_target(Urban_Member_Edu_2014, add_member_code(Edu_2014, Urban_Edu_2014)),
  tar_target(Urban_Member_Edu_2016, add_member_code(Edu_2016, Urban_Edu_2016)),
  tar_target(Urban_Member_Edu_2018, add_member_code(Edu_2018, Urban_Edu_2018)),
  
  tar_target(Urban_Member_Water_2010, add_member_code(Edu_2010, Urban_Water_2010)),
  tar_target(Urban_Member_Water_2012, add_member_code(Edu_2012, Urban_Water_2012)),
  tar_target(Urban_Member_Water_2014, add_member_code(Edu_2014, Urban_Water_2014)),
  tar_target(Urban_Member_Water_2016, add_member_code(Edu_2016, Urban_Water_2016)),
  tar_target(Urban_Member_Water_2018, add_member_code(Edu_2018, Urban_Water_2018)),
  
  tar_target(Urban_Member_Food_2010, add_member_code(Edu_2010, Urban_Food_2010)),
  tar_target(Urban_Member_Food_2012, add_member_code(Edu_2012, Urban_Food_2012)),
  tar_target(Urban_Member_Food_2014, add_member_code(Edu_2014, Urban_Food_2014)),
  tar_target(Urban_Member_Food_2016, add_member_code(Edu_2016, Urban_Food_2016)),
  tar_target(Urban_Member_Food_2018, add_member_code(Edu_2018, Urban_Food_2018)),
  
  tar_target(Urban_Member_Fuel_2010, add_member_code(Edu_2010, Urban_Fuel_2010)),
  tar_target(Urban_Member_Fuel_2012, add_member_code(Edu_2012, Urban_Fuel_2012)),
  tar_target(Urban_Member_Fuel_2014, add_member_code(Edu_2014, Urban_Fuel_2014)),
  tar_target(Urban_Member_Fuel_2016, add_member_code(Edu_2016, Urban_Fuel_2016)),
  tar_target(Urban_Member_Fuel_2018, add_member_code(Edu_2018, Urban_Fuel_2018)),



  tar_target(Rural_Member_Edu_2010, add_member_code(Edu_2010, Rural_Edu_2010)),
  tar_target(Rural_Member_Edu_2012, add_member_code(Edu_2012, Rural_Edu_2012)),
  tar_target(Rural_Member_Edu_2014, add_member_code(Edu_2014, Rural_Edu_2014)),
  tar_target(Rural_Member_Edu_2016, add_member_code(Edu_2016, Rural_Edu_2016)),
  tar_target(Rural_Member_Edu_2018, add_member_code(Edu_2018, Rural_Edu_2018)),
  
  tar_target(Rural_Member_Water_2010, add_member_code(Edu_2010, Rural_Water_2010)),
  tar_target(Rural_Member_Water_2012, add_member_code(Edu_2012, Rural_Water_2012)),
  tar_target(Rural_Member_Water_2014, add_member_code(Edu_2014, Rural_Water_2014)),
  tar_target(Rural_Member_Water_2016, add_member_code(Edu_2016, Rural_Water_2016)),
  tar_target(Rural_Member_Water_2018, add_member_code(Edu_2018, Rural_Water_2018)),
  
  tar_target(Rural_Member_Food_2010, add_member_code(Edu_2010, Rural_Food_2010)),
  tar_target(Rural_Member_Food_2012, add_member_code(Edu_2012, Rural_Food_2012)),
  tar_target(Rural_Member_Food_2014, add_member_code(Edu_2014, Rural_Food_2014)),
  tar_target(Rural_Member_Food_2016, add_member_code(Edu_2016, Rural_Food_2016)),
  tar_target(Rural_Member_Food_2018, add_member_code(Edu_2018, Rural_Food_2018)),
  
  tar_target(Rural_Member_Fuel_2010, add_member_code(Edu_2010, Rural_Fuel_2010)),
  tar_target(Rural_Member_Fuel_2012, add_member_code(Edu_2012, Rural_Fuel_2012)),
  tar_target(Rural_Member_Fuel_2014, add_member_code(Edu_2014, Rural_Fuel_2014)),
  tar_target(Rural_Member_Fuel_2016, add_member_code(Edu_2016, Rural_Fuel_2016)),
  tar_target(Rural_Member_Fuel_2018, add_member_code(Edu_2018, Rural_Fuel_2018)),
  
#--------------------------------------------------------Calculations Results based on number of households--------------------------------------------------------  
  
  tar_target(Total_population_df, data_set_choice(Pop_data, c("Year", "Population"), Year)),
  tar_target(Urban_population_df, data_set_choice(Pop_data, c("Year", "Urban.Population"), Year)),
  tar_target(Rural_population_df, data_set_choice(Pop_data, c("Year", "Rural.Population"), Year)),

  
  tar_target(Urban_Edu_list, list(Urban_Edu_2010, Urban_Edu_2012, Urban_Edu_2014, Urban_Edu_2016, Urban_Edu_2018)),
  tar_target(Urban_Water_list, list(Urban_Water_2010, Urban_Water_2012, Urban_Water_2014, Urban_Water_2016, Urban_Water_2018)),
  tar_target(Urban_Food_list, list(Urban_Food_2010, Urban_Food_2012, Urban_Food_2014, Urban_Food_2016, Urban_Food_2018)),
  tar_target(Urban_Fuel_list, list(Urban_Fuel_2010, Urban_Fuel_2012, Urban_Fuel_2014, Urban_Fuel_2016, Urban_Fuel_2018)),
  
  tar_target(Urban_Edu_Results, Results_WB(Urban_Edu_list, Urban_population_df, edu_results_colnames)),
  tar_target(Urban_Water_Results, Results_WB(Urban_Water_list, Urban_population_df, water_results_colnames)),
  tar_target(Urban_Food_Results, Results_WB(Urban_Food_list, Urban_population_df, food_results_colnames)),
  tar_target(Urban_Fuel_Results, Results_WB(Urban_Fuel_list, Urban_population_df, fuel_results_colnames)),
  
  tar_target(Urban_WB_list, list(Urban_Edu_Results, Urban_Water_Results, Urban_Food_Results, Urban_Fuel_Results)),
  
  
  
  tar_target(Rural_Edu_list, list(Rural_Edu_2010, Rural_Edu_2012, Rural_Edu_2014, Rural_Edu_2016, Rural_Edu_2018)),
  tar_target(Rural_Water_list, list(Rural_Water_2010, Rural_Water_2012, Rural_Water_2014, Rural_Water_2016, Rural_Water_2018)),
  tar_target(Rural_Food_list, list(Rural_Food_2010, Rural_Food_2012, Rural_Food_2014, Rural_Food_2016, Rural_Food_2018)),
  tar_target(Rural_Fuel_list, list(Rural_Fuel_2010, Rural_Fuel_2012, Rural_Fuel_2014, Rural_Fuel_2016, Rural_Fuel_2018)),
  
  tar_target(Rural_Edu_Results, Results_WB(Rural_Edu_list, Rural_population_df, edu_results_colnames)),
  tar_target(Rural_Water_Results, Results_WB(Rural_Water_list, Rural_population_df, water_results_colnames)),
  tar_target(Rural_Food_Results, Results_WB(Rural_Food_list, Rural_population_df, food_results_colnames)),
  tar_target(Rural_Fuel_Results, Results_WB(Rural_Fuel_list, Rural_population_df, fuel_results_colnames)),
  
  tar_target(Rural_WB_list, list(Rural_Edu_Results, Rural_Water_Results, Rural_Food_Results, Rural_Fuel_Results)),

#--------------------------------------------------Calculation Results based on number of members per households------------------------------------------------

  tar_target(Urban_Member_Edu_list, list(Urban_Member_Edu_2010, Urban_Member_Edu_2012, Urban_Member_Edu_2014, Urban_Member_Edu_2016, Urban_Member_Edu_2018)),
  tar_target(Urban_Member_Water_list, list(Urban_Member_Water_2010, Urban_Member_Water_2012, Urban_Member_Water_2014, Urban_Member_Water_2016, Urban_Member_Water_2018)),
  tar_target(Urban_Member_Food_list, list(Urban_Member_Food_2010, Urban_Member_Food_2012, Urban_Member_Food_2014, Urban_Member_Food_2016, Urban_Member_Food_2018)),
  tar_target(Urban_Member_Fuel_list, list(Urban_Member_Fuel_2010, Urban_Member_Fuel_2012, Urban_Member_Fuel_2014, Urban_Member_Fuel_2016, Urban_Member_Fuel_2018)),
  
  tar_target(Urban_Member_Edu_Results, Results_WB(Urban_Member_Edu_list, Urban_population_df, member_edu_results_colnames)),
  tar_target(Urban_Member_Water_Results, Results_WB(Urban_Member_Water_list, Urban_population_df, member_water_results_colnames)),
  tar_target(Urban_Member_Food_Results, Results_WB(Urban_Member_Food_list, Urban_population_df, member_food_results_colnames)),
  tar_target(Urban_Member_Fuel_Results, Results_WB(Urban_Member_Fuel_list, Urban_population_df, member_fuel_results_colnames)),
  
  tar_target(Urban_Member_WB_list, list(Urban_Member_Edu_Results, Urban_Member_Water_Results, Urban_Member_Food_Results, Urban_Member_Fuel_Results)),



  tar_target(Rural_Member_Edu_list, list(Rural_Member_Edu_2010, Rural_Member_Edu_2012, Rural_Member_Edu_2014, Rural_Member_Edu_2016, Rural_Member_Edu_2018)),
  tar_target(Rural_Member_Water_list, list(Rural_Member_Water_2010, Rural_Member_Water_2012, Rural_Member_Water_2014, Rural_Member_Water_2016, Rural_Member_Water_2018)),
  tar_target(Rural_Member_Food_list, list(Rural_Member_Food_2010, Rural_Member_Food_2012, Rural_Member_Food_2014, Rural_Member_Food_2016, Rural_Member_Food_2018)),
  tar_target(Rural_Member_Fuel_list, list(Rural_Member_Fuel_2010, Rural_Member_Fuel_2012, Rural_Member_Fuel_2014, Rural_Member_Fuel_2016, Rural_Member_Fuel_2018)),
  
  tar_target(Rural_Member_Edu_Results, Results_WB(Rural_Member_Edu_list, Rural_population_df, member_edu_results_colnames)),
  tar_target(Rural_Member_Water_Results, Results_WB(Rural_Member_Water_list, Rural_population_df, member_water_results_colnames)),
  tar_target(Rural_Member_Food_Results, Results_WB(Rural_Member_Food_list, Rural_population_df, member_food_results_colnames)),
  tar_target(Rural_Member_Fuel_Results, Results_WB(Rural_Member_Fuel_list, Rural_population_df, member_fuel_results_colnames)),
  
  tar_target(Rural_Member_WB_list, list(Rural_Member_Edu_Results, Rural_Member_Water_Results, Rural_Member_Food_Results, Rural_Member_Fuel_Results)),

#-------------------------------------------------------------Total number of people achieving all 4 well-beings------------------------------------------------------------
  tar_target(Urban_Member_2010, list(Urban_Member_Edu_2010, Urban_Member_Water_2010, Urban_Member_Food_2010, Urban_Member_Fuel_2010)),
  tar_target(Urban_Member_2012, list(Urban_Member_Edu_2012, Urban_Member_Water_2012, Urban_Member_Food_2012, Urban_Member_Fuel_2012)),
  tar_target(Urban_Member_2014, list(Urban_Member_Edu_2014, Urban_Member_Water_2014, Urban_Member_Food_2014, Urban_Member_Fuel_2014)),
  tar_target(Urban_Member_2016, list(Urban_Member_Edu_2016, Urban_Member_Water_2016, Urban_Member_Food_2016, Urban_Member_Fuel_2016)),
  tar_target(Urban_Member_2018, list(Urban_Member_Edu_2018, Urban_Member_Water_2018, Urban_Member_Food_2018, Urban_Member_Fuel_2018)),

  tar_target(Urban_all_WB_2010, Percent_all_WB_year(Urban_population_df[1,2],Urban_Member_2010, Edu_2010)),
  tar_target(Urban_all_WB_2012, Percent_all_WB_year(Urban_population_df[2,2],Urban_Member_2012, Edu_2012)),
  tar_target(Urban_all_WB_2014, Percent_all_WB_year(Urban_population_df[3,2],Urban_Member_2014, Edu_2014)),
  tar_target(Urban_all_WB_2016, Percent_all_WB_year(Urban_population_df[4,2],Urban_Member_2016, Edu_2016)),
  tar_target(Urban_all_WB_2018, Percent_all_WB_year(Urban_population_df[5,2],Urban_Member_2018, Edu_2018)),

  tar_target(Urban_all_WB_list, list(Urban_all_WB_2010, Urban_all_WB_2012, Urban_all_WB_2014, Urban_all_WB_2016, Urban_all_WB_2018)),


  
  tar_target(Rural_Member_2010, list(Rural_Member_Edu_2010, Rural_Member_Water_2010, Rural_Member_Food_2010, Rural_Member_Fuel_2010)),
  tar_target(Rural_Member_2012, list(Rural_Member_Edu_2012, Rural_Member_Water_2012, Rural_Member_Food_2012, Rural_Member_Fuel_2012)),
  tar_target(Rural_Member_2014, list(Rural_Member_Edu_2014, Rural_Member_Water_2014, Rural_Member_Food_2014, Rural_Member_Fuel_2014)),
  tar_target(Rural_Member_2016, list(Rural_Member_Edu_2016, Rural_Member_Water_2016, Rural_Member_Food_2016, Rural_Member_Fuel_2016)),
  tar_target(Rural_Member_2018, list(Rural_Member_Edu_2018, Rural_Member_Water_2018, Rural_Member_Food_2018, Rural_Member_Fuel_2018)),
  
  tar_target(Rural_all_WB_2010, Percent_all_WB_year(Rural_population_df[1,2], Rural_Member_2010, Edu_2010)),
  tar_target(Rural_all_WB_2012, Percent_all_WB_year(Rural_population_df[2,2], Rural_Member_2012, Edu_2012)),
  tar_target(Rural_all_WB_2014, Percent_all_WB_year(Rural_population_df[3,2], Rural_Member_2014, Edu_2014)),
  tar_target(Rural_all_WB_2016, Percent_all_WB_year(Rural_population_df[4,2], Rural_Member_2016, Edu_2016)),
  tar_target(Rural_all_WB_2018, Percent_all_WB_year(Rural_population_df[5,2], Rural_Member_2018, Edu_2018)),

  tar_target(Rural_all_WB_list, list(Rural_all_WB_2010, Rural_all_WB_2012, Rural_all_WB_2014, Rural_all_WB_2016, Rural_all_WB_2018)),


#-------------------------------------------------------------------------------FINAL RESULTS-------------------------------------------------------------------------
tar_target(Urban_Summary, Combine_dataframe(Urban_WB_list, Urban_population_df, "sample")),
tar_target(Rural_Summary, Combine_dataframe(Rural_WB_list, Rural_population_df, "sample")),
tar_target(Total_Sample_Summary, Add_total_population(Total_population_df, Rural_WB_list, Urban_WB_list, "sample")),



tar_target(Urban_Member_Summary, Combine_dataframe(Urban_Member_WB_list, Urban_population_df, "number")),
tar_target(Rural_Member_Summary, Combine_dataframe(Rural_Member_WB_list, Rural_population_df, "number")),
tar_target(Total_Member_Summary, Add_total_population(Total_population_df, Rural_Member_WB_list, Urban_Member_WB_list, "number")),


tar_target(Urban_all_Summary, Percent_all_WB(Urban_population_df, Urban_all_WB_list)),
tar_target(Rural_all_Summary, Percent_all_WB(Rural_population_df, Rural_all_WB_list)),
tar_target(Total_all_Summary, Add_all_WB_total(Total_population_df, Rural_all_Summary, Urban_all_Summary)),

tar_target(Percent_Sample_dropped, Percent_sample_dropped(Nrows_total_households, Nrows_Area_Sample)),

tar_target(GDP_WB, cbind(cbind(select(GDP_data, c("year","cgdpe")), select(Total_Member_Summary, c("Scale.Education", "Scale.Water", "Scale.Food", "Scale.Fuel"))), 
                         select(Total_all_Summary, c("Population.scale")))),

#--------------------------------------------------------------------GRAPHS----------------------------------------------------------------
tar_target(Total_WB_facet_graph, facet_graph(Total_Member_Summary, "Total", 100, total_WB_vector, total_WB_year_vector)),
tar_target(Urban_WB_facet_graph, facet_graph(Urban_Member_Summary, "Urban", 100, area_WB_vector, area_WB_year_vector)),
tar_target(Rural_WB_facet_graph, facet_graph(Rural_Member_Summary, "Rural", 100, area_WB_vector, area_WB_year_vector)),
tar_target(All_WB_facet_graph, Rural_WB_facet_graph + Urban_WB_facet_graph + Total_WB_facet_graph + plot_layout(ncol = 3)),

tar_target(Total_WB_graph, graph_4_WB(Total_all_Summary)),
tar_target(All_WB_graph, Sum_graph_4_WB(Total_all_Summary, Urban_all_Summary, Rural_all_Summary)),

tar_target(Sample_graph, sample_graph(Percent_Sample_dropped)),

tar_target(Population_graph, total_population_graph(Pop_data)),

tar_target(GDP_WB_growth_graph, GDP_growth_graph(GDP_WB))
)

