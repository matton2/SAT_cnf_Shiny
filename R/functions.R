

findLiterals <- function(cnfForm) {
  
  temp <- str_split(cnfForm, "\\^")
  
  literalList <- c()
  
  for(i in seq_along(temp[[1]])) {
    
    temp2 <- str_split(temp[[1]][[i]], "v")
    
    for(j in seq_along(temp2[[1]])) {
      literalList <- c(literalList, temp2[[1]][[j]])
      
    }
    
    
  }
  
  literalList <- literalList %>% 
    str_remove("\\(") %>% 
    str_remove("\\)") %>% 
    str_remove("n") %>% 
    str_trim() %>% 
    unique() %>% 
    str_sort()
  
  
  return(literalList)
  
}


findFormulas <- function(cnfForm) {
  
  formulas <- c()
  
  formulas <- c(formulas, (str_split(cnfForm, "\\^")))
  
  return(formulas)
  
  
}


testFormulas <- function(cnfForm, literalSelection) {
  
  cnfClean <- cnfForm %>% 
    str_replace_all("v", "|") %>% 
    str_replace_all("\\^", "&")
  
  
  for (i in seq_along(literalSelection)) {
    
    cnfClean <- str_replace_all(cnfClean, paste0("n", literalSelection[[i]]), "FALSE")
    cnfClean <- str_replace_all(cnfClean, literalSelection[[i]], "TRUE")
    
  }
  
  allLiterals <- findLiterals(cnfForm)
  
  notSelectedLiterals <- setdiff(allLiterals, literalSelection)
  
  for (i in seq_along(notSelectedLiterals)) {
    
    cnfClean <- str_replace_all(cnfClean, paste0("n", notSelectedLiterals[[i]]), "TRUE")
    cnfClean <- str_replace_all(cnfClean, notSelectedLiterals[[i]], "FALSE")
    
  }
  
  results <- eval(parse(text = cnfClean))
  
  
  return(results)
  
  
  
  
}
