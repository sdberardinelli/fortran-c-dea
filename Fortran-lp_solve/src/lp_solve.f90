module lp_solve
    use iso_c_binding
    implicit none
        interface
            subroutine lp_solve_version(majorversion,minorversion,release,build) bind(C,name="lp_solve_version")
                use iso_c_binding
                    type(c_ptr), value :: majorversion
                    type(c_ptr), value :: minorversion
                    type(c_ptr), value :: release
                    type(c_ptr), value :: build
            end subroutine
            function make_lp(rows,columns) bind(C,name="make_lp")
                use iso_c_binding
                    integer(c_int), value ::rows
                    integer(c_int), value ::columns
                    type(c_ptr) :: make_lp
            end function
            function resize_lp(lp,rows,columns) bind(C,name="resize_lp")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rows
                    integer(c_int), value ::columns
                    integer(c_int) :: resize_lp !MYBOOL
            end function
            function get_status(lp) bind(C,name="get_status")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_status
            end function
            function get_statustext(lp,statuscode) bind(C,name="get_statustext")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::statuscode
                    character(c_char) :: get_statustext
            end function
            function is_obj_in_basis(lp) bind(C,name="is_obj_in_basis")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: is_obj_in_basis !MYBOOL
            end function
            subroutine set_obj_in_basis(lp,obj_in_basis) bind(C,name="set_obj_in_basis")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: obj_in_basis !MYBOOL
            end subroutine
            function copy_lp(lp) bind(C,name="copy_lp")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_ptr) :: copy_lp
            end function
            function dualize_lp(lp) bind(C,name="dualize_lp")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: dualize_lp !MYBOOL
            end function
            function memopt_lp(lp,rowextra,colextra,nzextra) bind(C,name="memopt_lp")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rowextra
                    integer(c_int), value ::colextra
                    integer(c_int), value ::nzextra
                    integer(c_int) :: memopt_lp !MYBOOL
            end function
            subroutine delete_lp(lp) bind(C,name="delete_lp")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            subroutine free_lp(plp) bind(C,name="free_lp")
                use iso_c_binding
                    type(c_ptr), value :: plp
            end subroutine
            function set_lp_name(lp,lpname) bind(C,name="set_lp_name")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: lpname(*)
                    integer(c_int) :: set_lp_name !MYBOOL
            end function
            function get_lp_name(lp) bind(C,name="get_lp_name")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: get_lp_name
            end function
            function has_BFP(lp) bind(C,name="has_BFP")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: has_BFP !MYBOOL
            end function
            function is_nativeBFP(lp) bind(C,name="is_nativeBFP")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: is_nativeBFP !MYBOOL
            end function
            function set_BFP(lp,filename) bind(C,name="set_BFP")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: filename(*)
                    integer(c_int) :: set_BFP !MYBOOL
            end function
            function read_XLI(xliname,modelname,dataname,options,verbose) bind(C,name="read_XLI")
                use iso_c_binding
                    character(c_char) :: xliname(*)
                    character(c_char) :: modelname(*)
                    character(c_char) :: dataname(*)
                    character(c_char) :: options(*)
                    integer(c_int), value ::verbose
                    type(c_ptr) :: read_XLI
            end function
            function write_XLI(lp,filename,options,results) bind(C,name="write_XLI")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: filename(*)
                    character(c_char) :: options(*)
                    integer(c_int), value :: results !MYBOOL
                    integer(c_int) :: write_XLI !MYBOOL
            end function
            function has_XLI(lp) bind(C,name="has_XLI")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: has_XLI !MYBOOL
            end function
            function is_nativeXLI(lp) bind(C,name="is_nativeXLI")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: is_nativeXLI !MYBOOL
            end function
            function set_XLI(lp,filename) bind(C,name="set_XLI")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: filename(*)
                    integer(c_int) :: set_XLI !MYBOOL
            end function
            function set_obj(lp,colnr,value) bind(C,name="set_obj")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    real(c_double), value :: value
                    integer(c_int) :: set_obj !MYBOOL
            end function
            function set_obj_fn(lp,row) bind(C,name="set_obj_fn")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: row(*)
                    integer(c_int) :: set_obj_fn !MYBOOL
            end function
            function set_obj_fnex(lp,count,row,colno) bind(C,name="set_obj_fnex")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::count
                    real(c_double) :: row(*)
                    type(c_ptr), value :: colno
                    integer(c_int) :: set_obj_fnex !MYBOOL
            end function
            function str_set_obj_fn(lp,row_string) bind(C,name="str_set_obj_fn")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: row_string(*)
                    integer(c_int) :: str_set_obj_fn !MYBOOL
            end function
            subroutine set_sense(lp,maximize) bind(C,name="set_sense")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: maximize !MYBOOL
            end subroutine
            subroutine set_maxim(lp) bind(C,name="set_maxim")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            subroutine set_minim(lp) bind(C,name="set_minim")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            function is_maxim(lp) bind(C,name="is_maxim")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: is_maxim !MYBOOL
            end function
            function add_constraint(lp,row,constr_type,rh) bind(C,name="add_constraint")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: row(*)
                    integer(c_int), value ::constr_type
                    real(c_double), value :: rh
                    integer(c_int) :: add_constraint !MYBOOL
            end function
            function add_constraintex(lp,count,row,colno,constr_type,rh) bind(C,name="add_constraintex")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::count
                    real(c_double) :: row(*)
                    type(c_ptr), value :: colno
                    integer(c_int), value ::constr_type
                    real(c_double), value :: rh
                    integer(c_int) :: add_constraintex !MYBOOL
            end function
            function set_add_rowmode(lp,turnon) bind(C,name="set_add_rowmode")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: turnon !MYBOOL
                    integer(c_int) :: set_add_rowmode !MYBOOL
            end function
            function is_add_rowmode(lp) bind(C,name="is_add_rowmode")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: is_add_rowmode !MYBOOL
            end function
            function str_add_constraint(lp,row_string,constr_type,rh) bind(C,name="str_add_constraint")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: row_string(*)
                    integer(c_int), value ::constr_type
                    real(c_double), value :: rh
                    integer(c_int) :: str_add_constraint !MYBOOL
            end function
            function set_row(lp,rownr,row) bind(C,name="set_row")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    real(c_double) :: row(*)
                    integer(c_int) :: set_row !MYBOOL
            end function
            function set_rowex(lp,rownr,count,row,colno) bind(C,name="set_rowex")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    integer(c_int), value ::count
                    real(c_double) :: row(*)
                    type(c_ptr), value :: colno
                    integer(c_int) :: set_rowex !MYBOOL
            end function
            function get_row(lp,rownr,row) bind(C,name="get_row")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    real(c_double) :: row(*)
                    integer(c_int) :: get_row !MYBOOL
            end function
            function get_rowex(lp,rownr,row,colno) bind(C,name="get_rowex")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    real(c_double) :: row(*)
                    type(c_ptr), value :: colno
                    integer(c_int) :: get_rowex
            end function
            function del_constraint(lp,rownr) bind(C,name="del_constraint")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    integer(c_int) :: del_constraint !MYBOOL
            end function
            function del_constraintex(lp,rowmap) bind(C,name="del_constraintex")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_ptr), value :: rowmap
                    integer(c_int) :: del_constraintex !MYBOOL
            end function
            function add_lag_con(lp,row,con_type,rhs) bind(C,name="add_lag_con")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: row(*)
                    integer(c_int), value ::con_type
                    real(c_double), value :: rhs
                    integer(c_int) :: add_lag_con !MYBOOL
            end function
            function str_add_lag_con(lp,row_string,con_type,rhs) bind(C,name="str_add_lag_con")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: row_string(*)
                    integer(c_int), value ::con_type
                    real(c_double), value :: rhs
                    integer(c_int) :: str_add_lag_con !MYBOOL
            end function
            subroutine set_lag_trace(lp,lag_trace) bind(C,name="set_lag_trace")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: lag_trace !MYBOOL
            end subroutine
            function is_lag_trace(lp) bind(C,name="is_lag_trace")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: is_lag_trace !MYBOOL
            end function
            function set_constr_type(lp,rownr,con_type) bind(C,name="set_constr_type")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    integer(c_int), value ::con_type
                    integer(c_int) :: set_constr_type !MYBOOL
            end function
            function get_constr_type(lp,rownr) bind(C,name="get_constr_type")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    integer(c_int) :: get_constr_type
            end function
            function get_constr_value(lp,rownr,count,primsolution,nzindex) bind(C,name="get_constr_value")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    integer(c_int), value ::count
                    real(c_double) :: primsolution(*)
                    type(c_ptr), value :: nzindex
                    type(REAL) :: get_constr_value
            end function
            function is_constr_type(lp,rownr,mask) bind(C,name="is_constr_type")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    integer(c_int), value ::mask
                    integer(c_int) :: is_constr_type !MYBOOL
            end function
            function get_str_constr_type(lp,con_type) bind(C,name="get_str_constr_type")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::con_type
                    character(c_char) :: get_str_constr_type
            end function
            function get_constr_class(lp,rownr) bind(C,name="get_constr_class")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    integer(c_int) :: get_constr_class
            end function
            function get_str_constr_class(lp,con_class) bind(C,name="get_str_constr_class")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::con_class
                    character(c_char) :: get_str_constr_class
            end function
            function set_rh(lp,rownr,value) bind(C,name="set_rh")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    real(c_double), value :: value
                    integer(c_int) :: set_rh !MYBOOL
            end function
            function get_rh(lp,rownr) bind(C,name="get_rh")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    type(REAL) :: get_rh
            end function
            function set_rh_range(lp,rownr,deltavalue) bind(C,name="set_rh_range")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    real(c_double), value :: deltavalue
                    integer(c_int) :: set_rh_range !MYBOOL
            end function
            function get_rh_range(lp,rownr) bind(C,name="get_rh_range")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    type(REAL) :: get_rh_range
            end function
            subroutine set_rh_vec(lp,rh) bind(C,name="set_rh_vec")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: rh(*)
            end subroutine
            function str_set_rh_vec(lp,rh_string) bind(C,name="str_set_rh_vec")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: rh_string(*)
                    integer(c_int) :: str_set_rh_vec !MYBOOL
            end function
            function add_column(lp,column) bind(C,name="add_column")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: column(*)
                    integer(c_int) :: add_column !MYBOOL
            end function
            function add_columnex(lp,count,column,rowno) bind(C,name="add_columnex")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::count
                    real(c_double) :: column(*)
                    type(c_ptr), value :: rowno
                    integer(c_int) :: add_columnex !MYBOOL
            end function
            function str_add_column(lp,col_string) bind(C,name="str_add_column")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: col_string(*)
                    integer(c_int) :: str_add_column !MYBOOL
            end function
            function set_column(lp,colnr,column) bind(C,name="set_column")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    real(c_double) :: column(*)
                    integer(c_int) :: set_column !MYBOOL
            end function
            function set_columnex(lp,colnr,count,column,rowno) bind(C,name="set_columnex")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    integer(c_int), value ::count
                    real(c_double) :: column(*)
                    type(c_ptr), value :: rowno
                    integer(c_int) :: set_columnex !MYBOOL
            end function
            function column_in_lp(lp,column) bind(C,name="column_in_lp")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: column(*)
                    integer(c_int) :: column_in_lp
            end function
            function get_columnex(lp,colnr,column,nzrow) bind(C,name="get_columnex")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    real(c_double) :: column(*)
                    type(c_ptr), value :: nzrow
                    integer(c_int) :: get_columnex
            end function
            function get_column(lp,colnr,column) bind(C,name="get_column")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    real(c_double) :: column(*)
                    integer(c_int) :: get_column !MYBOOL
            end function
            function del_column(lp,colnr) bind(C,name="del_column")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    integer(c_int) :: del_column !MYBOOL
            end function
            function del_columnex(lp,colmap) bind(C,name="del_columnex")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_ptr), value :: colmap
                    integer(c_int) :: del_columnex !MYBOOL
            end function
            function set_mat(lp,rownr,colnr,value) bind(C,name="set_mat")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    integer(c_int), value ::colnr
                    real(c_double), value :: value
                    integer(c_int) :: set_mat !MYBOOL
            end function
            function get_mat(lp,rownr,colnr) bind(C,name="get_mat")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    integer(c_int), value ::colnr
                    type(REAL) :: get_mat
            end function
            function get_mat_byindex(lp,matindex,isrow,adjustsign) bind(C,name="get_mat_byindex")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::matindex
                    integer(c_int), value :: isrow !MYBOOL
                    integer(c_int), value :: adjustsign !MYBOOL
                    type(REAL) :: get_mat_byindex
            end function
            function get_nonzeros(lp) bind(C,name="get_nonzeros")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_nonzeros
            end function
            subroutine set_bounds_tighter(lp,tighten) bind(C,name="set_bounds_tighter")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: tighten !MYBOOL
            end subroutine
            function get_bounds(lp,column,lower,upper) bind(C,name="get_bounds")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::column
                    real(c_double) :: lower(*)
                    real(c_double) :: upper(*)
                    integer(c_int) :: get_bounds !MYBOOL
            end function
            function get_bounds_tighter(lp) bind(C,name="get_bounds_tighter")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_bounds_tighter !MYBOOL
            end function
            function set_upbo(lp,colnr,value) bind(C,name="set_upbo")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    real(c_double), value :: value
                    integer(c_int) :: set_upbo !MYBOOL
            end function
            function get_upbo(lp,colnr) bind(C,name="get_upbo")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    type(REAL) :: get_upbo
            end function
            function set_lowbo(lp,colnr,value) bind(C,name="set_lowbo")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    real(c_double), value :: value
                    integer(c_int) :: set_lowbo !MYBOOL
            end function
            function get_lowbo(lp,colnr) bind(C,name="get_lowbo")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    type(REAL) :: get_lowbo
            end function
            function set_bounds(lp,colnr,lower,upper) bind(C,name="set_bounds")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    real(c_double), value :: lower
                    real(c_double), value :: upper
                    integer(c_int) :: set_bounds !MYBOOL
            end function
            function set_unbounded(lp,colnr) bind(C,name="set_unbounded")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    integer(c_int) :: set_unbounded !MYBOOL
            end function
            function is_unbounded(lp,colnr) bind(C,name="is_unbounded")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    integer(c_int) :: is_unbounded !MYBOOL
            end function
            function set_int(lp,colnr,must_be_int) bind(C,name="set_int")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    integer(c_int), value :: must_be_int !MYBOOL
                    integer(c_int) :: set_int !MYBOOL
            end function
            function is_int(lp,colnr) bind(C,name="is_int")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    integer(c_int) :: is_int !MYBOOL
            end function
            function set_binary(lp,colnr,must_be_bin) bind(C,name="set_binary")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    integer(c_int), value :: must_be_bin !MYBOOL
                    integer(c_int) :: set_binary !MYBOOL
            end function
            function is_binary(lp,colnr) bind(C,name="is_binary")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    integer(c_int) :: is_binary !MYBOOL
            end function
            function set_semicont(lp,colnr,must_be_sc) bind(C,name="set_semicont")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    integer(c_int), value :: must_be_sc !MYBOOL
                    integer(c_int) :: set_semicont !MYBOOL
            end function
            function is_semicont(lp,colnr) bind(C,name="is_semicont")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    integer(c_int) :: is_semicont !MYBOOL
            end function
            function is_negative(lp,colnr) bind(C,name="is_negative")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    integer(c_int) :: is_negative !MYBOOL
            end function
            function set_var_weights(lp,weights) bind(C,name="set_var_weights")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: weights(*)
                    integer(c_int) :: set_var_weights !MYBOOL
            end function
            function get_var_priority(lp,colnr) bind(C,name="get_var_priority")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    integer(c_int) :: get_var_priority
            end function
            function set_pseudocosts(lp,clower,cupper,updatelimit) bind(C,name="set_pseudocosts")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: clower(*)
                    real(c_double) :: cupper(*)
                    type(c_ptr), value :: updatelimit
                    integer(c_int) :: set_pseudocosts !MYBOOL
            end function
            function get_pseudocosts(lp,clower,cupper,updatelimit) bind(C,name="get_pseudocosts")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: clower(*)
                    real(c_double) :: cupper(*)
                    type(c_ptr), value :: updatelimit
                    integer(c_int) :: get_pseudocosts !MYBOOL
            end function
            function add_SOS(lp,name,sostype,priority,count,sosvars,weights) bind(C,name="add_SOS")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: name(*)
                    integer(c_int), value ::sostype
                    integer(c_int), value ::priority
                    integer(c_int), value ::count
                    type(c_ptr), value :: sosvars
                    real(c_double) :: weights(*)
                    integer(c_int) :: add_SOS
            end function
            function is_SOS_var(lp,colnr) bind(C,name="is_SOS_var")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    integer(c_int) :: is_SOS_var !MYBOOL
            end function
            function set_row_name(lp,rownr,new_name) bind(C,name="set_row_name")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    character(c_char) :: new_name(*)
                    integer(c_int) :: set_row_name !MYBOOL
            end function
            function get_row_name(lp,rownr) bind(C,name="get_row_name")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    character(c_char) :: get_row_name
            end function
            function get_origrow_name(lp,rownr) bind(C,name="get_origrow_name")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    character(c_char) :: get_origrow_name
            end function
            function set_col_name(lp,colnr,new_name) bind(C,name="set_col_name")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    character(c_char) :: new_name(*)
                    integer(c_int) :: set_col_name !MYBOOL
            end function
            function get_col_name(lp,colnr) bind(C,name="get_col_name")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    character(c_char) :: get_col_name
            end function
            function get_origcol_name(lp,colnr) bind(C,name="get_origcol_name")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    character(c_char) :: get_origcol_name
            end function
            subroutine unscale(lp) bind(C,name="unscale")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            subroutine set_preferdual(lp,dodual) bind(C,name="set_preferdual")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: dodual !MYBOOL
            end subroutine
            subroutine set_simplextype(lp,simplextype) bind(C,name="set_simplextype")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::simplextype
            end subroutine
            function get_simplextype(lp) bind(C,name="get_simplextype")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_simplextype
            end function
            subroutine default_basis(lp) bind(C,name="default_basis")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            subroutine set_basiscrash(lp,mode) bind(C,name="set_basiscrash")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::mode
            end subroutine
            function get_basiscrash(lp) bind(C,name="get_basiscrash")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_basiscrash
            end function
            function set_basisvar(lp,basisPos,enteringCol) bind(C,name="set_basisvar")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::basisPos
                    integer(c_int), value ::enteringCol
                    integer(c_int) :: set_basisvar
            end function
            function set_basis(lp,bascolumn,nonbasic) bind(C,name="set_basis")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_ptr), value :: bascolumn
                    integer(c_int), value :: nonbasic !MYBOOL
                    integer(c_int) :: set_basis !MYBOOL
            end function
            function get_basis(lp,bascolumn,nonbasic) bind(C,name="get_basis")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_ptr), value :: bascolumn
                    integer(c_int), value :: nonbasic !MYBOOL
                    integer(c_int) :: get_basis !MYBOOL
            end function
            subroutine reset_basis(lp) bind(C,name="reset_basis")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            function guess_basis(lp,guessvector,basisvector) bind(C,name="guess_basis")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: guessvector(*)
                    type(c_ptr), value :: basisvector
                    integer(c_int) :: guess_basis !MYBOOL
            end function
            function is_feasible(lp,values,threshold) bind(C,name="is_feasible")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: values(*)
                    real(c_double), value :: threshold
                    integer(c_int) :: is_feasible !MYBOOL
            end function
            function solve(lp) bind(C,name="solve")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: solve
            end function
            function time_elapsed(lp) bind(C,name="time_elapsed")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: time_elapsed
            end function
            subroutine put_bb_nodefunc(lp,newnode,bbnodehandle) bind(C,name="put_bb_nodefunc")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_funptr) :: newnode
                    type(c_ptr), value :: bbnodehandle
            end subroutine
            subroutine put_bb_branchfunc(lp,newbranch,bbbranchhandle) bind(C,name="put_bb_branchfunc")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_funptr) :: newbranch
                    type(c_ptr), value :: bbbranchhandle
            end subroutine
            subroutine put_abortfunc(lp,newctrlc,ctrlchandle) bind(C,name="put_abortfunc")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_funptr) :: newctrlc
                    type(c_ptr), value :: ctrlchandle
            end subroutine
            subroutine put_logfunc(lp,newlog,loghandle) bind(C,name="put_logfunc")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_funptr)newlog
                    type(c_ptr), value :: loghandle
            end subroutine
            subroutine put_msgfunc(lp,newmsg,msghandle,mask) bind(C,name="put_msgfunc")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_funptr) :: newmsg
                    type(c_ptr), value :: msghandle
                    integer(c_int), value ::mask
            end subroutine
            function get_primal_solution(lp,pv) bind(C,name="get_primal_solution")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: pv(*)
                    integer(c_int) :: get_primal_solution !MYBOOL
            end function
            function get_ptr_primal_solution(lp,pv) bind(C,name="get_ptr_primal_solution")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: pv(*)
                    integer(c_int) :: get_ptr_primal_solution !MYBOOL
            end function
            function get_dual_solution(lp,rc) bind(C,name="get_dual_solution")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: rc(*)
                    integer(c_int) :: get_dual_solution !MYBOOL
            end function
            function get_ptr_dual_solution(lp,rc) bind(C,name="get_ptr_dual_solution")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: rc(*)
                    integer(c_int) :: get_ptr_dual_solution !MYBOOL
            end function
            function get_lambda(lp,lambda) bind(C,name="get_lambda")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: lambda(*)
                    integer(c_int) :: get_lambda !MYBOOL
            end function
            function get_ptr_lambda(lp,lambda) bind(C,name="get_ptr_lambda")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: lambda(*)
                    integer(c_int) :: get_ptr_lambda !MYBOOL
            end function
            function read_mps(filename,options) bind(C,name="read_mps")
                use iso_c_binding
                    type(c_ptr), value :: filename
                    integer(c_int), value ::options
                    type(c_ptr) :: read_mps
            end function
            function read_freemps(filename,options) bind(C,name="read_freemps")
                use iso_c_binding
                    type(c_ptr), value :: filename
                    integer(c_int), value ::options
                    type(c_ptr) :: read_freemps
            end function
            function write_mps(lp,filename) bind(C,name="write_mps")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: filename(*)
                    integer(c_int) :: write_mps !MYBOOL
            end function
            function write_freemps(lp,filename) bind(C,name="write_freemps")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: filename(*)
                    integer(c_int) :: write_freemps !MYBOOL
            end function
            function write_lp(lp,filename) bind(C,name="write_lp")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: filename(*)
                    integer(c_int) :: write_lp !MYBOOL
            end function
            function LP_readhandle(lp,filename,verbose,lp_name) bind(C,name="LP_readhandle")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_ptr), value :: filename
                    integer(c_int), value ::verbose
                    character(c_char) :: lp_name(*)
                    integer(c_int) :: LP_readhandle !MYBOOL
            end function
            function read_lp(filename,verbose,lp_name) bind(C,name="read_lp")
                use iso_c_binding
                    type(c_ptr), value :: filename
                    integer(c_int), value ::verbose
                    character(c_char) :: lp_name(*)
                    type(c_ptr) :: read_lp
            end function
            function write_basis(lp,filename) bind(C,name="write_basis")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: filename(*)
                    integer(c_int) :: write_basis !MYBOOL
            end function
            function read_basis(lp,filename,info) bind(C,name="read_basis")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: filename(*)
                    character(c_char) :: info(*)
                    integer(c_int) :: read_basis !MYBOOL
            end function
            function write_params(lp,filename,options) bind(C,name="write_params")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: filename(*)
                    character(c_char) :: options(*)
                    integer(c_int) :: write_params !MYBOOL
            end function
            function read_params(lp,filename,options) bind(C,name="read_params")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: filename(*)
                    character(c_char) :: options(*)
                    integer(c_int) :: read_params !MYBOOL
            end function
            subroutine reset_params(lp) bind(C,name="reset_params")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            subroutine print_lp(lp) bind(C,name="print_lp")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            subroutine print_tableau(lp) bind(C,name="print_tableau")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            subroutine print_objective(lp) bind(C,name="print_objective")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            subroutine print_solution(lp,columns) bind(C,name="print_solution")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::columns
            end subroutine
            subroutine print_constraints(lp,columns) bind(C,name="print_constraints")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::columns
            end subroutine
            subroutine print_duals(lp) bind(C,name="print_duals")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            subroutine print_scales(lp) bind(C,name="print_scales")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            subroutine print_str(lp,str) bind(C,name="print_str")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: str(*)
            end subroutine
            subroutine set_outputstream(lp,stream) bind(C,name="set_outputstream")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_ptr), value :: stream
            end subroutine
            function set_outputfile(lp,filename) bind(C,name="set_outputfile")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: filename(*)
                    integer(c_int) :: set_outputfile !MYBOOL
            end function
            subroutine set_verbose(lp,verbose) bind(C,name="set_verbose")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::verbose
            end subroutine
            function get_verbose(lp) bind(C,name="get_verbose")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_verbose
            end function
            subroutine set_timeout(lp,sectimeout) bind(C,name="set_timeout")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_long) :: sectimeout
            end subroutine
            function get_timeout(lp) bind(C,name="get_timeout")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_long) :: get_timeout
            end function
            subroutine set_print_sol(lp,print_sol) bind(C,name="set_print_sol")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::print_sol
            end subroutine
            function get_print_sol(lp) bind(C,name="get_print_sol")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_print_sol
            end function
            subroutine set_debug(lp,debug) bind(C,name="set_debug")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: debug !MYBOOL
            end subroutine
            function is_debug(lp) bind(C,name="is_debug")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: is_debug !MYBOOL
            end function
            subroutine set_trace(lp,trace) bind(C,name="set_trace")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: trace !MYBOOL
            end subroutine
            function is_trace(lp) bind(C,name="is_trace")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: is_trace !MYBOOL
            end function
            function print_debugdump(lp,filename) bind(C,name="print_debugdump")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: filename(*)
                    integer(c_int) :: print_debugdump !MYBOOL
            end function
            subroutine set_anti_degen(lp,anti_degen) bind(C,name="set_anti_degen")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::anti_degen
            end subroutine
            function get_anti_degen(lp) bind(C,name="get_anti_degen")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_anti_degen
            end function
            function is_anti_degen(lp,testmask) bind(C,name="is_anti_degen")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::testmask
                    integer(c_int) :: is_anti_degen !MYBOOL
            end function
            subroutine set_presolve(lp,presolvemode,maxloops) bind(C,name="set_presolve")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::presolvemode
                    integer(c_int), value ::maxloops
            end subroutine
            function get_presolve(lp) bind(C,name="get_presolve")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_presolve
            end function
            function get_presolveloops(lp) bind(C,name="get_presolveloops")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_presolveloops
            end function
            function is_presolve(lp,testmask) bind(C,name="is_presolve")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::testmask
                    integer(c_int) :: is_presolve !MYBOOL
            end function
            function get_orig_index(lp,lp_index) bind(C,name="get_orig_index")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::lp_index
                    integer(c_int) :: get_orig_index
            end function
            function get_lp_index(lp,orig_index) bind(C,name="get_lp_index")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::orig_index
                    integer(c_int) :: get_lp_index
            end function
            subroutine set_maxpivot(lp,max_num_inv) bind(C,name="set_maxpivot")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::max_num_inv
            end subroutine
            function get_maxpivot(lp) bind(C,name="get_maxpivot")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_maxpivot
            end function
            subroutine set_obj_bound(lp,obj_bound) bind(C,name="set_obj_bound")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: obj_bound
            end subroutine
            function get_obj_bound(lp) bind(C,name="get_obj_bound")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(REAL) :: get_obj_bound
            end function
            subroutine set_mip_gap(lp,absolute,mip_gap) bind(C,name="set_mip_gap")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: absolute !MYBOOL
                    real(c_double), value :: mip_gap
            end subroutine
            function get_mip_gap(lp,absolute) bind(C,name="get_mip_gap")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: absolute !MYBOOL
                    type(REAL) :: get_mip_gap
            end function
            subroutine set_bb_rule(lp,bb_rule) bind(C,name="set_bb_rule")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::bb_rule
            end subroutine
            function get_bb_rule(lp) bind(C,name="get_bb_rule")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_bb_rule
            end function
            function set_var_branch(lp,colnr,branch_mode) bind(C,name="set_var_branch")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    integer(c_int), value ::branch_mode
                    integer(c_int) :: set_var_branch !MYBOOL
            end function
            function get_var_branch(lp,colnr) bind(C,name="get_var_branch")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    integer(c_int) :: get_var_branch
            end function
            function is_infinite(lp,value) bind(C,name="is_infinite")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: value
                    integer(c_int) :: is_infinite !MYBOOL
            end function
            subroutine set_infinite(lp,infinite) bind(C,name="set_infinite")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: infinite
            end subroutine
            function get_infinite(lp) bind(C,name="get_infinite")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(REAL) :: get_infinite
            end function
            subroutine set_epsint(lp,epsint) bind(C,name="set_epsint")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: epsint
            end subroutine
            function get_epsint(lp) bind(C,name="get_epsint")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(REAL) :: get_epsint
            end function
            subroutine set_epsb(lp,epsb) bind(C,name="set_epsb")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: epsb
            end subroutine
            function get_epsb(lp) bind(C,name="get_epsb")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(REAL) :: get_epsb
            end function
            subroutine set_epsd(lp,epsd) bind(C,name="set_epsd")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: epsd
            end subroutine
            function get_epsd(lp) bind(C,name="get_epsd")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(REAL) :: get_epsd
            end function
            subroutine set_epsel(lp,epsel) bind(C,name="set_epsel")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: epsel
            end subroutine
            function get_epsel(lp) bind(C,name="get_epsel")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(REAL) :: get_epsel
            end function
            function set_epslevel(lp,epslevel) bind(C,name="set_epslevel")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::epslevel
                    integer(c_int) :: set_epslevel !MYBOOL
            end function
            subroutine set_scaling(lp,scalemode) bind(C,name="set_scaling")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::scalemode
            end subroutine
            function get_scaling(lp) bind(C,name="get_scaling")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_scaling
            end function
            function is_scalemode(lp,testmask) bind(C,name="is_scalemode")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::testmask
                    integer(c_int) :: is_scalemode !MYBOOL
            end function
            function is_scaletype(lp,scaletype) bind(C,name="is_scaletype")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::scaletype
                    integer(c_int) :: is_scaletype !MYBOOL
            end function
            function is_integerscaling(lp) bind(C,name="is_integerscaling")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: is_integerscaling !MYBOOL
            end function
            subroutine set_scalelimit(lp,scalelimit) bind(C,name="set_scalelimit")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: scalelimit
            end subroutine
            function get_scalelimit(lp) bind(C,name="get_scalelimit")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(REAL) :: get_scalelimit
            end function
            subroutine set_improve(lp,improve) bind(C,name="set_improve")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::improve
            end subroutine
            function get_improve(lp) bind(C,name="get_improve")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_improve
            end function
            subroutine set_pivoting(lp,piv_rule) bind(C,name="set_pivoting")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::piv_rule
            end subroutine
            function get_pivoting(lp) bind(C,name="get_pivoting")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_pivoting
            end function
            function set_partialprice(lp,blockcount,blockstart,isrow) bind(C,name="set_partialprice")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::blockcount
                    type(c_ptr), value :: blockstart
                    integer(c_int), value :: isrow !MYBOOL
                    integer(c_int) :: set_partialprice !MYBOOL
            end function
            subroutine get_partialprice(lp,blockcount,blockstart,isrow) bind(C,name="get_partialprice")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_ptr), value :: blockcount
                    type(c_ptr), value :: blockstart
                    integer(c_int), value :: isrow !MYBOOL
            end subroutine
            function set_multiprice(lp,multiblockdiv) bind(C,name="set_multiprice")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::multiblockdiv
                    integer(c_int) :: set_multiprice !MYBOOL
            end function
            function get_multiprice(lp,getabssize) bind(C,name="get_multiprice")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: getabssize !MYBOOL
                    integer(c_int) :: get_multiprice
            end function
            function is_use_names(lp,isrow) bind(C,name="is_use_names")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: isrow !MYBOOL
                    integer(c_int) :: is_use_names !MYBOOL
            end function
            subroutine set_use_names(lp,isrow,use_names) bind(C,name="set_use_names")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: isrow !MYBOOL
                    integer(c_int), value :: use_names !MYBOOL
            end subroutine
            function get_nameindex(lp,varname,isrow) bind(C,name="get_nameindex")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: varname(*)
                    integer(c_int), value :: isrow !MYBOOL
                    integer(c_int) :: get_nameindex
            end function
            function is_piv_mode(lp,testmask) bind(C,name="is_piv_mode")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::testmask
                    integer(c_int) :: is_piv_mode !MYBOOL
            end function
            function is_piv_rule(lp,rule) bind(C,name="is_piv_rule")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rule
                    integer(c_int) :: is_piv_rule !MYBOOL
            end function
            subroutine set_break_at_first(lp,break_at_first) bind(C,name="set_break_at_first")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: break_at_first !MYBOOL
            end subroutine
            function is_break_at_first(lp) bind(C,name="is_break_at_first")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: is_break_at_first !MYBOOL
            end function
            subroutine set_bb_floorfirst(lp,bb_floorfirst) bind(C,name="set_bb_floorfirst")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::bb_floorfirst
            end subroutine
            function get_bb_floorfirst(lp) bind(C,name="get_bb_floorfirst")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_bb_floorfirst
            end function
            subroutine set_bb_depthlimit(lp,bb_maxlevel) bind(C,name="set_bb_depthlimit")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::bb_maxlevel
            end subroutine
            function get_bb_depthlimit(lp) bind(C,name="get_bb_depthlimit")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_bb_depthlimit
            end function
            subroutine set_break_at_value(lp,break_at_value) bind(C,name="set_break_at_value")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: break_at_value
            end subroutine
            function get_break_at_value(lp) bind(C,name="get_break_at_value")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(REAL) :: get_break_at_value
            end function
            subroutine set_negrange(lp,negrange) bind(C,name="set_negrange")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: negrange
            end subroutine
            function get_negrange(lp) bind(C,name="get_negrange")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(REAL) :: get_negrange
            end function
            subroutine set_epsperturb(lp,epsperturb) bind(C,name="set_epsperturb")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: epsperturb
            end subroutine
            function get_epsperturb(lp) bind(C,name="get_epsperturb")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(REAL) :: get_epsperturb
            end function
            subroutine set_epspivot(lp,epspivot) bind(C,name="set_epspivot")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: epspivot
            end subroutine
            function get_epspivot(lp) bind(C,name="get_epspivot")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(REAL) :: get_epspivot
            end function
            function get_max_level(lp) bind(C,name="get_max_level")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_max_level
            end function
            function get_total_nodes(lp) bind(C,name="get_total_nodes")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_long) :: get_total_nodes
            end function
            function get_total_iter(lp) bind(C,name="get_total_iter")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_long) :: get_total_iter
            end function
            function get_objective(lp) bind(C,name="get_objective")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(REAL) :: get_objective
            end function
            function get_working_objective(lp) bind(C,name="get_working_objective")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(REAL) :: get_working_objective
            end function
            function get_var_primalresult(lp,index) bind(C,name="get_var_primalresult")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::index
                    type(REAL) :: get_var_primalresult
            end function
            function get_var_dualresult(lp,index) bind(C,name="get_var_dualresult")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::index
                    type(REAL) :: get_var_dualresult
            end function
            function get_variables(lp,var) bind(C,name="get_variables")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: var(*)
                    integer(c_int) :: get_variables !MYBOOL
            end function
            function get_ptr_variables(lp,var) bind(C,name="get_ptr_variables")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: var(*)
                    integer(c_int) :: get_ptr_variables !MYBOOL
            end function
            function get_constraints(lp,constr) bind(C,name="get_constraints")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: constr(*)
                    integer(c_int) :: get_constraints !MYBOOL
            end function
            function get_ptr_constraints(lp,constr) bind(C,name="get_ptr_constraints")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: constr(*)
                    integer(c_int) :: get_ptr_constraints !MYBOOL
            end function
            function get_sensitivity_rhs(lp,duals,dualsfrom,dualstill) bind(C,name="get_sensitivity_rhs")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: duals(*)
                    real(c_double) :: dualsfrom(*)
                    real(c_double) :: dualstill(*)
                    integer(c_int) :: get_sensitivity_rhs !MYBOOL
            end function
            function get_ptr_sensitivity_rhs(lp,duals,dualsfrom,dualstill) bind(C,name="get_ptr_sensitivity_rhs")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: duals(*)
                    real(c_double) :: dualsfrom(*)
                    real(c_double) :: dualstill(*)
                    integer(c_int) :: get_ptr_sensitivity_rhs !MYBOOL
            end function
            function get_sensitivity_obj(lp,objfrom,objtill) bind(C,name="get_sensitivity_obj")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: objfrom(*)
                    real(c_double) :: objtill(*)
                    integer(c_int) :: get_sensitivity_obj !MYBOOL
            end function
            function get_sensitivity_objex(lp,objfrom,objtill,objfromvalue,objtillvalue) bind(C,name="get_sensitivity_objex")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: objfrom(*)
                    real(c_double) :: objtill(*)
                    real(c_double) :: objfromvalue(*)
                    real(c_double) :: objtillvalue(*)
                    integer(c_int) :: get_sensitivity_objex !MYBOOL
            end function
            function get_ptr_sensitivity_obj(lp,objfrom,objtill) bind(C,name="get_ptr_sensitivity_obj")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: objfrom(*)
                    real(c_double) :: objtill(*)
                    integer(c_int) :: get_ptr_sensitivity_obj !MYBOOL
            end function
            function get_ptr_sensitivity_objex(lp,objfrom,objtill,objfromvalue,objtillvalue) &
                bind(C,name="get_ptr_sensitivity_objex")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: objfrom(*)
                    real(c_double) :: objtill(*)
                    real(c_double) :: objfromvalue(*)
                    real(c_double) :: objtillvalue(*)
                    integer(c_int) :: get_ptr_sensitivity_objex !MYBOOL
            end function
            subroutine set_solutionlimit(lp,limit) bind(C,name="set_solutionlimit")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::limit
            end subroutine
            function get_solutionlimit(lp) bind(C,name="get_solutionlimit")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_solutionlimit
            end function
            function get_solutioncount(lp) bind(C,name="get_solutioncount")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_solutioncount
            end function
            function get_Norig_rows(lp) bind(C,name="get_Norig_rows")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_Norig_rows
            end function
            function get_Nrows(lp) bind(C,name="get_Nrows")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_Nrows
            end function
            function get_Lrows(lp) bind(C,name="get_Lrows")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_Lrows
            end function
            function get_Norig_columns(lp) bind(C,name="get_Norig_columns")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_Norig_columns
            end function
            function get_Ncolumns(lp) bind(C,name="get_Ncolumns")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_Ncolumns
            end function
            function MPS_readex(newlp,userhandle,read_modeldata,typeMPS,options) bind(C,name="MPS_readex")
                use iso_c_binding
                    type(c_ptr), value :: newlp
                    type(c_ptr), value :: userhandle
                    type(c_funptr) :: read_modeldata
                    integer(c_int), value ::typeMPS
                    integer(c_int), value ::options
                    integer(c_int) :: MPS_readex !MYBOOL
            end function
            function read_lpex(userhandle,read_modeldata,verbose,lp_name) bind(C,name="read_lpex")
                use iso_c_binding
                    type(c_ptr), value :: userhandle
                    type(c_funptr) :: read_modeldata
                    integer(c_int), value ::verbose
                    character(c_char) :: lp_name(*)
                    type(c_ptr) :: read_lpex
            end function
            function yieldformessages(lp) bind(C,name="yieldformessages")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: yieldformessages
            end function
            function userabort(lp,message) bind(C,name="userabort")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: message
                    integer(c_int) :: userabort !MYBOOL
            end function
            function append_rows(lp,deltarows) bind(C,name="append_rows")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::deltarows
                    integer(c_int) :: append_rows !MYBOOL
            end function
            function append_columns(lp,deltacolumns) bind(C,name="append_columns")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: deltacolumns
                    integer(c_int) :: append_columns !MYBOOL
            end function
            subroutine inc_rows(lp,delta) bind(C,name="inc_rows")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::delta
            end subroutine
            subroutine inc_columns(lp,delta) bind(C,name="inc_columns")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::delta
            end subroutine
            function init_rowcol_names(lp) bind(C,name="init_rowcol_names")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: init_rowcol_names !MYBOOL
            end function
            function inc_row_space(lp,deltarows) bind(C,name="inc_row_space")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::deltarows
                    integer(c_int) :: inc_row_space !MYBOOL
            end function
            function inc_col_space(lp,deltacols) bind(C,name="inc_col_space")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::deltacols
                    integer(c_int) :: inc_col_space !MYBOOL
            end function
            function shift_rowcoldata(lp,base,delta,usedmap,isrow) bind(C,name="shift_rowcoldata")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::base
                    integer(c_int), value ::delta
                    type(c_ptr), value :: usedmap
                    integer(c_int), value :: isrow !MYBOOL
                    integer(c_int) :: shift_rowcoldata !MYBOOL
            end function
            function shift_basis(lp,base,delta,usedmap,isrow) bind(C,name="shift_basis")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::base
                    integer(c_int), value ::delta
                    type(c_ptr), value :: usedmap
                    integer(c_int), value :: isrow !MYBOOL
                    integer(c_int) :: shift_basis !MYBOOL
            end function
            function shift_rowdata(lp,base,delta,usedmap) bind(C,name="shift_rowdata")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::base
                    integer(c_int), value ::delta
                    type(c_ptr), value :: usedmap
                    integer(c_int) :: shift_rowdata !MYBOOL
            end function
            function shift_coldata(lp,base,delta,usedmap) bind(C,name="shift_coldata")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::base
                    integer(c_int), value ::delta
                    type(c_ptr), value :: usedmap
                    integer(c_int) :: shift_coldata !MYBOOL
            end function
            function is_chsign(lp,rownr) bind(C,name="is_chsign")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    integer(c_int) :: is_chsign !MYBOOL
            end function
            function inc_lag_space(lp,deltarows,ignoreMAT) bind(C,name="inc_lag_space")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::deltarows
                    integer(c_int), value :: ignoreMAT !MYBOOL
                    integer(c_int) :: inc_lag_space !MYBOOL
            end function
            function make_lag(server) bind(C,name="make_lag")
                use iso_c_binding
                    type(c_ptr), value :: server
                    type(c_ptr) :: make_lag
            end function
            function get_rh_upper(lp,rownr) bind(C,name="get_rh_upper")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    type(REAL) :: get_rh_upper
            end function
            function get_rh_lower(lp,rownr) bind(C,name="get_rh_lower")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    type(REAL) :: get_rh_lower
            end function
            function set_rh_upper(lp,rownr,value) bind(C,name="set_rh_upper")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    real(c_double), value :: value
                    integer(c_int) :: set_rh_upper !MYBOOL
            end function
            function set_rh_lower(lp,rownr,value) bind(C,name="set_rh_lower")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    real(c_double), value :: value
                    integer(c_int) :: set_rh_lower !MYBOOL
            end function
            function bin_count(lp,working) bind(C,name="bin_count")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: working !MYBOOL
                    integer(c_int) :: bin_count
            end function
            function MIP_count(lp) bind(C,name="MIP_count")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: MIP_count
            end function
            function SOS_count(lp) bind(C,name="SOS_count")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: SOS_count
            end function
            function GUB_count(lp) bind(C,name="GUB_count")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: GUB_count
            end function
            function identify_GUB(lp,mark) bind(C,name="identify_GUB")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: mark !MYBOOL
                    integer(c_int) :: identify_GUB
            end function
            function prepare_GUB(lp) bind(C,name="prepare_GUB")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: prepare_GUB
            end function
            function refactRecent(lp) bind(C,name="refactRecent")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: refactRecent !MYBOOL
            end function
            function check_if_less(lp,x,y,variable) bind(C,name="check_if_less")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: x
                    real(c_double), value :: y
                    integer(c_int), value ::variable
                    integer(c_int) :: check_if_less !MYBOOL
            end function
            function feasiblePhase1(lp,epsvalue) bind(C,name="feasiblePhase1")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: epsvalue
                    integer(c_int) :: feasiblePhase1 !MYBOOL
            end function
            subroutine free_duals(lp) bind(C,name="free_duals")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            subroutine initialize_solution(lp,shiftbounds) bind(C,name="initialize_solution")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: shiftbounds !MYBOOL
            end subroutine
            subroutine recompute_solution(lp,shiftbounds) bind(C,name="recompute_solution")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: shiftbounds !MYBOOL
            end subroutine
            function verify_solution(lp,reinvert,info) bind(C,name="verify_solution")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: reinvert !MYBOOL
                    character(c_char) :: info(*)
                    integer(c_int) :: verify_solution
            end function
            function is_fixedvar(lp,variable) bind(C,name="is_fixedvar")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::variable
                    integer(c_int) :: is_fixedvar !MYBOOL
            end function
            function is_splitvar(lp,colnr) bind(C,name="is_splitvar")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    integer(c_int) :: is_splitvar !MYBOOL
            end function
            subroutine set_action(actionvar,actionmask) bind(C,name="set_action")
                use iso_c_binding
                    type(c_ptr), value :: actionvar
                    integer(c_int), value ::actionmask
            end subroutine
            subroutine clear_action(actionvar,actionmask) bind(C,name="clear_action")
                use iso_c_binding
                    type(c_ptr), value :: actionvar
                    integer(c_int), value ::actionmask
            end subroutine
            function is_action(actionvar,testmask) bind(C,name="is_action")
                use iso_c_binding
                    integer(c_int), value ::actionvar
                    integer(c_int), value ::testmask
                    integer(c_int) :: is_action !MYBOOL
            end function
            function is_bb_rule(lp,bb_rule) bind(C,name="is_bb_rule")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::bb_rule
                    integer(c_int) :: is_bb_rule !MYBOOL
            end function
            function is_bb_mode(lp,bb_mask) bind(C,name="is_bb_mode")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::bb_mask
                    integer(c_int) :: is_bb_mode !MYBOOL
            end function
            function get_piv_rule(lp) bind(C,name="get_piv_rule")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: get_piv_rule
            end function
            function get_str_piv_rule(rule) bind(C,name="get_str_piv_rule")
                use iso_c_binding
                    integer(c_int), value ::rule
                    character(c_char) :: get_str_piv_rule
            end function
            function set_var_priority(lp) bind(C,name="set_var_priority")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: set_var_priority !MYBOOL
            end function
            function find_sc_bbvar(lp,count) bind(C,name="find_sc_bbvar")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_ptr), value :: count
                    integer(c_int) :: find_sc_bbvar
            end function
            function find_sos_bbvar(lp,count,intsos) bind(C,name="find_sos_bbvar")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_ptr), value :: count
                    integer(c_int), value :: intsos !MYBOOL
                    integer(c_int) :: find_sos_bbvar
            end function
            function find_int_bbvar(lp,count,BB,isfeasible) bind(C,name="find_int_bbvar")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_ptr), value :: count
                    type(c_ptr), value :: BB
                    integer(c_int) :: isfeasible(*) !MYBOOL
                    integer(c_int) :: find_int_bbvar
            end function
            function compute_dualslacks(lp,target,dvalues,nzdvalues,dosum) bind(C,name="compute_dualslacks")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::target
                    real(c_double) :: dvalues(*)
                    type(c_ptr) :: nzdvalues
                    integer(c_int), value :: dosum !MYBOOL
                    type(REAL) :: compute_dualslacks
            end function
            function solution_is_int(lp,index,checkfixed) bind(C,name="solution_is_int")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::index
                    integer(c_int), value :: checkfixed !MYBOOL
                    integer(c_int) :: solution_is_int !MYBOOL
            end function
            function bb_better(lp,target,mode) bind(C,name="bb_better")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::target
                    integer(c_int), value ::mode
                    integer(c_int) :: bb_better !MYBOOL
            end function
            function add_GUB(lp,name,priority,count,sosvars) bind(C,name="add_GUB")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    character(c_char) :: name(*)
                    integer(c_int), value ::priority
                    integer(c_int), value ::count
                    type(c_ptr), value :: sosvars
                    integer(c_int) :: add_GUB
            end function
            function push_basis(lp,basisvar,isbasic,islower) bind(C,name="push_basis")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_ptr), value :: basisvar
                    integer(c_int) :: isbasic(*) !MYBOOL
                    integer(c_int) :: islower(*) !MYBOOL
                    type(c_ptr) :: push_basis
            end function
            function compare_basis(lp) bind(C,name="compare_basis")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: compare_basis !MYBOOL
            end function
            function restore_basis(lp) bind(C,name="restore_basis")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: restore_basis !MYBOOL
            end function
            function pop_basis(lp,restore) bind(C,name="pop_basis")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: restore !MYBOOL
                    integer(c_int) :: pop_basis !MYBOOL
            end function
            function is_BasisReady(lp) bind(C,name="is_BasisReady")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: is_BasisReady !MYBOOL
            end function
            function is_slackbasis(lp) bind(C,name="is_slackbasis")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: is_slackbasis !MYBOOL
            end function
            function verify_basis(lp) bind(C,name="verify_basis")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: verify_basis !MYBOOL
            end function
            function unload_basis(lp,restorelast) bind(C,name="unload_basis")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: restorelast !MYBOOL
                    integer(c_int) :: unload_basis
            end function
            function perturb_bounds(lp,perturbed,doRows,doCols,includeFIXED) bind(C,name="perturb_bounds")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_ptr), value :: perturbed
                    integer(c_int), value :: doRows !MYBOOL
                    integer(c_int), value :: doCols !MYBOOL
                    integer(c_int), value :: includeFIXED !MYBOOL
                    integer(c_int) :: perturb_bounds
            end function
            function validate_bounds(lp,upbo,lowbo) bind(C,name="validate_bounds")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: upbo(*)
                    real(c_double) :: lowbo(*)
                    integer(c_int) :: validate_bounds !MYBOOL
            end function
            function impose_bounds(lp,upbo,lowbo) bind(C,name="impose_bounds")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: upbo(*)
                    real(c_double) :: lowbo(*)
                    integer(c_int) :: impose_bounds !MYBOOL
            end function
            function unload_BB(lp) bind(C,name="unload_BB")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: unload_BB
            end function
            function feasibilityOffset(lp,isdual) bind(C,name="feasibilityOffset")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: isdual !MYBOOL
                    type(REAL) :: feasibilityOffset
            end function
            function isP1extra(lp) bind(C,name="isP1extra")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: isP1extra !MYBOOL
            end function
            function get_refactfrequency(lp,final) bind(C,name="get_refactfrequency")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: final !MYBOOL
                    type(REAL) :: get_refactfrequency
            end function
            function findBasicFixedvar(lp,afternr,slacksonly) bind(C,name="findBasicFixedvar")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::afternr
                    integer(c_int), value :: slacksonly !MYBOOL
                    integer(c_int) :: findBasicFixedvar
            end function
            function isBasisVarFeasible(lp,tol,basis_row) bind(C,name="isBasisVarFeasible")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: tol
                    integer(c_int), value ::basis_row
                    integer(c_int) :: isBasisVarFeasible !MYBOOL
            end function
            function isPrimalFeasible(lp,tol,infeasibles,feasibilitygap) bind(C,name="isPrimalFeasible")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: tol
                    integer(c_int) ::infeasibles(*)
                    real(c_double) :: feasibilitygap(*)
                    integer(c_int) :: isPrimalFeasible !MYBOOL
            end function
            function isDualFeasible(lp,tol,boundflips,infeasibles,feasibilitygap) bind(C,name="isDualFeasible")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: tol
                    type(c_ptr), value :: boundflips
                    integer(c_int) ::infeasibles(*)
                    real(c_double) :: feasibilitygap(*)
                    integer(c_int) :: isDualFeasible !MYBOOL
            end function
            function preprocess(lp) bind(C,name="preprocess")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: preprocess
            end function
            subroutine postprocess(lp) bind(C,name="postprocess")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            function performiteration(lp,rownr,varin,theta,primal,allowminit,prow,nzprow,pcol,nzpcol,boundswaps) &
                bind(C,name="performiteration")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    integer(c_int), value ::varin
                    real(c_double) :: theta
                    integer(c_int), value :: primal !MYBOOL
                    integer(c_int), value :: allowminit !MYBOOL
                    real(c_double) :: prow(*)
                    type(c_ptr), value :: nzprow
                    real(c_double) :: pcol(*)
                    type(c_ptr), value :: nzpcol
                    type(c_ptr), value :: boundswaps
                    integer(c_int) :: performiteration !MYBOOL
            end function
            subroutine transfer_solution_var(lp,uservar) bind(C,name="transfer_solution_var")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::uservar
            end subroutine
            subroutine transfer_solution(lp,dofinal) bind(C,name="transfer_solution")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value :: dofinal !MYBOOL
            end subroutine
            function scaled_floor(lp,colnr,value,epsscale) bind(C,name="scaled_floor")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    real(c_double), value :: value
                    real(c_double), value :: epsscale
                    type(REAL) :: scaled_floor
            end function
            function scaled_ceil(lp,colnr,value,epsscale) bind(C,name="scaled_ceil")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    real(c_double), value :: value
                    real(c_double), value :: epsscale
                    type(REAL) :: scaled_ceil
            end function
            subroutine varmap_lock(lp) bind(C,name="varmap_lock")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            subroutine varmap_clear(lp) bind(C,name="varmap_clear")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            function varmap_canunlock(lp) bind(C,name="varmap_canunlock")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) :: varmap_canunlock !MYBOOL
            end function
            subroutine varmap_addconstraint(lp) bind(C,name="varmap_addconstraint")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            subroutine varmap_addcolumn(lp) bind(C,name="varmap_addcolumn")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            subroutine varmap_delete(lp,base,delta,varmap) bind(C,name="varmap_delete")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::base
                    integer(c_int), value ::delta
                    type(c_ptr), value :: varmap
            end subroutine
            subroutine varmap_compact(lp,prev_rows,prev_cols) bind(C,name="varmap_compact")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::prev_rows
                    integer(c_int), value ::prev_cols
            end subroutine
            function varmap_validate(lp,varno) bind(C,name="varmap_validate")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::varno
                    integer(c_int) :: varmap_validate !MYBOOL
            end function
            function del_varnameex(lp,namelist,items,ht,varnr,varmap) bind(C,name="del_varnameex")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    type(c_ptr), value :: namelist
                    integer(c_int), value ::items
                    type(c_ptr), value :: ht
                    integer(c_int), value ::varnr
                    type(c_ptr), value :: varmap
                    integer(c_int) :: del_varnameex !MYBOOL
            end function
            function init_pseudocost(lp,pseudotype) bind(C,name="init_pseudocost")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::pseudotype
                    type(c_ptr) :: init_pseudocost
            end function
            subroutine free_pseudocost(lp) bind(C,name="free_pseudocost")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            function get_pseudorange(pc,mipvar,varcode) bind(C,name="get_pseudorange")
                use iso_c_binding
                    type(c_ptr), value :: pc
                    integer(c_int), value ::mipvar
                    integer(c_int), value ::varcode
                    type(REAL) :: get_pseudorange
            end function
            subroutine update_pseudocost(pc,mipvar,varcode,capupper,varsol) bind(C,name="update_pseudocost")
                use iso_c_binding
                    type(c_ptr), value :: pc
                    integer(c_int), value ::mipvar
                    integer(c_int), value ::varcode
                    integer(c_int), value :: capupper !MYBOOL
                    real(c_double), value :: varsol
            end subroutine
            function get_pseudobranchcost(pc,mipvar,dofloor) bind(C,name="get_pseudobranchcost")
                use iso_c_binding
                    type(c_ptr), value :: pc
                    integer(c_int), value ::mipvar
                    integer(c_int), value :: dofloor !MYBOOL
                    type(REAL) :: get_pseudobranchcost
            end function
            function get_pseudonodecost(pc,mipvar,vartype,varsol) bind(C,name="get_pseudonodecost")
                use iso_c_binding
                    type(c_ptr), value :: pc
                    integer(c_int), value ::mipvar
                    integer(c_int), value ::vartype
                    real(c_double), value :: varsol
                    type(REAL) :: get_pseudonodecost
            end function
            subroutine set_OF_override(lp,ofVector) bind(C,name="set_OF_override")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: ofVector(*)
            end subroutine
            subroutine set_OF_p1extra(lp,p1extra) bind(C,name="set_OF_p1extra")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double), value :: p1extra
            end subroutine
            subroutine unset_OF_p1extra(lp) bind(C,name="unset_OF_p1extra")
                use iso_c_binding
                    type(c_ptr), value :: lp
            end subroutine
            function modifyOF1(lp,index,ofValue,mult) bind(C,name="modifyOF1")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::index
                    real(c_double) :: ofValue(*)
                    real(c_double), value :: mult
                    integer(c_int) :: modifyOF1 !MYBOOL
            end function
            function get_OF_active(lp,varnr,mult) bind(C,name="get_OF_active")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::varnr
                    real(c_double), value :: mult
                    type(REAL) :: get_OF_active
            end function
            function is_OF_nz(lp,colnr) bind(C,name="is_OF_nz")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::colnr
                    integer(c_int) :: is_OF_nz !MYBOOL
            end function
            function get_basisOF(lp,coltarget,crow,colno) bind(C,name="get_basisOF")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int) ::coltarget(*)
                    real(c_double) :: crow(*)
                    integer(c_int) ::colno(*)
                    integer(c_int) :: get_basisOF
            end function
            function get_basiscolumn(lp,j,rn,bj) bind(C,name="get_basiscolumn")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::j
                    integer(c_int) ::rn(*)
                    real(c_double) :: bj(*)
                    integer(c_int) :: get_basiscolumn
            end function
            function obtain_column(lp,varin,pcol,nzlist,maxabs) bind(C,name="obtain_column")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::varin
                    real(c_double) :: pcol(*)
                    type(c_ptr), value :: nzlist
                    type(c_ptr), value :: maxabs
                    integer(c_int) :: obtain_column
            end function
            function compute_theta(lp,rownr,theta,isupbound,HarrisScalar,primal) bind(C,name="compute_theta")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::rownr
                    type(c_ptr), value :: theta
                    integer(c_int), value ::isupbound
                    real(c_double), value :: HarrisScalar
                    integer(c_int), value :: primal !MYBOOL
                    integer(c_int) :: compute_theta
            end function
            function findBasisPos(lp,notint,var_basic) bind(C,name="findBasisPos")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    integer(c_int), value ::notint
                    type(c_ptr), value :: var_basic
                    integer(c_int) :: findBasisPos
            end function
            function check_degeneracy(lp,pcol,degencount) bind(C,name="check_degeneracy")
                use iso_c_binding
                    type(c_ptr), value :: lp
                    real(c_double) :: pcol(*)
                    type(c_ptr), value :: degencount
                    integer(c_int) :: check_degeneracy !MYBOOL
            end function
    end interface
end module lp_solve
