"crossval"<- function(x,y,theta.fit,theta.predict,...,ngroup=n){
  call <- match.call()
  x_as.matrix(x)
  n <- length(y)
  ngroup_trunc(ngroup)
  if( ngroup < 2){
    stop ("ngroup should be greater than or equal to 2")
  }
  if(ngroup > n){
    stop ("ngroup should be less than or equal to the number of observations")
  }
  
  if(ngroup==n) {groups_1:n; leave.out_1}
  if(ngroup<n){
    leave.out_trunc(n/ngroup);
    o_sample(1:n)
    groups_vector("list",ngroup)
    for(j in 1:(ngroup-1)){
      jj_(1+(j-1)*leave.out)
      groups[[j]]_(o[jj:(jj+leave.out-1)])
    }
    groups[[ngroup]]_o[(1+(ngroup-1)*leave.out):n]
  }
  u_vector("list",ngroup)
  cv.fit_rep(NA,n)
  for(j in 1:ngroup){
    u_theta.fit(x[-groups[[j]], ],y[-groups[[j]]],...)
    cv.fit[groups[[j]]]_ theta.predict(u,x[groups[[j]],])
    
  }
  
  if(leave.out==1) groups_NULL
  return( cv.fit=cv.fit,ngroup=ngroup,leave.out=leave.out,groups=groups, call=call)
  
 
}
