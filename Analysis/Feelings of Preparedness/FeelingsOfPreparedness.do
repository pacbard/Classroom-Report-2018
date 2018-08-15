** Load data
use "StudentSurveyData.dta", clear

** Calculate alpha score for the preparation scale
alpha teamworkcollab populartools projectmanagement futureinterncareer developercommunity portfolio advancedcourses, item

** First model
sem (Prep -> teamworkcollab populartools projectmanagement futureinterncareer developercommunity portfolio advancedcourses), standardize
** Fit indices
estat gof, stats(all)
** Modification indices
estat mindices

** Final model
sem (Prep -> teamworkcollab populartools projectmanagement futureinterncareer developercommunity portfolio advancedcourses), cov(e.teamworkcollab*e.projectmanagement) cov(e.populartools*e.projectmanagement) cov(e.futureinterncareer*e.advancedcourses) cov(e.portfolio*e.advancedcourses) standardize
estat gof, stats(all)

** Structural model with results for the effect of github use on students' feelings of preparedness
sem (Prep -> teamworkcollab populartools projectmanagement futureinterncareer developercommunity portfolio advancedcourses) (github2 -> Prep), cov(e.teamworkcollab*e.projectmanagement) cov(e.populartools*e.projectmanagement) cov(e.futureinterncareer*e.advancedcourses) cov(e.portfolio*e.advancedcourses) standardize
