library(tidyverse)
library(shiny)


walk(list.files("R", full.names = TRUE), source)

shinyApp(ui, server)
