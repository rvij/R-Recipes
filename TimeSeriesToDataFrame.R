library(sos)

help(package="sos")

findFn("ts2df")
install.packages("wq")

library(wq)

df <- ts2df(AirPassengers, mon1 = 1, addYr = FALSE, omit = TRUE)

df$year <- rownames(df)

library(reshape2)

help(package=reshape2)

df1 <- melt(df, id=c("year"), variable.name = "month", value.name="passenger_number")

tst <- c("Jan","Mar","Dec")
match(tst,month.abb)

df1$yearmonth <- paste(df$year, ifelse(match(df1$month,month.abb) < 10, paste("0", match(df1$month,month.abb),sep=""), 
                                       match(df1$month,month.abb)), sep="")

df <- df1[order(df1$yearmonth), c(4,3)]
