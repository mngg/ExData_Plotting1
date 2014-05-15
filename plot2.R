#COURSE PROJECT 1

#1. Fork Repo
#############

# Fork Repo "https://github.com/rdpeng/ExData_Plotting1"
# Create Folder "C:\Users\mnabernegg\Documents\Coursera\Data Science\4. Exploratory Data Analysis\ExData_Plotting1"

#GitBash:
#cd "Documents/Coursera/Data Science/4. Exploratory Data Analysis/ExData_Plotting1"
#git config --global http.sslVerify false
#git clone https://github.com/mngg/ExData_Plotting1.git

#2. Calculate Size of Data
##########################

#2,075,259 rows and 9 columns
#2,000,000*9*8 bytes/numeric = 149,400,000 bytes
# divided by 2^20 (bytes/MB) = 142 MB


#3. Load data
#############

setwd("C:/Users/mnabernegg/Documents/Coursera/Data Science/4. Exploratory Data Analysis/ExData_Plotting1/ExData_Plotting1")

#get lines where date is 01 or 02 of /2/2007
lines <- grep("^[1-2]/2/2007", readLines("data/household_power_consumption.txt"))

consumption<-read.table("../data/household_power_consumption.txt", header=TRUE,
                        sep=";",skip=lines[1]-1,nrows=length(lines), na.strings="?")
#set colnames
colnames(consumption)=colnames(read.table("../data/household_power_consumption.txt",header=TRUE,
                         sep=";",nrows=1))

#recode ? to na
#already done in read.table, to prove use colSums(is.na(consumption))


#convert to data/time format
consumption$DT<-strptime(paste(consumption$Date, consumption$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
#consumption$Date2<-as.Date(consumption$Date,"%d/%m/%y")
#consumption$Time2<-strptime(consumption$Time,"%H:%M:%S")


#4. Plot graph
png(file="plot2.png")

Sys.setlocale("LC_TIME", "English")
plot(consumption$DT,consumption$Global_active_power, ylab="Global Active Power (kilowatts)",
     xlab="", type="l")

dev.off()