#' Calories conversion
#'
#' @description
#' Converts a given calorie value(in grams) of a fast food item to Kilograms(Kgs)
#'
#' @param calories A numeric calorie number in grams to be converted to Kilograms
#'
#' @return the converted calorie value in Kgs
#'
#' @examples
#' calories_in_Kg(38)
#'
#' @export
calories_in_Kg <- function(calories) {
  cal <- calories/1000
  return(cal)
}


#' Sugar Quantity
#'
#' @description
#' Prints a message based on the sugar quantity entered
#'
#' @param sugar A numeric argument that denotes a sugar quantity of a fast food item
#'
#' @return a string that prints a message based on if the function condition is satisfied
#'
#' @examples
#' sugar_content()
#' sugar_content(5)
#' sugar_content(14)
#'
#' @export
sugar_content<- function(sugar) {
  if(sugar >= 8)
  print("Beware! High Sugar Quantity!!!")
  else print("Low Sugar Quantity!")
}


#' Highest Cholesterol
#'
#' @description
#' Prints out a list of items with highest cholesterol content based on the restaurant selected
#'
#' @param restaurant A character argument which implies a restaurant
#'
#' @return a vector
#'
#' @examples
#' cholesterol()
#' cholesterol(Mcdonalds)
#'
#'@import shiny
#' @export
cholesterol <- function(restaurant) {
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
            print(head(sort(cholesterol,decreasing=TRUE),n=5))
      )
    }

      )
}
