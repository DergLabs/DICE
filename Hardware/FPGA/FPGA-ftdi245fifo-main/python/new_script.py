from USB_FTX232H_FT60X import USB_FTX232H_FT60X_sync245mode          # see USB_FTX232H_FT60X.py
import numpy as np
import sys
from random import randrange


if __name__ == '__main__':
    
    usb = USB_FTX232H_FT60X_sync245mode(device_to_open_list =
        (('FTX232H', 'USB <-> Serial Converter'   ),           # firstly try to open FTX232H (FT232H or FT2232H) device named 'USB <-> Serial Converter'. Note that 'USB <-> Serial Converter' is the default name of FT232H or FT2232H chip unless the user has modified it. If the chip's name has been modified, you can use FT_Prog software to look up it.
         ('FT60X'  , 'FTDI SuperSpeed-FIFO Bridge'))           # secondly try to open FT60X (FT600 or FT601) device named 'FTDI SuperSpeed-FIFO Bridge'. Note that 'FTDI SuperSpeed-FIFO Bridge' is the default name of FT600 or FT601 chip unless the user has modified it.
    )

    #data = np.uint32(0xA7A5B400)

    # data = [51, 55, 69, 42, 13, 37]

    num_items_to_send = 16384
    num_loops = 10000

    bytearays = []

    for x in range(num_loops):
        bytearays.append(bytearray(num_items_to_send))

        for i in range(num_items_to_send):
            bytearays[x][i] = randrange(255)

    print('sending data\n')
    for x in range(num_loops):

        #print(data)
        
        txlen = usb.send(bytes(bytearays[x]))

        data = usb.recv(num_items_to_send)

        #print("recv %d B : %s" % (len(data), str(data)) )


    #data = bytearray(8)
    #data[0] = ord('0')
    #data[1] = 0x54
    #data[2] = 0x69
    #data[3] = 0x42
    #data[4] = 0x13
    #data[5] = 0x37
    #data[6] = 0x51
    #data[7] = 0x55
   

    #txlen = usb.send(bytes.fromhex(dat_string))
    #txlen = usb.send(bytes(data))

    #print("recv %d B : %s" % (len(data), str(data)) )

    usb.close()