program hook
integer*8 i, imax, k, kmax, n, nmax
real*8 dt, x, dx, v, dv, d_om, om0, sum_re, sum_im
parameter(imax = 1.e+4, kmax = 1.e+4, nmax = 1.e+4, dt = 1.e-2, d_om = 1.e-2, om0 = 1.)
real x_t(imax)

open(1,file='xt')
open(2,file='vt')
open(3,file='vx')
open(4,file='xw')

x = 0.; v = 1.

do i = 1, imax
write(1,*) i * dt, x
write(2,*) i * dt, v
write(3,*) x, v
dx = v; dv = -om0**2 * x
x = x + dx * dt; v = v + dv * dt
x_t(i) = x
print*, "step...", "i =", i
enddo

do n = 1, nmax ! n is omega index number
do k = 1, kmax ! k is sumation loop index number 
sum_re = sum_re + x_t(k) * cos(n * d_om * k * dt) * dt
sum_im = sum_im -x_t(k) * sin(n * d_om * k * dt) * dt
enddo
print*,"n:",n,'-------------',"w:", n*d_om,'-------',"x(w):",sqrt(sum_re**2 + sum_im**2)
enddo

stop
end
