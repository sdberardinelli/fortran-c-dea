module clp
    use iso_c_binding
    implicit none
        interface
            function Clp_Version() bind(C,name="Clp_Version")
                use iso_c_binding
                    type(c_ptr) :: Clp_Version
            end function
            function Clp_VersionMajor() bind(C,name="Clp_VersionMajor")
                use iso_c_binding
                    integer(c_int) :: Clp_VersionMajor
            end function
            function Clp_VersionMinor() bind(C,name="Clp_VersionMinor")
                use iso_c_binding
                    integer(c_int) :: Clp_VersionMinor
            end function
            function Clp_VersionRelease() bind(C,name="Clp_VersionRelease")
                use iso_c_binding
                    integer(c_int) :: Clp_VersionRelease
            end function
            function Clp_newModel() bind(C,name="Clp_newModel")
                use iso_c_binding
                    type(c_ptr) :: Clp_newModel
            end function
            subroutine Clp_deleteModel(model) bind(C,name="Clp_deleteModel")
                use iso_c_binding
                    type(c_ptr), value :: model
            end subroutine
            function ClpSolve_new() bind(C,name="ClpSolve_new")
                use iso_c_binding
                    type(c_ptr) :: ClpSolve_new
            end function
            subroutine ClpSolve_delete(solve) bind(C,name="ClpSolve_delete")
                use iso_c_binding
                    type(c_ptr), value :: solve
            end subroutine
            subroutine Clp_loadProblem(model,numcols,numrows,start, &
                index,value,collb,colub,obj,rowlb,rowub) bind(C,name="Clp_loadProblem")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::numcols
                    integer(c_int), value ::numrows
                    type(c_ptr), value :: start
                    type(c_ptr), value :: index
                    real(c_double) :: value(*)
                    real(c_double) :: collb(*)
                    real(c_double) :: colub(*)
                    real(c_double) :: obj(*)
                    real(c_double) :: rowlb(*)
                    real(c_double) :: rowub(*)
            end subroutine
            subroutine Clp_loadQuadraticObjective(model,numberColumns, &
                start,column,element) bind(C,name="Clp_loadQuadraticObjective")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::numberColumns
                    type(c_ptr), value :: start
                    type(c_ptr), value :: column
                    real(c_double) :: element(*)
            end subroutine
            function Clp_readMps(model,filename,keepNames,ignoreErrors) bind(C,name="Clp_readMps")
                use iso_c_binding
                    type(c_ptr), value :: model
                    character(c_char) :: filename(*)
                    integer(c_int), value ::keepNames
                    integer(c_int), value ::ignoreErrors
                    integer(c_int) :: Clp_readMps
            end function
            subroutine Clp_copyInIntegerInformation(model,information) bind(C,name="Clp_copyInIntegerInformation")
                use iso_c_binding
                    type(c_ptr), value :: model
                    character(c_char) :: information(*)
            end subroutine
            subroutine Clp_deleteIntegerInformation(model) bind(C,name="Clp_deleteIntegerInformation")
                use iso_c_binding
                    type(c_ptr), value :: model
            end subroutine
            subroutine Clp_resize(model,newNumberRows,newNumberColumns) bind(C,name="Clp_resize")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::newNumberRows
                    integer(c_int), value ::newNumberColumns
            end subroutine
            subroutine Clp_deleteRows(model,number,which) bind(C,name="Clp_deleteRows")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::number
                    type(c_ptr), value :: which
            end subroutine
            subroutine Clp_addRows(model,number,rowLower, &
                rowUpper,rowStarts,columns,elements) bind(C,name="Clp_addRows")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::number
                    real(c_double) :: rowLower(*)
                    real(c_double) :: rowUpper(*)
                    type(c_ptr), value :: rowStarts
                    type(c_ptr), value :: columns
                    real(c_double) :: elements(*)
            end subroutine
            subroutine Clp_deleteColumns(model,number,which) bind(C,name="Clp_deleteColumns")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::number
                    type(c_ptr), value :: which
            end subroutine
            subroutine Clp_addColumns(model,number,columnLower,columnUpper, &
                objective,columnStarts,rows,elements) bind(C,name="Clp_addColumns")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::number
                    real(c_double) :: columnLower(*)
                    real(c_double) :: columnUpper(*)
                    real(c_double) :: objective(*)
                    type(c_ptr), value :: columnStarts
                    type(c_ptr), value :: rows
                    real(c_double) :: elements(*)
            end subroutine
            subroutine Clp_chgRowLower(model,rowLower) bind(C,name="Clp_chgRowLower")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: rowLower(*)
            end subroutine
            subroutine Clp_chgRowUpper(model,rowUpper) bind(C,name="Clp_chgRowUpper")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: rowUpper(*)
            end subroutine
            subroutine Clp_chgColumnLower(model,columnLower) bind(C,name="Clp_chgColumnLower")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: columnLower(*)
            end subroutine
            subroutine Clp_chgColumnUpper(model,columnUpper) bind(C,name="Clp_chgColumnUpper")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: columnUpper(*)
            end subroutine
            subroutine Clp_chgObjCoefficients(model,objIn) bind(C,name="Clp_chgObjCoefficients")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: objIn(*)
            end subroutine
            subroutine Clp_dropNames(model) bind(C,name="Clp_dropNames")
                use iso_c_binding
                    type(c_ptr), value :: model
            end subroutine
            subroutine Clp_copyNames(model,rowNames,columnNames) bind(C,name="Clp_copyNames")
                use iso_c_binding
                    type(c_ptr), value :: model
                    character(c_char) :: rowNames(*)
                    character(c_char) :: columnNames(*)
            end subroutine
            function Clp_numberRows(model) bind(C,name="Clp_numberRows")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_numberRows
            end function
            function Clp_numberColumns(model) bind(C,name="Clp_numberColumns")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_numberColumns
            end function
            function Clp_primalTolerance(model) bind(C,name="Clp_primalTolerance")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: Clp_primalTolerance
            end function
            subroutine Clp_setPrimalTolerance(model,value) bind(C,name="Clp_setPrimalTolerance")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double), value :: value
            end subroutine
            function Clp_dualTolerance(model) bind(C,name="Clp_dualTolerance")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: Clp_dualTolerance
            end function
            subroutine Clp_setDualTolerance(model,value) bind(C,name="Clp_setDualTolerance")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double), value :: value
            end subroutine
            function Clp_dualObjectiveLimit(model) bind(C,name="Clp_dualObjectiveLimit")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: Clp_dualObjectiveLimit
            end function
            subroutine Clp_setDualObjectiveLimit(model,value) bind(C,name="Clp_setDualObjectiveLimit")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double), value :: value
            end subroutine
            function Clp_objectiveOffset(model) bind(C,name="Clp_objectiveOffset")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: Clp_objectiveOffset
            end function
            subroutine Clp_setObjectiveOffset(model,value) bind(C,name="Clp_setObjectiveOffset")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double), value :: value
            end subroutine
            subroutine Clp_problemName(model,maxNumberCharacters,array) bind(C,name="Clp_problemName")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::maxNumberCharacters
                    character(c_char) :: array(*)
            end subroutine
            function Clp_setProblemName(model,maxNumberCharacters,array) bind(C,name="COINLINKAGEClp_setProblemName")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::maxNumberCharacters
                    character(c_char) :: array(*)
                    integer(c_int) :: COINLINKAGEClp_setProblemName
            end function
            function Clp_numberIterations(model) bind(C,name="Clp_numberIterations")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_numberIterations
            end function
            subroutine Clp_setNumberIterations(model,numberIterations) bind(C,name="Clp_setNumberIterations")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::numberIterations
            end subroutine
            function maximumIterations(model) bind(C,name="maximumIterations")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: maximumIterations
            end function
            subroutine Clp_setMaximumIterations(model,value) bind(C,name="Clp_setMaximumIterations")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::value
            end subroutine
            function Clp_maximumSeconds(model) bind(C,name="Clp_maximumSeconds")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: Clp_maximumSeconds
            end function
            subroutine Clp_setMaximumSeconds(model,value) bind(C,name="Clp_setMaximumSeconds")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double), value :: value
            end subroutine
            function Clp_hitMaximumIterations(model) bind(C,name="Clp_hitMaximumIterations")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_hitMaximumIterations
            end function
            function Clp_status(model) bind(C,name="Clp_status")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_status
            end function
            subroutine Clp_setProblemStatus(model,problemStatus) bind(C,name="Clp_setProblemStatus")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::problemStatus
            end subroutine
            function Clp_secondaryStatus(model) bind(C,name="Clp_secondaryStatus")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_secondaryStatus
            end function
            subroutine Clp_setSecondaryStatus(model,status) bind(C,name="Clp_setSecondaryStatus")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::status
            end subroutine
            function Clp_optimizationDirection(model) bind(C,name="Clp_optimizationDirection")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: Clp_optimizationDirection
            end function
            subroutine Clp_setOptimizationDirection(model,value) bind(C,name="Clp_setOptimizationDirection")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double), value :: value
            end subroutine
            function Clp_primalRowSolution(model) bind(C,name="Clp_primalRowSolution")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_primalRowSolution
            end function
            function Clp_primalColumnSolution(model) bind(C,name="Clp_primalColumnSolution")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_primalColumnSolution
            end function
            function Clp_dualRowSolution(model) bind(C,name="Clp_dualRowSolution")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_dualRowSolution
            end function
            function Clp_dualColumnSolution(model) bind(C,name="Clp_dualColumnSolution")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_dualColumnSolution
            end function
            function Clp_rowLower(model) bind(C,name="Clp_rowLower")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_rowLower
            end function
            function Clp_rowUpper(model) bind(C,name="Clp_rowUpper")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_rowUpper
            end function
            function Clp_objective(model) bind(C,name="Clp_objective")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_objective
            end function
            function Clp_columnLower(model) bind(C,name="Clp_columnLower")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_columnLower
            end function
            function Clp_columnUpper(model) bind(C,name="Clp_columnUpper")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_columnUpper
            end function
            function Clp_getNumElements(model) bind(C,name="Clp_getNumElements")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_getNumElements
            end function
            function Clp_getVectorStarts(model) bind(C,name="Clp_getVectorStarts")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_getVectorStarts
            end function
            function Clp_getIndices(model) bind(C,name="Clp_getIndices")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_getIndices
            end function
            function Clp_getVectorLengths(model) bind(C,name="Clp_getVectorLengths")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_getVectorLengths
            end function
            function Clp_getElements(model) bind(C,name="Clp_getElements")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_getElements
            end function
            function Clp_objectiveValue(model) bind(C,name="Clp_objectiveValue")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: Clp_objectiveValue
            end function
            function Clp_integerInformation(model) bind(C,name="Clp_integerInformation")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_integerInformation
            end function
            function Clp_infeasibilityRay(model) bind(C,name="Clp_infeasibilityRay")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_infeasibilityRay
            end function
            function Clp_unboundedRay(model) bind(C,name="Clp_unboundedRay")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_unboundedRay
            end function
            subroutine Clp_freeRay(model,ray) bind(C,name="Clp_freeRay")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: ray(*)
            end subroutine
            function Clp_statusExists(model) bind(C,name="Clp_statusExists")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_statusExists
            end function
            function Clp_statusArray(model) bind(C,name="Clp_statusArray")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_statusArray
            end function
            subroutine Clp_copyinStatus(model,statusArray) bind(C,name="Clp_copyinStatus")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr), value :: statusArray
            end subroutine
            function Clp_getColumnStatus(model,sequence) bind(C,name="Clp_getColumnStatus")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::sequence
                    integer(c_int) :: Clp_getColumnStatus
            end function
            function Clp_getRowStatus(model,sequence) bind(C,name="Clp_getRowStatus")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::sequence
                    integer(c_int) :: Clp_getRowStatus
            end function
            subroutine Clp_setColumnStatus(model,sequence,value) bind(C,name="Clp_setColumnStatus")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::sequence
                    integer(c_int), value ::value
            end subroutine
            subroutine Clp_setRowStatus(model,sequence,value) bind(C,name="Clp_setRowStatus")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::sequence
                    integer(c_int), value ::value
            end subroutine
            subroutine Clp_setUserPointer(model,pointer) bind(C,name="Clp_setUserPointer")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr), value :: pointer
            end subroutine
            subroutine Clp_getUserPointer(model) bind(C,name="Clp_getUserPointer")
                use iso_c_binding
                    type(c_ptr) :: model
            end subroutine
            subroutine Clp_registerCallBack(model,userCallBack) bind(C,name="Clp_registerCallBack")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr), value :: userCallBack
            end subroutine
            subroutine Clp_clearCallBack(model) bind(C,name="Clp_clearCallBack")
                use iso_c_binding
                    type(c_ptr), value :: model
            end subroutine
            subroutine Clp_setLogLevel(model,value) bind(C,name="Clp_setLogLevel")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::value
            end subroutine
            function Clp_logLevel(model) bind(C,name="Clp_logLevel")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_logLevel
            end function
            function Clp_lengthNames(model) bind(C,name="Clp_lengthNames")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_lengthNames
            end function
            subroutine Clp_rowName(model,iRow,name) bind(C,name="Clp_rowName")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::iRow
                    character(c_char) :: name(*)
            end subroutine
            subroutine Clp_columnName(model,iColumn,name) bind(C,name="Clp_columnName")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::iColumn
                    character(c_char) :: name(*)
            end subroutine
            function Clp_initialSolve(model) bind(C,name="Clp_initialSolve")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_initialSolve
            end function
            function Clp_initialSolveWithOptions(model,solver) bind(C,name="Clp_initialSolveWithOptions")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr), value :: solver
                    integer(c_int) :: Clp_initialSolveWithOptions
            end function
            function Clp_initialDualSolve(model) bind(C,name="Clp_initialDualSolve")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_initialDualSolve
            end function
            function Clp_initialPrimalSolve(model) bind(C,name="Clp_initialPrimalSolve")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_initialPrimalSolve
            end function
            function Clp_initialBarrierSolve(model) bind(C,name="Clp_initialBarrierSolve")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_initialBarrierSolve
            end function
            function Clp_initialBarrierNoCrossSolve(model) bind(C,name="Clp_initialBarrierNoCrossSolve")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_initialBarrierNoCrossSolve
            end function
            function Clp_dual(model,ifValuesPass) bind(C,name="Clp_dual")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::ifValuesPass
                    integer(c_int) :: Clp_dual
            end function
            function Clp_primal(model,ifValuesPass) bind(C,name="Clp_primal")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::ifValuesPass
                    integer(c_int) :: Clp_primal
            end function
            subroutine Clp_idiot(model,tryhard) bind(C,name="Clp_idiot")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::tryhard
            end subroutine
            subroutine Clp_scaling(model,mode) bind(C,name="Clp_scaling")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::mode
            end subroutine
            function Clp_scalingFlag(model) bind(C,name="Clp_scalingFlag")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_scalingFlag
            end function
            function Clp_crash(model,gap,pivot) bind(C,name="Clp_crash")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double), value :: gap
                    integer(c_int), value ::pivot
                    integer(c_int) :: Clp_crash
            end function
            function Clp_primalFeasible(model) bind(C,name="Clp_primalFeasible")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_primalFeasible
            end function
            function Clp_dualFeasible(model) bind(C,name="Clp_dualFeasible")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_dualFeasible
            end function
            function Clp_dualBound(model) bind(C,name="Clp_dualBound")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: Clp_dualBound
            end function
            subroutine Clp_setDualBound(model,value) bind(C,name="Clp_setDualBound")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double), value :: value
            end subroutine
            function Clp_infeasibilityCost(model) bind(C,name="Clp_infeasibilityCost")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: Clp_infeasibilityCost
            end function
            subroutine Clp_setInfeasibilityCost(model,value) bind(C,name="Clp_setInfeasibilityCost")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double), value :: value
            end subroutine
            function Clp_perturbation(model) bind(C,name="Clp_perturbation")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_perturbation
            end function
            subroutine Clp_setPerturbation(model,value) bind(C,name="Clp_setPerturbation")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::value
            end subroutine
            function Clp_algorithm(model) bind(C,name="Clp_algorithm")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_algorithm
            end function
            subroutine Clp_setAlgorithm(model,value) bind(C,name="Clp_setAlgorithm")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int), value ::value
            end subroutine
            function Clp_sumDualInfeasibilities(model) bind(C,name="Clp_sumDualInfeasibilities")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: Clp_sumDualInfeasibilities
            end function
            function Clp_numberDualInfeasibilities(model) bind(C,name="Clp_numberDualInfeasibilities")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_numberDualInfeasibilities
            end function
            function Clp_sumPrimalInfeasibilities(model) bind(C,name="Clp_sumPrimalInfeasibilities")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: Clp_sumPrimalInfeasibilities
            end function
            function Clp_numberPrimalInfeasibilities(model) bind(C,name="Clp_numberPrimalInfeasibilities")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_numberPrimalInfeasibilities
            end function
            function Clp_saveModel(model,fileName) bind(C,name="Clp_saveModel")
                use iso_c_binding
                    type(c_ptr), value :: model
                    character(c_char) :: fileName(*)
                    integer(c_int) :: Clp_saveModel
            end function
            function Clp_restoreModel(model,fileName) bind(C,name="Clp_restoreModel")
                use iso_c_binding
                    type(c_ptr), value :: model
                    character(c_char) :: fileName(*)
                    integer(c_int) :: Clp_restoreModel
            end function
            subroutine Clp_checkSolution(model) bind(C,name="Clp_checkSolution")
                use iso_c_binding
                    type(c_ptr), value :: model
            end subroutine
            function Clp_getNumRows(model) bind(C,name="Clp_getNumRows")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_getNumRows
            end function
            function Clp_getNumCols(model) bind(C,name="Clp_getNumCols")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_getNumCols
            end function
            function Clp_getIterationCount(model) bind(C,name="Clp_getIterationCount")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_getIterationCount
            end function
            function Clp_isAbandoned(model) bind(C,name="Clp_isAbandoned")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_isAbandoned
            end function
            function Clp_isProvenOptimal(model) bind(C,name="Clp_isProvenOptimal")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_isProvenOptimal
            end function
            function Clp_isProvenPrimalInfeasible(model) bind(C,name="Clp_isProvenPrimalInfeasible")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_isProvenPrimalInfeasible
            end function
            function Clp_isProvenDualInfeasible(model) bind(C,name="Clp_isProvenDualInfeasible")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_isProvenDualInfeasible
            end function
            function Clp_isPrimalObjectiveLimitReached(model) bind(C,name="Clp_isPrimalObjectiveLimitReached")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_isPrimalObjectiveLimitReached
            end function
            function Clp_isDualObjectiveLimitReached(model) bind(C,name="Clp_isDualObjectiveLimitReached")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_isDualObjectiveLimitReached
            end function
            function Clp_isIterationLimitReached(model) bind(C,name="Clp_isIterationLimitReached")
                use iso_c_binding
                    type(c_ptr), value :: model
                    integer(c_int) :: Clp_isIterationLimitReached
            end function
            function Clp_getObjSense(model) bind(C,name="Clp_getObjSense")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: Clp_getObjSense
            end function
            subroutine Clp_setObjSense(model,objsen) bind(C,name="Clp_setObjSense")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double), value :: objsen
            end subroutine
            function Clp_getRowActivity(model) bind(C,name="Clp_getRowActivity")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_getRowActivity
            end function
            function Clp_getColSolution(model) bind(C,name="Clp_getColSolution")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_getColSolution
            end function
            subroutine Clp_setColSolution(model,input) bind(C,name="Clp_setColSolution")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: input(*)
            end subroutine
            function Clp_getRowPrice(model) bind(C,name="Clp_getRowPrice")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_getRowPrice
            end function
            function Clp_getReducedCost(model) bind(C,name="Clp_getReducedCost")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_getReducedCost
            end function
            function Clp_getRowLower(model) bind(C,name="Clp_getRowLower")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_getRowLower
            end function
            function Clp_getRowUpper(model) bind(C,name="Clp_getRowUpper")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_getRowUpper
            end function
            function Clp_getObjCoefficients(model) bind(C,name="Clp_getObjCoefficients")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_getObjCoefficients
            end function
            function Clp_getColLower(model) bind(C,name="Clp_getColLower")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_getColLower
            end function
            function Clp_getColUpper(model) bind(C,name="Clp_getColUpper")
                use iso_c_binding
                    type(c_ptr), value :: model
                    type(c_ptr) :: Clp_getColUpper
            end function
            function Clp_getObjValue(model) bind(C,name="Clp_getObjValue")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: Clp_getObjValue
            end function
            subroutine Clp_printModel(model,prefix) bind(C,name="Clp_printModel")
                use iso_c_binding
                    type(c_ptr), value :: model
                    character(c_char) :: prefix(*)
            end subroutine
            function Clp_getSmallElementValue(model) bind(C,name="Clp_getSmallElementValue")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double) :: Clp_getSmallElementValue
            end function
            subroutine Clp_setSmallElementValue(model,value) bind(C,name="Clp_setSmallElementValue")
                use iso_c_binding
                    type(c_ptr), value :: model
                    real(c_double), value :: value
            end subroutine
            subroutine ClpSolve_setSpecialOption(solver,which,value,extraInfo) bind(C,name="ClpSolve_setSpecialOption")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value ::which
                    integer(c_int), value ::value
                    integer(c_int), value ::extraInfo
            end subroutine
            function ClpSolve_getSpecialOption(solver,which) bind(C,name="ClpSolve_getSpecialOption")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value ::which
                    integer(c_int) :: ClpSolve_getSpecialOption
            end function
            subroutine ClpSolve_setSolveType(solver,method,extraInfo) bind(C,name="ClpSolve_setSolveType")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value ::method
                    integer(c_int), value ::extraInfo
            end subroutine
            function ClpSolve_getSolveType(solver) bind(C,name="ClpSolve_getSolveType")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int) :: ClpSolve_getSolveType
            end function
            subroutine ClpSolve_setPresolveType(solver,amount,extraInfo) bind(C,name="ClpSolve_setPresolveType")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value ::amount
                    integer(c_int), value ::extraInfo
            end subroutine
            function ClpSolve_getPresolveType(solver) bind(C,name="ClpSolve_getPresolveType")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int) :: ClpSolve_getPresolveType
            end function
            function ClpSolve_getPresolvePasses(solver) bind(C,name="ClpSolve_getPresolvePasses")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int) :: ClpSolve_getPresolvePasses
            end function
            function ClpSolve_getExtraInfo(solver,which) bind(C,name="ClpSolve_getExtraInfo")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value :: which
                    integer(c_int) :: ClpSolve_getExtraInfo
            end function
            subroutine ClpSolve_setInfeasibleReturn(solver,trueFalse) bind(C,name="ClpSolve_setInfeasibleReturn")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value ::trueFalse
            end subroutine
            function ClpSolve_infeasibleReturn(solver) bind(C,name="ClpSolve_infeasibleReturn")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int) :: ClpSolve_infeasibleReturn
            end function
            function ClpSolve_doDual(solver) bind(C,name="ClpSolve_doDual")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int) :: ClpSolve_doDual
            end function
            subroutine ClpSolve_setDoDual(solver,doDual) bind(C,name="ClpSolve_setDoDual")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value ::doDual
            end subroutine
            function ClpSolve_doSingleton(solver) bind(C,name="ClpSolve_doSingleton")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int) :: ClpSolve_doSingleton
            end function
            subroutine ClpSolve_setDoSingleton(solver,doSingleton) bind(C,name="ClpSolve_setDoSingleton")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value :: doSingleton
            end subroutine
            function ClpSolve_doDoubleton(solver) bind(C,name="ClpSolve_doDoubleton")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int) :: ClpSolve_doDoubleton
            end function
            subroutine ClpSolve_setDoDoubleton(solver,doDoubleton) bind(C,name="ClpSolve_setDoDoubleton")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value ::doDoubleton
            end subroutine
            function ClpSolve_doTripleton(solver) bind(C,name="ClpSolve_doTripleton")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int) :: ClpSolve_doTripleton
            end function
            subroutine ClpSolve_setDoTripleton(solver,doTripleton) bind(C,name="ClpSolve_setDoTripleton")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value ::doTripleton
            end subroutine
            function ClpSolve_doTighten(solver) bind(C,name="ClpSolve_doTighten")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int) :: ClpSolve_doTighten
            end function
            subroutine ClpSolve_setDoTighten(solver,doTighten) bind(C,name="ClpSolve_setDoTighten")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value ::doTighten
            end subroutine
            function ClpSolve_doForcing(solver) bind(C,name="ClpSolve_doForcing")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int) :: ClpSolve_doForcing
            end function
            subroutine ClpSolve_setDoForcing(solver,doForcing) bind(C,name="ClpSolve_setDoForcing")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value ::doForcing
            end subroutine
            function ClpSolve_doImpliedFree(solver) bind(C,name="ClpSolve_doImpliedFree")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int) :: ClpSolve_doImpliedFree
            end function
            subroutine ClpSolve_setDoImpliedFree(solver,doImpliedFree) bind(C,name="ClpSolve_setDoImpliedFree")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value :: doImpliedFree
            end subroutine
            function ClpSolve_doDupcol(solver) bind(C,name="ClpSolve_doDupcol")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int) :: ClpSolve_doDupcol
            end function
            subroutine ClpSolve_setDoDupcol(solver,doDupcol) bind(C,name="ClpSolve_setDoDupcol")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value ::doDupcol
            end subroutine
            function ClpSolve_doDuprow(solver) bind(C,name="ClpSolve_doDuprow")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int) :: ClpSolve_doDuprow
            end function
            subroutine ClpSolve_setDoDuprow(solver,doDuprow) bind(C,name="ClpSolve_setDoDuprow")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value ::doDuprow
            end subroutine
            function ClpSolve_doSingletonColumn(solver) bind(C,name="ClpSolve_doSingletonColumn")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int) :: ClpSolve_doSingletonColumn
            end function
            subroutine ClpSolve_setDoSingletonColumn(solver,doSingleton) bind(C,name="ClpSolve_setDoSingletonColumn")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value ::doSingleton
            end subroutine
            function ClpSolve_presolveActions(solver) bind(C,name="ClpSolve_presolveActions")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int) :: ClpSolve_presolveActions
            end function
            subroutine ClpSolve_setPresolveActions(solver,action) bind(C,name="ClpSolve_setPresolveActions")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value ::action
            end subroutine
            function ClpSolve_substitution(solver) bind(C,name="ClpSolve_substitution")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int) :: ClpSolve_substitution
            end function
            subroutine ClpSolve_setSubstitution(solver,value) bind(C,name="ClpSolve_setSubstitution")
                use iso_c_binding
                    type(c_ptr), value :: solver
                    integer(c_int), value ::value
            end subroutine
    end interface
end module clp
