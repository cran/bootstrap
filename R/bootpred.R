"bootpred"<- function(x,y,nboot,theta.fit,theta.predict,err.meas,...){
call <- match.call()
x_as.matrix(x)
n <- length(y)
saveii_NULL
fit0_theta.fit(x,y,...)
yhat0_theta.predict(fit0,x)
app.err_mean(err.meas(y,yhat0))
err1_matrix(0,nrow=nboot,ncol=n)
err2_rep(0,nboot)
for(b in 1:nboot){
  ii_sample(1:n,replace=T)
  saveii_cbind(saveii,ii)
  fit_theta.fit(x[ii,],y[ii],...)
  yhat1_theta.predict(fit,x[ii,])
  yhat2_theta.predict(fit,x)  
  err1[b,]_err.meas(y,yhat2)
  err2[b]_mean(err.meas(y[ii],yhat1))
}

optim_mean( apply(err1,1,mean)-err2)

junk_function(x,i){sum(x==i)}
e0_0
for(i in 1:n){
 o_apply(saveii,2,junk,i)
if( sum(o==0)==0) cat("increase nboot for computation of the .632 estimator",fill=T)
 e0_e0+ (1/n)*sum(err1[o==0,i])/sum(o==0)
}
err.632_.368*app.err + .632*e0
return(app.err,optim, err.632, call=call)
}

