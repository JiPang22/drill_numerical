program hook_FT
integer*8 i, n, nmax, tmax, wmax
real*8 dt, x, dx, v, dv, d_om, om0, sum_re, sum_im, period
parameter (dt = 1.e-4, d_om = 1.e-1, om0 = 0.001, period = 2 * (acos(-1.)/om0), tmax = 10, wmax = 10)
real x_t(int(tmax/dt))

open(1,file='xt')
open(2,file='vt')
open(3,file='vx')
open(4,file='xw')

x = 0.; v = 1.

do i = 1, int(tmax/dt) ! "i" is time series index
write(1,*) i * dt, x
write(2,*) i * dt, v
write(3,*) x, v
x_t(i) = x; dx = v; dv = -om0**2 * x
x = x + dx * dt; v = v + dv * dt
enddo

do n = 1, int(wmax/d_om) ! "n" is omega series index
write(4,*) n * d_om, sqrt(sum_im**2 + sum_re**2)

do i = 1, int(period/dt) 
sum_re = sum_re + x_t(i) * cos(n * d_om * i * dt) * dt
sum_im = sum_im -x_t(i) * sin(n * d_om * i * dt) * dt
enddo

print*, "step... ", n
enddo

stop
end
