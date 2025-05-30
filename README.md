# DICE - Dynamic Image Compression Engine
<ins>Developed by John Hofmeyr, Claudia Oufft, Michael Haahr, Shahriyar Shawon, Oscar Balan</ins>

*Drexel University Senior Class of 2025*

*Developed under the guidance of Dr. Anup Das*

**Overview**

The goal of this project was to develop a hardware based image processing system and hybrid file format that would take advantage of the benefits from both lossy and lossless image compression. 

By utilizing tiling, different image compression formats can be applied throughout an image based on the content of the tile. Improved image quality can be obtained when comapred to fully lossy compression, while maintaining file sizes smaller than that of fully lossless images. Our proposed solution utilizes a hardware optimized JPEG encoder for lossy compression and a novel hardware optimized arithmetic encoder for lossless compression.

**Implementation**

Image files are loaded and pre-processed into a pixel datastream using the Dice Reference compression tool. Image pre-processing consists of extracting the R, G and B channels from the image, applying matrix folding to create the 32x32 pixel tiles, and finally creating the byte arrays of raw pixels to be sent to the FPGA via USB. 

The FT600 USB FIFO is used to send and receive image data. Raw image data is sent to the FPGA module and loaded into a CDC FIFO buffer. The buffer stores 4KB of pixel data (equivalent to a 32x32 tile using 32b per pixel (8b for R, G, B and one spare byte to simplify processing). 

The pixels are then sent to the hardware statistics core to compute the mean, variance and std. deviation of the Laplacian and X/Y gradient kernels. The Variance of the Laplacian kernel values provides a numerical value that quantifies the blurryness of the tile while the mean and std. deviation of the 2d X/Y gradient values provide an indication of large changes in contrast, color or sharp edges in the tile. This information is used to determine what compression method should be used based on pre-defined threshold values. 

While the tile statistics are calculated, the pixel data is sent to both the Lossy and Lossless compression cores, with the processed data being buffered in output hold ram. Once the compression determination is made, the output data streams from both hold rams are muxed, selecting only one to be transmitted back to the FT600. 

**Hardware Platform** 

A dual board hardware platform was developed for this project. The hardware architecture is split into two modules, the IO moduel and FPGA module. The IO module provides video connectivity, high speed USB connectivity, USB-PD power control and monitoring, and Debug/JTAG IO. Below is a list of all IO available: 

- 4 Lane MIPI CSI (upto 2Gb/s per lane)
- HDMI 2.0 (Upto 4K 30FPS via Sii1136)
- USB 3.0 5Gb/s to FT600
- 3x USB 2.0 (1x for RP2040, 1x for FT2232, 1x for FPGA module MCU)
- Configurable USB-PD control allowing for upto 15V 5A
- Voltage, Current, Power & Temperature monitoring
- UART & JTAG for FPGA
- 12x GPIOs from RP2040 MCU to FPGA
- 16-bit USB FIFO Bus to FPGA (upto 1Gb/s)

The FPGA Module provides all of the processing hardware and implements the custom designed image processor. A Xilinx Kintex Ultrascale+ KU3P was utilized. Two DC-DC converters generate all voltage rails, the TDA38840 provides 0.85V at upto 40A for the FPGA VCCINT, and an LT7200 is used to generate 3.3V, 5V, 1.8V and 1.2V at 3A per channel. All rails have voltage, current, power and temperature monitoring. An onboard 200MHz oscillator provides the main system clock for the FPGA. Four 512Mb HyperRam 3.0 memory modules are also present. Each memory chip provides a 16-bit 250MHz DDR bus. The memory chips have been routed to allow for two banks of two chips each with length matching between chips 0/1 and 2/3. 

**Hardware Architecture**

The harware platform is split between two modules; the IO module and the FPGA module. The IO module contains all user IO, USB Power handling and supporting interface hardware. The FPGA module contains the Kintex US+ KU3P FPGA, 4x HyperRam modules, power supplies, FPGA clock, and onboard microcontroller. 

*IO Module Specifications*
- USB-C 3.0 Data & Power Port, supports 5Gb/s USB & USB-PD 2.1 (upto 20V 5A)
- 4 lane MIPI CSI
- HDMI 1.4b, supports 4K30
- FT600 USB FIFO, supports 1Gb/s bandwidth over 16-bit bus
- FT2232 confgired for JTAG and UART
- RP2040 for data logging & control

*FPGA Module Specifications*
- Kintex Ultrascale+ KU3P FPGA
- 4x HyperRam 3.0 512Mb
- RP2040 MCU
- LT7200S DC-DC (1.8v, 1.2v, 3.3v, 5v at 3A each)
- TDA38840A DC-DC (0.85V VCCINT at 40A)
- INA700 power monitors on 1.8v, 1.2v, 3.3v
- INA236 power monitor on 0.85V
- 4x User LED's
- 8x GPIO debug pads
- 200MHz System Clock
- 256Mb configuration memory

The following diagram outlines the top level hardware configuration:
![Hardware Top Level Diagram](https://github.com/DergLabs/DICE/blob/main/Hardware/Diagrams/Hardware%20Architecture/DICE%20General%20Hardware%20Architecture%20-%20Top%20Level%20Architecture.png)


**Lossy Compression Architecture**

The lossy compression method implemented for this design is a hardware optimized version of JPEG encoding. The JPEG implementation has been designed to work on 8 pixels per clock cycle, using a serial-to-parallel input register to convert the serial pixel input stream into 8 parallel pixel streams. The simplified architecture for the lossy core is shown below.

![Lossy compression core](https://github.com/DergLabs/DICE/blob/main/Hardware/Diagrams/FPGA%20Architecture/JPEG%20Core%20Pipeline.png)

In addition to the JPEG compression core, RGB to YCrCb conversion is performed. The implementation for this is shown below.

![RGB to YCrCb](https://github.com/DergLabs/DICE/blob/main/Hardware/Diagrams/FPGA%20Architecture/FPGA%20Based%20RGB%20to%20YCrCb.png)

In order to determine which compression method to utilize, statistics from the gradient and laplacian kernels is used. The current implementation uses the variance of the X/Y gradient and Laplacian convolutions. Variance was chosen as it provides a good representation of texture, edge transitions, and blur. The implementation of the gradient and laplacian calculations are shown below. Note, only the X sobel computation is shown, however the Y computation is identical.

<ins>Laplacian Core</ins>
![Laplacian Core](https://github.com/DergLabs/DICE/blob/main/Hardware/Diagrams/FPGA%20Architecture/Laplacian%20Implementation.png)

<ins>Gradient Core</ins>
![Gradient Core](https://github.com/DergLabs/DICE/blob/main/Hardware/Diagrams/FPGA%20Architecture/Gradient%20Implementation.png)


**Lossless Compression Architecture**

TODO: Finish me

**Software Tools**

TODO: Finish me

**DICE File Format**

TODO: Finish me

**Research Papers & References**

TODO: Finish me
























