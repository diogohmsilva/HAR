/*
 * Copyright (c) 2016, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*
 *    ======== i2ctmp007.c ========
 */

/* XDCtools Header files */
#include <xdc/std.h>
#include <xdc/runtime/System.h>

/* BIOS Header files */
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Clock.h>
#include <ti/sysbios/knl/Task.h>

/* TI-RTOS Header files */
#include <ti/drivers/PIN.h>
#include <ti/drivers/I2C.h>

/* Example/Board Header files */
#include "Board.h"

typedef void (*SensorMpu9250CallbackFn_t)(void);

static SensorMpu9250CallbackFn_t isrCallbackFn = NULL;

#define TASKSTACKSIZE       1024
#define TMP007_OBJ_TEMP     0x0003  /* Object Temp Result Register */
#define GYRO_XOUT_H         0x43 // R
#define GYRO_DATA_LEN       6
#define N_AXES              3

static Clock_struct my_clock;

/* Global memory storage for a PIN_Config table */
static PIN_State ledPinState, mpuPinState;

/*
 * Application LED pin configuration table:
 *   - All LEDs board LEDs are off.
 */
PIN_Config ledPinTable[] = {
    Board_LED1 | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX,
    Board_LED2 | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX,
    PIN_TERMINATE
};

PIN_Config MpuPinTable[] =
{
    Board_MPU_INT | PIN_INPUT_EN | PIN_PULLDOWN | PIN_IRQ_DIS | PIN_HYSTERESIS,
    Board_MPU_POWER | PIN_GPIO_OUTPUT_EN | PIN_GPIO_HIGH | PIN_PUSHPULL | PIN_DRVSTR_MAX,

    PIN_TERMINATE
};

Task_Struct task0Struct;
Char task0Stack[TASKSTACKSIZE];

static void SensorMpu9250_Callback(PIN_Handle handle, PIN_Id pinId)
{
    if (pinId == Board_MPU_INT)
    {
        if (isrCallbackFn != NULL)
        {
            isrCallbackFn();
        }
    }
}

/*
 *  ======== echoFxn ========
 *  Task for this function is created statically. See the project's .cfg file.
 *
 */
Void taskFxn(UArg arg0, UArg arg1)
{
    unsigned int    i, j;
    uint16_t        readings[N_AXES];
    uint8_t         txBuffer[1];
    uint8_t         rxBuffer[GYRO_DATA_LEN];
    I2C_Handle      i2c;
    I2C_Params      i2cParams;
    I2C_Transaction i2cTransaction;
    float r[N_AXES];

    /* Create I2C for usage */
    I2C_Params_init(&i2cParams);
    i2cParams.bitRate = I2C_400kHz;
    i2c = I2C_open(Board_I2C_TMP, &i2cParams);
    if (i2c == NULL) {
        System_abort("Error Initializing I2C\n");
    }
    else {
        System_printf("I2C Initialized!\n");
    }

    /* Point to the T ambient register and read its 2 bytes */
    txBuffer[0] = GYRO_XOUT_H;
    i2cTransaction.slaveAddress = Board_MPU9250_ADDR;
    i2cTransaction.writeBuf = txBuffer;
    i2cTransaction.writeCount = 1;
    i2cTransaction.readBuf = rxBuffer;
    i2cTransaction.readCount = GYRO_DATA_LEN;

    /* Take 20 samples and print them out onto the console */
    for (i = 0; i < 20; i++) {
        if (I2C_transfer(i2c, &i2cTransaction)) {


            readings[0] = ((uint16_t)rxBuffer[0] << 8) | rxBuffer[1];
            readings[1] = ((uint16_t)rxBuffer[2] << 8) | rxBuffer[3] ;
            readings[2] = ((uint16_t)rxBuffer[4] << 8) | rxBuffer[5] ;

            for(j = 0; j < N_AXES ; j++){
                r[j] = (readings[j] * 1.0) / (65536 / 500);
            }

            System_printf("Sample %u \n x : %f, y : %f, z : %f (C)\n", i, r[0], r[1], r[2]);
        }else {

            System_printf("I2C Bus fault\n");
        }

        System_flush();
        Task_sleep(1000000 / Clock_tickPeriod);
    }

    /* Deinitialized I2C */
    I2C_close(i2c);
    System_printf("I2C closed!\n");

    System_flush();
}

/*
 *  ======== main ========
 */
int main(void)
{

    //Task_Params taskParams;



    /* Construct tmp007 Task thread */
    /*Task_Params_init(&taskParams);
    taskParams.stackSize = TASKSTACKSIZE;
    taskParams.stack = &task0Stack;
    Task_construct(&task0Struct, (Task_FuncPtr)taskFxn, &taskParams, NULL);*/

    /* Open LED pins */
    /*ledPinHandle = PIN_open(&ledPinState, ledPinTable);
    if(!ledPinHandle) {
        System_abort("Error initializing board LED pins\n");
    }*/

    PIN_Handle mpuPinHandle; //ledPinHandle
    Board_initGeneral();
    Board_initI2C();

    mpuPinHandle = PIN_open(&mpuPinState, MpuPinTable);
    if(!mpuPinHandle) {
        System_abort("Error initializing MPU 9250\n");
    }

    PIN_registerIntCb(mpuPinHandle,SensorMpu9250_Callback);

    //PIN_setOutputValue(ledPinHandle, Board_LED1, 1);

    /*System_printf("Starting the I2C example\nSystem provider is set to SysMin."
                  " Halt the target to view any SysMin contents in ROV.\n");*/
    /* SysMin will only print to the console when you call flush or exit */
    //System_flush();

    /* Start BIOS */
    BIOS_start();

    return (0);
}


