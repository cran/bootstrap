"boott"<- function(x,theta,...,sdfun=sdfunboot,nbootsd=25,nboott=200,
		   VS=F, v.nbootg=100,v.nbootsd=25,v.nboott=200,
		   perc=c(.001,.01,.025,.05,.10,.50,.90,.95,.975,.99,.999)){

  call <- match.call()
  sdfunboot_function(x,nboot,theta,...){
    n_length(x)
    junk_matrix(sample(x,size=n*nboot,replace=T),nrow=nboot)
    return(sqrt(var(apply(junk,1,theta,...))))
  }

  thetahat<- theta(x,...)
  n_length(x)
  if(!VS) {sd_sdfun(x,nbootsd,theta,...)} else{sd_1}
  
  if(VS){ xstar_matrix(sample(x,size=n*v.nbootg,replace=T),nrow=v.nbootg)
	  thetastar0_apply(xstar,1,theta,...)
	  sdstar0_apply(xstar,1,sdfun,v.nbootsd,theta,...)
	  o_order(thetastar0)
	  thetastar0_thetastar0[o]
	  sdstar0_sdstar0[o]
	  
	  temp_lowess(thetastar0,log(sdstar0))$y
	  
	  sdstar0_exp(temp)
	  invsdstar0_1/sdstar0
	  g_ctsub(thetastar0,invsdstar0,thetastar0)
	  g_(g-mean(g))/sqrt(var(g))
	  g_g*sqrt(var(thetastar0))+mean(thetastar0)
	}

  if(!VS) { thetastar0_NULL; g _ NULL}

if(!VS){xstar_matrix(sample(x,n*nboott,replace=T),nrow=nboott)}
       else{xstar_matrix(sample(x,n*v.nboott,replace=T),nrow=v.nboott)}
       thetastar_apply(xstar,1,theta,...)
       gthetastar_rep(0,length(thetastar))

  if(VS){gthetahat_yinter(thetastar0,g,thetahat) }
    else{
      gthetahat_thetahat
    }

  if(VS){
    for(i in 1:length(thetastar)){
      gthetastar[i]_yinter(thetastar0,g,thetastar[i])
    }
  }
    else
      {gthetastar_thetastar}
  
  if(!VS) {sdstar_apply(xstar,1,sdfun,nbootsd,theta,...)} else{sdstar_1}
  
  tstar_sort( (gthetastar-gthetahat)/sdstar)[length(gthetastar):1]

  ans_ gthetahat-sd*tstar

  if(VS){for(i in 1:length(ans)){ ans[i]_xinter(thetastar0,g,ans[i])}  }

  o_trunc(length(ans)* perc)+1
  
  ans1_matrix(ans[o],nrow=1)

  dimnames(ans1)_list(NULL,perc)

  return(confpoints=ans1,theta=thetastar0,g,call=call)
}






