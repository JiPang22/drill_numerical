program ft
real w0, dw
parameter(w0 = 20., dw = 1.e-2)
open(1,file='xw')
do k = 1, 10000
write(1,*) k * dw,(1 + w0**2)/((k * dw)**2 - w0**2)
enddo
end
