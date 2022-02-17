program Driven_oscillator 
implicit none

integer*8 it, itmax
real*8 famp, gam, om0, t, dt, x_old, x_new, v_old, v_new, dx_dt, dv_dt, w
complex*8 i
integer*8 loop_num
parameter(itmax = 5000, dt = 0.01,  om0 = 1., gam = 0.1, w = 10., i = complex(0., 1.)) !k는 용수철 상수, m은 질량, c는 감쇠상수
real*8 xt(itmax) ! array


t = 0.
x0 = 1. !초기조건
v0 = 0.
famp = 0.

open(1, file = "x_t.dat")
open(2, file = "v_t.dat")
open(3, file = "v_x.dat")

do loop_num = 1, itmax

t = loop_num * dt !시간의 흐름을 표현

dx_dt = v0 !처음에는 초기조건을 쓰고 이후 루프에서부터 업데이트 
dv_dt = -om0*om0*x0 -gam*v0 + famp*exp(i*w*t) !운동방정식

xt(loop_num) = x0

x1 = x0 + dx_dt * dt !선형근사로 업데이트
v1 = v0 + dv_dt * dt

x0 = x1 !업데이트 
v0 = v1

!	print*, t, '/', itmax

enddo

do it = 1, itmax

write(1, *) it*dt, xt(it)

enddo

do loop_num = 1, itmax

xt_new(loop_num) = xt(loop_num) + xt_new(loop_num)

end do

end
