import delimited ../../StudentSurveyData.csv

foreach var of varlist _all {
    cap replace `var' = "" if `var' == "#NULL!"
}
destring, replace

** Generate dummy for github use
tab githubuse, gen(github)

save StudentSurveyData.dta, replace
