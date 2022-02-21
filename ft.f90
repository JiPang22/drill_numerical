program ft
integer*8 i, imax, k, kmax, n, nmax, wmax, tmax
real*8 dt_i, dt_k, dt, x, dx, v, dv, d_om, om0, sum_re, sum_im
parameter(imax = 1e+3, kmax = 1e+3, nmax = 1e+3, om0 = 10.)
real x_t(imax)
parameter(tmax = int(2 * acos(-1.)/om0))
parameter(wmax = int(2 * acos(-1.)/tmax))
parameter(d_om = wmax/nmax, dt_i = tmax/imax, dt_k = tmax/kmax)
open(1,file='xt')
open(2,file='vt')
open(3,file='vx')
open(4,file='xw')

x = 0.; v = 1.

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
sum_re = sum_re + x_t(k) * cos(n * d_om * k * dt_k) * dt_k
sum_im = sum_im -x_t(k) * sin(n * d_om * k * dt_k) * dt_k
enddo
write(4,*) n * d_om, sqrt(sum_im**2 + sum_re**2)
print*, "step... ", n
enddo

stop
end
