program main
    use iso_c_binding
    use lp_solve
    use lp_solve_constants
    implicit none

        type(c_ptr) :: lp
        integer :: ret
!        integer :: i
!        real(8) :: obj_val
        real(8), dimension(0:4) :: obj
!        real(8), dimension(0:4) :: row1
!        real(8), dimension(0:4) :: row2
!        real(8), dimension(0:4) :: row3
!        real(8), dimension(0:6) :: pv
!        real(8), dimension(0:2) :: var

!        lp = make_lp(0,3)
        lp = make_lp(3,3)
        call set_sense(lp,TRUE)
        call set_verbose(lp,NEUTRAL)
!        row1(0) = 0; row1(1) = 1;  row1(2) = 1; row1(3) = 1; ret = add_constraint(lp,row1,LE,100.0_8);
!        row2(0) = 0; row2(1) = 10; row2(2) = 4; row2(3) = 5; ret = add_constraint(lp,row2,LE,600.0_8);
!        row3(0) = 0; row3(1) = 2;  row3(2) = 2; row3(3) = 6; ret = add_constraint(lp,row3,LE,300.0_8);

        ret = set_mat(lp,1,1,1.0_8); ret = set_mat(lp,1,2,2.0_8); ret = set_mat(lp,1,3,3.0_8);
        ret = set_constr_type(lp,1,LE); ret = set_rh(lp,1,100.0_8);
        ret = set_mat(lp,2,1,4.0_8); ret = set_mat(lp,2,2,5.0_8); ret = set_mat(lp,2,3,6.0_8);
        ret = set_constr_type(lp,2,LE); ret = set_rh(lp,2,600.0_8);
        ret = set_mat(lp,3,1,7.0_8); ret = set_mat(lp,3,2,8.0_8); ret = set_mat(lp,3,3,9.0_8);
        ret = set_constr_type(lp,3,LE); ret = set_rh(lp,3,300.0_8);

        call print_lp(lp)


        obj(0) = 0;  obj(1) = 10;  obj(2) = 6; obj(3) = 4; ret = set_obj_fn(lp, obj);

        call print_lp(lp)

        ret = solve(lp)

        write(*,*) get_objective(lp)
        write(*,*)

        ret = set_mat(lp,1,1,100.0_8);
        ret = set_mat(lp,1,2,100.0_8);
        ret = set_mat(lp,2,3,100.0_8);

        call print_lp(lp)

        ret = solve(lp)

        write(*,*) get_objective(lp)
        write(*,*)


!
!
!        ret = get_primal_solution(lp,pv)
!        do i=0,6
!             obj_val = get_var_primalresult(lp,i)
!             write(*,*) obj_val
!        end do
!        write(*,*)
!
!        ret = get_variables(lp,var)
!        write(*,*) var
!
!
!        call print_objective(lp)
!        call print_solution(lp, 1)
!        call print_constraints(lp, 1)
        call delete_lp(lp)
end
