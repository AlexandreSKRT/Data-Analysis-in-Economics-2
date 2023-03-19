/*----------------------------------------------------------

 MODS206 - Pre-Processing : Data Cleaning
 authors : Sukeratha Alexandre, Michaud Jules

----------------------------------------------------------*/

********************** Import DataSet **********************
use state_WA_HMDA_V2.dta, clear

***** 1. Data Cleaning : Explicative & Target variables ****
/*--------------- Status : Before Cleaning ---------------*/
describe

*** 1.1 Explicative variable: income ***
* >> drop outliers / missing values 
drop if missing(income)
drop if income < 0

*** 1.2 Target variable: action_taken ***
* >> drop outliers / missing values 
drop if missing(action_taken)
keep if inlist(action_taken, 1, 3)
* >> boolean target variable {0:'denied', 1:'accepted'} 
replace action_taken = 0 if action_taken == 3 

********** 2. Data Cleaning : auxiliary variables **********

*** 2.1 Variable: applicant_sex ***
* >> applicant_sex {1:'Male'; 2:'Female'}
keep if inlist(applicant_sex, 1, 2)
* >> generate dummy variables : applicant_is_{sex} 
generate applicant_is_male = (applicant_sex == 1)
generate applicant_is_female = (applicant_sex == 2)
* >> label new features
label variable applicant_is_male "is the applicant a male"
label variable applicant_is_female "is the applicant a female"
* >> drop applicant_sex column
drop applicant_sex

*** 2.2 Variable : conforming_loan_limit ***
* >> boolean variable {0:'Not Conform', 1:'Conform'}
replace conforming_loan_limit = "1" if conforming_loan_limit == "C"
replace conforming_loan_limit = "0" if conforming_loan_limit == "NC"
* >> convert .str type to .long *
keep if inlist(conforming_loan_limit, "1", "0")
destring conforming_loan_limit, replace 

*** 2.3 Variable : loan_to_value_ratio ***
* >> delete non-numeric characters 
drop if missing(loan_to_value_ratio)
drop if inlist(loan_to_value_ratio, "Exempt")
* >> convert .str type to .long 
destring loan_to_value_ratio, replace

*** 2.4 Variable : property_value ***
* >> drop outliers / missing values 
drop if missing(property_value)
* >> convert .str type to .long 
destring property_value, replace

*** 2.5 Variable : loan_type ***
* >> generate dummy variables : loan_type_{actual_type}
generate loan_type_home_purchase = (loan_type == 1)
generate loan_type_home_improvement = (loan_type == 2)
generate loan_type_refinancing = (loan_type == 31)
generate loan_type_co_refinancing = (loan_type == 32)
* >> label new features
label variable loan_type_home_purchase "purpose of covered loan or application : home purchase"
label variable loan_type_home_purchase "purpose of covered loan or application : home improvement"
label variable loan_type_home_purchase "purpose of covered loan or application : refinancing"
label variable loan_type_home_purchase "purpose of covered loan or application : cash-out refinancing"

*** 2.6 Variable : applicant_age ***
* >> generate dummy variables : applicant_age_{inf_sup}
generate applicant_age_inf_24 = (applicant_age == "<25")
generate applicant_age_25_34 = (applicant_age == "25-34")
generate applicant_age_35_44 = (applicant_age == "35-44")
generate applicant_age_45_54 = (applicant_age == "45-54")
generate applicant_age_55_64 = (applicant_age == "55-64")
generate applicant_age_65_74 = (applicant_age == "65-74")
generate applicant_age_sup_75 = (applicant_age == ">75")
* >> label new features
label variable applicant_age_inf_24 "applicant's age < 25"
label variable applicant_age_25_34 "applicant's age between 25 and 34"
label variable applicant_age_25_34 "applicant's age between 35 and 44"
label variable applicant_age_25_34 "applicant's age between 45 and 54"
label variable applicant_age_25_34 "applicant's age between 55 and 64"
label variable applicant_age_25_34 "applicant's age between 65 and 74"
label variable applicant_age_sup_75 "applicant's age > 75"

/*--------------- Status : After Cleaning ---------------*/
describe

***************** Save Cleaned DataSet *****************









