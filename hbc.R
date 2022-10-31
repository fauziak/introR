getwd()
3 + 5 

# Intro to R Lesson
# October 18,2022

# Interacting with R

## I am adding 3 and 5. R is fun!
x <- 3
y <- 5
x + y 
number <- x + y
#Exercise 1 and 2
x <- 5
y <- 10
number <- x+y

## Create a numeric vector and store the vector as a variable called 'glengths'
glengths <- c(4.6, 3000, 50000)
glengths

# Create a character vector and store the vector as a variable called 'species'
species <-c("ecoli","human","corn")

# Create a chatacter vector and store the vector as a variable called 'expression'
expression<-c("low", "high","medium","high","low","medium","high")
# Turn 'expression' vector into a factor 
expression <-factor(expression)

# Samplegroup Exercise 
# 1. create a vector named samplegroup with nine elements: 3 control values, 3 knockout values, and 3 over expressing values 
samplegroup <- c("CTL","CTL","CTL","KO","KO","KO","OE","OE","OE")
 
#2, Turn samplegroup into a factor data stucture.
samplegroup<- factor(samplegroup)

# Create a data frame and store it is as a variable called 'df'
df <- data.frame(species, glengths)

df

#Df Exercise Create a data frame called `favorite_books` with the following vectors as columns:
titles <- c("Catch-22", "Pride and Prejudice", "Nineteen Eighty Four")
pages <- c(453, 432, 328)
favorite_books <- data.frame(titles, pages)

list1 <- list(species, df, number)

# Exercise Create a list called `list2` containing `species`, `glengths`, and `number`.
list2 <- list(species, glengths, number)

#Functions 

glengths <- c(glengths, 90) # adding at the end	
glengths <- c(30, glengths) # adding at the beginning

sqrt(81)
sqrt(glengths)
round(3.14159)
?round
args(round)
example("round")
round(3.14159, digits=2)

# Exercise 
#A.Let’s use base R function to calculate mean value of the glengths vector. You might need to search online to find what function can perform this task.
mean(glengths)
#B.Create a new vector test <- c(1, NA, 2, 3, NA, 4). Use the same base R function from exercise 1 (with addition of proper argument), and calculate mean value of the test vector. The output should be 2.5.
test <- c(1, NA, 2, 3, NA, 4)
mean(test, na.rm=TRUE)
#C.Another commonly used base function is sort(). Use this function to sort the glengths vector in descending order.
sort(glengths, decreasing = TRUE)


square_it <- function(x) {
  square <- x * x
  return(square)
}
square_it(5)

#Exercise Write a function called multiply_it, which takes two inputs: a numeric value x, and a numeric value y. The function will return the product of these two numeric values, which is x * y. For example, multiply_it(x=4, y=6) will return output 24.
multiply_it <- function(x,y) {
  product <- x * y
  return(product)
}

#data subsetting 
metadata <- read.csv(file="data/mouse_exp_design.txt")

#Exercise Read it in to R using read.table() with the approriate arguments and store it as the variable proj_summary. To figure out the appropriate arguments to use with read.table(), keep the following in mind:all the columns in the input text file have column name/headers; you want the first column of the text file to be used as row names (hint: look up the input for the row.names = argument in read.table())
#proj_summary <- read.table(file = "data/project-summary.txt", header = TRUE, row.names = 1)

# 2. Use the class() function on glengths and metadata, how does the output differ between the two?
#class(glengths)
#class(metadata)

# 3. Use the summary() function on the proj_summary dataframe
#       i. What is the median rRNA_rate?
#       ii. How many samples got the “low” level of treatment
#summary(proj_summary)

# 4. How long is the samplegroup factor?
#length(samplegroup)

# 5. What are the dimensions of the proj_summary dataframe?
#dim(proj_summary)

# 6. When you use the rownames() function on metadata, what is the data structure of the output?
#str(rownames(metadata))

