## R code implementing plotting tasks as part of creating Plot 1
## Coursera Assignment: Course Project 1 in Exploratory Data Analysis

setwd("E:/Coursera/C4-EDA/ex1") ## changes working directory
## rest of code assumes file "household_power_consumption.txt" is in working directory

## Investigate the data set 
sample<-read.table("household_power_consumption.txt",nrows=10)
str(sample)

## load the data set into data frame with appropriate column types
types<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=types,na.strings=c("?",""))
str(data)
names(data)

## extract subset of data matching dates specified in exercise
qdata<-subset(data,data$Date %in% c("1/2/2007","2/2/2007"))

## convert Date and Time columns to Date and POSIXlt types 
## (there is probably a neater way do to this than this)
date<-as.Date(qdata$Date,format="%d/%m/%Y")
time<-strptime(paste(qdata$Date,qdata$Time),format="%d/%m/%Y  %H:%M:%S")
qdata$Time<-time
qdata$Date<-date

## Plot 1 a Histogram of Global Active Power to window
hist(qdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## Plot 1 a Histogram of Global Active Power to png file
png(file="plot1.png",width = 480, height = 480)
hist(qdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()