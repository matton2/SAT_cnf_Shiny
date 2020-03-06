

ui <- fluidPage(
        
        # Application title
        titlePanel("CS479 SAT CNF Problem Solver"),
        
        sidebarLayout(
            sidebarPanel(
            h1("Upload a SAT CNF file."),
            #h3("Note: please only use v for negation and ^ for separation of clauses"),
            fileInput('fileIn', "Choose CNF Form")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
         
            h2("CNF Formula:"),
            textOutput('formulas'),
            br(),
            br(),
            br(),
            uiOutput("literalCheckBox"),
            br(),
            br(),
            textOutput('someText'),
            h4("This application runs in On2 time due to having to parse about the CNF formulas")
            
            
               
        )
)
)