# 7. How many elements in (how long is) the output of colnames(proj_summary)? Don’t count, but use another function to determine this.
#length(colnames(proj_summary))

#2.1 
age <-c(15, 22, 45, 52, 73, 81)
age[5]
age[-5]
age[c(3,5,6)] 
age[1:4]

# Exercise 1.Create a vector called alphabets with the following letters, C, D, X, L, F.
#alphabets <- c("C", "D", "X", "L", "F")

#2.Use the associated indices along with [ ] to do the following: only display C, D and F,display all,except X, display the letters in the opposite order (F, L, X, D, C)
#alphabets <-c("C","D","X","L","F")
#alphabets["C","D","F"]
#alphabets["-3"]
#alphabets[5:1]

#Exercise Extract only those elements in samplegroup that are not KO (nesting the logical operation is optional).
print(samplegroup[samplegroup!="KO"])
#Releveling factors
expression <- factor(expression, levels=c("low", "medium", "high"))
#str(expression)
#Exercise Use the samplegroup factor we created in a previous lesson, and relevel it such that KO is the first level followed by CTL and OE
samplegroup <- factor(samplegroup, levels=c("KO", "CTL", "OE"))


#Packages and Libraries 
sessionInfo()

#package installation from CRAN
#install.packages("ggplot2")

library(ggplot2)

#Exercise Installing Tidyverse
#install.packages("tidyverse")

#2.3 Data Wrangling:dataframes, matrices, and lists # Extract value 'Wt'
metadata[1, 1]
# Extract value '1'
metadata[1, 3] 
# Extract third row
metadata[3, ] 
#Extract third column
metadata[ , 3]   
#Extract third column as a data frame
metadata[ , 3, drop = FALSE]
#Dataframe containing first two columns
metadata[ , 1:2] 
#Data frame containing first, third and sixth rows
metadata[c(1,3,6), ] 
# Extract the celltype column for the first three samples
metadata[c("sample1", "sample2", "sample3") , "celltype"] 
# Check column names of metadata data frame
colnames(metadata)

# Check row names of metadata data frame
rownames(metadata)
# Extract the genotype column
metadata$genotype 
# Extract the first five values/elements of the genotype column
metadata$genotype[1:5]

#Exericse
#a. Return a data frame with only the genotype and replicate column values for sample2 and sample8.
print(metadata[c("sample2", "sample8"), c("genotype", "replicate")])
#b.Return the fourth and ninth values of the replicate column.
print(metadata[c(4,9), "replicate"])
#c.Extract the replicate column as a data frame.
print(metadata[, "replicate", drop=FALSE])

#Selecting using indices with logical operators
metadata$celltype == "typeA"
logical_idx <- metadata$celltype == "typeA"
metadata[logical_idx, ]
which(metadata$celltype == "typeA")
idx <- which(metadata$celltype == "typeA")
metadata[idx, ]
which(metadata$replicate > 1)
idx <- which(metadata$replicate > 1)
metadata[idx, ]
metadata[which(metadata$replicate > 1), ]
sub_meta <- metadata[which(metadata$replicate > 1), ]

#Exercise Subset the metadata dataframe to return only the rows of data with a genotype of KO.
metadata[which(metadata$genotype == "KO"), ]

#lists 
list1[[2]]
comp2 <- list1[[2]]
class(comp2)

#Exercise 
# a. Create a list named random with the following components: metadata, age, list1, samplegroup, and number.
random <- list(metadata=metadata, age=age, list1=list1, samplegroup=samplegroup, number=number)

#b. Extract the samplegroup component.
print(random$samplegroup)

names(list1)
# Name components of the list
names(list1) <- c("species", "df", "number")
names(list1)
# Extract 'df' component
list1$df

#Exercise 
#a. Set names for the random list you created in the last exercise.
names(random) <- c("metadata", "age", "list1", "samplegroup", "number")
#b. Extract the age component using the $ notation
print(random$age)
