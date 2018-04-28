#!/usr/bin/env Rscript
x=rexp(50000, rate=0.2)
sortx=sort(x)
y=1-exp(-0.2*x)
plot(c(1:50000), x)
x11()
#part2
matx<-matrix(x, ncol=500)
cdf<-matrix(1-exp(-0.2*x),ncol = 500)
pdf<-matrix(0.2*exp(-0.2*x), ncol=500)
plot(matx[,1], cdf[,1])
print(mean(matx[,1]))
print(sd(matx[,1]))
x11()
plot(matx[,1], pdf[,1])
x11()
plot(matx[,2], cdf[,2])
print(mean(matx[,2]))
print(sd(matx[,2]))
x11()
plot(matx[,2], pdf[,2])
x11()
plot(matx[,3], cdf[,3])
print(mean(matx[,3]))
print(sd(matx[,3]))
x11()
plot(matx[,3], pdf[,3])
x11()
plot(matx[,4], cdf[,4])
print(mean(matx[,4]))
print(sd(matx[,4]))
x11()
plot(matx[,4], pdf[,4])
x11()
plot(matx[,5], cdf[,5])
print(mean(matx[,5]))
print(sd(matx[,5]))
x11()
plot(matx[,5], pdf[,5])
x11()
#part2.2
meanval= c(1:500)
for(i in 1:500)
{
meanval[i] =  mean(matx[,i])
}

tab <- table(round(10*meanval)/10)

str(tab)
plot(tab, "h", xlab="Value", ylab="Frequency")
x11()


#part4

pdata <- rep(0, 100);
num_samples=500
for(i in 1:num_samples){
    val=round(meanval[i], 1);
    if(val <= 10){
       pdata[val*10] = pdata[val*10] + 1/ num_samples; 
    }
}

xcols <- c(0:99)

str(pdata)
str(xcols)

plot(xcols/10, pdata, "l", xlab="X", ylab="f(X)")
x11()
#Printing cdf
cdata <- rep(0, 100)

cdata[1] <- pdata[1]

for(i in 2:100){
    cdata[i] = cdata[i-1] + pdata[i]
}

plot(xcols/10, cdata, "o", col="blue", xlab="X", ylab="F(X)");

#printing mean and sd
print("Mean for Y1, Y2, Y3, .......")
print(mean(meanval))
print("SD for Y1, Y2, Y3, .......")
print(sd(meanval))
print("Mean for Data")
print(mean(x))
print("SD for Data")
print(sd(x))



