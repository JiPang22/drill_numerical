implicit none
integer it, itmax, iom, iomax
real dx, dv, om0, gam, x, v, om, dom, dt, sumr, sumi
parameter(itmax=1.e+4, iomax=100, gam=0.1, dt=0.01, dom=0.05)
real xt(itmax)

x=1. ; v=0.

om0=3.

do it=1, itmax
dx=v
dv=-om0**2*x-gam*v
xt(it)=x
x=x+dx*dt
v=v+dv*dt
!write(6,*) it*dt, x
enddo

do iom=1, iomax
om=iom*dom
sumi=0. ; sumr=0.
do it=1, itmax
sumr=sumr+xt(it)*cos(om*it*dt)*dt
sumi=sumi-xt(it)*sin(om*it*dt)*dt
enddo
write(6,*) om, sqrt(sumr**2+sumi**2)
enddo

stop
end
