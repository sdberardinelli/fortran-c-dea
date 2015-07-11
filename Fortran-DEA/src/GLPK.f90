! GLPK_subroutine_DEA-loop-DMUs-droprows
!********************************************************************
subroutine LP_GLPK(nr,nc,nDMU,nY,nX,objtype,objvals,rest,rhs,A,obj,soln,runtime,runtimes,EFFscores)
!********************************************************************
use glpk
use glpk_types
use glpk_constants
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

integer i,j,k,ii,jj,kk
integer kD,kQ,kD2
real(kind=8), dimension(0:(nr*nc))        :: ar
real(kind=8), dimension(0:((nDMU+1)*(nY+nX))) :: arD
real(kind=8), dimension(0:((nDMU+1)*(nY+nX))) :: arD2

real(kind=8) :: z,z8

integer ijrowD(nX),ijrow(nX)
integer jcount
!********************************************************************
real*8  :: t0,t1,t2,t3,t4,t6,t7,t8,t9,t10
!********************************************************************
type(glp_smcp) :: parmQ
type(glp_smcp) :: parmD
type(glp_smcp) :: parmD2


character(len=1024) filename

!********************************************************************
z8=0.0_8
!********************************************************************
call cpu_time(t1)

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

ret = glp_term_out(GLP_MSG_OFF)

! set up dea problem
dea  = glp_create_prob()
if(objtype.eq.'max') call glp_set_obj_dir(dea, GLP_MAX)
if(objtype.eq.'min') call glp_set_obj_dir(dea, GLP_MIN)
ret = glp_add_rows(dea, nrD)

do i=1,nrD
 if(restD(i).eq.'<=') then
  call glp_set_row_bnds(dea, i, GLP_UP, z8, rhsD(i))
 end if
 if(restD(i).eq.'>=') then
  call glp_set_row_bnds(dea, i, GLP_LO, z8, rhsD(i))
 end if
end do

ret = glp_add_cols(dea, ncD)

do j=1,ncD
 call glp_set_obj_coef(dea, j, objvalsD(j))
 call glp_set_col_bnds(dea, j, GLP_LO, z8,z8)
end do

iaD=0;jaD=0;arD=0.0
itmp=0;kD=0
do i=1,nrD
 do j=1,ncD
  if(abs(AD(i,j)).gt.eps) then
   kD=kD+1
   iaD(kD)=i;jaD(kD)=j;arD(kD)=AD(i,j)
    if(i==nDMUp1 .and. j>nY .and. j<=(nY+nX)) then
     itmp=itmp+1
     ijconrowD(itmp)=kD
    end if
  end if
 end do
end do

call glp_load_matrix(dea, kD, iaD, jaD, arD)
call glp_init_smcp(parmD)
!******************************************************
qdea = glp_create_prob()

if(objtype.eq.'max') call glp_set_obj_dir(qdea, GLP_MAX)
if(objtype.eq.'min') call glp_set_obj_dir(qdea, GLP_MIN)

ret = glp_add_rows(qdea, nr)

do i=1,nr
 if(rest(i).eq.'<=') then
  call glp_set_row_bnds(qdea, i, GLP_UP, z8, rhs(i))
 end if
 if(rest(i).eq.'>=') then
  call glp_set_row_bnds(qdea, i, GLP_LO, z8, rhs(i))
 end if
end do

ret = glp_add_cols(qdea, nc)

do j=1,nc
 call glp_set_obj_coef(qdea, j, objvals(j))
 call glp_set_col_bnds(qdea, j, GLP_LO, z8,z8)
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
  end if
 end do
end do

call glp_load_matrix(qdea, kQ, ia, ja, ar)
call glp_init_smcp(parmQ)
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
 call glp_set_obj_coef(dea, j, objvalsD(j))
end do

do j=1,nY
 call glp_set_obj_coef(qdea, j, objvals(j))
end do

! edit constraints
do j=1,nX
 jtmp=nY+j
 itmp=ijconrowD(j)
 arD(itmp)=-1.0*AD(jDMU,jtmp)
