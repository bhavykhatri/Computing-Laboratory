#!usr/bin/python

invalid=1
k=1
m=0
n=0
INPUT1 = raw_input("")
INPUT2 = float(input(""))
if 1<INPUT2<37:
    invalid=1
else:
    invalid=0
for i in range(len(INPUT1)):
    if INPUT1[i]=='.':
        k=0      
if k==0:
    devider_int_frac = str(INPUT1).split('.')
    Fchild = devider_int_frac[1]
    Ichild = devider_int_frac[0]
    if len(devider_int_frac) > 2:
        invalid=0
else:
    Ichild = INPUT1
    Fchild=str(0)
a=0
solution = 0
minus=1
if Ichild[0]=='-':
    Ichild=Ichild[1:]
    minus=0     
Ichild=Ichild[::-1]
while m < len(Fchild):
    if min(58,INPUT2+48)>ord(Fchild[m])>47:
        a = ord(Fchild[m])-48
    elif min(91,INPUT2+55)>ord(Fchild[m])>64:
        a = ord(Fchild[m])-55
    else:
        invalid=0
        break
    solution += a*INPUT2**(-m-1)
    m=m+1
while n < len(Ichild):
    if min(58,INPUT2+48)>ord(Ichild[n])>47:
        a = ord(Ichild[n])-48
    elif min(91,INPUT2+55)>ord(Ichild[n])>64:
        a = ord(Ichild[n])-55
    else:
        invalid=0
        break
    solution += a*INPUT2**(n)
    n=n+1
if invalid==1 :
    if minus==0 :
        print -1*solution
    else:
        print solution
else:
    print "INVALID INPUT"
