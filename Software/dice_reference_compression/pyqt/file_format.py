import sys
import math
from dataclasses import dataclass
import pprint
import struct

main_header_fmt = "32s I I I H H H B B 32s 16s B B B B"
lossless_header_fmt = ">IIQ"
lossy_header_fmt = ">IIQ"


@dataclass
class CompressionHeader:
    num_tiles: int
    bytes_per_tile: int
    reserved: int
    y: list[int]
    cr: list[int]
    cb: list[int]


@dataclass
class MainHeader:
    file_id: str
    main_header_size: int
    lossless_size: int
    lossy_size: int
    dim_x: int
    dim_y: int
    tile_dim: int
    channels_subsample_word_size: int
    res1: int
    dequantization_table: list[int]
    decode_table: list[int]
    ych_quality: int
    crch_quality: int
    cbch_quality: int
    res2: int
    tile_id_grid: list[int]


@dataclass
class DiceFile:
    main_header: MainHeader
    lossless_header: CompressionHeader
    lossy_header: CompressionHeader


def create_dice_file(
    filename: str,
    xdim: int,
    ydim: int,
    tiledim: int,
    lossless_data,
    lossy_data,
    dq_table: bytes,
    decode_table: bytes,
):
    # 2 means bytes per tile
    lossless_header = create_lossless_header(
        xdim * ydim, 2, lossless_data[0], lossless_data[1], lossless_data[2]
    )
    lossy_header = create_lossy_header(lossy_data)
    main_header = create_main_header(
        xdim, ydim, tiledim, dq_table, decode_table
    )

    with open(filename, "wb") as f:
        f.write(main_header)
        f.write(lossless_header)
        f.write(lossy_header)


def create_main_header(
    xdim, ydim, tiledim, dq_table: bytes, decode_table: bytes
) -> bytes:
    """
    file_id: 32 Bytes
    main_header_size: 4 Bytes
    lossless_size: 4 Bytes
    lossy_size: 4 Bytes
    dim_x: 2 Bytes
    dim_y: 2 Bytes
    tile_dim: 2 Bytes
    channels_subsample_word_size: 1 Byte
    reserved: 1 Byte
    dequantization_table: 32 Byte
    decode_table: 16 Byte
    ych_quality: 1 Byte
    crch_quality: 1 Byte
    cbch_quality: 1 Byte
    reserved: 1 Byte
    # tile_id_grid:
    """
    file_id = b"DICE IMG-V01-JH-MH-CO-OB-SS-0325"
    tile_id_grid_size = math.ceil(((xdim * ydim)) / (tiledim**2))
    main_header_size = 104 + tile_id_grid_size
    print(
        f"The Tile ID Grid size is {tile_id_grid_size} making the main header size {main_header_size} (104 + {tile_id_grid_size})"
    )
    lossless_size = 16
    lossy_size = 16
    dim_x = xdim
    dim_y = ydim
    tile_dim = tiledim
    channels_subsample_word_size = 0xFF
    reserved = 0
    dequantization_table = dq_table
    decode_table = decode_table
    ych_quality = 1
    crch_quality = 1
    cbch_quality = 1
    reserved = 0
    tile_id_grid = bytes([0] * 4096)

    return struct.pack(
        main_header_fmt + f" {tile_id_grid_size}H",
        file_id,
        main_header_size,
        lossless_size,
        lossy_size,
        dim_x,
        dim_y,
        tile_dim,
        channels_subsample_word_size,
        reserved,
        dequantization_table,
        decode_table,
        ych_quality,
        crch_quality,
        cbch_quality,
        reserved,
        *tile_id_grid,
    )


def create_lossless_header(num_tiles: int, bytes_per_tile: int, y, cr, cb) -> bytes:
    """
    num_tiles: 4 Bytes
    bytes_per_tile: 4 Bytes
    reserved: 4 Bytes
    y: ¯\_(ツ)_/¯
    cr: ¯\_(ツ)_/¯
    cb: ¯\_(ツ)_/¯
    """

    ysize = sys.getsizeof(y)
    crsize = sys.getsizeof(cr)
    cbsize = sys.getsizeof(cb)

    header_with_data_fmt = f"{lossless_header_fmt}<{ysize}s{crsize}s{cbsize}s"

    return struct.pack(header_with_data_fmt, num_tiles, bytes_per_tile, 0, y, cr, cb)


def create_lossy_header(lossy_data) -> bytes:
    """
    num_tiles: 4 Bytes
    bytes_per_tile: 4 Bytes
    reserved: 4 Bytes
    y: ¯\_(ツ)_/¯
    cr: ¯\_(ツ)_/¯
    cb: ¯\_(ツ)_/¯
    """
    return struct.pack(
        f"{lossless_header_fmt}<{sys.getsizeof(lossy_data)}s", 10, 2, 0, lossy_data
    )


def read_dice_file(dice_img_path: str) -> DiceFile:
    with open(dice_img_path, "rb") as f:
        f.read(32)
        main_header_size: int = struct.unpack("I", f.read(4))[0]
        # Divide by 2 because there are n 2 byte values
        # I want just the n value
        tile_id_grid_size = (main_header_size - 104) // 2
        lossless_header_offset = 104 + ((main_header_size - 104)) * 2

        print(f"Main header size is {main_header_size}")
        f.seek(0)

        # Had to do this because using * to unpack
        # the entire struct passed to many args to
        # the MainHeader constructor
        unpacked_mh = struct.unpack(
            main_header_fmt + f" {tile_id_grid_size}H", f.read(main_header_size)
        )
        fixed_fields = unpacked_mh[:15]
        tile_id_grid = list(unpacked_mh[15:])

        mh = MainHeader(*fixed_fields, tile_id_grid=tile_id_grid)

        f.seek(0)
        f.read(lossless_header_offset)
        unpacked_llh = struct.unpack(lossless_header_fmt, f.read(16))
        llh = CompressionHeader(*unpacked_llh, y=[], cr=[], cb=[])

        unpacked_lyh = struct.unpack(lossy_header_fmt, f.read(16))
        lyh = CompressionHeader(*unpacked_lyh, y=[], cr=[], cb=[])

        # pprint.pprint(mh)
        # pprint.pprint(llh)
        # pprint.pprint(lyh)
        # df = DiceFile(mh, llh, lyh)
        pprint.pprint(df)
        return df
    pass


if __name__ == "__main__":
    create_dice_file("test.dice", 2048, 2048, 32, [], [], bytes(), bytes())
    df = read_dice_file("test.dice")
