# # Source files from lab computer
# source("C:/Users/gvl2.CALVINAD/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/VHLSS data analysis/Functions.R")
# source("C:/Users/gvl2.CALVINAD/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/VHLSS data analysis/Column_label.R")
# source("C:/Users/gvl2.CALVINAD/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/VHLSS data analysis/List.R")

# Source files from personal computer
source("C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/HWBTools/VHLSS data analysis/Functions.R")
source("C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/HWBTools/VHLSS data analysis/Column_label.R")
source("C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Programming/HWBTools/VHLSS data analysis/List.R")

hh_path = "C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/VHLSS Raw data/10 - VHLSS 2018/2 - Data/1 - Households/HO1.dta"

# df1 <- data.frame(ID = c("One", "Two", "Three", "Four", "Five", "Six"),
#                  ID2 = c("H", "He", "Hel", "Hell", "Hello", "Hello!"),
#                  value_1 = c(1, 2, 3, 4, 5, 6),
#                  value_2 = c(10, 20, 30, 40, NA, 60),
#                  value_3 = c(100, 200, 300, 400, 500, 600),
#                  value_4 = c(1000, 2000, 3000, 4000, 5000, 6000))
# 
# df2 <- data.frame(ID = c("One", "Two", "Three", "Four", "Four", "Five", "Six"),
#                   ID2 = c("H", "He", "Hel", "Hell", "Hello", "Hello!", "Welp"),
#                   val_1 = c(1, 2, 3, 4, 5, 6, 7),
#                   val_2 = c(10, 20, 30, 40, NA, 60, 70),
#                   val_3 = c(100, 200, 300, 400, 500, 600, 700),
#                   val_4 = c(1000, 2000, 3000, 4000, 5000, 6000, 7000))


# new_df <- filter(Edu_hh_2010, Marital.status == 2)
# new_df2 <- filter(Edu_hh_2010, Marital.status != 2)
# 
# new_df$Highest.deg.gen.ed <- as.numeric(new_df$Highest.deg.gen.ed)
# new_df$Highest.deg.voc.ed <- as.numeric(new_df$Highest.deg.voc.ed)
# new_df$Relationship <- as.character(new_df$Relationship)
# 
# number1 <- (new_df$Relationship == 1 & new_df$Highest.deg.gen.ed >= 2)
# number2 <- (new_df$Relationship == 2 & new_df$Highest.deg.gen.ed >= 2)
# 
# number3 <- (new_df$Relationship == 1 & new_df$Highest.deg.voc.ed != 0 & new_df$Highest.deg.gen.ed < 2)
# number4 <- (new_df$Relationship == 2 & new_df$Highest.deg.voc.ed != 0 & new_df$Highest.deg.gen.ed < 2)
# 
# number5 <- (new_df2$Relationship == 1 & new_df2$Highest.deg.gen.ed >= 2)
# number6 <- (new_df2$Relationship == 1 & new_df2$Highest.deg.voc.ed != 0 & new_df2$Highest.deg.gen.ed < 2)
# 
# married1 <- (new_df$Relationship == 1)
# married2 <- (new_df$Relationship == 2)
# other_marstat <- (new_df2$Relationship == 1)
# 
# print(sum(number1))
# print(sum(number2))
# print(sum(number3))
# print(sum(number4))
# print(sum(number5))
# print(sum(number6))
# 
# print(sum(married1))
# print(sum(married2))
# print(sum(other_marstat))


# fuel <- Total_WB_fuel_data(Comb_Fuel_2010, Pop_2010, fuel_name1)
# 
# fuel$All.fuel.sum <- NULL
# 
# fuel$'All fuel Sum' = rowSums(fuel[,full_fuel1])
# fuel$'Modern fuel' = rowSums(fuel[, modern_fuel1])
# fuel$'Traditional fuel' = rowSums(fuel[, tradition_fuel])
# 
# percent <- unlist(apply(fuel, 1, function(x) {round(x["Modern fuel"]/x["All fuel Sum"], 1)}))
# fuel$Percent <-percent
# 
# WB_Fuel_data <- filter(fuel, Percent >= 0.5)

