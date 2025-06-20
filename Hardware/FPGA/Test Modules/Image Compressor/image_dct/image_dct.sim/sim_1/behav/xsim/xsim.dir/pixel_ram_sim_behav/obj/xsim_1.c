/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_103(char*, char *);
IKI_DLLESPEC extern void execute_104(char*, char *);
IKI_DLLESPEC extern void execute_105(char*, char *);
IKI_DLLESPEC extern void execute_32(char*, char *);
IKI_DLLESPEC extern void execute_33(char*, char *);
IKI_DLLESPEC extern void execute_34(char*, char *);
IKI_DLLESPEC extern void execute_35(char*, char *);
IKI_DLLESPEC extern void execute_36(char*, char *);
IKI_DLLESPEC extern void execute_37(char*, char *);
IKI_DLLESPEC extern void execute_38(char*, char *);
IKI_DLLESPEC extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_37(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_43(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_49(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_55(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_61(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_67(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_73(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_79(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[20] = {(funcp)execute_103, (funcp)execute_104, (funcp)execute_105, (funcp)execute_32, (funcp)execute_33, (funcp)execute_34, (funcp)execute_35, (funcp)execute_36, (funcp)execute_37, (funcp)execute_38, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_37, (funcp)transaction_43, (funcp)transaction_49, (funcp)transaction_55, (funcp)transaction_61, (funcp)transaction_67, (funcp)transaction_73, (funcp)transaction_79};
const int NumRelocateId= 20;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/pixel_ram_sim_behav/xsim.reloc",  (void **)funcTab, 20);
	iki_vhdl_file_variable_register(dp + 21288);
	iki_vhdl_file_variable_register(dp + 21344);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/pixel_ram_sim_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/pixel_ram_sim_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_xsimdir_location_if_remapped(argc, argv)  ;
    iki_set_sv_type_file_path_name("xsim.dir/pixel_ram_sim_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/pixel_ram_sim_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/pixel_ram_sim_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
