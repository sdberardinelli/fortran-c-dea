program main
    use glpk
    use glpk_types
    use glpk_constants
    use iso_c_binding
    implicit none
        type(c_ptr) :: lp
        integer :: ret

        integer, dimension(0:1000) :: ia, ja
        real(kind=8), dimension(0:1000) :: ar
        real(kind=8) :: z, x1, x2, x3

        type(glp_smcp) :: parm

        lp = glp_create_prob()
        ret = glp_term_out(GLP_MSG_OFF)
        call glp_set_prob_name(lp, "sample"//C_NULL_CHAR)
        call glp_set_obj_dir(lp, GLP_MAX)

        ret = glp_add_rows(lp, 3)
        call glp_set_row_name(lp, 1, "p"//C_NULL_CHAR)
        call glp_set_row_bnds(lp, 1, GLP_UP, 0.0_8, 100.0_8)
        call glp_set_row_name(lp, 2, "q"//C_NULL_CHAR)
        call glp_set_row_bnds(lp, 2, GLP_UP, 0.0_8, 600.0_8)
        call glp_set_row_name(lp, 3, "r"//C_NULL_CHAR)
        call glp_set_row_bnds(lp, 3, GLP_UP, 0.0_8, 300.0_8)

        ret = glp_add_cols(lp, 3)
        call glp_set_col_name(lp, 1, "x1"//C_NULL_CHAR)
        call glp_set_col_bnds(lp, 1, GLP_LO, 0.0_8, 0.0_8)
        call glp_set_obj_coef(lp, 1, 10.0_8)
        call glp_set_col_name(lp, 2, "x2"//C_NULL_CHAR)
        call glp_set_col_bnds(lp, 2, GLP_LO, 0.0_8, 0.0_8)
        call glp_set_obj_coef(lp, 2, 6.0_8)
        call glp_set_col_name(lp, 3, "x3"//C_NULL_CHAR)
        call glp_set_col_bnds(lp, 3, GLP_LO, 0.0_8, 0.0_8)
        call glp_set_obj_coef(lp, 3, 4.0_8)

        ! a[1,1] = 1
        ia(1) = 1
        ja(1) = 1
        ar(1) = 1.0

        ! a[1,2] = 1
        ia(2) = 1
        ja(2) = 2
        ar(2) = 1.0

        ! a[1,3] = 1
        ia(3) = 1
        ja(3) = 3
        ar(3) = 1.0

        ! a[2,1] = 10
        ia(4) = 2
        ja(4) = 1
        ar(4) = 10.0

        ! a[3,1] = 2
        ia(5) = 3
        ja(5) = 1
        ar(5) = 2.0

        ! a[2,2] = 4
        ia(6) = 2
        ja(6) = 2
        ar(6) = 4.0

        ! a[3,2] = 2
        ia(7) = 3
        ja(7) = 2
        ar(7) = 2.0

        ! a[2,3] = 5
        ia(8) = 2
        ja(8) = 3
        ar(8) = 6.0

        ! a[3,3] = 6
        ia(9) = 3
        ja(9) = 3
        ar(9) = 6.0

        call glp_load_matrix(lp, 9, ia, ja, ar)
        call glp_init_smcp(parm)
        ret = glp_simplex(lp, parm)

        z = glp_get_obj_val(lp)
        x1 = glp_get_col_prim(lp, 1)
        x2 = glp_get_col_prim(lp, 2)
        x3 = glp_get_col_prim(lp, 3)

        Print *, "z = ", z   ! 733.33
        Print *, "x1 = ", x1 ! 33.33
        Print *, "x2 = ", x2 ! 66.66
        Print *, "x3 = ", x3 ! 0.0

        call glp_delete_prob(lp)
end
