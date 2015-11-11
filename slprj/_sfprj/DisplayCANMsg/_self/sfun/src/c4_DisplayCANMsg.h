#ifndef __c4_DisplayCANMsg_h__
#define __c4_DisplayCANMsg_h__

/* Include files */
#include "sf_runtime/sfc_sf.h"
#include "sf_runtime/sfc_mex.h"
#include "rtwtypes.h"
#include "multiword_types.h"

/* Type Definitions */
#include <stddef.h>
#ifndef typedef_SFc4_DisplayCANMsgInstanceStruct
#define typedef_SFc4_DisplayCANMsgInstanceStruct

typedef struct {
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint32_T chartNumber;
  uint32_T instanceNumber;
  int32_T c4_sfEvent;
  boolean_T c4_isStable;
  boolean_T c4_doneDoubleBufferReInit;
  uint8_T c4_is_active_c4_DisplayCANMsg;
  uint8_T (*c4_littleEndianArray)[2];
  int16_T *c4_y;
} SFc4_DisplayCANMsgInstanceStruct;

#endif                                 /*typedef_SFc4_DisplayCANMsgInstanceStruct*/

/* Named Constants */

/* Variable Declarations */
extern struct SfDebugInstanceStruct *sfGlobalDebugInstanceStruct;

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c4_DisplayCANMsg_get_eml_resolved_functions_info(void);

/* Function Definitions */
extern void sf_c4_DisplayCANMsg_get_check_sum(mxArray *plhs[]);
extern void c4_DisplayCANMsg_method_dispatcher(SimStruct *S, int_T method, void *
  data);

#endif
