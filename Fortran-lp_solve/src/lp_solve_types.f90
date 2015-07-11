module lp_solve_types
    use iso_c_binding
    implicit none
        type, bind(c) :: basisrec
            integer(c_int) ::level
            type(c_ptr) :: var_basic
            type(c_ptr) :: is_basic
            type(c_ptr) :: is_lower
            integer(c_int) ::pivots
            type(c_ptr) :: previous
        end type basisrec
        type, bind(c) :: presolveundorec
            type(c_ptr) :: lp
            integer(c_int) ::orig_rows
            integer(c_int) ::orig_columns
            integer(c_int) ::orig_sum
            type(c_ptr) :: var_to_orig
            type(c_ptr) :: orig_to_var
            type(c_ptr) :: fixed_rhs
            type(c_ptr) :: fixed_obj
            type(c_ptr) :: deletedA
            type(c_ptr) :: primalundo
            type(c_ptr) :: dualundo
            integer(c_int) ::OFcolsdeleted !MYBOOL
        end type presolveundorec
        type, bind(c) :: BBPSrec
            type(c_ptr) :: lp
            integer(c_int) ::pseodotype
            integer(c_int) ::updatelimit
            integer(c_int) ::updatesfinished
            real(c_double) ::restartlimit
            type(c_ptr) :: UPcost
            type(c_ptr) :: LOcost
            type(c_ptr) :: secondary
        end type BBPSrec
        type, bind(c) :: partialrec
            integer(c_int) ::blockcount
            integer(c_int) ::blocknow
            type(c_ptr) :: blockend
            type(c_ptr) :: blockpos
            integer(c_int) ::isrow !MYBOOL
        end type partialrec
        type, bind(c) :: lprec
            type(c_ptr) :: add_column
            type(c_ptr) :: add_columnex
            type(c_ptr) :: add_constraint
            type(c_ptr) :: add_constraintex
            type(c_ptr) :: add_lag_con
            type(c_ptr) :: add_SOS
            type(c_ptr) :: column_in_lp
            type(c_ptr) :: copy_lp
            type(c_ptr) :: default_basis
            type(c_ptr) :: del_column
            type(c_ptr) :: del_constraint
            type(c_ptr) :: delete_lp
            type(c_ptr) :: dualize_lp
            type(c_ptr) :: free_lp
            type(c_ptr) :: get_anti_degen
            type(c_ptr) :: get_basis
            type(c_ptr) :: get_basiscrash
            type(c_ptr) :: get_bb_depthlimit
            type(c_ptr) :: get_bb_floorfirst
            type(c_ptr) :: get_bb_rule
            type(c_ptr) :: get_bounds_tighter
            type(c_ptr) :: get_break_at_value
            type(c_ptr) :: get_col_name
            type(c_ptr) :: get_columnex
            type(c_ptr) :: get_constr_type
            type(c_ptr) :: get_constr_value
            type(c_ptr) :: get_constraints
            type(c_ptr) :: get_dual_solution
            type(c_ptr) :: get_epsb
            type(c_ptr) :: get_epsd
            type(c_ptr) :: get_epsel
            type(c_ptr) :: get_epsint
            type(c_ptr) :: get_epsperturb
            type(c_ptr) :: get_epspivot
            type(c_ptr) :: get_improve
            type(c_ptr) :: get_infinite
            type(c_ptr) :: get_lambda
            type(c_ptr) :: get_lowbo
            type(c_ptr) :: get_lp_index
            type(c_ptr) :: get_lp_name
            type(c_ptr) :: get_Lrows
            type(c_ptr) :: get_mat
            type(c_ptr) :: get_mat_byindex
            type(c_ptr) :: get_max_level
            type(c_ptr) :: get_maxpivot
            type(c_ptr) :: get_mip_gap
            type(c_ptr) :: get_multiprice
            type(c_ptr) :: get_nameindex
            type(c_ptr) :: get_Ncolumns
            type(c_ptr) :: get_negrange
            type(c_ptr) :: get_nonzeros
            type(c_ptr) :: get_Norig_columns
            type(c_ptr) :: get_Norig_rows
            type(c_ptr) :: get_Nrows
            type(c_ptr) :: get_obj_bound
            type(c_ptr) :: get_objective
            type(c_ptr) :: get_orig_index
            type(c_ptr) :: get_origcol_name
            type(c_ptr) :: get_origrow_name
            type(c_ptr) :: get_partialprice
            type(c_ptr) :: get_pivoting
            type(c_ptr) :: get_presolve
            type(c_ptr) :: get_presolveloops
            type(c_ptr) :: get_primal_solution
            type(c_ptr) :: get_print_sol
            type(c_ptr) :: get_pseudocosts
            type(c_ptr) :: get_ptr_constraints
            type(c_ptr) :: get_ptr_dual_solution
            type(c_ptr) :: get_ptr_lambda
            type(c_ptr) :: get_ptr_primal_solution
            type(c_ptr) :: get_ptr_sensitivity_obj
            type(c_ptr) :: get_ptr_sensitivity_objex
            type(c_ptr) :: get_ptr_sensitivity_rhs
            type(c_ptr) :: get_ptr_variables
            type(c_ptr) :: get_rh
            type(c_ptr) :: get_rh_range
            type(c_ptr) :: get_row
            type(c_ptr) :: get_rowex
            type(c_ptr) :: get_row_name
            type(c_ptr) :: get_scalelimit
            type(c_ptr) :: get_scaling
            type(c_ptr) :: get_sensitivity_obj
            type(c_ptr) :: get_sensitivity_objex
            type(c_ptr) :: get_sensitivity_rhs
            type(c_ptr) :: get_simplextype
            type(c_ptr) :: get_solutioncount
            type(c_ptr) :: get_solutionlimit
            type(c_ptr) :: get_status
            type(c_ptr) :: get_statustext
            type(c_ptr) :: get_timeout
            type(c_ptr) :: get_total_iter
            type(c_ptr) :: get_total_nodes
            type(c_ptr) :: get_upbo
            type(c_ptr) :: get_var_branch
            type(c_ptr) :: get_var_dualresult
            type(c_ptr) :: get_var_primalresult
            type(c_ptr) :: get_var_priority
            type(c_ptr) :: get_variables
            type(c_ptr) :: get_verbose
            type(c_ptr) :: get_working_objective
            type(c_ptr) :: has_BFP
            type(c_ptr) :: has_XLI
            type(c_ptr) :: is_add_rowmode
            type(c_ptr) :: is_anti_degen
            type(c_ptr) :: is_binary
            type(c_ptr) :: is_break_at_first
            type(c_ptr) :: is_constr_type
            type(c_ptr) :: is_debug
            type(c_ptr) :: is_feasible
            type(c_ptr) :: is_infinite
            type(c_ptr) :: is_int
            type(c_ptr) :: is_integerscaling
            type(c_ptr) :: is_lag_trace
            type(c_ptr) :: is_maxim
            type(c_ptr) :: is_nativeBFP
            type(c_ptr) :: is_nativeXLI
            type(c_ptr) :: is_negative
            type(c_ptr) :: is_obj_in_basis
            type(c_ptr) :: is_piv_mode
            type(c_ptr) :: is_piv_rule
            type(c_ptr) :: is_presolve
            type(c_ptr) :: is_scalemode
            type(c_ptr) :: is_scaletype
            type(c_ptr) :: is_semicont
            type(c_ptr) :: is_SOS_var
            type(c_ptr) :: is_trace
            type(c_ptr) :: is_unbounded
            type(c_ptr) :: is_use_names
            type(c_ptr) :: lp_solve_version
            type(c_ptr) :: make_lp
            type(c_ptr) :: print_constraints
            type(c_ptr) :: print_debugdump
            type(c_ptr) :: print_duals
            type(c_ptr) :: print_lp
            type(c_ptr) :: print_objective
            type(c_ptr) :: print_scales
            type(c_ptr) :: print_solution
            type(c_ptr) :: print_str
            type(c_ptr) :: print_tableau
            type(c_ptr) :: put_abortfunc
            type(c_ptr) :: put_bb_nodefunc
            type(c_ptr) :: put_bb_branchfunc
            type(c_ptr) :: put_logfunc
            type(c_ptr) :: put_msgfunc
            type(c_ptr) :: read_LP
            type(c_ptr) :: read_MPS
            type(c_ptr) :: read_XLI
            type(c_ptr) :: read_params
            type(c_ptr) :: read_basis
            type(c_ptr) :: reset_basis
            type(c_ptr) :: reset_params
            type(c_ptr) :: resize_lp
            type(c_ptr) :: set_add_rowmode
            type(c_ptr) :: set_anti_degen
            type(c_ptr) :: set_basisvar
            type(c_ptr) :: set_basis
            type(c_ptr) :: set_basiscrash
            type(c_ptr) :: set_bb_depthlimit
            type(c_ptr) :: set_bb_floorfirst
            type(c_ptr) :: set_bb_rule
            type(c_ptr) :: set_BFP
            type(c_ptr) :: set_binary
            type(c_ptr) :: set_bounds
            type(c_ptr) :: set_bounds_tighter
            type(c_ptr) :: set_break_at_first
            type(c_ptr) :: set_break_at_value
            type(c_ptr) :: set_column
            type(c_ptr) :: set_columnex
            type(c_ptr) :: set_col_name
            type(c_ptr) :: set_constr_type
            type(c_ptr) :: set_debug
            type(c_ptr) :: set_epsb
            type(c_ptr) :: set_epsd
            type(c_ptr) :: set_epsel
            type(c_ptr) :: set_epsint
            type(c_ptr) :: set_epslevel
            type(c_ptr) :: set_epsperturb
            type(c_ptr) :: set_epspivot
            type(c_ptr) :: set_unbounded
            type(c_ptr) :: set_improve
            type(c_ptr) :: set_infinite
            type(c_ptr) :: set_int
            type(c_ptr) :: set_lag_trace
            type(c_ptr) :: set_lowbo
            type(c_ptr) :: set_lp_name
            type(c_ptr) :: set_mat
            type(c_ptr) :: set_maxim
            type(c_ptr) :: set_maxpivot
            type(c_ptr) :: set_minim
            type(c_ptr) :: set_mip_gap
            type(c_ptr) :: set_multiprice
            type(c_ptr) :: set_negrange
            type(c_ptr) :: set_obj_bound
            type(c_ptr) :: set_obj_fn
            type(c_ptr) :: set_obj_fnex
            type(c_ptr) :: set_obj
            type(c_ptr) :: set_obj_in_basis
            type(c_ptr) :: set_outputfile
            type(c_ptr) :: set_outputstream
            type(c_ptr) :: set_partialprice
            type(c_ptr) :: set_pivoting
            type(c_ptr) :: set_preferdual
            type(c_ptr) :: set_presolve
            type(c_ptr) :: set_print_sol
            type(c_ptr) :: set_pseudocosts
            type(c_ptr) :: set_rh
            type(c_ptr) :: set_rh_range
            type(c_ptr) :: set_rh_vec
            type(c_ptr) :: set_row
            type(c_ptr) :: set_rowex
            type(c_ptr) :: set_row_name
            type(c_ptr) :: set_scalelimit
            type(c_ptr) :: set_scaling
            type(c_ptr) :: set_semicont
            type(c_ptr) :: set_sense
            type(c_ptr) :: set_simplextype
            type(c_ptr) :: set_solutionlimit
            type(c_ptr) :: set_timeout
            type(c_ptr) :: set_trace
            type(c_ptr) :: set_upbo
            type(c_ptr) :: set_use_names
            type(c_ptr) :: set_var_branch
            type(c_ptr) :: set_var_weights
            type(c_ptr) :: set_verbose
            type(c_ptr) :: set_XLI
            type(c_ptr) :: solve
            type(c_ptr) :: str_add_column
            type(c_ptr) :: str_add_constraint
            type(c_ptr) :: str_add_lag_con
            type(c_ptr) :: str_set_obj_fn
            type(c_ptr) :: str_set_rh_vec
            type(c_ptr) :: time_elapsed
            type(c_ptr) :: unscale
            type(c_ptr) :: write_lp
            type(c_ptr) :: write_mps
            type(c_ptr) :: write_freemps
            type(c_ptr) :: write_XLI
            type(c_ptr) :: write_basis
            type(c_ptr) :: write_params
            type(c_ptr) :: alignmentspacer
            type(c_ptr) :: lp_name
            integer(c_int) ::sum
            integer(c_int) ::rows
            integer(c_int) ::columns
            integer(c_int) ::equalities
            integer(c_int) ::boundedvars
            integer(c_int) ::INTfuture1
            integer(c_int) ::sum_alloc
            integer(c_int) ::rows_alloc
            integer(c_int) ::columns_alloc
            integer(c_int) ::source_is_file !MYBOOL
            integer(c_int) ::model_is_pure !MYBOOL
            integer(c_int) ::model_is_valid !MYBOOL
            integer(c_int) ::tighten_on_set !MYBOOL
            integer(c_int) ::names_used !MYBOOL
            integer(c_int) ::use_row_names !MYBOOL
            integer(c_int) ::use_col_names !MYBOOL
            integer(c_int) ::lag_trace !MYBOOL
            integer(c_int) ::spx_trace !MYBOOL
            integer(c_int) ::bb_trace !MYBOOL
            integer(c_int) ::streamowned !MYBOOL
            integer(c_int) ::obj_in_basis !MYBOOL
            integer(c_int) ::spx_status
            integer(c_int) ::lag_status
            integer(c_int) ::solutioncount
            integer(c_int) ::solutionlimit
            real(c_double) ::real_solution
            type(c_ptr) :: solution
            type(c_ptr) :: best_solution
            type(c_ptr) :: full_solution
            type(c_ptr) :: edgeVector
            type(c_ptr) :: drow
            type(c_ptr) :: nzdrow
            type(c_ptr) :: duals
            type(c_ptr) :: full_duals
            type(c_ptr) :: dualsfrom
            type(c_ptr) :: dualstill
            type(c_ptr) :: objfrom
            type(c_ptr) :: objtill
            type(c_ptr) :: objfromvalue
            type(c_ptr) :: orig_obj
            type(c_ptr) :: obj
            integer(c_long) ::current_iter
            integer(c_long) ::total_iter
            integer(c_long) ::current_bswap
            integer(c_long) ::total_bswap
            integer(c_int) ::solvecount
            integer(c_int) ::max_pivots
            integer(c_int) ::simplex_strategy
            integer(c_int) ::simplex_mode
            integer(c_int) ::verbose
            integer(c_int) ::print_sol
            type(c_ptr) :: outstream
            type(c_ptr) :: bb_varbranch
            integer(c_int) ::piv_strategy
            integer(c_int) ::piv_rule
            integer(c_int) ::bb_rule
            integer(c_int) ::bb_floorfirst !MYBOOL
            integer(c_int) ::bb_breakfirst !MYBOOL
            integer(c_int) ::iv_left !MYBOOL
            integer(c_int) ::BOOLfuture1 !MYBOOL
            real(c_double) ::scalelimit
            integer(c_int) ::scalemode
            integer(c_int) ::improve
            integer(c_int) ::anti_degen
            integer(c_int) ::do_presolve
            integer(c_int) ::presolveloops
            integer(c_int) ::perturb_count
            type(c_ptr) :: row_name
            type(c_ptr) :: col_name
            type(c_ptr) :: rowname_hashtab
            type(c_ptr) :: colname_hashtab
            type(c_ptr) :: rowblocks
            type(c_ptr) :: colblocks
            type(c_ptr) :: var_type
            type(c_ptr) :: multivars
            integer(c_int) ::multiblockdiv
            integer(c_int) ::fixedvars
            integer(c_int) ::int_vars
            integer(c_int) ::sc_vars
            type(c_ptr) :: sc_lobound
            type(c_ptr) :: var_is_free
            type(c_ptr) :: var_priority
            type(c_ptr) :: GUB
            integer(c_int) ::sos_vars
            integer(c_int) ::sos_ints
            type(c_ptr) :: SOS
            type(c_ptr) :: sos_priority
            type(c_ptr) :: bsolveVal
            type(c_ptr) :: bsolveIdx
            type(c_ptr) :: orig_rhs
            type(c_ptr) :: rhs
            type(c_ptr) :: row_type
            type(c_ptr) :: longsteps
            type(c_ptr) :: orig_upbo
            type(c_ptr) :: upbo
            type(c_ptr) :: orig_lowbo
            type(c_ptr) :: lowbo
            type(c_ptr) :: matA
            type(c_ptr) :: invB
            type(c_ptr) :: bb_bounds
            type(c_ptr) :: rootbounds
            type(c_ptr) :: bb_basis
            type(c_ptr) :: rootbasis
            type(c_ptr) :: monitor
            type(c_ptr) :: scalars
            integer(c_int) ::scaling_used !MYBOOL
            integer(c_int) ::columns_scaled !MYBOOL
            integer(c_int) ::varmap_locked !MYBOOL
            integer(c_int) ::basis_valid !MYBOOL
            integer(c_int) ::crashmode
            type(c_ptr) :: var_basic
            type(c_ptr) :: val_nonbasic
            type(c_ptr) :: is_basic
            type(c_ptr) :: is_lower
            type(c_ptr) :: rejectpivot
            type(c_ptr) :: bb_PseudoCost
            integer(c_int) ::bb_PseudoUpdates
            integer(c_int) ::bb_strongbranches
            integer(c_int) ::is_strongbranch
            integer(c_int) ::bb_improvements
            real(c_double) ::rhsmax
            real(c_double) ::suminfeas
            real(c_double) ::bigM
            real(c_double) ::P1extraVal
            integer(c_int) ::P1extraDim
            integer(c_int) ::spx_action
            integer(c_int) ::spx_perturbed !MYBOOL
            integer(c_int) ::bb_break !MYBOOL
            integer(c_int) ::wasPreprocessed !MYBOOL
            integer(c_int) ::wasPresolved !MYBOOL
            integer(c_int) ::INTfuture2
            type(c_ptr) :: matL
            type(c_ptr) :: lag_rhs
            type(c_ptr) :: lag_con_type
            type(c_ptr) :: lambda
            real(c_double) ::lag_bound
            real(c_double) ::lag_accept
            real(c_double) ::infinite
            real(c_double) ::negrange
            real(c_double) ::epsmachine
            real(c_double) ::epsvalue
            real(c_double) ::epsprimal
            real(c_double) ::epsdual
            real(c_double) ::epspivot
            real(c_double) ::epsperturb
            real(c_double) ::epssolution
            integer(c_int) ::bb_status
            integer(c_int) ::bb_level
            integer(c_int) ::bb_maxlevel
            integer(c_int) ::bb_limitlevel
            integer(c_long) ::bb_totalnodes
            integer(c_int) ::bb_solutionlevel
            integer(c_int) ::bb_cutpoolsize
            integer(c_int) ::bb_cutpoolused
            integer(c_int) ::bb_constraintOF
            type(c_ptr) :: bb_cuttype
            type(c_ptr) :: bb_varactive
            type(c_ptr) :: bb_upperchange
            type(c_ptr) :: bb_lowerchange
            real(c_double) ::bb_deltaOF
            real(c_double) ::bb_breakOF
            real(c_double) ::bb_limitOF
            real(c_double) ::bb_heuristicOF
            real(c_double) ::bb_parentOF
            real(c_double) ::bb_workOF
            type(c_ptr) :: presolve_undo
            type(c_ptr) :: workarrays
            real(c_double) ::epsint
            real(c_double) ::mip_absgap
            real(c_double) ::mip_relgap
            type(c_ptr) :: ex_status
            type(c_ptr) :: hBFP
            type(c_ptr) :: bfp_name
            type(c_ptr) :: bfp_compatible
            type(c_ptr) :: bfp_init
            type(c_ptr) :: bfp_free
            type(c_ptr) :: bfp_resize
            type(c_ptr) :: bfp_memallocated
            type(c_ptr) :: bfp_restart
            type(c_ptr) :: bfp_mustrefactorize
            type(c_ptr) :: bfp_preparefactorization
            type(c_ptr) :: bfp_factorize
            type(c_ptr) :: bfp_finishfactorization
            type(c_ptr) :: bfp_updaterefactstats
            type(c_ptr) :: bfp_prepareupdate
            type(c_ptr) :: bfp_pivotRHS
            type(c_ptr) :: bfp_finishupdate
            type(c_ptr) :: bfp_ftran_prepare
            type(c_ptr) :: bfp_ftran_normal
            type(c_ptr) :: bfp_btran_normal
            type(c_ptr) :: bfp_btran_double
            type(c_ptr) :: bfp_status
            type(c_ptr) :: bfp_nonzeros
            type(c_ptr) :: bfp_implicitslack
            type(c_ptr) :: bfp_indexbase
            type(c_ptr) :: bfp_rowoffset
            type(c_ptr) :: bfp_pivotmax
            type(c_ptr) :: bfp_pivotalloc
            type(c_ptr) :: bfp_colcount
            type(c_ptr) :: bfp_canresetbasis
            type(c_ptr) :: bfp_efficiency
            type(c_ptr) :: bfp_pivotvector
            type(c_ptr) :: bfp_pivotcount
            type(c_ptr) :: bfp_refactcount
            type(c_ptr) :: bfp_isSetI
            type(c_ptr) :: bfp_findredundant
            type(c_ptr) :: hXLI
            type(c_ptr) :: xli_name
            type(c_ptr) :: xli_compatible
            type(c_ptr) :: xli_readmodel
            type(c_ptr) :: xli_writemodel
            type(c_ptr) :: userabort
            type(c_ptr) :: report
            type(c_ptr) :: explain
            type(c_ptr) :: get_lpcolumn
            type(c_ptr) :: get_basiscolumn
            type(c_ptr) :: get_OF_active
            type(c_ptr) :: getMDO
            type(c_ptr) :: invert
            type(c_ptr) :: set_action
            type(c_ptr) :: is_action
            type(c_ptr) :: clear_action
            type(c_ptr) :: ctrlc
            type(c_ptr) :: ctrlchandle
            type(c_ptr) :: writelog
            type(c_ptr) :: loghandle
            type(c_ptr) :: debuginfo
            type(c_ptr) :: usermessage
            integer(c_int) ::msgmask
            type(c_ptr) :: msghandle
            type(c_ptr) :: bb_usenode
            type(c_ptr) :: bb_nodehandle
            type(c_ptr) :: bb_usebranch
            type(c_ptr) :: bb_branchhandle
            type(c_ptr) :: rowcol_name
        end type lprec
end module lp_solve_types
