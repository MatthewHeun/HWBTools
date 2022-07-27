#--------------------------------------------Extra variable--------------------------------------------------------
Year = c(2010, 2012, 2014, 2016, 2018)
area_colnames1 = c("ttnt")
area_colnames2 = c("tinh", "huyen", "xa", "diaban", "hoso", "ttnt")

#---------------------------------------------------------------Vector of fuel names------------------------------------------------------
fuel_name1 = c("Coal", "Coal briquette", "Petroleum", "Kerosene", "Maznut oil", "Diesel oil",
               "LPG", "Natural gas", "Firewood, husk, sawdust", "Farm by-products", "Other")

fuel_name2 = c("Coal", "Coal briquette", "Petroleum", "Kerosene", "Maznut oil", "Diesel oil", "Lubricant oil",
               "LPG", "Natural gas", "Firewood, husk, sawdust", "Farm by-products", "Other")
code1 = c(202:212)
code2 = c(202:213)

full_fuel1 <- c("Coal", "Coal briquette", "Petroleum", "Kerosene", "Maznut oil", "Diesel oil",
                "LPG", "Natural gas", "Firewood, husk, sawdust", "Farm by-products", "Other", "Electricity")

full_fuel2 <- c("Coal", "Coal briquette", "Petroleum", "Kerosene", "Maznut oil", "Diesel oil", "Lubricant oil",
                "LPG", "Natural gas", "Firewood, husk, sawdust", "Farm by-products", "Other", "Electricity")

modern_fuel <- c("LPG",  "Electricity", "Natural gas")

other_fuel1 <- c("Coal", "Coal briquette", "Firewood, husk, sawdust", "Farm by-products", 
                 "Other","Petroleum", "Diesel oil", "Maznut oil", "Kerosene")

other_fuel2 <- c("Coal", "Coal briquette", "Firewood, husk, sawdust", "Farm by-products", 
                    "Other","Petroleum", "Diesel oil", "Maznut oil", "Kerosene", "Lubricant oil")


#---------------------------------------------------------------Vector of marital status---------------------------------------------------
Mar_stat = c("Single", "Married", "Widowed", "Divorced", "Separated")


#------------------------------------------------------------Vector of safe and unsafe water---------------------------------------------------
safe_water1 = c("Private tap water", "Public tap water", "Drilled well", "Protected dug well",
               "Protected stream water", "Bought water", "Rain water")
unsafe_water1 = c("Unprotected dug well", "Unprotected stream water", "Others")

safe_water_code1 = c(1,2,3,4,6,8,9)
unsafe_water_code1 = c(5,7,10)

safe_water2 = c("Private tap water", "Yard tap water", "Local tap water", "Public tap water", "Drilled well",
                "Protected dug well", "Protected stream water", "Rain water", "Bought water from tank car",
                "Bottled water")
unsafe_water2 = c("Unprotected dug well", "Unprotected stream water", "Bought water from buckets",
                  "Water from rivers and ponds", "Others")

safe_water_code2 = c(1,2,3,4,5,6,8,10,11,14)
unsafe_water_code2 = c(7,9,12,13,15)

#----------------------------------------------------List of files containing related well-being data--------------------------------------------

# List of relevant 2010 folders for population data
exp_2010_list = list("muc5a1.dta", "muc5a2.dta", "muc5b1.dta", "muc5b2.dta", 
                     "muc5b3.dta", "muc6b.dta", "muc7.dta")
edu_exp_2010_list = list("muc2_qx_cau9_11.dta", "muc2_qx_cau12_16.dta")
muc3_exp_2010_list = list("muc3a.dta", "muc3b.dta")
area_2010_list = list("ho11.dta")

Folder_2010 = list(
  hh_2010_list = list("muc1a.dta"),
  edu_2010_list = list("muc2a1.dta"),
  safeH2O_2010_list = list("muc7.dta"),
  food_2010_list = list("muc8.dta"),
  fuel_2010_list = list("muc5b1.dta"),
  electricity_2010_list = list("muc7.dta")
)

