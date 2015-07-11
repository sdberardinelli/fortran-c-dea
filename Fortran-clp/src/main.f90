program main
    use iso_c_binding
    use clp
    use clp_constants
    implicit none

        integer :: ret

        type(c_ptr) :: lp
        real(8), dimension(0:4) :: obj
        real(8), dimension(0:4) :: row1

        lp = Clp_newModel()

        call Clp_resize(lp,4,4)

!        row1(0) = 0; row1(1) = 1;  row1(2) = 1; row1(3) = 1; ret = add_constraint(lp,row1,LE,100.0_8);

!        write (*,*) Clp_VersionMajor()
!        write (*,*) Clp_VersionMinor()
!        write (*,*) Clp_VersionRelease()


        write (*,*) Clp_numberRows(lp)
        write (*,*) Clp_numberColumns(lp)

!        call Clp_printModel(lp,"name"//c_null_char) ! seems to be broken when model is not defined

        call Clp_deleteModel(lp)
end
