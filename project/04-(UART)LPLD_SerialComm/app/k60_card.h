/**
 * @file k60_card.h
 * @version 3.0[By LPLD]
 * @date 2013-06-18
 * @brief 拉普兰德K60核心板配置文件
 *
 * 更改建议:可根据工程需求修改
 *
 * **必须在每个工程的app文件夹内包含此文件。**
 * 该头文件为拉普兰德K60底层库所必须的配置文件。
 * 用于配置MCU型号、主频、调试信息等参数。
 *
 * 版权所有:北京拉普兰德电子技术有限公司
 * http://www.lpld.cn
 * mail:support@lpld.cn
 *
 * @par
 * 本代码由拉普兰德[LPLD]开发并维护，并向所有使用者开放源代码。
 * 开发者可以随意修使用或改源代码。但本段及以上注释应予以保留。
 * 不得更改或删除原版权所有者姓名，二次开发者可以加注二次版权所有者。
 * 但应在遵守此协议的基础上，开放源代码、不得出售代码本身。
 * 拉普兰德不负责由于使用本代码所带来的任何事故、法律责任或相关不良影响。
 * 拉普兰德无义务解释、说明本代码的具体原理、功能、实现方法。
 * 除非拉普兰德[LPLD]授权，开发者不得将本代码用于商业产品。
 */
#ifndef __K60_CARD_H__
#define __K60_CARD_H__

/*
 * 系统主频定义(CORE_CLK_MHZ)
 * 可选范围:
 * PLL_48        //48MHz 如果使用USB模块，必须选择48的倍数主频
 * PLL_50        //50MHz
 * PLL_96        //96MHz 如果使用USB模块，必须选择48的倍数主频
 * PLL_100       //100MHz 是MK60DZ10的额定最高主频，再往上飞思卡尔可不质保
 * PLL_120       //120MHz
 * PLL_150       //150MHz
 * PLL_180       //180MHz
 * PLL_200       //200MHz 如果超到200，发热很正常，烧了别找我>_>
 *
 * LPLD提示：MK60DZ10不推荐使用100MHz以上频率，可能引起不可修复的故障
 *           此列表为LPLD固件库列出的常用频率，可以满足各种功能、功耗需求
 */
#define CORE_CLK_MHZ        PLL_120       
   
/*
 * 总线频率定义(BUS_CLK_MHZ)
 * 可选范围:
 *   不超过系统主频，但建议不超过100，超过100后会出现跑飞、发热现象
 *
 * LPLD提示：MK60DZ10额定最高总线频率为50MHz
 *           此处设置的为期望值，即最终输出频率不会高于此频率
*/
#define BUS_CLK_MHZ         50u    
   
/*
 * Flex总线频率定义(FLEXBUS_CLK_MHZ)
 * 可选范围:
 *   不超过50
 *
 * LPLD提示：MK60DZ10额定最高Flex总线频率为50MHz
 *           此处设置的为期望值，即最终输出频率不会高于此频率
*/
#define FLEXBUS_CLK_MHZ     50u 
   
/*
 * Flash频率定义(FLASH_CLK_MHZ)
 * 可选范围:
 *   不超过25
 *
 * LPLD提示：MK60DZ10额定最高Flash频率为25MHz
 *           此处设置的为期望值，即最终输出频率不会高于此频率
*/
#define FLASH_CLK_MHZ       25u    


/* 
 * 选择调试信息输出所有的串口号和波特率
 */
#define TERM_PORT           UART0
#define TERMINAL_BAUD       9600

/*
 * 是否启用串口显示调试信息
 * 如果启用，核心板会在运行时通过UART5显示器件相关信息，占用PTE8和PTE9两个端口
 * 1显示  0不显示
 */
#define PRINT_ON_OFF    0

#if (PRINT_ON_OFF == 0)            
  #undef DEBUG_PRINT
#endif
   
/*
 * 是否启用断言函数判断参数合法性
 * 如果启用，会增加部分库函的运行时间来判断参数的合法性
 * 1使用  0不使用
 */
#define ASSERT_ON_OFF   1

#if (ASSERT_ON_OFF == 0)            
  #undef DEBUG_ASSERT
#endif

/*
 * 是否使用uCOS II
 * 1使用  0不使用
 */
#define UCOS_II         0

/*
 * 是否使用FatFs
 * 1使用  0不使用
 */
#define USE_FATFS       0

/*
 * 定义MCU型号
 */
#define CPU_MK60DZ10
#define CPU_MK60FX15_ADD

#endif /* __K60_CARD_H__ */
