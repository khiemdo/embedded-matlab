#ifndef __c2_DisplayCANMsg_h__
#define __c2_DisplayCANMsg_h__

/* Include files */
#include "sf_runtime/sfc_sf.h"
#include "sf_runtime/sfc_mex.h"
#include "rtwtypes.h"
#include "multiword_types.h"

/* Type Definitions */
#include <stddef.h>
#ifndef typedef_SFc2_DisplayCANMsgInstanceStruct
#define typedef_SFc2_DisplayCANMsgInstanceStruct

typedef struct {
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint32_T chartNumber;
  uint32_T instanceNumber;
  int32_T c2_sfEvent;
  boolean_T c2_isStable;
  boolean_T c2_doneDoubleBufferReInit;
  uint8_T c2_is_active_c2_DisplayCANMsg;
  uint8_T (*c2_littleEndianArray)[2];
  int16_T *c2_y;
} SFc2_DisplayCANMsgInstanceStruct;

#endif                                 /*typedef_SFc2_DisplayCANMsgInstanceStruct*/

/* Named Constants */

/* Variable Declarations */
extern struct SfDebugInstanceStruct *sfGlobalDebugInstanceStruct;

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c2_DisplayCANMsg_get_eml_resolved_functions_info(void);

/* Function Definitions */
extern void sf_c2_DisplayCANMsg_get_check_sum(mxArray *plhs[]);
extern void c2_DisplayCANMsg_method_dispatcher(SimStruct *S, int_T method, void *
  data);

#endif
