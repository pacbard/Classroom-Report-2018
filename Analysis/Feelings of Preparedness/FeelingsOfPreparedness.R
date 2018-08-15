# Read in data
library(haven)
data <- read_stata("StudentSurveyData.dta")

# Set up CFA
library(lavaan)

model <- '
# Feelings of Preparedness
Prep =~ NA*teamworkcollab + populartools + projectmanagement + futureinterncareer + developercommunity + portfolio + advancedcourses

# Standardized solution
Prep ~~ 1 * Prep
'

fit <- cfa(model,
            data = data,
            estimator="ML",
            mimic="Mplus"
            )

summary(fit,
        fit.measures=TRUE,
        standardized=TRUE,
        rsquare=TRUE,
        modindices=TRUE)

model_final <- '
# Feelings of Preparedness
Prep =~ NA*teamworkcollab + populartools + projectmanagement + futureinterncareer + developercommunity + portfolio + advancedcourses

# Error Covariances
teamworkcollab ~~ projectmanagement
populartools ~~ projectmanagement
futureinterncareer ~~ advancedcourses
portfolio ~~ advancedcourses

# Standardized solution
Prep ~~ 1 * Prep
'

fit <- cfa(model_final,
            data = data,
            estimator="ML",
            mimic="Mplus"
            )

summary(fit,
        fit.measures=TRUE,
        standardized=TRUE,
        rsquare=TRUE)

model_sem <- '
# Feelings of Preparedness
Prep =~ NA*teamworkcollab + populartools + projectmanagement + futureinterncareer + developercommunity + portfolio + advancedcourses
Prep ~ github2

# Error Covariances
teamworkcollab ~~ projectmanagement
populartools ~~ projectmanagement
futureinterncareer ~~ advancedcourses
portfolio ~~ advancedcourses

# Standardized solution
Prep ~~ 1 * Prep
'

fit <- cfa(model_sem,
            data = data,
            estimator="ML",
            mimic="Mplus"
            )

summary(fit,
        fit.measures=TRUE,
        standardized=TRUE,
        rsquare=TRUE)
