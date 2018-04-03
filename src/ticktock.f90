subroutine tick(it0,rate)
   integer :: it0,rate
   call system_clock(it0,rate)
end subroutine

subroutine tock(it0,rate)
   integer :: it0,rate
   write(*,"(A,10F8.4)") "Tock registers ",tocksilent(it0,rate)
end subroutine

real function tocksilent(it0,rate)
   integer :: it0,rate
   call system_clock(it1)
   time = dble(it1 - it0)/dble(rate)
   tocksilent = time
end function
