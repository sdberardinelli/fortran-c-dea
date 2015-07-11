!**********************************************************
program GLPK_main
!**********************************************************
implicit none
!**********************************************************
character*72 :: cname
character*3  :: objtype,rest(:)
integer      :: nDMU,nY,nX
integer      :: i,j,k
integer      :: nr,nc
real*8       :: objvals(:),rhs(:)
real*8       :: A(:,:)
!***********************************************************
real*8       :: obj,soln(:)
real*8       :: EFFscores(:,:)
real*8       :: runtime
real*8       :: runtimes(10)
!***********************************************************
allocatable   rest,objvals,rhs,A
allocatable   soln
allocatable   EFFscores
!***********************************************************
open(10,file='GLPKdata.txt')
read(10,*) cname
read(10,*) objtype
read(10,*) cname
read(10,*) nDMU,nY,nX
allocate(EFFscores(nDMU,3))
read(10,*) cname
read(10,*) nc
allocate(objvals(nc),soln(nc))
read(10,*) cname
read(10,*) (objvals(k),k=1,nc)
!write(*,*) (objvals(k),k=1,nc)

read(10,*) cname
read(10,*) nr
allocate(rest(nr),rhs(nr))
read(10,*) cname
read(10,*) (rest(k),k=1,nr)
!write(*,*) (rest(k),k=1,nr)

read(10,*) cname
read(10,*) (rhs(k),k=1,nr)
!write(*,*) (rhs(k),k=1,nr)

allocate(A(nr,nc))
read(10,*) cname
do i=1,nr
read(10,*) (A(i,k),k=1,nc)
!write(*,*) (A(i,k),k=1,nc)
end do

close(10)

write(*,*) 'Finished Reading LP Data'

call LP_LPSOLVE(nr,nc,nDMU,nY,nX,objtype,objvals,rest,rhs,A,obj,soln,runtime,runtimes,EFFscores)
!call LP_GLPK(nr,nc,nDMU,nY,nX,objtype,objvals,rest,rhs,A,obj,soln,runtime,runtimes,EFFscores)

!write(*,*) 'obj = ',obj
!if(nc.le.20) write(*,*) 'solution = ',(soln(k),k=1,nc)

write(*,*) 'Runtime 1 = ',runtimes(1)
write(*,*) 'Runtime 2 = ',runtimes(2)

100 format(3(1F12.8,','))
open(10,file='EFFscores.csv',status='unknown')
write(10,*) 'DEA,QDEA1,QDEA2,'
do i=1,nDMU
 write(10,100) (EFFscores(i,k),k=1,3)
end do
close(10)

!**********************************************************
end program GLPK_main
!**********************************************************
