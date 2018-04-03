program gpu_saxpy

   integer,parameter :: N=1e7
   real,save  :: x(N),y(N),z(N)
   real :: a = 5./3.
   integer it0,it1

   call tick(it0,it1) 
   call saxpy(N,a,x,y,z)
   call tock(it0,it1) 

end program

subroutine saxpy(N,a,x,y,z)
   integer :: N
   real  :: a,x(N),y(N),z(N)

!initialization
   do i = 1,N
      x(i) = real(i)*real(i)
      y(i) = (i+1.)*(i-1.)
   end do

!$acc kernels
   do i = 1,N
      z(i) = x(i)*a+y(i)
   end do
!$acc end kernels

end subroutine
