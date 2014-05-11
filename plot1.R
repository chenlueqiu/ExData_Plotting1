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
png(filename = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)");
dev.off();