end do
call glp_load_matrix(dea, kD, iaD, jaD, arD)

do j=1,nX
 jtmp=nY+j
 itmp=ijconrowQ(j)
 ar(itmp)=-1.0*A(jDMU,jtmp)
end do
call glp_load_matrix(qdea, kQ, ia, ja, ar)

!!restore rhs to DEA model
!do i=1,nrD
! if(restD(i).eq.'<=') then
!  call glp_set_row_bnds(dea, i, GLP_UP, z8, rhsD(i))
! end if
! if(restD(i).eq.'>=') then
!  call glp_set_row_bnds(dea, i, GLP_LO, z8, rhsD(i))
! end if
!end do
!!**************************************************

!solve DEA problem
ret = glp_simplex(dea, parmD)
objD=glp_get_obj_val(dea)
!Print *, "jDMU,objD = ", jDMU,objD
EFFscores(jDMU,1)=objD

!do j=1,ncD
! solnD(j)=glp_get_col_prim(dea,j)
! if(nc.lt.20) Print *, "DEA j,xj = ", j,solnD(j)
!end do
!******************************************************
!QDEA stage 1
ret = glp_simplex(qdea, parmQ)

obj=glp_get_obj_val(qdea)
EFFscores(jDMU,2)=obj
!Print *, "jDMU,objQ1 = ", jDMU,obj

 do j=1,nc
  soln(j)=glp_get_col_prim(qdea,j)
 ! if(nc.lt.20) Print *, "QDEA1 j,xj = ", j,soln(j)
 end do

!*******************************************************
!QDEA stage 2

dmult=0.0;dvals=0.0
dvals=soln(dstart:dend)
where(dvals>eps) dmult=1.0000000005

dcount=int(sum(dmult))
nrD2=nrD-dcount
!

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
dea2  = glp_create_prob()
if(objtype.eq.'max') call glp_set_obj_dir(dea2, GLP_MAX)
if(objtype.eq.'min') call glp_set_obj_dir(dea2, GLP_MIN)
ret = glp_add_rows(dea2, nrD2)

do i=1,nrD2
 if(restD2(i).eq.'<=') then
  call glp_set_row_bnds(dea2, i, GLP_UP, z8, rhsD2(i))
 end if
 if(restD2(i).eq.'>=') then
  call glp_set_row_bnds(dea2, i, GLP_LO, z8, rhsD2(i))
 end if
end do

ret = glp_add_cols(dea2, ncD)

do j=1,ncD
 call glp_set_obj_coef(dea2, j, objvalsD(j))
 call glp_set_col_bnds(dea2, j, GLP_LO, z8,z8)
end do

kD2=0
iaD2=0;jaD2=0;arD2=0.0
do i=1,nrD2
 do j=1,ncD
  if(abs(AD2(i,j)).gt.eps) then
   kD2=kD2+1
   iaD2(kD2)=i;jaD2(kD2)=j;arD2(kD2)=AD2(i,j)
  end if
 end do
end do

call glp_load_matrix(dea2, kD2, iaD2, jaD2, arD2)
call glp_init_smcp(parmD2)

ret = glp_simplex(dea2, parmD2)
objD2=glp_get_obj_val(dea2)
!Print *, "jDMU,objQ2 = ", jDMU,objD
EFFscores(jDMU,3)=objD2

!do j=1,ncD
! solnD(j)=glp_get_col_prim(dea,j)
! if(nc.lt.20) Print *, "DEA2 j,xj = ", j,solnD(j)
!end do
call glp_delete_prob(dea2)

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



call glp_delete_prob(dea)
call glp_delete_prob(qdea)

!********************************************************************
end subroutine LP_GLPK
!********************************************************************


!write(filename,'(I5.5)') jDMU
!
!101 format(3(1F12.8,' '))
!
!open(11,file='arD'//trim(filename)//'.data',status='unknown')
!
!    do ii=1,nrD
!        do jj=1,ncD
!            write(11,'(1F12.8,(A))',advance='no') arD(ii*nrD + jj)
!        end do
!        write(11,*) ' '
!    end do
!
!close(11)
