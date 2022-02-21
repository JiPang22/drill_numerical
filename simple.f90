<<<<<<< HEAD
program hook_FT
integer*8 i, n, nmax, tmax, wmax
real*8 dt, x, dx, v, dv, d_om, om0, sum_re, sum_im, period
parameter (dt = 1.e-4, d_om = 1.e-1, om0 = 0.001, period = 2 * (acos(-1.)/om0), tmax = 10, wmax = 10)
real x_t(int(tmax/dt))

=======
program simple
integer i, n, tmax, wmax, pmax, imax, nmax
real dt, x, dx, v, dv, dw, om0, sum_re, sum_im , t
parameter(wmax = 100, pmax = 100, imax =1e+3, nmax = 1e+3, om0 = 10., period = 2 * acos(-1.)/om0)
parameter(tmax = int(pmax * period))
parameter(dt = tmax/imax, dw = wmax/nmax)
real x_t(imax)
>>>>>>> refs/remotes/origin/main
open(1,file='xt')
open(2,file='vt')
open(3,file='vx')
open(4,file='xw')

t = 0.; x = 0.; v = 1.

<<<<<<< HEAD
do i = 1, int(tmax/dt) ! "i" is time series index
write(1,*) i * dt, x
write(2,*) i * dt, v
=======
do i = 1, imax ! "i" is time series index
t = i * dt
write(1,*) t, x
write(2,*) t, v
>>>>>>> refs/remotes/origin/main
write(3,*) x, v
x_t(i) = x

dx = v; dv = -x * om0 ** 2
x = x + dx * dt; v = v + dv * dt
enddo

<<<<<<< HEAD
do n = 1, int(wmax/d_om) ! "n" is omega series index
write(4,*) n * d_om, sqrt(sum_im**2 + sum_re**2)

do i = 1, int(period/dt) 
sum_re = sum_re + x_t(i) * cos(n * d_om * i * dt) * dt
sum_im = sum_im -x_t(i) * sin(n * d_om * i * dt) * dt
enddo

print*, "step... ", n
=======
do n = 1, nmax ! n is omega index
write(4,*) n * dw, sqrt(sum_im**2 + sum_re**2)
do i = 1, imax ! "i" is time series index of period summation
sum_re = sum_re + x_t(i) * cos(n * d_om * t) * dt
sum_im = sum_im -x_t(i) * sin(n * d_om * t) * dt
enddo
print*, "step... ", n 
>>>>>>> refs/remotes/origin/main
enddo

stop
end
