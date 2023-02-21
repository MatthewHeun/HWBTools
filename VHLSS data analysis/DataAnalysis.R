# .xlsx file path to excel observation sheet
excel_path = "C:/Users/giami/OneDrive - Calvin University/SUMMER RESEARCH/Summer 2022/Analysis/Questionnaire analysis.xlsx"
excel_sheet1 = "observations-WB"
excel_sheet2 = "observations-energy"


#----------------------------------------FUNCTION------------------------------------------------

input_necessary_columns <- function(excel_file, excel_sheet, data_set) {
  Obs_criteria <- read_excel(excel_file, sheet = excel_sheet)
  
  for (x in 1:nrow(Obs_criteria)) {
    if (Obs_criteria$'Data file'[x] == 'n/a' || Obs_criteria$'Data column'[x] == 'n/a') {
      Obs_criteria$'Number of households'[x] <- 'n/a'
      Obs_criteria$'Total households'[x] <- 'n/a'
      Obs_criteria$'Number of individuals'[x] <- 'n/a'
      Obs_criteria$'Total individuals'[x] <- 'n/a'
    }else{
      data_file <- data_set[[Obs_criteria$'Data file'[x]]]
      data_column <- data_file[Obs_criteria$'Data column'[x]]
    }
  }
  
  return(Obs_criteria)
}


data_file_extract <- function(file_list, data_set) {
  data_list <- list()
  for (x in 1:nrow(file_list)) {
    if (file_list$'Data file'[x] == 'n/a'|| file_list$'Data column'[x] == 'n/a') {
      data_list <- append(data_list, 'n/a')
    }else{
      df1 <- data.frame(select(data_set[[file_list$'Data file'[x]]], c(1:6)))
      df2 <- data.frame(select(data_set[[file_list$'Data file'[x]]], c(file_list$'Data column'[x])))
      new_list <- list(cbind(df1, df2))

      data_list <- append(data_list, new_list)
    }
  }
  return(data_list)
}

Number_observation <- function(file_list, data_list) {
  for (x in 1:nrow(file_list)) {
    file_list$'Recorded observations'[x] <- 0
    
    if (file_list$'Data file'[x] == 'n/a' || file_list$'Data column'[x] == 'n/a') {
      file_list$'Recorded observations'[x] <- -1
    }else{
      for (y in 1:(length(data_list[[x]])-2)) {
        empty_values = sum(is.na(data_list[[x]][, c(y)]))
        file_list$'Recorded observations'[x] <- file_list$'Recorded observations'[x] + empty_values
      }
    }
    
    if (file_list$'Code'[x]== 'No' && file_list$'Individual or Household?'[x] == 'Household') {

      file_list$'Number of households'[x] = sum(!is.na(data_list[[x]][, c(7)]))
      file_list$'Total households'[x] = nrow(data_list[[x]])
    }
    else if(file_list$'Code'[x]== 'No' && file_list$'Individual or Household?'[x] == 'Individual'){
      file_list$'Number of individuals'[x] = sum(!is.na(data_list[[x]][, c(7)]))
      file_list$'Total individuals'[x] = nrow(data_list[[x]])
      
      hh_df <- data_list[[x]][, c(1:5)]
      hh_df2 <- drop_na(data_list[[x]][, c(1:5, 7)])
      file_list$'Total households'[x] = nrow(unique(hh_df))
      file_list$'Number of households'[x] = nrow(unique(hh_df2[, c(1:5)]))
    }
    else if(file_list$'Code'[x]== 'Yes' && file_list$'Individual or Household?'[x] == 'Household') {
      if (file_list$'Code number'[x] == 'skip') {
        hh_df <- data_list[[x]][, c(1:5)]
        file_list$'Total households'[x] = nrow(unique(hh_df))
        
        hh_df2 <- drop_na(data_list[[x]][, c(1:5, 7)])
        hh_df3 <- hh_df2[, c(1:5)]
        file_list$'Number of households'[x] = nrow(unique(hh_df3))
      }
      else if(file_list$'Code number'[x] == 'none') {
        hh_name_change <- data_list[[x]]
        names(hh_name_change)[7] <- 'Fuel'
        
        hh_df_sum <- hh_name_change %>% 
          group_by(tinh, huyen, xa, diaban, hoso) %>% 
          dplyr::summarise(Sum_all_code = sum(Fuel)) %>% as.data.frame()

        hh_df2 <- filter(hh_df_sum, Sum_all_code > 0)
        hh_df3 <- hh_df2[, c(1:5)]
        file_list$'Number of households'[x] = nrow(unique(hh_df3))
        
        hh_df <- hh_df_sum[, c(1:5)]
        file_list$'Total households'[x] = nrow(unique(hh_df))
        
      }
      else{
        codeNum_df <- filter(data_list[[x]], data_list[[x]][, c(6)] == as.numeric(file_list$'Code number'[x]))
        
        hh_df <- codeNum_df[, c(1:5)]
        file_list$'Total households'[x] = nrow(unique(hh_df))
        
        hh_df2 <- filter(codeNum_df[, c(1:5, 7)], codeNum_df[, c(7)] > 0)
        hh_df3 <- hh_df2[, c(1:5)]
        file_list$'Number of households'[x] = nrow(unique(hh_df3))
      }

    }
  }
  
  return(file_list)
}

Output_data_to_excel <- function(excel_file, excel_sheet, data_set) {
  wb <- loadWorkbook(excel_file)
  writeData(wb, excel_sheet, data_set)
  saveWorkbook(wb, excel_file, overwrite = TRUE)
}

#------------------------------------------FUNCTION CALLS--------------------------------------------


Obs_WB <- input_necessary_columns(excel_path, excel_sheet1, Named_HH_2014)
Obs_energy <- input_necessary_columns(excel_path, excel_sheet2, Named_HH_2014)

Obs_WB_data_list <- data_file_extract(Obs_WB, Named_HH_2014)
Obs_energy_data_list <- data_file_extract(Obs_energy, Named_HH_2014)

Obs_WB <- Number_observation(Obs_WB, Obs_WB_data_list)
Obs_energy <- Number_observation(Obs_energy, Obs_energy_data_list)

Output_data_to_excel(excel_path, excel_sheet1, Obs_WB)
Output_data_to_excel(excel_path, excel_sheet2, Obs_energy)

