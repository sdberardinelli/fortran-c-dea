module glpk_types
    use iso_c_binding
    implicit none
        type, bind(c) :: glp_bfcp
            integer(c_int) :: msg_lev
            integer(c_int) :: type
            integer(c_int) :: lu_size
            real(c_double) :: piv_tol
            integer(c_int) :: piv_lim
            integer(c_int) :: suhl
            real(c_double) :: eps_tol
            real(c_double) :: max_gro
            integer(c_int) :: nfs_max
            real(c_double) :: upd_tol
            integer(c_int) :: nrs_max
            integer(c_int) :: rs_size
            real(c_double), dimension(0,37) :: foo_bar
        end type glp_bfcp
        type, bind(c) :: glp_smcp
            integer(c_int) :: msg_lev
            integer(c_int) :: meth
            integer(c_int) :: pricing
            integer(c_int) :: r_test
            real(c_double) :: tol_bnd
            real(c_double) :: tol_dj
            real(c_double) :: tol_piv
            real(c_double) :: obj_ll
            real(c_double) :: obj_ul
            integer(c_int) :: it_lim
            integer(c_int) :: tm_lim
            integer(c_int) :: out_frq
            integer(c_int) :: out_dly
            integer(c_int) :: presolve
            real(c_double), dimension(0,35) :: foo_bar
        end type glp_smcp
        type, bind(c) :: glp_iptcp
            integer(c_int) :: msg_lev
            integer(c_int) :: ord_alg
            real(c_double), dimension(0,47) :: foo_bar
        end type glp_iptcp
        type, bind(c) :: glp_iocp
            integer(c_int) :: msg_lev
            integer(c_int) :: br_tech
            integer(c_int) :: bt_tech
            real(c_double) :: tol_int
            real(c_double) :: tol_obj
            integer(c_int) :: tm_lim
            integer(c_int) :: out_frq
            integer(c_int) :: out_dly
            type(C_FUNPTR) :: cb_func
            type(c_ptr) :: cb_info
            integer(c_int) :: cb_size
            integer(c_int) :: pp_tech
            real(c_double) :: mip_gap
            integer(c_int) :: mir_cuts
            integer(c_int) :: gmi_cuts
            integer(c_int) :: cov_cuts
            integer(c_int) :: clq_cuts
            integer(c_int) :: presolve
            integer(c_int) :: binarize
            integer(c_int) :: fp_heur
            integer(c_int) :: ps_heur
            integer(c_int) :: ps_tm_lim
            integer(c_int) :: use_sol
            type(c_ptr) :: save_sol
            integer(c_int) :: alien
            real(c_double), dimension(0,24) :: foo_bar
        end type glp_iocp
        type, bind(c) :: glp_attr
            integer(c_int) :: level
            integer(c_int) :: origin
            integer(c_int) :: klass
            real(c_double), dimension(0,6) :: foo_bar
        end type glp_attr
        type, bind(c) :: glp_mpscp
            integer(c_int) :: blank
            type(c_ptr) :: obj_name
            real(c_double) :: tol_mps
            real(c_double), dimension(0,16) :: foo_bar
        end type glp_mpscp
        type, bind(c) :: glp_cpxcp
            real(c_double), dimension(0,19) :: foo_bar
        end type glp_cpxcp
        type, bind(c) :: glp_graph
            type(c_ptr) :: pool
            type(c_ptr) :: name
            integer(c_int) :: nv_max
            integer(c_int) :: nv
            integer(c_int) :: na
            type(c_ptr) :: v
            type(c_ptr) :: index
            integer(c_int) :: v_size
            integer(c_int) :: a_size
        end type glp_graph
        type, bind(c) :: glp_vertex
            integer(c_int) :: i
            type(c_ptr) :: name
            type(c_ptr) :: entry
            type(c_ptr) :: data
            type(c_ptr) :: temp
            type(c_ptr) :: in
            type(c_ptr) :: out
        end type glp_vertex
        type, bind(c) :: glp_arc
            type(c_ptr) :: tail
            type(c_ptr) :: head
            type(c_ptr) :: data
            type(c_ptr) :: temp
            type(c_ptr) :: t_prev
            type(c_ptr) :: t_next
            type(c_ptr) :: h_prev
            type(c_ptr) :: h_next
        end type glp_arc
end module glpk_types
