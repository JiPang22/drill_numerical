program hook_FT
integer*8 i, imax
real*8 dt, dx, v, dv, om0
parameter(imax = 1.e+4, dt = 1.e-2, om0 = 1.)
real x_t(imax)

x_t(i) = 0.
v = 1. 

do i = 1, imax
dx = v; dv = -om0**2 * x_t(i)
v = v + dv * dt; x_t(i) = x_t(i) + dx * dt
print*, i * dt, x(i)
enddo

stop
end