# df1 <- data.frame(ID = c(1,1,2,2,2,3,3),
#                   Relationship = c("Head", "Spouse", "Head", "Spouse", "Spouse", "Head", "Spouse"),
#                   Grade = c(4,3,5,7,8,2,12))

# dataframe <- haven::read_dta(hh_path)
# 
# dataframe2 <- dataframe[, c(1:5, 7)]
# 
# colnames(dataframe2) <- c("Province", "District", "Commune", "Territory", "Region", "House.code")
# 
# 
# 
# split <- inner_join(Final_WB_Edu_2010[[1]], dataframe2, by = c("Province", "District", "Commune", "Territory", "House.code"))

# Sample_2016 <- Sample_data(Named_HH_2016, Final_List)



#------------------------------------------------------Graph making test section---------------------------------------------------


# Total_Member_Summary$Year <- as.character(Total_Member_Summary$Year)
# Total_Member_Summary$Percent.WB.Education <- as.numeric(Total_Member_Summary$Percent.WB.Education)
# 
# alter_df <- select(Total_Member_Summary, c("Year", "Scale.Education", "Scale.Water", "Scale.Food", "Scale.Fuel")) %>%
#   gather(key = "WB.Indicator", value = "Population", c("Scale.Education", "Scale.Water", "Scale.Food", "Scale.Fuel"))
# 
# alter_df2 <- select(Total_Member_Summary, c("Year", "Percent.WB.Education", "Percent.WB.Water", "Percent.WB.Food", "Percent.WB.Fuel")) %>%
#   gather(key = "Percent.WB", value = "Percent.value", c("Percent.WB.Education", "Percent.WB.Water", "Percent.WB.Food", "Percent.WB.Fuel"))
# 
# final_df <- cbind(select(alter_df, c("Year", "WB.Indicator", "Population")), select(alter_df2, c("Percent.WB", "Percent.value")))
# 
# ggplot(final_df, aes(x = Year, group = 1)) +
#   geom_col(aes(y = Population/1000000), width = 0.5, fill = "light blue", colour = "black") +
#   facet_wrap(~WB.Indicator, ncol = 4, labeller = as_labeller(c("Scale.Education" = "Education",
#                                                      "Scale.Food" = "Food",
#                                                      "Scale.Fuel" = "Fuel",
#                                                      "Scale.Water" = "Water"))) +
#   geom_line(aes(y = Percent.value*100), colour = "navy", size = 0.75, linetype = "solid") +
# 
#   scale_y_continuous(name = "Population (million people)",
#                      sec.axis = sec_axis(~./100, name = "Well-being achieved (%)", labels = scales::label_percent()),
#                      limits = c(0, 100),
#                      expand = c(0,0)) +
#   theme_bw() +
#   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
#         axis.ticks.length.y = unit(-0.15, "cm"),
#         axis.ticks.x = element_blank(),
#         legend.position = "bottom",
#         legend.title = element_blank(),
#         strip.text = element_text(face = "bold"))




