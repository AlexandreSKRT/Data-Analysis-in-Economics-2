*** Working Directory ***
cd "/Stata_project"
*** Import .csv DataSet ***
import delimited using state_WA_merged.csv, clear
*** Convert the .csv file into a .dta file and save it in the working directory ***
save state_WA_HMDA.dta
