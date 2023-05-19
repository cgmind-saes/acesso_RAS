library(tidyverse)
library(data.table)
metadados <- read_csv("https://github.com/ipeaGIT/aopdata/releases/download/v1.0.0/metadata.csv")




  
  pastas <- c("access","landuse","population","hex_grid")

  bx_napasta <- function(url){
      nnn <- gsub(".*/","",url)
      pasta <-  gsub("_.*","",nnn)
      nom <- paste0("data/new/",pasta,"/",nnn)  
      if (!file.exists(nom)) {
        try(download.file(url,nom))
      }
      print(paste("processado",nnn))
      }
    
  lapply(metadados$download_path,bx_napasta)
  
   
  access <- lapply(list.files("data/new/access","*.csv",full.names = T),read_csv)
  
  access <- rbindlist(access,fill=T)
  
  access_extremes <- access %>%
    group_by(abbrev_muni, mode) %>%
    summarise(across(CMATT15:TMICT, min, .names = "{.col}.min"),
              across(CMATT15:TMICT, max, .names = "{.col}.max"))
  
  write_rds(access_extremes,"data/new/access/access_limits.rds")
  