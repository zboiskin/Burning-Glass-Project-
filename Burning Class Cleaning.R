BGT <- read.delim("C:/Users/zbois/Desktop/SQL Scripts/BGT.txt")
View(BGT)

#changing the -999 values into 0
BGT$Occupation_Code[BGT$Occupation_Code == "-999"] <- 0

#changing NAs to None values
#identifies factors need to be changed to characters in order to convert, NAs are factors
i <- sapply(BGT, is.factor)
#converts identified factors from previous step into characters
BGT[i] <- lapply(BGT[i], as.character)
#converts new character NAs into "None"s
BGT[is.na(BGT)] <- "None"
#turns the data back into factors
BGT[i] <- lapply(BGT[i], as.factor)
#creating unique row IDs for columns that don't already have
BGT$unique <- rownames(BGT) 

#creating unique IDs Counties
Counties <- data.frame(BGT$unique)
names(Counties)[1] <- paste("Uni")
Counties$county <- BGT$County
Counties <- Counties[!duplicated(Counties$county),]
#Education Level (degree)
Edu_Level <- data.frame(BGT$unique)
names(Edu_Level)[1] <- paste("Uni")
Edu_Level$Edu_Level <- BGT$Degree_Level
Edu_Level <- Edu_Level[!duplicated(Edu_Level$Edu_Level),]

#Experience Level (years)
Exp_Level <- data.frame(BGT$unique)
names(Exp_Level)[1] <- paste("Uni")
Exp_Level$Exp_Level <- BGT$Experience_Level
Exp_Level <- Exp_Level[!duplicated(Exp_Level$Exp_Level),]
#Major
Major <- data.frame(BGT$unique)
names(Major)[1] <- paste("Uni")
Major$Major <- BGT$Edu_.Major
Major <- Major[!duplicated(Major$Major),]
#Title (Occupation)
Title <- data.frame(BGT$unique)
names(Title)[1] <- paste("Uni")
Title$Title <- BGT$Occupation_Title
Title <- Title[!duplicated(Title$Title),]

#Creating new tables with existing IDs
MSA <- data.frame(BGT$MSA_ID)
names(MSA)[1] <- paste("Uni")
MSA$MSA_Name <- BGT$MSA_Name
MSA <- MSA[!duplicated(MSA$MSA_Name),]
#State
State <- data.frame(BGT$State_ID)
names(State)[1] <- paste("Uni")
State$State_Name <- BGT$State_Name
State <- State[!duplicated(State$State_Name),]
#Occupation
Occupation <- data.frame(BGT$Occupation_Code)
names(Occupation)[1] <- paste("Uni")
Occupation$Occupation_Name <- BGT$Occupation_Name
Occupation$Occupation_Title <- BGT$Occupation_Title
Occupation <- Occupation[!duplicated(Occupation$Occupation_Name),]
Occupation <- Occupation[!duplicated(Occupation$Occupation_Title),]

#Skill
Skill <- data.frame(BGT$Skill_ID)
names(Skill)[1] <- paste("Uni")
Skill$Skill_Name <- BGT$Skill_Name
Skill <- Skill[!duplicated(Skill$Skill_Name),]
View(Skill)
#Certification
Cert <- data.frame(BGT$Cert_ID)
names(Cert)[1] <- paste("Uni")
Cert$Cert_Name <- BGT$Cert_Name
Cert <- Cert[!duplicated(Cert$Cert_Name),]

#Exporting new tables as CSVs
write.csv(Counties, file = "Counties.CSV", row.names = FALSE)
write.csv(Cert, file = "Cert.CSV", row.names = FALSE)
write.csv(Edu_Level, file = "Edu_Level.CSV", row.names = FALSE)
write.csv(Exp_Level, file = "Exp_Level.CSV", row.names = FALSE)
write.csv(Major, file = "Major.CSV", row.names = FALSE)
write.csv(MSA, file = "MSA.CSV", row.names = FALSE)
write.csv(Occupation, file = "Occupation.CSV", row.names = FALSE)
write.csv(Skill, file = "Skill.CSV", row.names = FALSE)
write.csv(State, file = "State.CSV", row.names = FALSE)
write.csv(Title, file = "Title.CSV", row.names = FALSE)
write.csv(BGT, file = "BGT.CSV", row.names = FALSE)

#Redo tables to take "s out of rows main table
BGT$MSA_Name<-gsub(",","",BGT$MSA_Name)
BGT$Edu_.Major<-gsub(",","",BGT$Edu_.Major)
BGT$Occupation_Title<-gsub(",","",BGT$Occupation_Title)
#Redo tables to take "s out of rows table we created
MSA$MSA_Name<-gsub(",","",MSA$MSA)
Major$Major<-gsub(",","",Major$Major)
Title$Title<-gsub(",","",Title$Title)
