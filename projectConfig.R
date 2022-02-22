
# Packages upload ---------------------------------------------------------

library(tidyverse)
library(readxl)
library(sf)


# Census data upload ------------------------------------------------------

archivo_padron <- "inputData/nacional_2019.txt"

#dat <- readLines(archivo_padron, n=10)
#dat
#rm(dat)

#Defining same variable names as in INE
nombres_padron <- c("CPRO", 
                    "CMUN",
                    "SEXO",
                    "CPRON",
                    "CMUNN",
                    "NACI",
                    "EDAD",
                    "TAMU",
                    "TAMUN")

#Defining width of variables
anchos_padron <- c(2,3,1,2,3,3,3,2,2)

#Putting together new variables
variables_padron <- fwf_widths(anchos_padron, col_names = nombres_padron)

#Data upload 

padron <- read_fwf(archivo_padron,
                   col_positions = variables_padron,
                   col_types = "ccicccicc")


# Metadata upload ---------------------------------------------------------

#Census metadata file 
archivo_meta <- "inputData/Padron_2019.xlsx"

#Listing excel sheet in the file
excel_sheets(archivo_meta)

#Uploading provincial code data
cpro <- read_xlsx(archivo_meta,
                  sheet="CPRO",
                  skip = 3,
                  col_names= c("CPRO", "prov_residencia"))

#Uploading province of birth
#WARNING: this sheet contains two rows more than the previous provinces' account
#1 row :"53, Antiguos Territorios Españoles"
#2 ro2 :"66, Extranjero"
cpron <- read_xlsx(archivo_meta,
                   sheet="CPRON",
                   skip=3,
                   col_names = c("CPRON", "prov_nacimiento"))

#Uploading nationality
naci <- read_xlsx(archivo_meta,
                  sheet="NACI",
                  skip=3,
                  col_names=c("NACI", "nacionalidad"))

# Cartography upload ------------------------------------------------------

prov <- read_sf("inputData/carto/Provincias_ETRS89_30N.shp")
