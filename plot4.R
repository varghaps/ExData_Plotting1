plot4 <- function() {
  
  
  
  # Read data table
  data <- read.table("household_power_consumption.txt", sep=";",header=TRUE, comment.char = "", nrows=2075259, colClasses = "character")
  
    # Convert dates
    data[,1]<-as.Date(data[,1], "%d/%m/%Y")
  
    # Choose subset
    data2<-subset(data, Date=="2007-02-01" | Date=="2007-02-02")
  
    #Convert time
    x <- paste(data2$Date, data2$Time)
  
    datetime <- strptime(x, "%Y-%m-%d %H:%M:%S")
  
    # Recode data as numeric
    for (i in 3:9) { 
    
        data2[,i]<-as.numeric(data2[,i])
    }
  

  
  
  #draw plots
  png(file="plot4.png", height=480, width=480)

  
  #set 2-by-2 plotting
  par(mfrow=c(2,2))
  
      #draw plot1
      plot(datetime, data2$Global_active_power,xlab="", ylab= "Global active power (kilowatts)", type='l')
  
      #draw plot2  
      plot(datetime, data2$Voltage, ylab= "Voltage", type='l')
  
      #draw plot3
  
          #first variable
          plot(datetime, data2$Sub_metering_1, xlab="", ylab= "Energy sub metering", type='l')
  
  
          #add other two lines 
          lines(datetime, data2$Sub_metering_2,col="red")
          lines(datetime, data2$Sub_metering_3,col="blue")
  
          legend("topright", lty=c(1,1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n") 
      
      #draw plot4
      plot(datetime, data2$Global_reactive_power, ylab= "Global_reactive_power", type='l')
  
  dev.off() 
  
}  