# List of relevant 2012 folders for population data
exp_2012_list = list("muc5a1.dta", "muc5a2.dta", "muc5b1.dta", "muc5b2.dta",
                     "muc5b3.dta", "muc6b.dta", "muc7.dta")
edu_exp_2012_list = list("muc2a2.dta", "muc2b2.dta")
muc3_exp_2012_list = list("muc3a.dta", "muc3b.dta")

Folder_2012 = list(
  hh_2012_list = list("muc1a.dta"),
  edu_2012_list = list("muc2a1.dta"),
  safeH2O_2012_list = list("muc7.dta"),
  food_2012_list = list("muc8.dta"),
  fuel_2012_list = list("muc5b1.dta"),
  electricity_2012_list = list("muc7.dta")
)

# List of relevant 2014 folders for population data
exp_2014_list = list("muc5a1.dta", "muc5a2.dta", "muc5b1.dta", "muc5b2.dta",
                     "muc5b3.dta", "muc6b.dta", "muc7.dta")
edu_exp_2014_list = list("muc2x.dta")
muc3_exp_2014_list = list("muc3b.dta", "muc3c.dta")
area_2014_list = list("ho1.dta")

Folder_2014 = list(
  hh_2014_list = list("muc1a.dta"),
  edu_2014_list = list("muc2a.dta"),
  safeH2O_2014_list = list("muc7.dta"),
  food_2014_list = list("muc8.dta"),
  fuel_2014_list = list("muc5b1.dta"),
  electricity_2014_list = list("muc7.dta")
)

# List of relevant 2016 folders for population data
exp_2016_list = list("muc5a1.dta", "muc5a2.dta", "muc5b1.dta", "muc5b2.dta",
                     "muc5b3.dta", "muc6b.dta", "muc7.dta")
edu_exp_2016_list = list("muc2v.dta", "muc2x.dta")
muc3_exp_2016_list = list("muc3a.dta", "muc3b.dta")
area_2016_list = list("ho1.dta")

Folder_2016 = list(
  hh_2016_list = list("muc1a.dta"),
  edu_2016_list = list("muc2ab.dta"),
  safeH2O_2016_list = list("muc7.dta"),
  food_2016_list2 = list("muc8.dta"),
  food_2016_list1 = list("muc81.dta"),
  fuel_2016_list = list("muc5b1.dta"),
  electricity_2016_list = list("muc7.dta")
)

# List of relevant 2018 folders for population data
exp_2018_list = list("muc5a1.dta", "muc5a2.dta", "muc5b1.dta", "muc5b2.dta",
                     "muc5b3.dta", "muc6b.dta", "muc7.dta")
edu_exp_2018_list = list("muc2d.dta", "muc2v.dta", "muc2x.dta")
muc3_exp_2018_list = list("muc3a.dta", "muc3b.dta", "muc3c.dta")
edu_2018_list1 = list("muc2v.dta")
edu_2018_list2 = list("muc2x.dta")
area_2018_list = list("ho1.dta")

Folder_2018 = list(
  hh_2018_list = list("muc1a.dta"),
  safeH2O_2018_list = list("muc7.dta"),
  food_2018_list2 = list("muc8.dta"),
  food_2018_list1 = list("muc81.dta"),
  fuel_2018_list = list("muc5b1.dta"),
  electricity_2018_list = list("muc7.dta")
)

#----------------------------------------------------List of columns containing well-being data---------------------------------------------------------
#List of columns containing related 2010 well-being data
hh_2010_colnames = c("matv", "m1ac3", "m1ac6")
edu_2010_colnames = c("matv", "m2ac1")
safeH2O_2010_colnames = c("m7c14")
food_2010_colnames = c("m8c22_11", "m8c11a", "m8c11b")
fuel_2010_colnames = c("m5b1ma", "m5b1c3", "m5b1c4", "m5b1c5")
electricity_2010_colnames = c("m7c19")