# Total_all_Summary$Year <- as.character(Total_all_Summary$Year)
# Total_all_Summary$Percent.WB <- as.numeric(Total_all_Summary$Percent.WB)
# 
# urban_df <- select(Urban_all_Summary, c("Percent.WB", "Population.scale"))
# colnames(urban_df) <- c("Urban.WB", "Urban")
# 
# rural_df <- select(Rural_all_Summary, c("Percent.WB", "Population.scale"))
# colnames(rural_df) <- c("Rural.WB", "Rural")
# 
# total_df <- select(Total_all_Summary, c("Year", "Percent.WB", "Population.scale"))
# colnames(total_df) <- c("Year","Total.WB", "Total")
# 
# final_df <- cbind(cbind(total_df, urban_df), rural_df)
# 
# alter_df <- gather(final_df, key = "Area", value = "Population", c("Total", "Urban", "Rural")) %>% select(c("Year", "Area", "Population"))
# alter_df2 <- gather(final_df, key = "Area", value = "Percent", c("Total.WB", "Urban.WB", "Rural.WB")) %>% select("Percent")
# 
# sum_df <- cbind(alter_df, alter_df2)
# 
# sum_df$Area <- factor(sum_df$Area, levels = c("Rural", "Urban", "Total"))
# 
# ggplot(sum_df, aes(x = Year, group = 1)) +
#   geom_col(aes(y = Population/1000000, fill = "Population"), width = 0.25, colour = "black") +
#   geom_line(aes(y = Percent*35, color = "Percentage"), size = 0.75) +
#   facet_wrap(~Area, ncol = 3) +
#   scale_y_continuous(name = "Population (million people)",
#                     sec.axis = sec_axis(~./35, name = "Well-being achieved (%)", labels = scales::label_percent()),
#                     limits = c(0, 35),
#                     expand = c(0,0),
#                     breaks = seq(0, 35, 5)) +
#   scale_fill_manual(values = c("light blue")) +
#   scale_color_manual(values = c("red")) +
#   theme_bw() +
#   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
#         axis.ticks.length.y = unit(-0.15, "cm"),
#         axis.ticks.x = element_blank(),
#         strip.text = element_text(face = "bold"),
#         legend.title = element_blank(), 
#         legend.position = "bottom")




# Percent_Sample_dropped$Year <- as.character(Percent_Sample_dropped$Year)
# ggplot(Percent_Sample_dropped, aes(x = Year, group = 1)) +
#   geom_line(aes(y = Final.Sample/1000, linetype = "Analyzed household samples"), size = 1) +
#   geom_line(aes(y = Total.households/1000, linetype = "Total household samples"), size = 1) +
#   theme_bw() +
#   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
#         axis.ticks.length = unit(-0.15, "cm"),
#         plot.title = element_text(hjust = 0.5),
#         legend.title = element_blank(),
#         legend.position = "bottom") +
#   scale_y_continuous(breaks = seq(0, 120, 20),
#                      limits = c(0, 120),
#                      expand = c(0,0)) +
#   ggtitle("Total vs. Analyzed Household Samples") +
#   ylab("Number of households (thousands)")




# pop_df <- filter(Pop_data, Year %in% c(2010:2018))
# pop_df$Year <- as.character(pop_df$Year)
# 
# pop_df <- gather(pop_df, key = "Area.type", value = "Population", c("Population", "Urban.Population", "Rural.Population"))
# pop_df$Area.type <- factor(pop_df$Area.type, level = c("Rural.Population", "Urban.Population", "Population"))
# 
# ggplot(pop_df, aes(x = Year, y = Population/1000000)) +
#   geom_col(width = 0.5, fill = "orange", color = "black") +
#   facet_wrap(~ Area.type, labeller = as_labeller(c("Population" = "Total",
#                                                    "Rural.Population" = "Rural",
#                                                    "Urban.Population" = "Urban"))) +
#   theme_bw() +
#   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
#         axis.ticks.length = unit(-0.15, "cm"),
#         axis.ticks.x = element_blank(),
#         strip.text = element_text(face = "bold"),
#         plot.title = element_text(hjust = 0.5)) +
#   scale_y_continuous(name = "Population (million)",
#                      limits = c(0, 100),
#                      expand = c(0, 0),
#                      breaks = seq(0, 100, 20)) +
#   ggtitle("Vietnam's total, urban, and rural population")




