# Importing libraries
import pandas as pd

# Importing DataSets; years (2018-2021)
df_2018 = pd.read_csv(filepath_or_buffer="../Data/state_WA_2018.csv")
df_2019 = pd.read_csv(filepath_or_buffer="../Data/state_WA_2019.csv")
df_2020 = pd.read_csv(filepath_or_buffer="../Data/state_WA_2020.csv")
df_2021 = pd.read_csv(filepath_or_buffer="../Data/state_WA_2021.csv")

# For each (year, action_taken), we sample sample_size rows
sample_size = 15000

# Sampling
df_2018_AT1 = df_2018[df_2018["action_taken"] == 1].sample(n=sample_size)
df_2018_AT3 = df_2018[df_2018["action_taken"] == 3].sample(n=sample_size)

df_2019_AT1 = df_2019[df_2019["action_taken"] == 1].sample(n=sample_size)
df_2019_AT3 = df_2019[df_2019["action_taken"] == 3].sample(n=sample_size)

df_2020_AT1 = df_2020[df_2020["action_taken"] == 1].sample(n=sample_size)
df_2020_AT3 = df_2020[df_2020["action_taken"] == 3].sample(n=sample_size)

df_2021_AT1 = df_2021[df_2021["action_taken"] == 1].sample(n=sample_size)
df_2021_AT3 = df_2021[df_2021["action_taken"] == 3].sample(n=sample_size)

# Merging DataFrames
df_WA = pd.concat([df_2018_AT1, df_2018_AT3, df_2019_AT1, df_2019_AT3,
                  df_2020_AT1, df_2020_AT3, df_2021_AT1, df_2021_AT3], axis=0)

# Saving the merged DataFrame in the /Data folder
df_WA.to_csv("../Data/state_WA_merged.csv")