# List of columns containing related 2012 well-being data
hh_2012_colnames = list("m1ama", "m1ac3", "m1ac6")
edu_2012_colnames = list("m2ama1", "m2ac1")
safeH2O_2012_colnames = list("m7c18")
food_2012_colnames = list("m8c2_11", "m8c11a", "m8c11b")
fuel_2012_colnames = list("m5b1ma", "m5b1c3", "m5b1c4", "m5b1c5")
electricity_2012_colnames = list("m7c23")

# List of columns containing related 2014 well-being data
hh_2014_colnames = c("matv", "m1ac3", "m1ac8")
edu_2014_colnames = c("matv", "m2ac1")
safeH2O_2014_colnames = c("m7c18")
food_2014_colnames = c("m8c2_11", "m8c19a", "m8c19b")
fuel_2014_colnames = c("m5b1ma", "m5b1c3", "m5b1c4", "m5b1c5")
electricity_2014_colnames = c("m7c23")

# List of columns containing related 2016 well-being data
hh_2016_colnames = c("m1ama", "m1ac3", "m1ac8")
edu_2016_colnames = c("m2ma", "m2ac1")
safeH2O_2016_colnames = c("m7c18")
food_2016_colnames1 = c("m8c2maso", "m8c2a16")
food_2016_colnames2 = c("m8c1a")
fuel_2016_colnames = c("m5b1ma", "m5b1c3", "m5b1c4", "m5b1c5")
electricity_2016_colnames = c("m7c23")

# List of columns containing related 2018 well-being data
hh_2018_colnames = c("m1ama", "m1ac3", "m1ac8")
edu_2018_colnames1 = c("m2vma", "m2vc1")
edu_2018_colnames2 = c("m2xma", "m2xc1")
safeH2O_2018_colnames = c("m7c18", "m7c18a")
food_2018_colnames1 = c("m8c2maso", "m8c2a18")
food_2018_colnames2 = c("m8c1a")
fuel_2018_colnames = c("m5b1ma", "m5b1c3", "m5b1c4", "m5b1c5")
electricity_2018_colnames = c("m7c23")

#---------------------------------------------------------------------Vector of final results column names----------------------------------------------------------------------
edu_results_colnames <- c("Year", "Total population","Samples.Education", "Grade completed >= 9", "Grade completed < 9", "Sample.Percent.Education", "Scale.Education")
water_results_colnames <- c("Year", "Total population","Samples.Water", "Safe Water", "Unsafe Water", "Sample.Percent.Water", "Scale.Water")
food_results_colnames <- c("Year","Total Population", "Samples.Food", "Adequate Food", "Inadequate Food", "Sample.Percent.Food", "Scale.Food")
fuel_results_colnames <- c("Year","Total population", "Samples.Fuel", "Modern fuel met", "Modern fuel not met", "Sample.Percent.Fuel", "Scale.Fuel")

member_edu_results_colnames <- c("Year", "Total population","Numbers.Education", "Grade completed >= 9", "Grade completed < 9", "Number.Percent.Education", "Scale.Education")
member_water_results_colnames <- c("Year", "Total population","Numbers.Water", "Safe Water", "Unsafe Water", "Number.Percent.Water", "Scale.Water")
member_food_results_colnames <- c("Year","Total Population", "Numbers.Food", "Adequate Food", "Inadequate Food", "Number.Percent.Food", "Scale.Food")
member_fuel_results_colnames <- c("Year","Total population", "Numbers.Fuel", "Modern fuel met", "Modern fuel not met", "Number.Percent.Fuel", "Scale.Fuel")

#-------------------------------------------------------Vector to get values for the graph-------------------------------------------------------------------------------------
area_WB_vector <- c("Number.Percent.Education", "Number.Percent.Water", "Number.Percent.Food", "Number.Percent.Fuel")
area_WB_year_vector <- c("Year", "Number.Percent.Education", "Number.Percent.Water", "Number.Percent.Food", "Number.Percent.Fuel") 

total_WB_vector <- c("Percent.WB.Education", "Percent.WB.Water", "Percent.WB.Food", "Percent.WB.Fuel")
total_WB_year_vector <- c("Year", "Percent.WB.Education", "Percent.WB.Water", "Percent.WB.Food", "Percent.WB.Fuel") 

