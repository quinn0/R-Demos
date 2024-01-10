
##Download Ears.RData from our data sets folder on Schoology
## make sure to store it where your working directory is:

getwd() ## is this where Ears.RData is? if not move to the folder printed in your console

list.files() ## check to see the files you currently have in your working directory

load("Ears.RData")

## Counts the number of students with pierced earings 'by' gender
?table

table(Ears)

##Proportion of students with pierced earings 'by' gender

prop.table(table(Ears))

## copy your Marginal proportion table into the RLab Google Doc
