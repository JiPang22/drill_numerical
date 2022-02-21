program start
integer a, b

a = 1
b = 2
call iswap(a, b)
print*,a
print*,b
end
subroutine iswap (a, b)
integer a, b, tmp

tmp = a
a = b
b = tmp

return
end
