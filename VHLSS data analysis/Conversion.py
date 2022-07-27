import pandas as pd
data = pd.io.stata.read_stata("MUC1B.dta")
data.to_csv("MUC1B.csv")
