/*----------------------------------------------------------

 MODS206 - Analysis : Data Visualization
 authors : Sukeratha Alexandre, Michaud Jules

----------------------------------------------------------*/

use state_WA_HMDA_V3.dta, clear
describe

************* 1. Explicative Variable : income *************
* >> Histogram income
histogram income if income < 300, normal ytitle(Density) xtitle(Gross Annual Revenue (in thousands of USD$)) title(Figure 1: Histogram of applicants' incomes (WA; 2018-2021), span) subtitle((incomes over $300,000 are not displayed)) note(Data Source : FFIEC Home Mortgage Disclosure Act DataBase) legend(on cols(2))

summarize income

* >> Scatter plot - loan_amount on income
twoway (scatter loan_amount income if income < 500), ytitle(Loan Amount (in USD$)) xtitle(Gross Annual Revenue (in thousands of USD$)) title(Figure 2 : Scatter plot loan_amount on income (WA; 2018-2021), span) subtitle((incomes over $500,000 are not displayed)) note(Data Source : FFIEC Home Mortgage Disclosure Act DataBase)

************* 2. Target Variable : action_taken ************
* >> Pie chart action_taken
graph pie, over(action_taken) plabel(_all percent) title(Figure 3 : Pie chart action_taken distribution (WA; 2018-2021), span) note(Data Source : FFIEC Home Mortgage Disclosure Act DataBase) legend(order (2 "Yes" 1 "No"))

************* 3. Auxiliary variables ************************

*** 3.1 Variable: applicant_sex ***
* >> Pie chart apllicant_sex
graph pie, over(applicant_is_male) plabel(_all percent) title(Figure 4 : Pie chart applicant sex distribution (WA; 2018-2021), span) note(Data Source : FFIEC Home Mortgage Disclosure Act DataBase) legend(order (2 "Male" 1 "Female"))

*** 3.2 Variable: activity_year ***
* >> Pie chart applicant_race1
graph pie, over(applicant_race1) plabel(_all percent) title(Figure 5: Pie chart applicant race distribution (WA; 2018-2021), span) note(Data Source : FFIEC Home Mortgage Disclosure Act DataBase) legend(order(1 "American Indian or Alaska Native" 2 "Asian" 3 "Black or African American" 4 "Native Hawaiian or Other Pacific Islander" 5 "White" 6 "Information not provided by applicant in mail, internet, or telephone application" 7 "Not applicable" 8 "Asian Indian" 9 "Chinese" 10 "Filipino" 11 "Japanese" 12 "Korean" 13 "Vietnamese" 14 "Other Asian" 15 "Native Hawaiian" 16 "Guamanian or Chamorro" 17 "Samoan" 18 "Other Pacific Islander"))


*** 3.3 Variable: activity_year ***
* >> Histogram activity_year
histogram activity_year, ytitle(Density) xtitle(Calendar year the data submission covers) title(Figure 6: Histogram of activity year (WA; 2018-2021), span) note(Data Source : FFIEC Home Mortgage Disclosure Act DataBase)
