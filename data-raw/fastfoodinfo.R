## code to prepare `fastfood info` dataset :

# reading the data into an object using read_csv function
fastfoodinfo <- read.csv("data-raw/fastfood_calories.csv")

#use_data from the use this package to run this and create a binary version of this data in the folder "data"
usethis::use_data(fastfoodinfo, overwrite = TRUE)

