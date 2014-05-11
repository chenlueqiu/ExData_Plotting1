# seting up working dir
getwd(); # get the working dir
setwd('F:/Coursera/Math/DS/EDA/script'); # set the working dir
dir(); # get the list of all files in the working dir

# read in the dataset
data <- read.table(file = "household_power_consumption.txt",
                   header = T, sep = ";", na.strings = "?", nrow = 2075260);

# add a new colomn called DataTime
data <- transform(data, 
                  DateTime = strptime(paste(as.character(Date), as.character(Time), sep = " "),
                                      "%d/%m/%Y %H:%M:%S"));
# subsetting the dataset
idx1 <- format(data$DateTime, "%Y") == "2007";
table(idx1);
idx2 <- format(data$DateTime, "%m") == "02";
table(idx2);
table(idx1 & idx2);
idx3 <- format(data$DateTime, "%d") == "01";
idx4 <- format(data$DateTime, "%d") == "02";
table(idx3 | idx4);
data <- data[idx1 & idx2 & (idx3 | idx4), ];

# create plot
png(filename = "plot4.png", width = 480, height = 480)

# to avoid displaying Chinese weekdays, since I'm from China
Sys.setlocale("LC_TIME", "English United States"); 

par(mfrow = c(2, 2));

plot(data$DateTime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power");

plot(data$DateTime, data$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage");

plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering");
lines(data$DateTime, data$Sub_metering_2, col = "red");
lines(data$DateTime, data$Sub_metering_3, col = "blue");
legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n", cex = 0.9,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"));

plot(data$DateTime, data$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power");

dev.off();








