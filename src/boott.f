      subroutine ctsub(n,u,v,y,ty)
      implicit double precision (a-h,o-z)
      double precision u(1),v(1),y(1),ty(1)
      i=1
23000 if(.not.(i .le. n))goto 23002
      if(.not.(y(i) .le. u(1)))goto 23003
      ty(i)=(y(i)-u(1))*v(1)
      goto 23004
23003 continue
      j=1
      ty(i)=0
23005 if(.not.((j .le. n)  .and.  (y(i) .gt. u(j)) ))goto 23006
      if(.not.(j  .gt.  1))goto 23007
      ty(i)=ty(i)+(u(j)-u(j-1))*(v(j)+v(j-1))/2
23007 continue
      j=j+1
      goto 23005
23006 continue
      if(.not.(y(i) .le. u(n)))goto 23009
      ty(i)=ty(i)+.5*(y(i)-u(j-1))*(2*v(j-1)+(y(i)-u(j-1))*(v(j)-v(j-1))
&     /(u(j)-u(j-1)))
      goto 23010
23009 continue
      ty(i)=ty(i)+(y(i)-u(n))*v(n) 
23010 continue
23004 continue
      i=i+1
      goto 23000
23002 continue
      return
      end
C     mortran 2.79 (reserved keyword macros of 09/28/81)
      subroutine xinter(z,fz,n,y,result) 
      implicit double precision (a-h,o-z)                                     4
      double precision  z(n),fz(n),y                                                   
      integer n                                                              10
      if(y .gt. fz(1))goto 10021                                             10
      ii=1                                                                   10
      jj=2                                                                   10
10031 if(z(jj) .ne. z(ii)) goto 10032                                        10
      jj=jj+1                                                                10
      goto 10031                                                             10
10032 continue                                                               10
      goto10011                                                              11
10021 if(y .lt. fz(n))goto 10041                                             11
      jj=n                                                                   11
      ii=n-1                                                                 11
10051 if(z(ii) .ne. z(jj)) goto 10052                                        11
      ii=ii-1                                                                11
      goto 10051                                                             11
10052 continue                                                               11
      goto 10061                                                             12
10041 continue                                                               13
      ii=1                                                                   17
10071 if(((fz(ii).le.y).and.(y.le.fz(ii+1))) .or. ((fz(ii).ge.y).and.(y.     17
     *ge.fz(ii+1)))) goto 10072
      ii=ii+1                                                                17
      goto 10071                                                             18
10072 continue                                                               18
      jj=ii+1                                                                19
10061 continue                                                               20
10011 continue                                                               20
      if(z(ii) .ne. z(jj))goto 10091                                         20
      result=(z(ii))                                                         20
      goto10081                                                              22
10091 if(fz(ii) .ne. fz(jj) .or. y .gt. fz(1))goto 10101                     22
      result=z(1)                                                            22
      goto10081                                                              24
10101 if(fz(ii) .ne. fz(jj) .or. y .lt. fz(n))goto 10111                     24
      result=z(n)                                                            24
      goto10081                                                              25
10111 if(fz(ii) .ne. fz(jj))goto 10121                                       25
      result=(z(ii)+z(jj))/2                                                 25
      goto 10131                                                             26
10121 continue                                                               26
      slope=(fz(jj)-fz(ii))/(z(jj)-z(ii))                                    27
      result=z(ii)+(y-fz(ii))/slope                                          28
10131 continue                                                               29
10081 continue                                                               29
      return                                                                 30
      end                                                                    30
C     mortran 2.79 (reserved keyword macros of 09/28/81)
      subroutine yinter(z,fz,n,x,result) 
      implicit double precision (a-h,o-z)                                     4
      double precision z(n),fz(n),x                                               
      integer n                                                               6
      if(x .gt. z(1))goto 10021                                               6
      ii=1                                                                    6
      jj=2                                                                    6
10031 if(fz(jj) .ne. fz(ii)) goto 10032                                       6
      jj=jj+1                                                                 6
      goto 10031                                                              6
10032 continue                                                                6
      goto10011                                                               7
10021 if(x .lt. z(n))goto 10041                                               7
      jj=n                                                                    7
      ii=n-1                                                                  7
10051 if(fz(ii) .ne. fz(jj)) goto 10052                                       7
      ii=ii-1                                                                 7
      goto 10051                                                              7
10052 continue                                                                7
      goto 10061                                                              8
10041 continue                                                                8
      ii=1                                                                   10
10071 if((z(ii).le.x).and.(x.le.z(ii+1))) goto 10072                         10
      ii=ii+1                                                                10
      goto 10071                                                             11
10072 continue                                                               11
      jj=ii+1                                                                12
10061 continue                                                               13
10011 continue                                                               13
      if(z(ii) .ne. z(jj))goto 10091                                         13
      result=(fz(ii)+fz(jj))/2                                               13
      goto 10101                                                             14
10091 continue                                                               14
      slope=(fz(jj)-fz(ii))/(z(jj)-z(ii))                                    15
      result=fz(ii)+slope*(x-z(ii))                                          16
10101 continue                                                               17
10081 continue                                                               17
      return                                                                 18
      end                                                                    18
