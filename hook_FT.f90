program hook_FT
integer*8 i, imax, k, kmax
real*8 t, dt, x, dx, v, dv, om, d_om, om0, sum_re, sum_im, xom
parameter(imax = 3.e+4, kmax = 1.e+2, dt = 1.e-3, d_om = 1.e-3, om0 = 1.)
real x_t(imax), x_om(kmax)

open(1,file='xt')
open(2,file='vt')
open(3,file='vx')
!open(4,file='xw')

x = 0.; v = 1.; xom = 0.
!sum_re = 0.; sum_im = 0.

do i = 1, imax

write(1,*) t, x
write(2,*) t, v
write(3,*) x, v

!    do k = 1, kmax
!    write(4,*) om, xom
 !   om = k * d_om 
  
!    sum_re = sum_re + x * cos(om * t) * dt
 !   sum_im = sum_im -x * sin(om * t) * dt
  
  !  x_om = sqrt(sum_re**2 + sum_im**2)
   ! x_om(k) = xom
 
!    enddo

t = i * dt; x_t(i) = x

dx = v; dv = -om0**2 * x

x = x + dx * dt; v = v + dv * dt

print*, "step ", i

enddo

end
