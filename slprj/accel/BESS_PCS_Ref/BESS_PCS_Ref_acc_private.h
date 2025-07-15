#ifndef RTW_HEADER_BESS_PCS_Ref_acc_private_h_
#define RTW_HEADER_BESS_PCS_Ref_acc_private_h_
#include "rtwtypes.h"
#include "multiword_types.h"
#include "BESS_PCS_Ref_acc.h"
#include "BESS_PCS_Ref_acc_types.h"
#if !defined(ss_VALIDATE_MEMORY)
#define ss_VALIDATE_MEMORY(S, ptr)     if(!(ptr)) {\
    ssSetErrorStatus(S, RT_MEMORY_ALLOCATION_ERROR);\
    }
#endif
#if !defined(rt_FREE)
#if !defined(_WIN32)
#define rt_FREE(ptr)     if((ptr) != (NULL)) {\
    free((ptr));\
    (ptr) = (NULL);\
    }
#else
#define rt_FREE(ptr)     if((ptr) != (NULL)) {\
    free((void *)(ptr));\
    (ptr) = (NULL);\
    }
#endif
#endif
#ifndef __RTW_UTFREE__
extern void * utMalloc ( size_t ) ; extern void utFree ( void * ) ;
#endif
boolean_T BESS_PCS_Ref_acc_rt_TDelayUpdateTailOrGrowBuf ( int_T * bufSzPtr ,
int_T * tailPtr , int_T * headPtr , int_T * lastPtr , real_T tMinusDelay ,
real_T * * uBufPtr , boolean_T isfixedbuf , boolean_T istransportdelay ,
int_T * maxNewBufSzPtr ) ; real_T BESS_PCS_Ref_acc_rt_TDelayInterpolate (
real_T tMinusDelay , real_T tStart , real_T * uBuf , int_T bufSz , int_T *
lastIdx , int_T oldestIdx , int_T newIdx , real_T initOutput , boolean_T
discrete , boolean_T minorStepAndTAtLastMajorOutput ) ; extern real_T
look1_pbinlxpw ( real_T u0 , const real_T bp0 [ ] , const real_T table [ ] ,
uint32_T prevIndex [ ] , uint32_T maxIndex ) ; void BESS_PCS_Ref_RMS_Init (
SimStruct * S , DW_RMS_BESS_PCS_Ref_T * localDW , P_RMS_BESS_PCS_Ref_T *
localP , X_RMS_BESS_PCS_Ref_T * localX ) ; void BESS_PCS_Ref_RMS_Deriv (
SimStruct * S , B_RMS_BESS_PCS_Ref_T * localB , DW_RMS_BESS_PCS_Ref_T *
localDW , XDot_RMS_BESS_PCS_Ref_T * localXdot ) ; void
BESS_PCS_Ref_RMS_Disable ( SimStruct * S , DW_RMS_BESS_PCS_Ref_T * localDW )
; void BESS_PCS_Ref_RMS_Update ( SimStruct * S , B_RMS_BESS_PCS_Ref_T *
localB , DW_RMS_BESS_PCS_Ref_T * localDW , P_RMS_BESS_PCS_Ref_T * localP ) ;
void BESS_PCS_Ref_RMS ( SimStruct * S , boolean_T rtu_Enable , const real_T
rtu_In [ 3 ] , B_RMS_BESS_PCS_Ref_T * localB , DW_RMS_BESS_PCS_Ref_T *
localDW , P_RMS_BESS_PCS_Ref_T * localP , X_RMS_BESS_PCS_Ref_T * localX ,
XDis_RMS_BESS_PCS_Ref_T * localXdis ) ; void BESS_PCS_Ref_TrueRMS_Init (
SimStruct * S , DW_TrueRMS_BESS_PCS_Ref_T * localDW ,
P_TrueRMS_BESS_PCS_Ref_T * localP , X_TrueRMS_BESS_PCS_Ref_T * localX ) ;
void BESS_PCS_Ref_TrueRMS_Deriv ( SimStruct * S , B_TrueRMS_BESS_PCS_Ref_T *
localB , DW_TrueRMS_BESS_PCS_Ref_T * localDW , XDot_TrueRMS_BESS_PCS_Ref_T *
localXdot ) ; void BESS_PCS_Ref_TrueRMS_ZC ( SimStruct * S ,
B_TrueRMS_BESS_PCS_Ref_T * localB , DW_TrueRMS_BESS_PCS_Ref_T * localDW ,
P_TrueRMS_BESS_PCS_Ref_T * localP , ZCV_TrueRMS_BESS_PCS_Ref_T * localZCSV )
; void BESS_PCS_Ref_TrueRMS_Disable ( SimStruct * S ,
DW_TrueRMS_BESS_PCS_Ref_T * localDW ) ; void BESS_PCS_Ref_TrueRMS_Update (
SimStruct * S , B_TrueRMS_BESS_PCS_Ref_T * localB , DW_TrueRMS_BESS_PCS_Ref_T
* localDW , P_TrueRMS_BESS_PCS_Ref_T * localP ) ; void BESS_PCS_Ref_TrueRMS (
SimStruct * S , boolean_T rtu_Enable , const real_T rtu_In [ 3 ] ,
B_TrueRMS_BESS_PCS_Ref_T * localB , DW_TrueRMS_BESS_PCS_Ref_T * localDW ,
P_TrueRMS_BESS_PCS_Ref_T * localP , X_TrueRMS_BESS_PCS_Ref_T * localX ,
XDis_TrueRMS_BESS_PCS_Ref_T * localXdis ) ; void BESS_PCS_Ref_CLARK (
SimStruct * S , real_T rtu_Enableheld , const real_T rtu_abc [ 3 ] ,
B_CLARK_BESS_PCS_Ref_T * localB , DW_CLARK_BESS_PCS_Ref_T * localDW ,
P_CLARK_BESS_PCS_Ref_T * localP ) ; void BESS_PCS_Ref_CLARK_lag ( SimStruct *
S , real_T rtu_Enable , const real_T rtu_abc [ 3 ] ,
B_CLARK_lag_BESS_PCS_Ref_T * localB , DW_CLARK_lag_BESS_PCS_Ref_T * localDW )
; void BESS_PCS_Ref_CLARK_lead ( SimStruct * S , real_T rtu_Enable , const
real_T rtu_abc [ 3 ] , B_CLARK_lead_BESS_PCS_Ref_T * localB ,
DW_CLARK_lead_BESS_PCS_Ref_T * localDW ) ; void BESS_PCS_Ref_Regulator_Init (
SimStruct * S , DW_Regulator_BESS_PCS_Ref_T * localDW ,
P_Regulator_BESS_PCS_Ref_T * localP ) ; void BESS_PCS_Ref_Regulator_Reset (
SimStruct * S , DW_Regulator_BESS_PCS_Ref_T * localDW ,
P_Regulator_BESS_PCS_Ref_T * localP ) ; void BESS_PCS_Ref_Regulator_Enable (
SimStruct * S , DW_Regulator_BESS_PCS_Ref_T * localDW ) ; void
BESS_PCS_Ref_Regulator_Disable ( SimStruct * S , DW_Regulator_BESS_PCS_Ref_T
* localDW ) ; void BESS_PCS_Ref_Regulator_Update ( SimStruct * S ,
B_Regulator_BESS_PCS_Ref_T * localB , DW_Regulator_BESS_PCS_Ref_T * localDW ,
P_Regulator_BESS_PCS_Ref_T * localP ) ; void BESS_PCS_Ref_Regulator (
SimStruct * S , real_T rtu_Enable , const real_T rtu_V_ref_lim_abc [ 3 ] ,
const real_T rtu_Iv_abc [ 3 ] , real_T rtu_Udc_0_mean ,
B_Regulator_BESS_PCS_Ref_T * localB , DW_Regulator_BESS_PCS_Ref_T * localDW ,
P_Regulator_BESS_PCS_Ref_T * localP ) ; void BESS_PCS_Ref_RegulatorTID6 (
SimStruct * S , B_Regulator_BESS_PCS_Ref_T * localB ,
DW_Regulator_BESS_PCS_Ref_T * localDW , P_Regulator_BESS_PCS_Ref_T * localP )
; void BESS_PCS_Ref_Subsystempi2delay_Init ( SimStruct * S ,
B_Subsystempi2delay_BESS_PCS_Ref_T * localB ,
P_Subsystempi2delay_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_Subsystempi2delay ( SimStruct * S , uint8_T rtu_Enable , const
real_T rtu_dq [ 2 ] , real_T rtu_wt , B_Subsystempi2delay_BESS_PCS_Ref_T *
localB , DW_Subsystempi2delay_BESS_PCS_Ref_T * localDW ) ; void
BESS_PCS_Ref_Subsystem1_Init ( SimStruct * S , B_Subsystem1_BESS_PCS_Ref_T *
localB , P_Subsystem1_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_Subsystem1 ( SimStruct * S , uint8_T rtu_Enable , const real_T
rtu_dq [ 2 ] , real_T rtu_wt , B_Subsystem1_BESS_PCS_Ref_T * localB ,
DW_Subsystem1_BESS_PCS_Ref_T * localDW ) ; void
BESS_PCS_Ref_DCVoltageControlOverride_Init ( SimStruct * S ,
DW_DCVoltageControlOverride_BESS_PCS_Ref_T * localDW ,
P_DCVoltageControlOverride_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_DCVoltageControlOverride_Reset ( SimStruct * S ,
DW_DCVoltageControlOverride_BESS_PCS_Ref_T * localDW ,
P_DCVoltageControlOverride_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_DCVoltageControlOverride_Enable ( SimStruct * S ,
DW_DCVoltageControlOverride_BESS_PCS_Ref_T * localDW ) ; void
BESS_PCS_Ref_DCVoltageControlOverride_Disable ( SimStruct * S ,
DW_DCVoltageControlOverride_BESS_PCS_Ref_T * localDW ) ; void
BESS_PCS_Ref_DCVoltageControlOverride_Update ( SimStruct * S ,
B_DCVoltageControlOverride_BESS_PCS_Ref_T * localB ,
DW_DCVoltageControlOverride_BESS_PCS_Ref_T * localDW ,
P_DCVoltageControlOverride_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_DCVoltageControlOverride ( SimStruct * S , real_T
rtu_Enablereset , real_T rtu_In , B_DCVoltageControlOverride_BESS_PCS_Ref_T *
localB , DW_DCVoltageControlOverride_BESS_PCS_Ref_T * localDW ,
P_DCVoltageControlOverride_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_DCVoltageControlOverrideTID6 ( SimStruct * S ,
B_DCVoltageControlOverride_BESS_PCS_Ref_T * localB ,
DW_DCVoltageControlOverride_BESS_PCS_Ref_T * localDW ,
P_DCVoltageControlOverride_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_Int_regulatortype1_Init ( SimStruct * S ,
DW_Int_regulatortype1_BESS_PCS_Ref_T * localDW ,
P_Int_regulatortype1_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_Int_regulatortype1_Reset ( SimStruct * S ,
DW_Int_regulatortype1_BESS_PCS_Ref_T * localDW ,
P_Int_regulatortype1_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_Int_regulatortype1_Enable ( SimStruct * S ,
DW_Int_regulatortype1_BESS_PCS_Ref_T * localDW ) ; void
BESS_PCS_Ref_Int_regulatortype1_Disable ( SimStruct * S ,
DW_Int_regulatortype1_BESS_PCS_Ref_T * localDW ) ; void
BESS_PCS_Ref_Int_regulatortype1_Update ( SimStruct * S ,
B_Int_regulatortype1_BESS_PCS_Ref_T * localB ,
DW_Int_regulatortype1_BESS_PCS_Ref_T * localDW ,
P_Int_regulatortype1_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_Int_regulatortype1 ( SimStruct * S , real_T rtu_EnableReset ,
real_T rtu_Ord , real_T rtu_Meas , real_T rtu_freeze ,
B_Int_regulatortype1_BESS_PCS_Ref_T * localB ,
DW_Int_regulatortype1_BESS_PCS_Ref_T * localDW ,
P_Int_regulatortype1_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_Int_regulatortype1TID6 ( SimStruct * S ,
B_Int_regulatortype1_BESS_PCS_Ref_T * localB ,
DW_Int_regulatortype1_BESS_PCS_Ref_T * localDW ,
P_Int_regulatortype1_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_DC_Voltage_Control_Init ( SimStruct * S ,
DW_DC_Voltage_Control_BESS_PCS_Ref_T * localDW ,
P_DC_Voltage_Control_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_DC_Voltage_Control_Reset ( SimStruct * S ,
DW_DC_Voltage_Control_BESS_PCS_Ref_T * localDW ,
P_DC_Voltage_Control_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_DC_Voltage_Control_Enable ( SimStruct * S ,
DW_DC_Voltage_Control_BESS_PCS_Ref_T * localDW ) ; void
BESS_PCS_Ref_DC_Voltage_Control_Disable ( SimStruct * S ,
DW_DC_Voltage_Control_BESS_PCS_Ref_T * localDW ) ; void
BESS_PCS_Ref_DC_Voltage_Control_Update ( SimStruct * S ,
B_DC_Voltage_Control_BESS_PCS_Ref_T * localB ,
DW_DC_Voltage_Control_BESS_PCS_Ref_T * localDW ,
P_DC_Voltage_Control_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_DC_Voltage_Control ( SimStruct * S , real_T rtu_EnableReset ,
real_T rtu_Udref , real_T rtu_Udc_meas , B_DC_Voltage_Control_BESS_PCS_Ref_T
* localB , DW_DC_Voltage_Control_BESS_PCS_Ref_T * localDW ,
P_DC_Voltage_Control_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_Subsystempi2delay_g_Init ( SimStruct * S ,
B_Subsystempi2delay_BESS_PCS_Ref_f_T * localB ,
P_Subsystempi2delay_BESS_PCS_Ref_n_T * localP ) ; void
BESS_PCS_Ref_Subsystempi2delay_b ( SimStruct * S , uint8_T rtu_Enable , const
real_T rtu_alpha_beta [ 2 ] , real_T rtu_wt ,
B_Subsystempi2delay_BESS_PCS_Ref_f_T * localB ,
DW_Subsystempi2delay_BESS_PCS_Ref_o_T * localDW ) ; void
BESS_PCS_Ref_Subsystem1_k_Init ( SimStruct * S ,
B_Subsystem1_BESS_PCS_Ref_p_T * localB , P_Subsystem1_BESS_PCS_Ref_j_T *
localP ) ; void BESS_PCS_Ref_Subsystem1_b ( SimStruct * S , uint8_T
rtu_Enable , const real_T rtu_alpha_beta [ 2 ] , real_T rtu_wt ,
B_Subsystem1_BESS_PCS_Ref_p_T * localB , DW_Subsystem1_BESS_PCS_Ref_o_T *
localDW ) ; void BESS_PCS_Ref_Fullbridge1ph_Init ( SimStruct * S ,
B_Fullbridge1ph_BESS_PCS_Ref_T * localB , P_Fullbridge1ph_BESS_PCS_Ref_T *
localP ) ; void BESS_PCS_Ref_Fullbridge1ph ( SimStruct * S , boolean_T
rtu_Enable , real_T rtu_Uref , const real_T rtu_C_pn [ 2 ] ,
B_Fullbridge1ph_BESS_PCS_Ref_T * localB , DW_Fullbridge1ph_BESS_PCS_Ref_T *
localDW , P_Fullbridge1ph_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_Halfbridge1phand3phbridge_Init ( SimStruct * S ,
B_Halfbridge1phand3phbridge_BESS_PCS_Ref_T * localB ,
P_Halfbridge1phand3phbridge_BESS_PCS_Ref_T * localP ) ; void
BESS_PCS_Ref_Halfbridge1phand3phbridge ( SimStruct * S , boolean_T rtu_Enable
, const real_T rtu_Uref [ 3 ] , const real_T rtu_C_pn [ 2 ] ,
B_Halfbridge1phand3phbridge_BESS_PCS_Ref_T * localB ,
DW_Halfbridge1phand3phbridge_BESS_PCS_Ref_T * localDW ) ; void
BESS_PCS_Ref_RMS_Term ( SimStruct * const S ) ; void
BESS_PCS_Ref_TrueRMS_Term ( SimStruct * const S ) ; void
BESS_PCS_Ref_CLARK_Term ( SimStruct * const S ) ; void
BESS_PCS_Ref_CLARK_lag_Term ( SimStruct * const S ) ; void
BESS_PCS_Ref_CLARK_lead_Term ( SimStruct * const S ) ; void
BESS_PCS_Ref_Regulator_Term ( SimStruct * const S ) ; void
BESS_PCS_Ref_Subsystempi2delay_Term ( SimStruct * const S ) ; void
BESS_PCS_Ref_Subsystem1_Term ( SimStruct * const S ) ; void
BESS_PCS_Ref_DCVoltageControlOverride_Term ( SimStruct * const S ) ; void
BESS_PCS_Ref_Int_regulatortype1_Term ( SimStruct * const S ) ; void
BESS_PCS_Ref_DC_Voltage_Control_Term ( SimStruct * const S ) ; void
BESS_PCS_Ref_Subsystempi2delay_d_Term ( SimStruct * const S ) ; void
BESS_PCS_Ref_Subsystem1_k_Term ( SimStruct * const S ) ; void
BESS_PCS_Ref_Fullbridge1ph_Term ( SimStruct * const S ) ; void
BESS_PCS_Ref_Halfbridge1phand3phbridge_Term ( SimStruct * const S ) ;
#endif
