# installed.packages("rvest")
# installed.packages("dplyr")
installed.packages("stringr")

library(rvest)
library(dplyr)
library(stringr)

# given url, create an html document
link <- ("https://tautmilesgloba.lt/dingo/")
shelter <- read_html(link)

# select parts of a document using CSS selection
# translation : vardas(name), vieta(place/town)
name <- shelter %>% html_nodes(".main-vardas") %>% html_text()
date <- shelter %>% html_nodes(".main-data") %>% html_text() %>% str_trim()
city <- shelter %>% html_nodes(".main-vieta") %>% html_text() %>% str_trim()

# makes columns into factors and creates data frame
animals <- data.frame(name, date, city, stringsAsFactors = FALSE)
write.csv(animals, file = '/Users/veranikapotiiko/Documents/GitHub/st2195_assignment_2/r_csv/animal_shelter.csv', row.names = FALSE) 
