program Driven_oscillator 
implicit none

integer*8 j, j_max, k, k_max
real*8 t, dt, x_old, x_new, v_old, v_new, dx_dt, dv_dt, sumr,sumi, w, dw, k, gam
complex*8 i
integer*8 loop_num
parameter(dw = 0.001, itmax = 5000, dt = 0.01,  om0 = 1., gam = 0.1, w = 10., i = complex(0., 1.))
real*8 xt(itmax) ! array


t = 0.
x0 = 1. !초기조건
v0 = 0.
famp = 0.

do j = 1, j_max

t = loop_num * dt !시간의 흐름을 표현

dx_dt = v0 !처음에는 초기조건을 쓰고 이후 루프에서부터 업데이트 
dv_dt = -om0*om0*x0 -gam*v0 !운동방정식

xt(loop_num) = x0

x1 = x0 + dx_dt * dt !선형근사로 업데이트
v1 = v0 + dv_dt * dt

x0 = x1 !업데이트 
v0 = v1

enddo

do k = 1, k_max

w = k * dw


end