# sum_df <- GDP_WB
# for (y in 2:length(GDP_WB)) {
#   for (x in 1:nrow(GDP_WB)) {
#     sum_df[x, y] <- round(sum_df[x, y]/GDP_WB[1, y], 2)
#   }
# }
# 
# alter_df <- melt(sum_df, id.vars = 'year')
# alter_df$variable <- factor(alter_df$variable, level = c("cgdpe", "Population.scale", "Scale.Education",
#                                                          "Scale.Water", "Scale.Food", "Scale.Fuel"))
# 
# ggplot(alter_df, aes(x = year, y = value)) +
#   geom_line(aes(color = variable, linetype = variable), size = 0.75) +
#   scale_y_continuous(name = "Growth rate",
#                      breaks = seq(0, 2.2, 0.2),
#                      limits = c(0, 2.2),
#                      expand = c(0,0)) +
#   scale_linetype_manual(labels = c("GDP", 'All Well-being indicators', 'Education', 'Water', 'Food', 'Fuel'),
#                         values = c("solid", "solid", "dashed", "dashed", "dashed", "dashed")) +
#   scale_color_manual(labels = c("GDP", 'All Well-being indicators', 'Education', 'Water', 'Food', 'Fuel'),
#                      values = c("black", "red", "blue", "orange", "green", "maroon")) +
#   theme_bw() +
#   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
#         axis.ticks.length = unit(-0.15, "cm"),
#         legend.title = element_blank(),
#         plot.title = element_text(hjust = 0.5)) +
#   ggtitle("GDP growth rate vs. Human well-being growth rate in Vietnam")




# urban_df <- cbind(select(Urban_all_Summary, c("Year", "Percent.WB")), select(Urban_Member_Summary, starts_with('Number.Percent.')))
# colnames(urban_df) <- c("Year", "Percent.WB", "Percent.WB.Education", "Percent.WB.Water", "Percent.WB.Food", "Percent.WB.Fuel")
# urban_df <- add_column(urban_df, Area.type = "Urban", .after = "Year")
# 
# rural_df <- cbind(select(Rural_all_Summary, c("Year", "Percent.WB")), select(Rural_Member_Summary, starts_with('Number.Percent.')))
# colnames(rural_df) <- c("Year", "Percent.WB", "Percent.WB.Education", "Percent.WB.Water", "Percent.WB.Food", "Percent.WB.Fuel")
# rural_df <- add_column(rural_df, Area.type = "Rural", .after = "Year")
# 
# total_df <- cbind(select(Total_all_Summary, c("Year", "Percent.WB")), select(Total_Member_Summary, starts_with('Percent.')))
# total_df <- add_column(total_df, Area.type = "Total", .after = "Year")
# 
# 
# final_df <- rbind(rbind(rural_df, urban_df), total_df)
# 
# final_df <- gather(final_df, key = "WB.Indicator", value = "Percent", c("Percent.WB", "Percent.WB.Education", "Percent.WB.Water",
#                                                                         "Percent.WB.Food", "Percent.WB.Fuel"))
# 
# final_df$Area.type <- factor(final_df$Area.type, level = c("Rural", "Urban", "Total"))
# 
# ggplot(final_df, aes(x = Year, y = Percent)) +
#   geom_line(aes(color = WB.Indicator, linetype = WB.Indicator), size = 0.75) +
#   facet_wrap(~Area.type) +
#   theme_bw() +
#   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
#         axis.ticks.length = unit(-0.15, "cm"),
#         strip.text = element_text(face = "bold"),
#         legend.title = element_blank(),
#         plot.title = element_text(hjust = 0.5)) +
#   scale_y_continuous(name = "% Population achieved well-being",
#                      labels = scales::label_percent(),
#                      limits = c(0, 1),
#                      expand = c(0, 0),
#                      breaks = seq(0, 1, 0.2)) +
#   scale_linetype_manual(labels = c('All Well-being indicators', 'Education', 'Food', 'Fuel', 'Water'),
#                         values = c("solid", "dashed", "dashed", "dashed", "dashed")) +
#   scale_color_manual(labels = c('All Well-being indicators', 'Education', 'Food', 'Fuel', 'Water'),
#                       values = c("red", "blue", "orange", "green", "maroon")) +
#   ggtitle("Percent population achieved well-being in rural, urban, and all of Vietnam")
  

# sum_df <- GDP_WB
# 
# for (y in 2:length(GDP_WB)) {
#   for (x in 1:nrow(GDP_WB)) {
#     if (x == 1) {
#       sum_df[x, y] <- 0
#     }else{
#       sum_df[x, y] <- round(((GDP_WB[x, y]/GDP_WB[x-1, y])^(1/(GDP_WB[x, 1] - GDP_WB[x-1, 1]))) - 1, 3)
#     }
#   }
# }

