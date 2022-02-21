program hook_FT
integer*8 i, imax, k, kmax, n, nmax
real*8 dt, x, dx, v, dv, d_om, om0, sum_re, sum_im
parameter(imax = 3e+4, kmax = 3e+4, nmax = 3e+3, dt = 1.e-4, d_om = 1.e-2, om0 = 10.)
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
x_t(i) = x; dx = v; dv = -om0**2 * x
x = x + dx * dt; v = v + dv * dt
enddo

do n = 1, nmax ! n is omega index number
sum_re = 0.; sum_im = 0.
do k = 1, kmax ! k is sumation loop index number 
sum_re = sum_re + x_t(k) * cos(n * d_om * k * dt) * dt
sum_im = sum_im -x_t(k) * sin(n * d_om * k * dt) * dt
enddo
write(4,*) n * d_om, sqrt(sum_im**2 + sum_re**2)
print*, "step... ", n
enddo

stop
end
