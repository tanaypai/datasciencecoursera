library("data.table")

setwd("~/R Programs/datasciencecoursera/4_Exploratory_Data_Analysis/project/data")

#Reading the Data from the file and then subsetting
PowerTable <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Makes sure the histogram is not printed in scientific notation
PowerTable[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Changes the Date Column to Date Type
PowerTable[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filtering the Dates for 2007-02-01 and 2007-02-02
PowerTable <- PowerTable[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(PowerTable[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off() 