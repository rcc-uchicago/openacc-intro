program test_kernel

    implicit none

    integer,parameter :: SIZE = 1000
    integer :: a(SIZE),b(SIZE),c(SIZE)
    integer :: i
    !$acc kernels
        do i=1,SIZE
            a(i)=i
            b(i)=i+1
            c(i)=i*2
        enddo
        
        do i=1,SIZE
            a(i)=b(i)+c(i)+a(i)
        end do
    !$acc end kernels 
end program test_kernel     
