
# fastfoodworld

<!-- badges: start -->
<!-- badges: end -->

## Goals

The **goal** of fastfoodworld is to pack all the necessary information
that one may need about fast foods into one package.

-   The package comes in with a built-in dataset called **fastfoodinfo**
    that can loaded up after loading the package library. That data set
    has nutritional information on various fast food items from various
    fast food joints like fats, calories, sugar, cholesterol and so on.

-   The package also comes in with 3 handy functions:

    -   **calories_in_Kg()** function - The calories of food items are
        usually measured in grams. However, on research I found that
        some places in the world like to measure and read their calories
        in Kgs for easy understanding. With this function, we can
        convert a calorie value to kgs so that the section of the world
        that likes to read their calories in kgs can benefit and
        understand their food nutrition as well.  
    -   **sugar_content() function** - In order to better understand if
        a fast food item qualified as high sugar item or a low sugar
        item, this function comes handy. Universally speaking, if sugar
        content in grams of a single item is more than 8, it is on the
        higher side of the scale. This function takes a sugar quantity
        value in grams as an argument and returns a message explaining
        if that’s high sugar or low sugar.  
    -   **cholesterol() function** - This function is related to the
        shiny app. This function creates a parameterised version of thr
        cholesterol plot in the Shiny app where the function argument(s)
        corresponds to the radio button input. This function lets use
        chose a restaurant as an argument and then displays the top 5
        items from that restaurant with the highest cholesterol
        quantity.  

-   One can also launch an interactive shiny app about the fast food
    data set from this package using the run_app() function to see
    statistical summaries in the form of graphics and plots . The user
    is free to make the choice of inputs to see the respective output on
    the shiny app.

## Installation

You can install the development version of fastfoodworld from
[GitHub](https://github.com/Sanna-Meer) with:

``` r
# install.packages("devtools")
devtools::install_github("etc5523-2022/rpkg-Sanna-Meer")
```

The URL for this package is :
<https://etc5523-2022.github.io/rpkg-Sanna-Meer/>

## Example

### This is the inbuilt data set :

``` r
library(fastfoodworld)
head(fastfoodinfo, 5)
#>   X restaurant                                      item calories cal_fat
#> 1 1  Mcdonalds          Artisan Grilled Chicken Sandwich      380      60
#> 2 2  Mcdonalds            Single Bacon Smokehouse Burger      840     410
#> 3 3  Mcdonalds            Double Bacon Smokehouse Burger     1130     600
#> 4 4  Mcdonalds Grilled Bacon Smokehouse Chicken Sandwich      750     280
#> 5 5  Mcdonalds  Crispy Bacon Smokehouse Chicken Sandwich      920     410
#>   total_fat sat_fat trans_fat cholesterol sodium total_carb fiber sugar protein
#> 1         7       2       0.0          95   1110         44     3    11      37
#> 2        45      17       1.5         130   1580         62     2    18      46
#> 3        67      27       3.0         220   1920         63     3    18      70
#> 4        31      10       0.5         155   1940         62     2    18      55
#> 5        45      12       0.5         120   1980         81     4    18      46
#>   vit_a vit_c calcium salad
#> 1     4    20      20 Other
#> 2     6    20      20 Other
#> 3    10    20      50 Other
#> 4     6    25      20 Other
#> 5     6    20      20 Other
```

### The shiny app can be run using the following :

``` r

run_app <- function() {
  app_dir <- system.file("myapp", package = "fastfoodworld")
  shiny::runApp(app_dir, display.mode = "normal")
}
```

### The calorie conversion is done using the following function :

``` r
calories_in_Kg <- function(calories) {
  cal <- calories/1000
  return(cal)
}
```

For example : calories_in_Kg(38) returns the value 0.38 and so on.

### The sugar content of an item can be monitored using :

``` r
sugar_content<- function(sugar) {
  if(sugar >= 8)
  print("Beware! High Sugar Quantity!!!")
  else print("Low Sugar Quantity!")
}
```

For example, sugar_content(50) returns the following : “Beware! High
Sugar Quantity!!!”

While sugar_content(6) “Low Sugar Quantity!”

### The following function gives the top 5 items with highest cholesterol in the chosen retaurant :

``` r
cholesterol <- function(restaurant) {
  require(shiny)
  shinyApp(
    ui = fluidPage(
      sidebarLayout(
        sidebarPanel(
                     radioButtons("choice", "Choice:",
                                  c("Mcdonalds",
                                    "Chick Fil-A",
                                    "Sonic",
                                    "Arbys",
                                    "Burger King",
                                    "Subway",
                                    "Taco Bell"
      )
    )
    ),
    mainPanel(textOutput("chol"))

      )
    ),

    server = function(input, output) {
      output$chol <- renderText(
            # MODIFY CODE BELOW: Filter for the selected rest
            filter(restaurant == input$choice) %>%
            print((sort(cholesterol,decreasing=TRUE)))
      )
    }
      )
}
```

One shud render `README.Rmd` regularly, to keep `README.md` up-to-date.
`devtools::build_readme()` is handy for this. You could also use GitHub
Actions to re-render `README.Rmd` every time you push. An example
workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

All content should be committed and pushed regularly to keep it updated
with Github and CRAN.
