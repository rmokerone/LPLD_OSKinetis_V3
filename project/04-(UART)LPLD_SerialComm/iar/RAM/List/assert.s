///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    16/Feb/2014  16:24:45 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\embed\LPLD\LPLD_OSKinetis_V3\lib\common\assert.c     /
//    Command line =  C:\embed\LPLD\LPLD_OSKinetis_V3\lib\common\assert.c -D  /
//                    LPLD_K60 -lCN "C:\embed\LPLD\LPLD_OSKinetis_V3\project\ /
//                    04-(UART)LPLD_SerialComm\iar\RAM\List\" -lB             /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\04-(UART)LPLD_ /
//                    SerialComm\iar\RAM\List\" -o                            /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\04-(UART)LPLD_ /
//                    SerialComm\iar\RAM\Obj\" --no_cse --no_unroll           /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.4\arm\INC\c\DLib_Config_Normal.h" -I                  /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\04-(UART)LPLD_ /
//                    SerialComm\iar\..\app\" -I                              /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\04-(UART)LPLD_ /
//                    SerialComm\iar\..\..\..\lib\CPU\" -I                    /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\04-(UART)LPLD_ /
//                    SerialComm\iar\..\..\..\lib\common\" -I                 /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\04-(UART)LPLD_ /
//                    SerialComm\iar\..\..\..\lib\LPLD\" -I                   /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\04-(UART)LPLD_ /
//                    SerialComm\iar\..\..\..\lib\LPLD\HW\" -I                /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\04-(UART)LPLD_ /
//                    SerialComm\iar\..\..\..\lib\LPLD\DEV\" -I               /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\04-(UART)LPLD_ /
//                    SerialComm\iar\..\..\..\lib\uCOS-II\Ports\" -I          /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\04-(UART)LPLD_ /
//                    SerialComm\iar\..\..\..\lib\uCOS-II\Source\" -I         /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\04-(UART)LPLD_ /
//                    SerialComm\iar\..\..\..\lib\FatFs\" -I                  /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\04-(UART)LPLD_ /
//                    SerialComm\iar\..\..\..\lib\FatFs\option\" -I           /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\04-(UART)LPLD_ /
//                    SerialComm\iar\..\..\..\lib\USB\common\" -I             /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\04-(UART)LPLD_ /
//                    SerialComm\iar\..\..\..\lib\USB\driver\" -I             /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\04-(UART)LPLD_ /
//                    SerialComm\iar\..\..\..\lib\USB\descriptor\" -I         /
//                    "C:\embed\LPLD\LPLD_OSKinetis_V3\project\04-(UART)LPLD_ /
//                    SerialComm\iar\..\..\..\lib\USB\class\" -Ol -I          /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.4\arm\CMSIS\Include\" -D ARM_MATH_CM4                 /
//    List file    =  C:\embed\LPLD\LPLD_OSKinetis_V3\project\04-(UART)LPLD_S /
//                    erialComm\iar\RAM\List\assert.s                         /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME assert

        #define SHT_PROGBITS 0x1

        EXTERN printf

        PUBLIC ASSERT_FAILED_STR
        PUBLIC assert_failed

// C:\embed\LPLD\LPLD_OSKinetis_V3\lib\common\assert.c
//    1 /**
//    2  * @file assert.c
//    3  * @version 3.0[By LPLD]
//    4  * @date 2013-06-18
//    5  * @brief 断言函数定义
//    6  *
//    7  * 更改建议:不建议修改
//    8  *
//    9  * 一般不直接调用这里的断言函数，需要调用assert.h中的ASSERT宏定义
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
//   26 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   27 const int8 ASSERT_FAILED_STR[] = "断言失败发生于 %s 代码的第 %d 行，请检查参数。\n";
ASSERT_FAILED_STR:
        DATA
        DC8 "\266\317\321\324\312\247\260\334\267\242\311\372\323\332 %s \264\372\302\353\265\304\265\332 %d \320\320\243\254\307\353\274\354\262\351\262\316\312\375\241\243\012"
//   28 
//   29 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   30 void assert_failed(int8 *file, int32 line)
//   31 {
//   32   printf(ASSERT_FAILED_STR, file, line);
assert_failed:
        MOVS     R2,R1
        MOVS     R1,R0
        LDR.N    R0,??assert_failed_0
        BL       printf
//   33 
//   34   while (1)
??assert_failed_1:
        B.N      ??assert_failed_1
        DATA
??assert_failed_0:
        DC32     ASSERT_FAILED_STR
//   35   {}
//   36 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   37 /********************************************************************/
// 
// 48 bytes in section .rodata
// 16 bytes in section .text
// 
// 16 bytes of CODE  memory
// 48 bytes of CONST memory
//
//Errors: none
//Warnings: none
