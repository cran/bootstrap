"bcanon"<- function(x,nboot,theta,...,alpha = c(.025,.05,.1,.16,.84,.9,.95,.975)){

call <- match.call()
n <- length(x)
thetahat_theta(x,...)
bootsam<- matrix(sample(x,size=n*nboot,replace=T),nrow=nboot)

thetastar_apply(bootsam,1,theta,...)
z0_qnorm(sum(thetastar<thetahat)/nboot)

u_rep(0,n)
for(i in 1:n){
 u[i]_theta(x[-i],...)
}
uu_mean(u)-u
acc_sum(uu*uu*uu)/(6*(sum(uu*uu))^1.5)

zalpha_qnorm(alpha)

tt_pnorm(z0+ (z0+zalpha)/(1-acc*(z0+zalpha)))
ooo_trunc(tt*nboot)
confpoints_sort(thetastar)[ooo]
confpoints_cbind(alpha,confpoints)
dimnames(confpoints)[[2]]_c("alpha","bca point")
return(confpoints, z0, acc, u, call=call)

 
}
