/*----------------------------------------------------------

 MODS206 - Analysis : Data Visualization
 authors : Sukeratha Alexandre, Michaud Jules

----------------------------------------------------------*/

use state_WA_HMDA_V3.dta, clear
describe

************* 1. Explicative Variable : income *************
* >> Histogram income
histogram income if income < 300, normal ytitle(Density) xtitle(Gross Annual Revenue (in thousands of USD$)) title(Figure 1: Histogram of applicants' incomes (WA; 2018-2021), span) subtitle((incomes over $300,000 are not displayed)) note(Data Source : FFIEC Home Mortgage Disclosure Act DataBase) legend(on cols(2))

* >> Scatter plot - loan_amount on income
twoway (scatter loan_amount income if income < 500), ytitle(Loan Amount (in USD$)) xtitle(Gross Annual Revenue (in thousands of USD$)) title(figure 2 : Scatter plot loan_amount on income (WA; 2018-2021), span) subtitle((incomes over $500,000 are not displayed)) note(Data Source : FFIEC Home Mortgage Disclosure Act DataBase)

************* 2. Target Variable : action_taken ************
* >> Pie chart action_taken
graph pie, over(action_taken) plabel(_all percent) title(Figure 3 : Pie chart action_taken distribution (WA; 2018-2021), span) note(Data Source : FFIEC Home Mortgage Disclosure Act DataBase)



