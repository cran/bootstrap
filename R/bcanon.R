"bcanon" <- function(x,nboot,theta,...,alpha =
                     c(.025,.05,.1,.16,.84,.9,.95,.975)) { 

    call <- match.call()
    n <- length(x)
    thetahat <- theta(x,...)
    bootsam<- matrix(sample(x,size=n*nboot,replace=TRUE),nrow=nboot)

    thetastar <- apply(bootsam,1,theta,...)
    z0 <- qnorm(sum(thetastar<thetahat)/nboot)
    
    u <- rep(0,n)
    for(i in 1:n){
        u[i] <- theta(x[-i],...)
    }
    uu <- mean(u)-u
    acc <- sum(uu*uu*uu)/(6*(sum(uu*uu))^1.5)
    
    zalpha <- qnorm(alpha)
    
    tt <- pnorm(z0+ (z0+zalpha)/(1-acc*(z0+zalpha)))
    ooo <- trunc(tt*nboot)
    confpoints <- sort(thetastar)[ooo]
    confpoints <- cbind(alpha,confpoints)
    dimnames(confpoints)[[2]] <- c("alpha","bca point")
    return(confpoints, z0, acc, u, call=call)
}
