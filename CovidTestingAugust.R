library(tidyr)
library(dplyr)
library(readr)
library(readxl)
library(tibble)
library(writexl)
library(stringr)
library(ggplot2)
library(summarytools)

CT <- read_excel("C:/Users/woodsk1/OneDrive - UMass Chan Medical School/Documents/MS Data Science/Fun/CovidTest.xlsx")

summary(CT)
freq(CT$`Provider Name`)


rep_str = c('.*WALGREENS.*'='Walgreens','.*CVS.*'='CVS')
CT$`Provider Name` <- str_replace_all(CT$`Provider Name`, rep_str)
Covid <- CT %>%
  filter(`Provider Name` == c("Walgreens", "CVS"))
freq(Covid$`Provider Name`)


barplot(table(Covid$`Provider Name`))
barplot(table(Covid$State))


MAPharm <- Covid %>%
  filter(State == "MA")
barplot(table(MAPharm$`Provider Name`))

MA <- CT %>%
  filter(State == "MA")
barplot(table(MA$`Provider Name`))