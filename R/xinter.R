"xinter"<-
function(x, y, z, increasing = T)
{
# for function defined by (x(i),y(i)), i=1,...n, interpolate x value at z
	if(increasing == F) {
		x <- -1 * x
		x <- x[length(x):1]
		y <- y[length(y):1]
	}

n_length(x)

if (z <= y[1]) {ii_1;jj_2;while(x[jj]==x[ii]) {jj_jj+1;}}
  else if (z >= y[n]) {jj_n;ii_n-1;while(x[ii]==x[jj]) {ii_ii-1;}}
else {
        ii_1;                                                             
              while( (!((y[ii] <= z) & (z <= y[ii+1])))                
                     &
              (!((y[ii]>= z) & (z>= y[ii+1])))  )   
                         {ii_ii+1;}                                             
             jj_ii+1;                                                           
            }                                                                   
if (x[ii]==x[jj]) {result_(x[ii])}
  else if ((y[ii]==y[jj]) & (z <= y[1]))
        {result_x[1];}
  else if ((y[ii]==y[jj]) & (z >= y[n]))
        {result_x[n];}
  else if (y[ii]==y[jj]) {result_(x[ii]+x[jj])/2;}
       else {slope_(y[jj]-y[ii])/(x[jj]-x[ii]);
             result_x[ii]+(z-y[ii])/slope;
            }

	if(increasing == F) {
		result <- -1 * result
	}
	return(result)
}
