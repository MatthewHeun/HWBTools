# Population dataframe column labels
Table_label_pop <- function(Population) {
  Old_names <- colnames(Population)
  
  Population <- set_label(Population, Old_names)
  if (length(Population) == 5) {
    colnames(Population) <- c("Province", "District", "Commune", "Territory", "House.code") 
  }else{
    colnames(Population) <- c("Province", "District", "Commune", "Territory", "House.code", "Urban.Rural") 
  }
  return(Population)
}

# Household dataframe column labels
Table_label_hh <- function(Household) {
  Old_names <- colnames(Household)

  Household <- set_label(Household, Old_names)
  
  colnames(Household) <- c("Province", "District", "Commune", "Territory", "House.code",
                           "Member.code", "Relationship", "Marital.status") 
  return(Household)
}

# Education dataframe column labels
Table_label_edu <- function(Education) {
  Old_names <- colnames(Education)
  
  Education <- set_label(Education, Old_names)
  
  colnames(Education) <- c("Province", "District", "Commune", "Territory", "House.code",
                           "Member.code", "Grade.completed")
  
  return(Education)
}

# Safe water dataframe column labels
Table_label_H2O <- function(Safewater) {
  
  Old_names <- colnames(Safewater)
  Safewater <- set_label(Safewater, Old_names)
  
  if (length(Safewater) == 6) {
    colnames(Safewater) <- c("Province", "District", "Commune", "Territory", "House.code",
                             "Main.water.source")
  }else{
    colnames(Safewater) <- c("Province", "District", "Commune", "Territory", "House.code",
                             "Main.water.source.for.food", "Main.water.source.for.activities" )
  }
  return(Safewater)
}

# Food dataframe column labels
Table_label_food <- function(Food) {
  
  Old_names <- colnames(Food)
  Food <- set_label(Food, Old_names)
  
  if (length(Food) == 8) {

    
    colnames(Food) <- c("Province", "District", "Commune", "Territory", "House.code",
                        "Food.aid", "Food", "Food.stuff")
  }else if (length(Food) == 7) {
    colnames(Food) <- c("Province", "District", "Commune", "Territory", "House.code",
                        "Food.aid", "Enough.food")
  }
  return(Food)
}

# Fuels dataframe column labels
Table_label_fuel <- function(Fuels) {
  Old_names <- colnames(Fuels)
  
  Fuels <- set_label(Fuels, Old_names)
  
  colnames(Fuels) <- c("Province", "District", "Commune", "Territory", "House.code",
                       "Product.code", "Expenditure 1", "Expenditure 2", "Expenditure 3")
  return(Fuels)
}

#Electricity dataframe column labels
Table_label_elec <- function(Electricity) {
  Old_names <- colnames(Electricity)
  
  Electricity <- set_label(Electricity, Old_names )
  
  colnames(Electricity) <- c("Province", "District", "Commune", "Territory", "House.code",
                             "Electricity")
  return(Electricity)
}