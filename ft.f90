program ft
integer*8 i, imax, k, kmax, n, nmax, wmax, tmax, pmax
real*8 dt_i, dt_k, dt, x, dx, v, dv, dw, om0, sum_re, sum_im
parameter(pmax = 1e+3, imax = 1e+5, kmax = 1e+4, nmax = 1e+2, om0 = 5.)
real x_t(imax)
parameter(tmax = pmax * (2. * 3.141592/om0))
parameter(wmax = pmax * om0)
parameter(dw = wmax/nmax, dt_i = tmax/imax, dt_k = tmax/kmax)

open(1,file='xt')
open(2,file='vt')
open(3,file='vx')
open(4,file='xw')

x = 0.; v = 0.
do i = 1, imax
write(1,*) i * dt_i, x
write(2,*) i * dt_i, v
write(3,*) x, v
x_t(i) = x; dx = v; dv = -om0**2 * x
x = x + dx * dt_i; v = v + dv * dt_i
enddo

do n = 1, nmax ! n is omega index 
sum_re = 0.; sum_im = 0.
do k = 1, kmax ! k is time index in sumation loop 
sum_re = sum_re + x_t(k) * cos(n * dw * k * dt_k) * dt_k
sum_im = sum_im -x_t(k) * sin(n * dw * k * dt_k) * dt_k
enddo
write(4,*) n * dw, sqrt(sum_im**2 + sum_re**2)
print*, "step... ", n
enddo

stop
end
