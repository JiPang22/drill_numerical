program simple
integer i, n
real dt, x, dx, v, dv, dw, om0, sum_re, sum_im
parameter(tmax = 10, wmax = 10, pmax = 10, dt = 1.e-2, dw = 1.e-3, om0 = 1., period = 2 * acos(-1.)/om0)
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
x_t(i) = x; dx = v; dv = -x * om0 ** 2
x = x + dx * dt; v = v + dv * dt
enddo

do n = 1, int(wmax/dw) ! n is omega index
write(4,*) n * dw, sqrt(sum_im**2 + sum_re**2)
do i = 1, int(tmax/dt) ! "i" is time series index of period summation
sum_re = sum_re + x_t(i) * cos(n * d_om * i * dt) * dt
sum_im = sum_im -x_t(i) * sin(n * d_om * i * dt) * dt
enddo
print*, "step... ", n 
enddo

stop
end
