program hook_FT
integer*8 i, imax, j, jmax, k, kmax
real*8 t, dt, x, dx, v, dv, om, d_om, om0, sum_re, sum_im
parameter(imax = 1e+5, jmax = 1e+5, kmax = 1e+5, dt = 1.e-3, d_om = 1.e-3, om0 = 1.)
real*8 x_vec(imax)

x = 0.; v = 1.

do i = 1, imax

dx = v; dv = -om0**2 * x

x_vec(i) = x
print*, x_vec(i)
x = x + dx * dt; v = v + dv * dt

enddo

do k = 1, kmax

do j = 1, jmax
om = j * d_om; sum_re = 0.; sum_im = 0.
enddo

sum_re = sum_re + x_vec(i) * cos(om * k * dt) * dt; sum_im = sum_im -x_vec(i) * sin(om * k *dt) * dt

enddo

end
