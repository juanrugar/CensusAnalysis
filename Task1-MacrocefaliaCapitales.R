#Analysis 1: Capital cities populational pull strength

# Step 1: List of municipalites upload ------------------------------------

#uploading of municipality of residence  (with over 10000 inhabitants)
cmun <- read_xlsx(archivo_meta,
                  sheet="CMUN",
                  skip=5,
                  col_names = c("CPRO", "CMUN", "NOMBRE"))


# Step 2: Count of cmun ocurrence -----------------------------------------

#To clarify how many cmun exist with the same code
#Using Pipe Operator

cmun %>%  #usando PIPE OPERATOR
  count(CMUN)

#cmun ocurrence per province
cmun %>%  #usando PIPE OPERATOR
  count(CPRO, CMUN)

#cleaning out existing NA values
cmun <- filter(cmun, !is.na(CMUN))



# Step 3: Population per province -----------------------------------------

#Creat new table

pob_provincial <- 

  

