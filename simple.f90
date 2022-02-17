program damped_oscillator
implicit none
real*8 t, dt, t_max, x_old, x_new, dx_dt, v_old, v_new, dv_dt, m, k 
integer*8 count_num
parameter(dt = 0.001, t_max = 100., m = 1., k = 1.) !k는 용수철 상수

t = 0. !초기값
x_old = 0.
v_old = 10.

open(1,file='x_t.dat') !없는 파일을 하나 만드는 과정
open(2,file='v_t.dat')
open(3,file='v_x.dat')

write(1,*) t, x_old
write(2,*) t, v_old
write(3,*) x_old, v_old

do count_num = 0, int(t_max/dt) !인덱스 0부터 int(t_max/dt)
t = t + dt

dx_dt = v_old
k1_v = -(k/m)*x_old!운동방정식
k2_v = 

x_new = x_old + dx_dt*dt
v_new = v_old + (1/6)*dt*(k1_v + 2*k2_v + 2*k3_v + k4_v)
x_old = x_new
v_old = v_new

write(1,*) t, x_old !기록
write(2,*) t, v_old
write(3,*) x_old, v_old

end do

end
