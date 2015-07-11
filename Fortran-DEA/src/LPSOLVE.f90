! GLPK_subroutine_DEA-loop-DMUs-droprows
!********************************************************************
subroutine LP_LPSOLVE(nr,nc,nDMU,nY,nX,objtype,objvals,rest,rhs,A,obj,soln,runtime,runtimes,EFFscores)
!********************************************************************
use lp_solve
use lp_solve_constants
use iso_c_binding
implicit none
type(c_ptr) :: dea
type(c_ptr) :: dea2
type(c_ptr) :: qdea
!********************************************************************
!input variables
integer     :: nr,nc
integer     :: nDMU,nY,nX
character*3 :: objtype,rest(nr)
real*8      :: objvals(nc),rhs(nr)
real*8      :: A(nr,nc)
!********************************************************************
!output variables
real*8      :: obj
real*8      :: soln(nc)
real*8      :: runtime
real*8      :: runtimes(10)
!DEA and QDEA outputs
real*8      :: EFFscores(nDMU,3)
!********************************************************************
!DEA  variables
character*3 :: restD(nDMU+1),restD2(nDMU+1)
real*8      :: objvalsD(nY+nX)
real*8      :: rhsD(nDMU+1),rhsD2(nDMU+1)
real*8      :: AD(nDMU+1,nY+nX),AD2(nDMU+1,nY+nX)
real*8      :: objD,objD2
real*8      :: solnD(nY+nX)
!DEA internal viables
integer     :: nYX,nDMUp1,nconst
integer     :: nrD,ncD
integer     :: nrD2,ncD2
integer     :: irD2
integer     :: jDMU
integer     :: itmp,itmp1,itmp2,itmp3
integer     :: jtmp,jtmp1,jtmp2,jtmp3
integer     :: dstart,dend
integer     :: ijconrowD(nX),ijconrowQ(nX)
integer     :: dcount
real*8      :: eps=10.0**(-10.0)
real*8      :: dmult(nDMU),dvals(nDMU)
!********************************************************************
!internal variables
integer     :: nsims

integer :: ret
integer, dimension(0:(nr*nc))        :: ia,ja
integer, dimension(0:((nDMU+1)*(nY+nX))) :: iaD,jaD
integer, dimension(0:((nDMU+1)*(nY+nX))) :: iaD2,jaD2

integer i,j,k
integer kD,kQ,kD2
real(kind=8), dimension(0:(nr*nc))        :: ar
real(kind=8), dimension(0:((nDMU+1)*(nY+nX))) :: arD
real(kind=8), dimension(0:((nDMU+1)*(nY+nX))) :: arD2

real(8), dimension(0:4) :: obj_coeff
real(8), dimension(0:4) :: obj_coeff_temp
real(8), dimension(0:4) :: row_coeff
real(8), dimension(0:4) :: row_coeff_temp

real(kind=8) :: z,z8

integer ijrowD(nX),ijrow(nX)
integer jcount
!********************************************************************
real*8  :: t0,t1,t2,t3,t4,t6,t7,t8,t9,t10
!********************************************************************
z8=0.0_8
!********************************************************************
EFFscores=0.0
!construct the DEA data
nYX=nY+nX
nconst=nYX+1
nDMUp1=nDMU+1
nrD=nDMUp1
ncD=nYX

dstart=nYX+2
dend=dstart+nDMU-1

restD=rest(1:nDMUp1)
objvalsD=objvals(1:nYX)
rhsD=rhs(1:nDMUp1)
AD=A(1:nDMUp1,1:nYX)

call cpu_time(t0)

dea = make_lp(nrD,ncD)

call set_verbose(dea,NEUTRAL)

if(objtype.eq.'max') call set_maxim(dea)
if(objtype.eq.'min') call set_minim(dea)

do i=1,nrD
    if(restD(i).eq.'<=') then
        ret = set_constr_type(dea,i,LE);
    end if
    if(restD(i).eq.'>=') then
        ret = set_constr_type(dea,i,GE);
    end if
    ret = set_rh(dea,i,rhsD(i));
end do

iaD=0;jaD=0;arD=0.0
itmp=0;kD=0
do i=1,nrD
    row_coeff(0) = 0
    do j=1,ncD
        if(abs(AD(i,j)).gt.eps) then
            kD=kD+1
            iaD(kD)=i;jaD(kD)=j;arD(kD)=AD(i,j)
            if(i==nDMUp1 .and. j>nY .and. j<=(nY+nX)) then
                itmp=itmp+1
                ijconrowD(itmp)=kD
            end if

             ret = set_mat(dea,i,j,arD(kD));
!            write(*,'(5F10.2,(A))',advance='no') row_coeff(j)
        end if
    end do
!    write (*,*) rhsD(i)

!    call print_lp(dea)
!    read(*,*)
end do

do j=1,ncD
    ret = set_obj(dea, j, objvalsD(j));
end do

!******************************************************
qdea = make_lp(nr,nc)

call set_verbose(qdea,NEUTRAL)

if(objtype.eq.'max') call set_maxim(qdea)
if(objtype.eq.'min') call set_minim(qdea)


do i=1,nr
    if(rest(i).eq.'<=') then
        ret = set_constr_type(qdea,i,LE);
    end if
    if(rest(i).eq.'>=') then
        ret = set_constr_type(qdea,i,GE);
    end if
    ret = set_rh(qdea,i,rhs(i));
