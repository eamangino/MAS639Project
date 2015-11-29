library(XLConnect)

#Table 2-9
fname <- "C:/Users/Arwa/Downloads/tab2-9.xlsx"
sheet <- c("sheet1")
namedata <-readWorksheetFromFile(fname, sheet, header=FALSE, startRow=2, endRow=2, startCol=1, endCol=12)

UndergradEngEnroll<- readWorksheetFromFile(fname, sheet, header=FALSE, startRow=6, endRow=16, startCol=1, endCol=12)
colnames(UndergradEngEnroll)<-namedata
FreshEngEnroll<- readWorksheetFromFile(fname, sheet, header=FALSE, startRow=19, endRow=29, startCol=1, endCol=12)
colnames(FreshEngEnroll)<-namedata

#Table 2-9 undergrad engineering total enrollment and freshmen enrollment
UndergradEngEnroll
FreshEngEnroll

#this is what i've come up with for the charts

library(reshape2)
ugee_long <- melt(UndergradEngEnroll,
                 id.vars = "Year and enrollment status",
                 measure.vars = c("Female","Male"),
                 variable.name = "gender")
ugee_long$`Year and enrollment status`<-as.factor(ugee_long$`Year and enrollment status`)

ggplot(ugee_long, aes(x=gender, y=value, colour=`Year and enrollment status`, group=`Year and enrollment status`)) +
  geom_bar(position=position_dodge(), stat="identity") 

fee_long<-melt(FreshEngEnroll,
               id.vars = "Year and enrollment status",
               measure.vars = c("Female","Male"),
               variable.name = "gender")
fee_long$`Year and enrollment status`<-as.factor(fee_long$`Year and enrollment status`)
ggplot(fee_long, aes(x=gender, y=value, colour=`Year and enrollment status`, group=`Year and enrollment status`)) +
  geom_bar(position=position_dodge(), stat="identity") 
