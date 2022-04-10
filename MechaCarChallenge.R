# CHALLENGE DELIVERABLE 1

#3. import library
library(dplyr)

#4. import mechacar dataset
mechaCar <- read.csv('MechaCar_mpg.csv')

#5. make multiple linear regression on mpg
reg1 <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCar)

#6. use summary function
summary(reg1)

#check correlations
cor(as.matrix(mechaCar[,c("mpg","vehicle_length","vehicle_weight","spoiler_angle","ground_clearance","AWD")]))


# CHALLENGE DELIVERABLE 2

#1-2. import suspension_coil dataset
suspCoil <- read.csv('Suspension_Coil.csv')

#3. create total_summary
total_summary <- suspCoil %>%
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

#4. create lot_summary
lot_summary <- suspCoil %>% 
  group_by(Manufacturing_Lot) %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

#plot PSI
plt <- ggplot(suspCoil, aes(x=0, y=PSI))
plt + geom_boxplot(outlier.colour = "red", outlier.shape = 1)



# CHALLENGE DELIVERABLE 3

#1. t-test of PSI across all lots
t.test(suspCoil$PSI, mu=1500)


#2. t-tests for each lot
#Lot1
t.test(subset(suspCoil,Manufacturing_Lot=='Lot1',select = c('PSI')), mu=1500)
#Lot2
t.test(subset(suspCoil,Manufacturing_Lot=='Lot2',select = c('PSI')), mu=1500)
#Lot3
t.test(subset(suspCoil,Manufacturing_Lot=='Lot3',select = c('PSI')), mu=1500)


#plot lot_summary
plt <- ggplot(suspCoil,aes(x=Manufacturing_Lot,y=PSI,colour=Manufacturing_Lot))
plt + geom_boxplot(outlier.colour = "red", outlier.shape = 1)