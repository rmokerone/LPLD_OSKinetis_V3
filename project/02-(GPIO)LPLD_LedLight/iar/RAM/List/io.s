///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    16/Feb/2014  11:35:23 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\embed\LPLD\LPLD_OSKinetis_V3\lib\common\io.c         /
//    Command line =  C:\embed\LPLD\LPLD_OSKinetis_V3\lib\common\io.c -D      /
//                    LPLD_K60 -lCN "C:\embed\LPLD\LPLD_OSKinetis_V3\project\ /
//                    02-(GPIO)LPLD_LedLight\iar\RAM\List\" -lB               /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\02-(GPIO)LPLD_ /
//                    LedLight\iar\RAM\List\" -o                              /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\02-(GPIO)LPLD_ /
//                    LedLight\iar\RAM\Obj\" --no_cse --no_unroll             /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.4\arm\INC\c\DLib_Config_Normal.h" -I                  /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\02-(GPIO)LPLD_ /
//                    LedLight\iar\..\app\" -I "C:\embed\LPLD\LPLD_OSKinetis_ /
//                    V3\project\02-(GPIO)LPLD_LedLight\iar\..\..\..\lib\CPU\ /
//                    " -I "C:\embed\LPLD\LPLD_OSKinetis_V3\project\02-(GPIO) /
//                    LPLD_LedLight\iar\..\..\..\lib\common\" -I              /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\02-(GPIO)LPLD_ /
//                    LedLight\iar\..\..\..\lib\LPLD\" -I                     /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\02-(GPIO)LPLD_ /
//                    LedLight\iar\..\..\..\lib\LPLD\HW\" -I                  /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\02-(GPIO)LPLD_ /
//                    LedLight\iar\..\..\..\lib\LPLD\DEV\" -I                 /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\02-(GPIO)LPLD_ /
//                    LedLight\iar\..\..\..\lib\uCOS-II\Ports\" -I            /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\02-(GPIO)LPLD_ /
//                    LedLight\iar\..\..\..\lib\uCOS-II\Source\" -I           /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\02-(GPIO)LPLD_ /
//                    LedLight\iar\..\..\..\lib\FatFs\" -I                    /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\02-(GPIO)LPLD_ /
//                    LedLight\iar\..\..\..\lib\FatFs\option\" -I             /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\02-(GPIO)LPLD_ /
//                    LedLight\iar\..\..\..\lib\USB\common\" -I               /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\02-(GPIO)LPLD_ /
//                    LedLight\iar\..\..\..\lib\USB\driver\" -I               /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\02-(GPIO)LPLD_ /
//                    LedLight\iar\..\..\..\lib\USB\descriptor\" -I           /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\02-(GPIO)LPLD_ /
//                    LedLight\iar\..\..\..\lib\USB\class\" -Ol -I            /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.4\arm\CMSIS\Include\" -D ARM_MATH_CM4                 /
//    List file    =  C:\embed\LPLD\LPLD_OSKinetis_V3\project\02-(GPIO)LPLD_L /
//                    edLight\iar\RAM\List\io.s                               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME io

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_UART_GetChar
        EXTERN LPLD_UART_GetChar_Present
        EXTERN LPLD_UART_PutChar

        PUBLIC char_present
        PUBLIC in_char
        PUBLIC out_char

// C:\embed\LPLD\LPLD_OSKinetis_V3\lib\common\io.c
//    1 /**
//    2  * @file io.c
//    3  * @version 3.01[By LPLD]
//    4  * @date 2013-11-4
//    5  * @brief 串行输入/输出函数
//    6  *
//    7  * 更改建议:不建议修改
//    8  *
//    9  * TERMINAL_PORT为串口号，在用户工程的k60_card.h中定义
//   10  *
//   11  * 版权所有:北京拉普兰德电子技术有限公司
//   12  * http://www.lpld.cn
//   13  * mail:support@lpld.cn
//   14  *
//   15  * @par
//   16  * 本代码由拉普兰德[LPLD]开发并维护，并向所有使用者开放源代码。
//   17  * 开发者可以随意修使用或改源代码。但本段及以上注释应予以保留。
//   18  * 不得更改或删除原版权所有者姓名，二次开发者可以加注二次版权所有者。
//   19  * 但应在遵守此协议的基础上，开放源代码、不得出售代码本身。
//   20  * 拉普兰德不负责由于使用本代码所带来的任何事故、法律责任或相关不良影响。
//   21  * 拉普兰德无义务解释、说明本代码的具体原理、功能、实现方法。
//   22  * 除非拉普兰德[LPLD]授权，开发者不得将本代码用于商业产品。
//   23  */
//   24 
//   25 #include "common.h"
//   26 #include "HW_UART.h"
//   27 
//   28 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   29 int8 in_char (void)
//   30 {
in_char:
        PUSH     {R7,LR}
//   31 	return LPLD_UART_GetChar(TERM_PORT);
        LDR.N    R0,??DataTable2  ;; 0x4006a000
        BL       LPLD_UART_GetChar
        POP      {R1,PC}          ;; return
//   32 }
//   33 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   34 void out_char (int8 ch)
//   35 {
out_char:
        PUSH     {R7,LR}
//   36 	LPLD_UART_PutChar(TERM_PORT, ch);
        MOVS     R1,R0
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable2  ;; 0x4006a000
        BL       LPLD_UART_PutChar
//   37 }
        POP      {R0,PC}          ;; return
//   38 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   39 int32 char_present (void)
//   40 {
char_present:
        PUSH     {R7,LR}
//   41 	return LPLD_UART_GetChar_Present(TERM_PORT);
        LDR.N    R0,??DataTable2  ;; 0x4006a000
        BL       LPLD_UART_GetChar_Present
        POP      {R1,PC}          ;; return
//   42 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x4006a000

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   43 /********************************************************************/
// 
// 38 bytes in section .text
// 
// 38 bytes of CODE memory
//
//Errors: none
//Warnings: none
