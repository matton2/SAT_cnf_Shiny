library(tidyverse)
library(shiny)
library(shinyalert)


walk(list.files("R", full.names = TRUE), source)

shinyApp(ui, server)