end do

do j=1,nc
    ret = set_obj(qdea, j, objvals(j));
end do

ia=0;ja=0;ar=0.0
itmp=0;kQ=0
do i=1,nr
    do j=1,nc
        if(abs(A(i,j)).gt.eps) then
            kQ=kQ+1
            ia(kQ)=i;ja(kQ)=j;ar(kQ)=A(i,j)
            if(i==nDMUp1 .and. j>nY .and. j<=(nY+nX)) then
                itmp=itmp+1
                ijconrowQ(itmp)=kQ
            end if
            ret = set_mat(qdea,i,j,ar(kQ));
        end if
    end do
end do

!******************************************************
call cpu_time(t2)
!******************************************************
jcount=0
jDMU=1
do 100 jDMU=1,nDMU
!******************************************************
!! edit objective values

objvalsD(1:nY)=AD(jDMU,1:nY)
objvals(1:nY) =A(jDMU,1:nY)

jtmp1=nY+1
jtmp2=nY+nX

AD(nrD,jtmp1:jtmp2)=-1.0*AD(jDMU,jtmp1:jtmp2)

do j=1,nY
    ret = set_obj(dea,j,objvalsD(j))
end do

do j=1,nY
    ret = set_obj(qdea,j,objvals(j))
end do

do j=1,nX
 jtmp=nY+j
 itmp=ijconrowD(j)
 arD(itmp)=-1.0*AD(jDMU,jtmp)
 ret = set_mat(dea,itmp/(nY+nX)+1,jtmp,arD(itmp))
end do

do j=1,nX
 jtmp=nY+j
 itmp=ijconrowQ(j)
 ar(itmp)=-1.0*A(jDMU,jtmp)
 ret = set_mat(qdea,itmp/(5)+1,jtmp,ar(itmp)) !!! not sure why this works? check dim of A for debugging
end do

!!**************************************************

!solve DEA problem
ret = solve(dea)
objD = get_objective(dea)
EFFscores(jDMU,1)=objD

!******************************************************

!******************************************************
!QDEA stage 1
ret = solve(qdea)
obj = get_objective(qdea)

EFFscores(jDMU,2)=obj

ret = get_variables(qdea,soln)

!do j=1,nc
!    write(*,'(5F10.2,(A))',advance='no') get_var_primalresult(qdea,j)
!end do

!*******************************************************
!QDEA stage 2

dmult=0.0;dvals=0.0
dvals=soln(dstart:dend)
where(dvals>eps) dmult=1.0000000005

dcount=int(sum(dmult))
nrD2=nrD-dcount

!create AD2, rhsD2, and restD2
AD2=0.0d0;rhsD2=0.0d0;restD2='<='
itmp=0
do i=1,nrD
 if(i<=nDMU.and. dmult(i)<(0.01d0)) then
  itmp=itmp+1
  AD2(itmp,1:ncD)=AD(i,1:ncD)
  rhsD2(itmp)=rhsD(i)
  restD2(itmp)=restD(i)
 end if

 if(i>nDMU) then
  itmp=itmp+1
  AD2(itmp,1:ncD)=AD(i,1:ncD)
  rhsD2(itmp)=rhsD(i)
  restD2(itmp)=restD(i)
 end if
end do

!************************************************************
! set up dea2 problem
dea2 = make_lp(nrD2,ncD)
call set_verbose(dea2,NEUTRAL)

if(objtype.eq.'max') call set_maxim(dea2)
if(objtype.eq.'min') call set_maxim(dea2)

do i=1,nrD2
    if(restD2(i).eq.'<=') then
        ret = set_constr_type(dea2,i,LE);
    end if
    if(restD2(i).eq.'>=') then
        ret = set_constr_type(dea2,i,GE);
    end if
    ret = set_rh(dea2,i,rhsD2(i));
end do

do j=1,ncD
    ret = set_obj(dea2,j,objvalsD(j));
end do

kD2=0
iaD2=0;jaD2=0;arD2=0.0
do i=1,nrD2
    do j=1,ncD
        if(abs(AD2(i,j)).gt.eps) then
            kD2=kD2+1
            iaD2(kD2)=i;jaD2(kD2)=j;arD2(kD2)=AD2(i,j)
            ret = set_mat(dea2,i,j,arD2(kD2));
        end if
    end do
end do

ret = solve(dea2)
objD2=get_objective(dea2)

!Print *, "jDMU,objQ2 = ", jDMU,objD
EFFscores(jDMU,3)=objD2

call delete_lp(dea2)

jcount=jcount+1
if(jcount==50) then
 call cpu_time(t3)
 open(20,file='fortran-report.txt',status='unknown')
  write(20,*) 'jDMU, runtimes = ',jDMU,t3-t2,t3-t1
 close(20)
 jcount=0
end if

100 continue

call cpu_time(t3)
runtimes(1)=t3-t1
runtimes(2)=t3-t2

!Print *, "runtime = ",runtimes(2)
 open(20,file='fortran-report.txt',status='unknown')
  write(20,*) 'jDMU, runtimes = ',jDMU,t3-t2,t3-t1
 close(20)

call delete_lp(dea)
call delete_lp(qdea)
!********************************************************************
end subroutine LP_LPSOLVE
!********************************************************************
