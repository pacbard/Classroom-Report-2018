import delimited ../StudentSurveyData.csv

foreach var of varlist _all {
    cap replace `var' = "" if `var' == "#NULL!"
}
destring, replace

save StudentSurveyData.dta, replace
