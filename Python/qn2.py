#!/usr/bin/python
import numpy as np
from numpy.linalg import inv
import matplotlib.pyplot as plt
#Step1
hfile=open("train.csv","r")
arr=hfile.read()
arr=arr.split('\n')
arr=arr[1:-1]
r=[]
for i in arr:
    i=i.split(',')
    r.append([float(i[0]),float(i[1])])
r=np.array(r)
X_flag=r[:,0]
Y_train=r[:,1]
#I have to create new X_train with first coloumn as 1 and other coloumn as previous
X_train=np.full( (len(X_flag), 2), 1, dtype=float)
#np.concatenate( (X_flag, X_train), axis=0 )
X_train[:,1]=X_flag  
print "X_train: ",X_train
print "Y_train: ",Y_train
#step2
w=10*np.random.rand(2,1)
print "w: ",w
####step3
plt.figure(1)
plt.plot(X_flag, Y_train, 'ro')
w_trans=w.T
X_prime=X_train.T
c=np.matmul( w_trans, X_prime)
plt.plot(X_flag, c.T)
#########step4
plt.figure(2)
w_direct =  np.matmul(inv(np.matmul(X_prime, X_train)) , np.matmul(X_prime, Y_train) )
d=np.matmul( w_direct.T, X_prime)
plt.plot(X_flag, Y_train, 'ro')
plt.plot(X_flag, d.T)
#####
#--------
#########step5
eta=0.00000001
x_prime=np.full( (2, 1), 0, dtype=float)
for x in range(0,2):
	for j in range(len(Y_train)):
		x_prime[0] = X_train.T[0,j]
		x_prime[1] = X_train.T[1,j]
		mid=np.matmul( w.T, x_prime)-Y_train[j]
		w=np.subtract(w , eta*mid*x_prime )
		if j%100==0:
			plt.figure(x+3)
			e=np.matmul(w.T,x_prime)
			plt.plot(X_flag[j], e,'g^')
			plt.plot(X_flag[j], Y_train[j], 'ro')
#########-Step 6------------
plt.figure(5)
plt.plot(X_flag, Y_train, 'ro')
c=np.matmul( w.T, X_prime)
plt.plot(X_flag, c.T)
###########Important-----------
plt.show()
###############-------------
#Step 7
hfile=open("test.csv","r")
arr=hfile.read()
arr=arr.split('\n')
arr=arr[1:-1]
r=[]
for i in arr:
    i=i.split(',')
    r.append([float(i[0]),float(i[1])])
r=np.array(r)
X_teflag=r[:,0]
Y_test=r[:,1]
X_test=np.full( (len(X_teflag), 2), 1, dtype=float)
X_test[:,1]=X_teflag
y_pred1=np.matmul(X_test, w)
y_pred2=np.matmul(X_test, w_direct)
#----------------rmse
def rmse(predictions, targets):
    return np.sqrt(((predictions - targets) ** 2).mean())
#-------------------
print "RMSE b/w pred1 and test ",rmse(np.array(y_pred1), np.array(Y_test))
print "RMSE b/w pred2 and test ",rmse(np.array(y_pred2), np.array(Y_test))
