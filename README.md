# ERTC — Embedded Real-Time Control Labs

STM32F767ZI (Nucleo-144) lab projects developed during the Embedded Real-Time Control course at the University of Padova.

**A.Y. 2024-2025 — Prof. Alberto Morato**

## Labs

### LAB1 — GPIO and I2C peripheral control (`LAB1_Base/`)
Introduction to STM32CubeIDE and the HAL library. Configuration of GPIO pins and I2C communication with the SX1509 GPIO expander to read a keypad matrix. First experience with real-time periodic task scheduling using timer interrupts.

### LAB2 — IMU reading and servo control (`LAB2_IMU_SERVO/`)
Reading orientation data (Euler angles and raw accelerometer) from the BNO055 IMU over I2C. Control of a servo motor position based on the measured tilt angle. Data logged to PC in real time via UART/UDP using the COBS framing protocol and the ERTC datalogger library. MATLAB scripts for post-processing and plotting of the acquired signals.

### LAB3 — DC motor PI speed control (`LAB3_MotorControl_Base/`)
Independent PI speed control of two DC motors. Wheel velocity is estimated from quadrature encoder counts read via timer (TIM3, TIM4) and converted to RPM. The PI controller computes the voltage command applied as a PWM duty cycle. Speed reference is sent from PC via UART. MATLAB scripts compare open-loop and closed-loop step responses at different reference speeds (±60 RPM) for both motors.

### LAB4 — Line following on TurtleBot (`LAB4_Line_following/`)

![Line Following Demo](LAB4_Line_following/demo.gif)

Two-level cascaded controller for autonomous line following on the TurtleBot platform:
- **Outer loop (yaw-rate):** an 8-element IR sensor array (read via SX1509 over I2C) computes a lateral error `phi_err` as the weighted centroid of active sensors. A proportional controller generates a yaw-rate reference: `yaw_rate = kp * phi_err`.
- **Inner loop (wheel speed):** the yaw-rate reference is converted to individual wheel speed references using the unicycle differential-drive model (`w_1`, `w_2`), each tracked by an independent PI controller.
- Speed reference magnitude is selectable at runtime (10 / 25 / 37 RPM) via push-buttons. Data logged over UDP; MATLAB scripts analyze wheel speed tracking and yaw dynamics.

## Hardware

- **MCU:** STM32F767ZI (ARM Cortex-M7, 216 MHz)
- **Board:** ST Nucleo-144
- **Robot platform:** TurtleBot
- **Toolchain:** STM32CubeIDE · STM32CubeMX · HAL drivers

## Report & Presentation

- `Embedded_Laboratory_Report_group4.pdf` — final lab report
- `ERTC presentation Group 4.pptx` — project presentation
