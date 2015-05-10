plot2 <- function() {
  
  
  
  # Read data table
  data <- read.table("household_power_consumption.txt", sep=";",header=TRUE, comment.char = "", nrows=2075259, colClasses = "character")
  
  # Convert dates
  data[,1]<-as.Date(data[,1], "%d/%m/%Y")
  
  # Choose subset
  data2<-subset(data, Date=="2007-02-01" | Date=="2007-02-02")
  
  #Convert time
  x <- paste(data2$Date, data2$Time)
  
  datetime <- strptime(x, "%Y-%m-%d %H:%M:%S")
  
  # Recode Global_active_power as numeric
  data2[,3]<-as.numeric(data2[,3])
  
  #draw plot
  png(file="plot2.png", height=480, width=480)
  
  plot(datetime, data2$Global_active_power,xlab="", ylab= "Global active power (kilowatts)", type='l')
  
  dev.off() 
  
}  
