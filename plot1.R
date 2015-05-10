plot1 <- function() {
  
  
  
  # Read data table
  data <- read.table("household_power_consumption.txt", sep=";",header=TRUE, comment.char = "", nrows=2075259, colClasses = "character")
  
  # Convert dates
  data[,1]<-as.Date(data[,1], "%d/%m/%Y")
  
  # Choose subset
  data2<-subset(data, Date=="2007-02-01" | Date=="2007-02-02")
  
  # Recode Global_active_power as numeric
  data2[,3]<-as.numeric(data2[,3])
  
  #draw histogram
  png(file="plot1.png", height=480, width=480)
  
  hist(data2$Global_active_power, col ="red", xlab="Global active power (kilowatts)", main="Global Active Power")
  
  dev.off() 
  
}  
