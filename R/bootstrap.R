"bootstrap"<- function(x,nboot,theta,...,func=NULL){
call <- match.call()

n <- length(x)
bootsam<- matrix(sample(x,size=n*nboot,replace=T),nrow=nboot)
thetastar_apply(bootsam,1,theta,...)
func.thetastar_NULL; jack.boot.val_NULL; jack.boot.se_NULL;
if(!is.null(func)){
   match1 <- function(bootx,x){duplicated(c(bootx,x))[( length(x)+1) : (2*length(x))]}
   matchs <- t(apply(bootsam,1,match1,x))
   func.thetastar <- func(thetastar)
   jack.boot <- function(inout,thetastar,func){ func(thetastar[!inout])}
   jack.boot.val <- apply(matchs,2,jack.boot,thetastar,func)

   if(sum(is.na(jack.boot.val)>0)) {cat("At least one jackknife influence value for func(theta) is   undefined", fill=T)
   cat(" Increase nboot and try again",fill=T)
  return()}

if( sum(is.na(jack.boot.val))==0) 
  {jack.boot.se <- sqrt( ((n-1)/n)*sum( (jack.boot.val-mean(jack.boot.val))^2 )  )



}}

 return(thetastar,func.thetastar,jack.boot.val, jack.boot.se, call=call)

 
}
