/*----------------------------------------------------------

MODS206 - Pre-Processing : Documentation
authors : Sukeratha Alexandre, Michaud Jules

----------------------------------------------------------*/

*** Import DataSet ***
use state_WA_HMDA.dta, clear

*** Label DataSet ***
label data "HMDA mortgage loan information collected between 2017-2021 in the state of WA."

label variable v1 ""

*** Public HMDA - Data Fields with Values and Definitions ***
label variable activity_year "the calendar year the data submission covers"
label variable lei "a financial institution's Legal Entity Identifier"
label variable derived_msamd "5 digit derived MSA or MD code"
label variable state_code "two-letter state code"
label variable county_code "state-county FIPS code"
label variable census_tract "11 digit census tract number"
label variable derived_loan_product_type "derived loan product type from Loan Type and Lien Status fields"
label variable derived_dwelling_category "derived dwelling type from Construction Method and Total Units fields"
label variable conforming_loan_limit "indicates whether the reported loan amount exceeds the GSE conforming loan limit"
label variable derived_ethnicity "single aggregated ethnicity categorization"
label variable derived_race "single aggregated race categorization"
label variable derived_sex "single aggregated sex categorization"
label variable action_taken "the action taken on the covered loan or application"
label variable purchaser_type "type of entity purchasing a covered loan from the institution"
label variable preapproval "whether the covered loan or application involved a request for a preapproval"
label variable loan_type "the type of covered loan or application"
label variable loan_purpose "the purpose of covered loan or application"
label variable lien_status "lien status of the property securing the covered loan"
label variable reverse_mortgage "whether the covered loan or application is for a reverse mortgage"
* label variable open-end_line_of_credit "whether the covered loan or application is for an open-end line of credit" *
label variable business_or_commercial_purpose "the covered loan or application is primarily for a business/commercial purpose"
label variable loan_amount "the amount of the covered loan, or the amount applied for"
label variable loan_to_value_ratio "the ratio of the total amount of debt /value of the property"
label variable interest_rate "the interest rate for the covered loan or application"
label variable rate_spread "difference between the APR and the average prime offer rate (APOR)"
label variable hoepa_status "whether the covered loan is a high-cost mortgage"
label variable total_loan_costs "the amount, in dollars, of total loan costs"
label variable total_points_and_fees "the total points and fees (USD) charged in connection with the covered loan"
label variable origination_charges "the total of all itemized amounts that are designated borrower-paid"
label variable discount_points "the points paid, in dollars, to the creditor to reduce the interest rate"
label variable lender_credits "the amount, in dollars, of lender credits"
label variable loan_term "number of months after which the legal obligation will mature or terminate"
label variable prepayment_penalty_term "the term, in months, of any prepayment penalty"
label variable intro_rate_period "number of months until the first date the interest rate may change"
label variable negative_amortization "whether the contractual terms include a possible negative amortization loan"
label variable interest_only_payment "whether the contractual terms include interest-only payments"
label variable balloon_payment "whether the contractual terms include a balloon payment"
label variable other_nonamortizing_features "whether the contractual terms include non-amortizing features"
label variable property_value "the value of the property securing the covered loan"
label variable construction_method "construction method for the dwelling"
label variable occupancy_type "occupancy type for the dwelling"
* label variable manufactured_home_secured_property_type "whether the covered loan or application is secured by a manufactured home&land" *
label variable manufactured_home_land_property_interest "the applicant's or borrower's land property interest"
label variable total_units "number of individual dwelling units of the property securing the covered loan"
label variable applicant_age "the age of the applicant"
label variable multifamily_affordable_units "reported values as a percentage of the value reported for Total Units"
label variable income "gross annual income, in thousands of dollars of the applicant"
label variable debt_to_income_ratio "ratio of the applicant/borrower's total monthly debt to the total monthly income"
label variable applicant_credit_score_type "name of the credit scoring model used to generate the credit score"
label variable coapplicant_credit_score_type "name of the credit scoring model used to generate the credit score"
label variable applicant_ethnicity1 "ethnicity of the applicant or borrower"
label variable applicant_ethnicity2 "ethnicity of the applicant or borrower"
label variable applicant_ethnicity3 "ethnicity of the applicant or borrower"
label variable applicant_ethnicity4 "ethnicity of the applicant or borrower"
label variable applicant_ethnicity5 "ethnicity of the applicant or borrower"
label variable coapplicant_ethnicity1 "ethnicity of the applicant or borrower"
label variable coapplicant_ethnicity2 "ethnicity of the applicant or borrower"
label variable coapplicant_ethnicity3 "ethnicity of the applicant or borrower"
label variable coapplicant_ethnicity4 "ethnicity of the applicant or borrower"
label variable coapplicant_ethnicity5 "ethnicity of the applicant or borrower"
label variable applicant_ethnicity_observed "the ethnicity of the applicant was collected based on visual observation/surname"
label variable coapplicant_ethnicity_observed "the ethnicity of the co-applicant was collected using observation/surname"
label variable applicant_race1 "race of the applicant or borrower"
label variable applicant_race2 "race of the applicant or borrower"
label variable applicant_race3 "race of the applicant or borrower"
label variable applicant_race4 "race of the applicant or borrower"
label variable applicant_race5 "race of the applicant or borrower"
label variable coapplicant_race1 "race of the applicant or borrower"
label variable coapplicant_race2 "race of the applicant or borrower"
label variable coapplicant_race3 "race of the applicant or borrower"
label variable coapplicant_race4 "race of the applicant or borrower"
label variable coapplicant_race5 "race of the applicant or borrower"
label variable applicant_race_observed "the race of the applicant was collected based on visual observation/surname"
label variable coapplicant_race_observed "the race of the co-applicant was collected based on visual observation/surname"
label variable applicant_sex "sex of the applicant or borrower"
label variable coapplicant_sex "sex of the first co-applicant or co-borrower"
label variable applicant_sex_observed "the sex of the applicant was collected based on visual observation/surname"
label variable coapplicant_sex_observed "the sex of the applicant was collected based on visual observation/surname"
label variable coapplicant_age "the age, in years, of the first co-applicant or co-borrower"
label variable applicant_age_above_62 "whether the applicant or borrower age is above 62"
label variable coapplicant_age_above_62 "whether the first co-applicant or co-borrower age is above 62"
label variable submission_of_application "the applicant submitted the application directly to the financial institution"
label variable initially_payable_to_institution "Whether the obligation was initially payable to the financial institution"
label variable aus1 "the AUS used by the financial institution to evaluate the application"
label variable aus2 "the AUS used by the financial institution to evaluate the application"
label variable aus3 "the AUS used by the financial institution to evaluate the application"
label variable aus4 "the AUS used by the financial institution to evaluate the application"
label variable aus5 "the AUS used by the financial institution to evaluate the application"
label variable denial_reason1 "principal reason, or reasons, for denial"
label variable denial_reason2 "principal reason, or reasons, for denial"
label variable denial_reason3 "principal reason, or reasons, for denial"
label variable denial_reason4 "principal reason, or reasons, for denial"

*** Census fields produced by the U.S. Census Bureau and appended to public HMDA Data ***
label variable tract_population "total population in tract"
label variable tract_minority_population_percent "percentage of minority population to total population for tract"
label variable ffiec_msa_md_median_family_income "FFIEC Median family income in dollars for the MSA/MD"
label variable tract_to_msa_income_percentage "percentage of tract median family income compared to MSA/MD median family income"
label variable tract_owner_occupied_units "number of dwellings that are lived in by the owner"
label variable tract_one_to_four_family_homes "dwellings that are built to houses with fewer than 5 families"
label variable tract_median_age_of_housing_units "tract median age of homes"

*** Saving documented .dta file ***
save state_WA_HMDA_V2.dta
