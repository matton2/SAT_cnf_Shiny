
server <- function(input, output, session) {
    
    rv <- reactiveValues()
    
    rv$result <- FALSE
    
    
    output$literalCheckBox <- renderUI({
        
        req(input$fileIn)
        
        literals <- findLiterals(read_file(input$fileIn$datapath))
        
        checkboxGroupInput('literalSelection', "Select Literals for CNF", choices = literals)
        
        
    })
    
    output$formulas <- renderText({
        
        req(input$fileIn)
        
        formulas <- read_file(input$fileIn$datapath)
        
        formulas
        
    })
    
    observeEvent(input$literalSelection, {
        
        req(input$fileIn)
        
        result <- FALSE
        
        print("event entered!")
        
        cnfform <- read_file(input$fileIn$datapath)
        
        rv$result <- testFormulas(cnfform, input$literalSelection)
        
        print(rv$result)
        
        
        
    })
    
    output$someText <- renderText({
        
        if(rv$result == FALSE) {
            "CNF Not Successful yet"
            
        } else {

            paste("CNF SUCCESSFUL!!!!!  Selections were:", paste(input$literalSelection, collapse = ","))
            
        }
        
        
    })
    
    
    
}
