program hook_FT
integer*8 i, imax, j, jmax, k, kmax
real*8 t, dt, x, dx, v, dv, om, d_om, om0, x(imax), sum_re, sum_im
parameter(imax = 1e+5, jmax = 1e+5, kmax = 1e+5, dt = 1.e-3, d_om = 1.e-3, om0 = 1.)

x = 0.; v = 1.

do i = 1, imax

dx = v ; dv = -om0**2 * x

x_vec(i) = x

x = x + dx * dt

enddo

do j = 1, jmax

om = j * d_om

sum_im = sum_0.

end
