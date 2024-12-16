# Dice IO Module Firmware

## Build
`-DCAM_TARGET` can be either 477 for IMX477 or 219 for IMX219

If in `build` directory...
```bash
$ cmake .. -DCAM_TARGET=<219|477>
$ make
```

If in `dice_io_module_firmware` directory
If in build directory...
```bash
$ cmake -S . -B build -DCAM_TARGET=<219|477>
$ cmake --build build
```
