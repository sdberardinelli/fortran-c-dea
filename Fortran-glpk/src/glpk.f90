module glpk
    use iso_c_binding
    implicit none
        interface
            function glp_create_prob() bind(C,name="glp_create_prob")
                use iso_c_binding
                    type(c_ptr) :: glp_create_prob
            end function
            subroutine glp_set_prob_name(P,name) bind(C,name="glp_set_prob_name")
                use iso_c_binding
                    type(c_ptr), value :: P
                    character(c_char) :: name(*)
            end subroutine
            subroutine glp_set_obj_name(P,name) bind(C,name="glp_set_obj_name")
                use iso_c_binding
                    type(c_ptr), value :: P
                    character(c_char) :: name(*)
            end subroutine
            subroutine glp_set_obj_dir(P,dir) bind(C,name="glp_set_obj_dir")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: dir
            end subroutine
            function glp_add_rows(P,nrs) bind(C,name="glp_add_rows")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: nrs
                    integer(c_int) :: glp_add_rows
            end function
            function glp_add_cols(P,ncs) bind(C,name="glp_add_cols")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: ncs
                    integer(c_int) :: glp_add_cols
            end function
            subroutine glp_set_row_name(P,i,name) bind(C,name="glp_set_row_name")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    character(c_char) :: name(*)
            end subroutine
            subroutine glp_set_col_name(P,j,name) bind(C,name="glp_set_col_name")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    character(c_char) :: name(*)
            end subroutine
            subroutine glp_set_row_bnds(P,i,type,lb,ub) bind(C,name="glp_set_row_bnds")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    integer(c_int), value :: type
                    real(c_double), value  :: lb
                    real(c_double), value  :: ub
            end subroutine
            subroutine glp_set_col_bnds(P,i,type,lb,ub) bind(C,name="glp_set_col_bnds")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    integer(c_int), value :: type
                    real(c_double), value  :: lb
                    real(c_double), value  :: ub
            end subroutine
            subroutine glp_set_obj_coef(P,j,coef) bind(C,name="glp_set_obj_coef")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    real(c_double), value :: coef
            end subroutine
            subroutine glp_load_matrix(P,ne,ia,ja,ar) bind(C,name="glp_load_matrix")
            use iso_c_binding
                type(c_ptr), value :: P
                integer(c_int), value :: ne
                integer(c_int) :: ia(*)
                integer(c_int) :: ja(*)
                real(c_double) :: ar(*)
            end subroutine
            function glp_check_dup(m,n,ne,ia,ja) bind(C,name="glp_check_dup")
                use iso_c_binding
                    integer(c_int), value :: m
                    integer(c_int), value :: n
                    integer(c_int), value :: ne
                    integer(c_int) :: ia(*)
                    integer(c_int) :: ja(*)
                    integer(c_int) :: glp_check_dup
            end function
            subroutine glp_sort_matrix(P) bind(C,name="glp_sort_matrix")
                use iso_c_binding
                    type(c_ptr), value :: P
            end subroutine
            subroutine glp_del_rows(P,nrs,num) bind(C,name="glp_del_rows")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: nrs
                    integer(c_int) :: num(*)
            end subroutine
            subroutine glp_del_cols(P,ncs,num) bind(C,name="glp_del_cols")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: ncs
                    integer(c_int) :: num(*)
            end subroutine
            subroutine glp_copy_prob(dest,prob,names) bind(C,name="glp_copy_prob")
                use iso_c_binding
                    type(c_ptr), value :: dest
                    type(c_ptr), value :: prob
                    integer(c_int), value :: names
            end subroutine
            subroutine glp_erase_prob(P) bind(C,name="glp_erase_prob")
                use iso_c_binding
                    type(c_ptr), value :: P
            end subroutine
            subroutine glp_delete_prob(P) bind(C,name="glp_delete_prob")
                use iso_c_binding
                    type(c_ptr), value :: P
            end subroutine
            function glp_get_prob_name(P) bind(C,name="glp_get_prob_name")
                use iso_c_binding
                    type(c_ptr), value :: P
                    character(c_char) :: glp_get_prob_name
            end function
            function glp_get_obj_name(P) bind(C,name="glp_get_obj_name")
                use iso_c_binding
                    type(c_ptr), value :: P
                    character(c_char) :: glp_get_obj_name
            end function
            function glp_get_obj_dir(P) bind(C,name="glp_get_obj_dir")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_get_obj_dir
            end function
            function glp_get_num_rows(P) bind(C,name="glp_get_num_rows")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_get_num_rows
            end function
            function glp_get_num_cols(P) bind(C,name="glp_get_num_cols")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_get_num_cols
            end function
            function glp_get_row_name(P,i) bind(C,name="glp_get_row_name")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    character(c_char) :: glp_get_row_name
            end function
            function glp_get_col_name(P,j) bind(C,name="glp_get_col_name")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    character(c_char) :: glp_get_col_name
            end function
            function glp_get_row_type(P,i) bind(C,name="glp_get_row_type")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    integer(c_int) :: glp_get_row_type
            end function
            function glp_get_row_lb(P,i) bind(C,name="glp_get_row_lb")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    real(c_double) :: glp_get_row_lb
            end function
            function glp_get_row_ub(P,i) bind(C,name="glp_get_row_ub")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    real(c_double) :: glp_get_row_ub
            end function
            function glp_get_col_type(P,j) bind(C,name="glp_get_col_type")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    integer(c_int) :: glp_get_col_type
            end function
            function glp_get_col_lb(P,j) bind(C,name="glp_get_col_lb")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    real(c_double) :: glp_get_col_lb
            end function
            function glp_get_col_ub(P,j) bind(C,name="glp_get_col_ub")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    real(c_double) :: glp_get_col_ub
            end function
            function glp_get_obj_coef(P,j) bind(C,name="glp_get_obj_coef")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    real(c_double) :: glp_get_obj_coef
            end function
            function glp_get_num_nz(P) bind(C,name="glp_get_num_nz")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_get_num_nz
            end function
            function glp_get_mat_row(P,i,ind,val) bind(C,name="glp_get_mat_row")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    integer(c_int) :: ind(*)
                    real(c_double) :: val(*)
                    integer(c_int) :: glp_get_mat_row
            end function
            function glp_get_mat_col(P,j,ind,val) bind(C,name="glp_get_mat_col")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    integer(c_int) :: ind(*)
                    real(c_double) :: val(*)
                    integer(c_int) :: glp_get_mat_col
            end function
            subroutine glp_create_index(P) bind(C,name="glp_create_index")
                use iso_c_binding
                    type(c_ptr), value :: P
            end subroutine
            function glp_find_row(P,name) bind(C,name="glp_find_row")
                use iso_c_binding
                    type(c_ptr), value :: P
                    character(c_char) :: name(*)
                    integer(c_int) :: glp_find_row
            end function
            function glp_find_col(P,name) bind(C,name="glp_find_col")
                use iso_c_binding
                    type(c_ptr), value :: P
                    character(c_char) :: name(*)
                    integer(c_int) :: glp_find_col
            end function
            subroutine glp_delete_index(P) bind(C,name="glp_delete_index")
                use iso_c_binding
                    type(c_ptr), value :: P
            end subroutine
            subroutine glp_set_rii(P,i,rii) bind(C,name="glp_set_rii")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    real(c_double), value :: rii
            end subroutine
            subroutine glp_set_sjj(P,j,sjj) bind(C,name="glp_set_sjj")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    real(c_double), value :: sjj
            end subroutine
            function glp_get_rii(P,i) bind(C,name="glp_get_rii")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    real(c_double) :: glp_get_rii
            end function
            function glp_get_sjj(P,j) bind(C,name="glp_get_sjj")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    real(c_double) :: glp_get_sjj
            end function
            subroutine glp_scale_prob(P,flags) bind(C,name="glp_scale_prob")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: flags
            end subroutine
            subroutine glp_unscale_prob(P) bind(C,name="glp_unscale_prob")
                use iso_c_binding
                    type(c_ptr), value :: P
            end subroutine
            subroutine glp_set_row_stat(P,i,stat) bind(C,name="glp_set_row_stat")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    integer(c_int), value :: stat
            end subroutine
            subroutine glp_set_col_stat(P,j,stat) bind(C,name="glp_set_col_stat")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    integer(c_int), value :: stat
            end subroutine
            subroutine glp_std_basis(P) bind(C,name="glp_std_basis")
                use iso_c_binding
                    type(c_ptr), value :: P
            end subroutine
            subroutine glp_adv_basis(P,flags) bind(C,name="glp_adv_basis")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: flags
            end subroutine
            subroutine glp_cpx_basis(P) bind(C,name="glp_cpx_basis")
                use iso_c_binding
                    type(c_ptr), value :: P
            end subroutine
            function glp_simplex(P,parm) bind(C,name="glp_simplex")
                use iso_c_binding
                use glpk_types
                    type(c_ptr), value :: P
                    type(glp_smcp), value :: parm
                    integer(c_int) :: glp_simplex
            end function
            function glp_exact(P,parm) bind(C,name="glp_exact")
                use iso_c_binding
                use glpk_types
                    type(c_ptr), value :: P
                    type(glp_smcp), value :: parm
                    integer(c_int) :: glp_exact
            end function
            subroutine glp_init_smcp(parm) bind(C,name="glp_init_smcp")
                use iso_c_binding
                use glpk_types
                    type(glp_smcp) :: parm
            end subroutine
            function glp_get_status(P) bind(C,name="glp_get_status")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_get_status
            end function
            function glp_get_prim_stat(P) bind(C,name="glp_get_prim_stat")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_get_prim_stat
            end function
            function glp_get_dual_stat(P) bind(C,name="glp_get_dual_stat")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_get_dual_stat
            end function
            function glp_get_obj_val(P) bind(C,name="glp_get_obj_val")
                use iso_c_binding
                    type(c_ptr), value :: P
                    real(c_double) :: glp_get_obj_val
            end function
            function glp_get_row_stat(P,i) bind(C,name="glp_get_row_stat")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    integer(c_int) :: glp_get_row_stat
            end function
            function glp_get_row_prim(P,i) bind(C,name="glp_get_row_prim")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    real(c_double) :: glp_get_row_prim
            end function
            function glp_get_row_dual(P,i) bind(C,name="glp_get_row_dual")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    real(c_double) :: glp_get_row_dual
            end function
            function glp_get_col_stat(P,j) bind(C,name="glp_get_col_stat")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    integer(c_int) :: glp_get_col_stat
            end function
            function glp_get_col_prim(P,j) bind(C,name="glp_get_col_prim")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    real(c_double) :: glp_get_col_prim
            end function
            function glp_get_col_dual(P,j) bind(C,name="glp_get_col_dual")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    real(c_double) :: glp_get_col_dual
            end function
            function glp_get_unbnd_ray(P) bind(C,name="glp_get_unbnd_ray")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_get_unbnd_ray
            end function
            function glp_get_it_cnt(P) bind(C,name="glp_get_it_cnt")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_get_it_cnt
            end function
            subroutine glp_set_it_cnt(P,it_cnt) bind(C,name="glp_set_it_cnt")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: it_cnt
            end subroutine
            function glp_interior(P,parm) bind(C,name="glp_interior")
                use iso_c_binding
                    type(c_ptr), value :: P
                    type(c_ptr), value :: parm
                    integer(c_int) :: glp_interior
            end function
            subroutine glp_init_iptcp(parm) bind(C,name="glp_init_iptcp")
                use iso_c_binding
                use glpk_types
                    type(glp_iptcp) :: parm
            end subroutine
            function glp_ipt_status(P) bind(C,name="glp_ipt_status")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_ipt_status
            end function
            function glp_ipt_obj_val(P) bind(C,name="glp_ipt_obj_val")
                use iso_c_binding
                    type(c_ptr), value :: P
                    real(c_double) :: glp_ipt_obj_val
            end function
            function glp_ipt_row_prim(P,i) bind(C,name="glp_ipt_row_prim")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    real(c_double) :: glp_ipt_row_prim
            end function
            function glp_ipt_row_dual(P,i) bind(C,name="glp_ipt_row_dual")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    real(c_double) :: glp_ipt_row_dual
            end function
            function glp_ipt_col_prim(P,j) bind(C,name="glp_ipt_col_prim")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    real(c_double) :: glp_ipt_col_prim
            end function
            function glp_ipt_col_dual(P,j) bind(C,name="glp_ipt_col_dual")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    real(c_double) :: glp_ipt_col_dual
            end function
            subroutine glp_set_col_kind(P,j,kind) bind(C,name="glp_set_col_kind")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    integer(c_int), value :: kind
            end subroutine
            function glp_get_col_kind(P,j) bind(C,name="glp_get_col_kind")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    integer(c_int) :: glp_get_col_kind
            end function
            function glp_get_num_int(P) bind(C,name="glp_get_num_int")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_get_num_int
            end function
            function glp_get_num_bin(P) bind(C,name="glp_get_num_bin")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_get_num_bin
            end function
            function glp_intopt(P,parm) bind(C,name="glp_intopt")
                use iso_c_binding
                    type(c_ptr), value :: P
                    type(c_ptr), value :: parm
                    integer(c_int) :: glp_intopt
            end function
            subroutine glp_init_iocp(parm) bind(C,name="glp_init_iocp")
                use iso_c_binding
                use glpk_types
                    type(glp_iocp) :: parm
            end subroutine
            function glp_mip_status(P) bind(C,name="glp_mip_status")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_mip_status
            end function
            function glp_mip_obj_val(P) bind(C,name="glp_mip_obj_val")
                use iso_c_binding
                    type(c_ptr), value :: P
                    real(c_double) :: glp_mip_obj_val
            end function
            function glp_mip_row_val(P,i) bind(C,name="glp_mip_row_val")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    real(c_double) :: glp_mip_row_val
            end function
            function glp_mip_col_val(P,j) bind(C,name="glp_mip_col_val")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    real(c_double) :: glp_mip_col_val
            end function
            function glp_print_sol(P,fname) bind(C,name="glp_print_sol")
                use iso_c_binding
                    type(c_ptr), value :: P
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_print_sol
            end function
            function glp_read_sol(P,fname) bind(C,name="glp_read_sol")
                use iso_c_binding
                    type(c_ptr), value :: P
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_read_sol
            end function
            function glp_write_sol(P,fname) bind(C,name="glp_write_sol")
                use iso_c_binding
                    type(c_ptr), value :: P
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_write_sol
            end function
            function glp_print_ipt(P,fname) bind(C,name="glp_print_ipt")
                use iso_c_binding
                    type(c_ptr), value :: P
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_print_ipt
            end function
            function glp_read_ipt(P,fname) bind(C,name="glp_read_ipt")
                use iso_c_binding
                    type(c_ptr), value :: P
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_read_ipt
            end function
            function glp_write_ipt(P,fname) bind(C,name="glp_write_ipt")
                use iso_c_binding
                    type(c_ptr), value :: P
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_write_ipt
            end function
            function glp_print_mip(P,fname) bind(C,name="glp_print_mip")
                use iso_c_binding
                    type(c_ptr), value :: P
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_print_mip
            end function
            function glp_read_mip(P,fname) bind(C,name="glp_read_mip")
                use iso_c_binding
                    type(c_ptr), value :: P
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_read_mip
            end function
            function glp_write_mip(P,fname) bind(C,name="glp_write_mip")
                use iso_c_binding
                    type(c_ptr), value :: P
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_write_mip
            end function
            function glp_bf_exists(P) bind(C,name="glp_bf_exists")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_bf_exists
            end function
            function glp_factorize(P) bind(C,name="glp_factorize")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_factorize
            end function
            function glp_bf_updated(P) bind(C,name="glp_bf_updated")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_bf_updated
            end function
            subroutine glp_get_bfcp(P,parm) bind(C,name="glp_get_bfcp")
                use iso_c_binding
                use glpk_types
                    type(c_ptr) :: P
                    type(glp_bfcp) :: parm
            end subroutine
            subroutine glp_set_bfcp(P,parm) bind(C,name="glp_set_bfcp")
                use iso_c_binding
                use glpk_types
                    type(c_ptr), value :: P
                    type(glp_bfcp), value :: parm
            end subroutine
            function glp_get_bhead(P,k) bind(C,name="glp_get_bhead")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: k
                    integer(c_int) :: glp_get_bhead
            end function
            function glp_get_row_bind(P,i) bind(C,name="glp_get_row_bind")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: i
                    integer(c_int) :: glp_get_row_bind
            end function
            function glp_get_col_bind(P,j) bind(C,name="glp_get_col_bind")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: j
                    integer(c_int) :: glp_get_col_bind
            end function
            subroutine glp_ftran(P,x) bind(C,name="glp_ftran")
                use iso_c_binding
                    type(c_ptr), value :: P
                    real(c_double) :: x(*)
            end subroutine
            subroutine glp_btran(P,x) bind(C,name="glp_btran")
                use iso_c_binding
                    type(c_ptr), value :: P
                    real(c_double) :: x(*)
            end subroutine
            function glp_warm_up(P) bind(C,name="glp_warm_up")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_warm_up
            end function
            function glp_eval_tab_row(P,k,ind,val) bind(C,name="glp_eval_tab_row")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: k
                    integer(c_int) :: ind(*)
                    real(c_double) :: val(*)
                    integer(c_int) :: glp_eval_tab_row
            end function
            function glp_eval_tab_col(P,k,ind,val) bind(C,name="glp_eval_tab_col")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: k
                    integer(c_int) :: ind(*)
                    real(c_double) :: val(*)
                    integer(c_int) :: glp_eval_tab_col
            end function
            function glp_transform_row(P,len,ind,val) bind(C,name="glp_transform_row")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: len
                    integer(c_int) :: ind(*)
                    real(c_double) :: val(*)
                    integer(c_int) :: glp_transform_row
            end function
            function glp_transform_col(P,len,ind,val) bind(C,name="glp_transform_col")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: len
                    integer(c_int) :: ind(*)
                    real(c_double) :: val(*)
                    integer(c_int) :: glp_transform_col
            end function
            subroutine glp_init_mpscp(parm) bind(C,name="glp_init_mpscp")
                use iso_c_binding
                use glpk_types
                    type(glp_mpscp) :: parm
            end subroutine
            subroutine glp_init_cpxcp(parm) bind(C,name="glp_init_cpxcp")
                use iso_c_binding
                use glpk_types
                    type(glp_cpxcp) :: parm
            end subroutine
            function glp_read_lp(P,parm,fname) bind(C,name="glp_read_lp")
                use iso_c_binding
                    type(c_ptr), value :: P
                    type(c_ptr), value :: parm
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_read_lp
            end function
            function glp_write_lp(P,parm,fname) bind(C,name="glp_write_lp")
                use iso_c_binding
                    type(c_ptr), value :: P
                    type(c_ptr), value :: parm
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_write_lp
            end function
            function glp_read_prob(P,flags,fname) bind(C,name="glp_read_prob")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: flags
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_read_prob
            end function
            function glp_write_prob(P,flags,fname) bind(C,name="glp_write_prob")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: flags
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_write_prob
            end function
            function glp_mpl_alloc_wksp() bind(C,name="glp_mpl_alloc_wksp")
                use iso_c_binding
                    type(c_ptr) :: glp_mpl_alloc_wksp
            end function
            function glp_mpl_read_model(tran,fname,skip) bind(C,name="glp_mpl_read_model")
                use iso_c_binding
                    type(c_ptr), value :: tran
                    character(c_char) :: fname(*)
                    integer(c_int), value :: skip
                    integer(c_int) :: glp_mpl_read_model
            end function
            function glp_mpl_read_data(tran,fname) bind(C,name="glp_mpl_read_data")
                use iso_c_binding
                    type(c_ptr), value :: tran
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_mpl_read_data
            end function
            function glp_mpl_generate(tran,fname) bind(C,name="glp_mpl_generate")
                use iso_c_binding
                    type(c_ptr), value :: tran
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_mpl_generate
            end function
            subroutine glp_mpl_build_prob(tran,prob) bind(C,name="glp_mpl_build_prob")
                use iso_c_binding
                    type(c_ptr), value :: tran
                    type(c_ptr), value :: prob
            end subroutine
            function glp_mpl_postsolve(tran,prob,sol) bind(C,name="glp_mpl_postsolve")
                use iso_c_binding
                    type(c_ptr), value :: tran
                    type(c_ptr), value :: prob
                    integer(c_int), value :: sol
                    integer(c_int) :: glp_mpl_postsolve
            end function
            subroutine glp_mpl_free_wksp(tran) bind(C,name="glp_mpl_free_wksp")
                use iso_c_binding
                    type(c_ptr), value :: tran
            end subroutine
            function glp_main(argc,argv) bind(C,name="glp_main")
                use iso_c_binding
                    integer(c_int), value :: argc
                    character(c_char) :: argv(*)
                    integer(c_int) :: glp_main
            end function
            function glp_read_cnfsat(P,fname) bind(C,name="glp_read_cnfsat")
                use iso_c_binding
                    type(c_ptr), value :: P
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_read_cnfsat
            end function
            function glp_check_cnfsat(P) bind(C,name="glp_check_cnfsat")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_check_cnfsat
            end function
            function glp_write_cnfsat(P,fname) bind(C,name="glp_write_cnfsat")
                use iso_c_binding
                    type(c_ptr), value :: P
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_write_cnfsat
            end function
            function glp_minisat1(P) bind(C,name="glp_minisat1")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int) :: glp_minisat1
            end function
            function glp_intfeas1(P,use_bound,obj_bound) bind(C,name="glp_intfeas1")
                use iso_c_binding
                    type(c_ptr), value :: P
                    integer(c_int), value :: use_bound
                    integer(c_int), value :: obj_bound
                    integer(c_int) :: glp_intfeas1
            end function
            function glp_init_env() bind(C,name="glp_init_env")
                use iso_c_binding
                    integer(c_int) :: glp_init_env
            end function
            function glp_version() bind(C,name="glp_version")
                use iso_c_binding
                    character(c_char) :: glp_version
            end function
            function glp_free_env() bind(C,name="glp_free_env")
                use iso_c_binding
                    integer(c_int) :: glp_free_env
            end function
            subroutine glp_puts(s) bind(C,name="glp_puts")
                use iso_c_binding
                    character(c_char) :: s(*)
            end subroutine

            function glp_term_out(flag) bind(C,name="glp_term_out")
                use iso_c_binding
                    integer(c_int), value :: flag
                    integer(c_int) :: glp_term_out
            end function
            function glp_open_tee(name) bind(C,name="glp_open_tee")
                use iso_c_binding
                    character(c_char) :: name(*)
                    integer(c_int) :: glp_open_tee
            end function
            function glp_close_tee() bind(C,name="glp_close_tee")
                use iso_c_binding
                    integer(c_int) :: glp_close_tee
            end function
            subroutine glp_alloc(n,size) bind(C,name="glp_alloc")
                use iso_c_binding
                    integer(c_int), value :: n
                    integer(c_int), value :: size
            end subroutine
            subroutine glp_realloc(ptr,n,size) bind(C,name="glp_realloc")
                use iso_c_binding
                    type(c_ptr) :: ptr
                    integer(c_int), value :: n
                    integer(c_int), value :: size
            end subroutine
            subroutine glp_free(ptr) bind(C,name="glp_free")
                use iso_c_binding
                    type(c_ptr) :: ptr
            end subroutine
            subroutine glp_mem_limit(limit) bind(C,name="glp_mem_limit")
                use iso_c_binding
                    integer(c_int), value :: limit
            end subroutine
            function glp_create_graph(v_size,a_size) bind(C,name="glp_create_graph")
                use iso_c_binding
                    integer(c_int), value :: v_size
                    integer(c_int), value :: a_size
                    type(c_ptr) :: glp_create_graph
            end function
            subroutine glp_set_graph_name(G,name) bind(C,name="glp_set_graph_name")
                use iso_c_binding
                use glpk_types
                    type(c_ptr) :: G
                    character(c_char) :: name(*)
            end subroutine
            function glp_add_vertices(G,nadd) bind(C,name="glp_add_vertices")
                use iso_c_binding
                    type(c_ptr), value :: G
                    integer(c_int), value :: nadd
                    integer(c_int) :: glp_add_vertices
            end function
            subroutine glp_set_vertex_name(G,i,name) bind(C,name="glp_set_vertex_name")
                use iso_c_binding
                use glpk_types
                    type(c_ptr) :: G
                    integer(c_int), value :: i
                    character(c_char) :: name(*)
            end subroutine
            function glp_add_arc(G,i,j) bind(C,name="glp_add_arc")
                use iso_c_binding
                    type(c_ptr), value :: G
                    integer(c_int), value :: i
                    integer(c_int), value :: j
                    type(c_ptr) :: glp_add_arc
            end function
            subroutine glp_del_vertices(G,ndel,num) bind(C,name="glp_del_vertices")
                use iso_c_binding
                use glpk_types
                    type(c_ptr) :: G
                    integer(c_int), value :: ndel
                    integer(c_int) :: num(*)
            end subroutine
            subroutine glp_del_arc(G,a) bind(C,name="glp_del_arc")
                use iso_c_binding
                use glpk_types
                    type(c_ptr) :: G
                    type(c_ptr) :: a
            end subroutine
            subroutine glp_erase_graph(G,v_size,a_size) bind(C,name="glp_erase_graph")
                use iso_c_binding
                use glpk_types
                    type(c_ptr) :: G
                    integer(c_int), value :: v_size
                    integer(c_int), value :: a_size
            end subroutine
            subroutine glp_delete_graph(G) bind(C,name="glp_delete_graph")
                use iso_c_binding
                use glpk_types
                    type(c_ptr) :: G
            end subroutine
            subroutine glp_create_v_index(G) bind(C,name="glp_create_v_index")
                use iso_c_binding
                use glpk_types
                    type(c_ptr) :: G
            end subroutine
            function glp_find_vertex(G,name) bind(C,name="glp_find_vertex")
                use iso_c_binding
                    type(c_ptr), value :: G
                    character(c_char) :: name(*)
                    integer(c_int) :: glp_find_vertex
            end function
            subroutine glp_delete_v_index(G) bind(C,name="glp_delete_v_index")
                use iso_c_binding
                use glpk_types
                    type(c_ptr) :: G
            end subroutine
            function glp_read_graph(G,fname) bind(C,name="glp_read_graph")
                use iso_c_binding
                    type(c_ptr), value :: G
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_read_graph
            end function
            function glp_write_graph(G,fname) bind(C,name="glp_write_graph")
                use iso_c_binding
                    type(c_ptr), value :: G
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_write_graph
            end function
            function glp_check_asnprob(G,v_set) bind(C,name="glp_check_asnprob")
                use iso_c_binding
                    type(c_ptr), value :: G
                    integer(c_int), value :: v_set
                    integer(c_int) :: glp_check_asnprob
            end function
            function glp_asnprob_hall(G,v_set,a_x) bind(C,name="glp_asnprob_hall")
                use iso_c_binding
                    type(c_ptr), value :: G
                    integer(c_int), value :: v_set
                    integer(c_int), value :: a_x
                    integer(c_int) :: glp_asnprob_hall
            end function
            function glp_cpp(G,v_t,v_es,v_ls) bind(C,name="glp_cpp")
                use iso_c_binding
                    type(c_ptr), value :: G
                    integer(c_int), value :: v_t
                    integer(c_int), value :: v_es
                    integer(c_int), value :: v_ls
                    real(c_double) :: glp_cpp
            end function
            function glp_read_ccdata(G,v_wgt,fname) bind(C,name="glp_read_ccdata")
                use iso_c_binding
                    type(c_ptr), value :: G
                    integer(c_int), value :: v_wgt
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_read_ccdata
            end function
            function glp_write_ccdata(G,v_wgt,fname) bind(C,name="glp_write_ccdata")
                use iso_c_binding
                    type(c_ptr), value :: G
                    integer(c_int), value :: v_wgt
                    character(c_char) :: fname(*)
                    integer(c_int) :: glp_write_ccdata
            end function
            subroutine glp_netgen_prob(nprob,parm) bind(C,name="glp_netgen_prob")
                use iso_c_binding
                    integer(c_int), value :: nprob
                    integer(c_int) :: parm(*)
            end subroutine
            function glp_weak_comp(G,v_num) bind(C,name="glp_weak_comp")
                use iso_c_binding
                    type(c_ptr), value :: G
                    integer(c_int), value :: v_num
                    integer(c_int) :: glp_weak_comp
            end function
            function glp_strong_comp(G,v_num) bind(C,name="glp_strong_comp")
                use iso_c_binding
                    type(c_ptr), value :: G
                    integer(c_int), value :: v_num
                    integer(c_int) :: glp_strong_comp
            end function
            function glp_top_sort(G,v_num) bind(C,name="glp_top_sort")
                use iso_c_binding
                    type(c_ptr), value :: G
                    integer(c_int), value :: v_num
                    integer(c_int) :: glp_top_sort
            end function
            function glp_wclique_exact(G,v_wgt,sol,v_set) bind(C,name="glp_wclique_exact")
                use iso_c_binding
                    type(c_ptr), value :: G
                    integer(c_int), value :: v_wgt
                    real(c_double) :: sol(*)
                    integer(c_int), value :: v_set
                    integer(c_int) :: glp_wclique_exact
            end function
    end interface
end module glpk
