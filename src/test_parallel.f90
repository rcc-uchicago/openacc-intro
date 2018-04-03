program test_parallel
    
    implicit none

    integer,parameter :: SIZE = 100
    integer,dimension(SIZE) :: a,b,c
    integer :: i

    !$acc parallel loop
        do i=1,SIZE
            a(i)=1
            b(i)=0
            c(i)=2
        end do
    !$acc end parallel loop 
        
    !$acc parallel loop
        do i=1,SIZE
            a(i)=b(i)+c(i)+a(i)
        end do
    !$acc end parallel loop 
end program test_parallel
     
