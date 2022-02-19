program test
integer i, imax 
parameter (imax = 1e+3)
real x(imax)
do i = 1, imax
x(i) = i
print*, x(i)
enddo
end
