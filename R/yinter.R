"yinter"<-
function(x, y, z, increasing = T)
{
# for function defined by (x(i),y(i)), i=1,...n, interpolate y value at z
#
# used by boott
    
	if(increasing == F) {
		x <- -1 * x
		x <- x[length(x):1]
		y <- y[length(y):1]
		z <- -1 * z
	}
n _ length(x)
if (z <= x[1]) {ii_1;jj_2;while ( y[jj]==y[ii]) {jj_jj+1;}}
  else if (z>=x[n]) {jj_n;ii_n-1;while ( y[ii]==y[jj]) {ii_ii-1;}}
        else {ii_1;
              while  (!((x[ii] <= z) & (z <= x[ii+1])))
                         {ii_ii+1;}
             jj_ii+1;
             }
if (x[ii]==x[jj]) {result_(y[ii]+y[jj])/2;}
       else {slope_(y[jj]-y[ii])/(x[jj]-x[ii]);
             result_y[ii]+slope*(z-x[ii]);
            }

	return(result)
}
