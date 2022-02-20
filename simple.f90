program simple
integer i, n, tmax, wmax, pmax, imax, nmax
real dt, x, dx, v, dv, dw, om0, sum_re, sum_im , t
parameter(wmax = 100, pmax = 100, imax =1e+3, nmax = 1e+3, om0 = 10., period = 2 * acos(-1.)/om0)
parameter(tmax = int(pmax * period))
parameter(dt = tmax/imax, dw = wmax/nmax)
real x_t(imax)
open(1,file='xt')
open(2,file='vt')
open(3,file='vx')
open(4,file='xw')

t = 0.; x = 0.; v = 1.

do i = 1, imax ! "i" is time series index
t = i * dt
write(1,*) t, x
write(2,*) t, v
write(3,*) x, v
x_t(i) = x

dx = v; dv = -x * om0 ** 2
x = x + dx * dt; v = v + dv * dt
enddo

do n = 1, nmax ! n is omega index
write(4,*) n * dw, sqrt(sum_im**2 + sum_re**2)
do i = 1, imax ! "i" is time series index of period summation
sum_re = sum_re + x_t(i) * cos(n * d_om * t) * dt
sum_im = sum_im -x_t(i) * sin(n * d_om * t) * dt
enddo
print*, "step... ", n 
enddo

stop
end
