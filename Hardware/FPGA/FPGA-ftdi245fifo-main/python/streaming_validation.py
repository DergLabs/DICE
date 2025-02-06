# -*- coding:utf-8 -*-
# Python3
#
# This program is a test of FPGA+FTDI USB chips (FT232H, FT600, or FT601)
# It sends 16 bytes to FTDI chip. The FPGA immediately returns these data (loopback).
# The program will receive these bytes (they should be as same as the sended 16 bytes)

from USB_FTX232H_FT60X import USB_FTX232H_FT60X_sync245mode
import time
from collections import defaultdict
import numpy as np

# Original data array
'''original_data_array = [
    "A5B4", "1234", "789A", "DEF0", "3456", "9ABC", "F012", "5678",
    "C356", "5678", "BC12", "1234", "7890", "DEAB", "3434", "9090",
    "FEDC", "9876", "3210", "7654", "1098", "5432", "9876", "3210",
    "BA54", "5432", "9876", "3210", "7654", "1098", "5454", "9898",
    "AABB", "DDEE", "1122", "4455", "7788", "AABB", "DDEE", "1122",
    "CCFF", "FF33", "3366", "6699", "99CC", "CCFF", "FF33", "3333",
    "4567", "ABCD", "1234", "789A", "DEF0", "3456", "9ABC", "F012",
    "89EF", "EF56", "56BC", "BC12", "1278", "7834", "DECD", "3434"
]'''

original_data_array = [
    "A5B4", "00A7", "C356", "00B9", "FEDC", "00C3", "BA54", "00D1", "AABB", "00E5", "CCFF", "00F8", "4567", "0084", "89EF", "0092",
    "1234", "00A1", "5678", "00B4", "9876", "00C7", "5432", "00D2", "DDEE", "00E6", "FF33", "00F9", "ABCD", "0085", "EF56", "0093",
    "789A", "00A2", "BC12", "00B5", "3210", "00C8", "9876", "00D3", "1122", "00E7", "3366", "00FA", "1234", "0086", "56BC", "0094",
    "DEF0", "00A3", "1234", "00B6", "7654", "00C9", "3210", "00D4", "4455", "00E8", "6699", "00FB", "789A", "0087", "BC12", "0095",
    "3456", "00A4", "7890", "00B7", "1098", "00CA", "7654", "00D5", "7788", "00E9", "99CC", "00FC", "DEF0", "0088", "1278", "0096",
    "9ABC", "00A5", "DEAB", "00B8", "5432", "00CB", "1098", "00D6", "AABB", "00EA", "CCFF", "00FD", "3456", "0089", "7834", "0097",
    "F012", "00A6", "3434", "00B9", "9876", "00CC", "5454", "00D7", "DDEE", "00EB", "FF33", "00FE", "9ABC", "008A", "DECD", "0098",
    "5678", "00A7", "9090", "00BA", "3210", "00CD", "9898", "00D8", "1122", "00EC", "3333", "00FF", "F012", "008B", "3434", "0099",
    "A5B4", "00A7", "C356", "00B9", "FEDC", "00C3", "BA54", "00D1", "AABB", "00E5", "CCFF", "00F8", "4567", "0084", "89EF", "0092",
    "1234", "00A1", "5678", "00B4", "9876", "00C7", "5432", "00D2", "DDEE", "00E6", "FF33", "00F9", "ABCD", "0085", "EF56", "0093",
    "789A", "00A2", "BC12", "00B5", "3210", "00C8", "9876", "00D3", "1122", "00E7", "3366", "00FA", "1234", "0086", "56BC", "0094",
    "DEF0", "00A3", "1234", "00B6", "7654", "00C9", "3210", "00D4", "4455", "00E8", "6699", "00FB", "789A", "0087", "BC12", "0095",
    "3456", "00A4", "7890", "00B7", "1098", "00CA", "7654", "00D5", "7788", "00E9", "99CC", "00FC", "DEF0", "0088", "1278", "0096",
    "9ABC", "00A5", "DEAB", "00B8", "5432", "00CB", "1098", "00D6", "AABB", "00EA", "CCFF", "00FD", "3456", "0089", "7834", "0097",
    "F012", "00A6", "3434", "00B9", "9876", "00CC", "5454", "00D7", "DDEE", "00EB", "FF33", "00FE", "9ABC", "008A", "DECD", "0098",
    "5678", "00A7", "9090", "00BA", "3210", "00CD", "9898", "00D8", "1122", "00EC", "3333", "00FF", "F012", "008B", "3434", "0099",
    "A5B4", "00A7", "C356", "00B9", "FEDC", "00C3", "BA54", "00D1", "AABB", "00E5", "CCFF", "00F8", "4567", "0084", "89EF", "0092",
    "1234", "00A1", "5678", "00B4", "9876", "00C7", "5432", "00D2", "DDEE", "00E6", "FF33", "00F9", "ABCD", "0085", "EF56", "0093",
    "789A", "00A2", "BC12", "00B5", "3210", "00C8", "9876", "00D3", "1122", "00E7", "3366", "00FA", "1234", "0086", "56BC", "0094",
    "DEF0", "00A3", "1234", "00B6", "7654", "00C9", "3210", "00D4", "4455", "00E8", "6699", "00FB", "789A", "0087", "BC12", "0095",
    "3456", "00A4", "7890", "00B7", "1098", "00CA", "7654", "00D5", "7788", "00E9", "99CC", "00FC", "DEF0", "0088", "1278", "0096",
    "9ABC", "00A5", "DEAB", "00B8", "5432", "00CB", "1098", "00D6", "AABB", "00EA", "CCFF", "00FD", "3456", "0089", "7834", "0097",
    "F012", "00A6", "3434", "00B9", "9876", "00CC", "5454", "00D7", "DDEE", "00EB", "FF33", "00FE", "9ABC", "008A", "DECD", "0098",
    "5678", "00A7", "9090", "00BA", "3210", "00CD", "9898", "00D8", "1122", "00EC", "3333", "00FF", "F012", "008B", "3434", "0099",
    "A5B4", "00A7", "C356", "00B9", "FEDC", "00C3", "BA54", "00D1", "AABB", "00E5", "CCFF", "00F8", "4567", "0084", "89EF", "0092",
    "1234", "00A1", "5678", "00B4", "9876", "00C7", "5432", "00D2", "DDEE", "00E6", "FF33", "00F9", "ABCD", "0085", "EF56", "0093",
    "789A", "00A2", "BC12", "00B5", "3210", "00C8", "9876", "00D3", "1122", "00E7", "3366", "00FA", "1234", "0086", "56BC", "0094",
    "DEF0", "00A3", "1234", "00B6", "7654", "00C9", "3210", "00D4", "4455", "00E8", "6699", "00FB", "789A", "0087", "BC12", "0095",
    "3456", "00A4", "7890", "00B7", "1098", "00CA", "7654", "00D5", "7788", "00E9", "99CC", "00FC", "DEF0", "0088", "1278", "0096",
    "9ABC", "00A5", "DEAB", "00B8", "5432", "00CB", "1098", "00D6", "AABB", "00EA", "CCFF", "00FD", "3456", "0089", "7834", "0097",
    "F012", "00A6", "3434", "00B9", "9876", "00CC", "5454", "00D7", "DDEE", "00EB", "FF33", "00FE", "9ABC", "008A", "DECD", "0098",
    "5678", "00A7", "9090", "00BA", "3210", "00CD", "9898", "00D8", "1122", "00EC", "3333", "00FF", "F012", "008B", "3434", "0099"
]

'''original_data_array = [
    "A7_A5_B4_00", "00A11234", "00A2789A", "00A3DEF0", "00A43456", "00A59ABC", "00A6F012", "00A75678",
    "00B9C356", "00B45678", "00B5BC12", "00B61234", "00B77890", "00B8DEAB", "00B93434", "00BA9090",
    "00C3FEDC", "00C79876", "00C83210", "00C97654", "00CA1098", "00CB5432", "00CC9876", "00CD3210",
    "00D1BA54", "00D25432", "00D39876", "00D43210", "00D57654", "00D61098", "00D75454", "00D89898",
    "00E5AABB", "00E6DDEE", "00E71122", "00E84455", "00E97788", "00EAAABB", "00EBDDEE", "00EC1122",
    "00F8CCFF", "00F9FF33", "00FA3366", "00FB6699", "00FC99CC", "00FDCCFF", "00FEFF33", "00FF3333",
    "00844567", "0085ABCD", "00861234", "0087789A", "0088DEF0", "00893456", "008A9ABC", "008BF012",
    "009289EF", "0093EF56", "009456BC", "0095BC12", "00961278", "00977834", "0098DECD", "00993434",

    "009289EF", "0093EF56", "009456BC", "0095BC12", "00961278", "00977834", "0098DECD", "00993434",
    "00844567", "0085ABCD", "00861234", "0087789A", "0088DEF0", "00893456", "008A9ABC", "008BF012",
    "00F8CCFF", "00F9FF33", "00FA3366", "00FB6699", "00FC99CC", "00FDCCFF", "00FEFF33", "00FF3333",
    "00E5AABB", "00E6DDEE", "00E71122", "00E84455", "00E97788", "00EAAABB", "00EBDDEE", "00EC1122",
    "00D1BA54", "00D25432", "00D39876", "00D43210", "00D57654", "00D61098", "00D75454", "00D89898",
    "00C3FEDC", "00C79876", "00C83210", "00C97654", "00CA1098", "00CB5432", "00CC9876", "00CD3210",
    "00B9C356", "00B45678", "00B5BC12", "00B61234", "00B77890", "00B8DEAB", "00B93434", "00BA9090",
    "00A7A5B4", "00A11234", "00A2789A", "00A3DEF0", "00A43456", "00A59ABC", "00A6F012", "00A75678",

    "00A7A5B4", "00A11234", "00A2789A", "00A3DEF0", "00A43456", "00A59ABC", "00A6F012", "00A75678",
    "00B9C356", "00B45678", "00B5BC12", "00B61234", "00B77890", "00B8DEAB", "00B93434", "00BA9090",
    "00C3FEDC", "00C79876", "00C83210", "00C97654", "00CA1098", "00CB5432", "00CC9876", "00CD3210",
    "00D1BA54", "00D25432", "00D39876", "00D43210", "00D57654", "00D61098", "00D75454", "00D89898",
    "00E5AABB", "00E6DDEE", "00E71122", "00E84455", "00E97788", "00EAAABB", "00EBDDEE", "00EC1122",
    "00F8CCFF", "00F9FF33", "00FA3366", "00FB6699", "00FC99CC", "00FDCCFF", "00FEFF33", "00FF3333",
    "00844567", "0085ABCD", "00861234", "0087789A", "0088DEF0", "00893456", "008A9ABC", "008BF012",
    "009289EF", "0093EF56", "009456BC", "0095BC12", "00961278", "00977834", "0098DECD", "00993434",

    "009289EF", "0093EF56", "009456BC", "0095BC12", "00961278", "00977834", "0098DECD", "00993434",
    "00844567", "0085ABCD", "00861234", "0087789A", "0088DEF0", "00893456", "008A9ABC", "008BF012",
    "00F8CCFF", "00F9FF33", "00FA3366", "00FB6699", "00FC99CC", "00FDCCFF", "00FEFF33", "00FF3333",
    "00E5AABB", "00E6DDEE", "00E71122", "00E84455", "00E97788", "00EAAABB", "00EBDDEE", "00EC1122",
    "00D1BA54", "00D25432", "00D39876", "00D43210", "00D57654", "00D61098", "00D75454", "00D89898",
    "00C3FEDC", "00C79876", "00C83210", "00C97654", "00CA1098", "00CB5432", "00CC9876", "00CD3210",
    "00B9C356", "00B45678", "00B5BC12", "00B61234", "00B77890", "00B8DEAB", "00B93434", "00BA9090",
    "00A7A5B4", "00A11234", "00A2789A", "00A3DEF0", "00A43456", "00A59ABC", "00A6F012", "00A75678"

]'''

'''original_data_array = [
    "00A7A5B4", "00A11234", "00A2789A", "00A3DEF0", "00A43456", "00A59ABC", "00A6F012", "00A75678",
    "00B9C356", "00B45678", "00B5BC12", "00B61234", "00B77890", "00B8DEAB", "00B93434", "00BA9090",
    "00C3FEDC", "00C79876", "00C83210", "00C97654", "00CA1098", "00CB5432", "00CC9876", "00CD3210",
    "00D1BA54", "00D25432", "00D39876", "00D43210", "00D57654", "00D61098", "00D75454", "00D89898",
    "00E5AABB", "00E6DDEE", "00E71122", "00E84455", "00E97788", "00EAAABB", "00EBDDEE", "00EC1122",
    "00F8CCFF", "00F9FF33", "00FA3366", "00FB6699", "00FC99CC", "00FDCCFF", "00FEFF33", "00FF3333",
    "00844567", "0085ABCD", "00861234", "0087789A", "0088DEF0", "00893456", "008A9ABC", "008BF012",
    "009289EF", "0093EF56", "009456BC", "0095BC12", "00961278", "00977834", "0098DECD", "00993434",

    "00A7A5B4", "00A11234", "00A2789A", "00A3DEF0", "00A43456", "00A59ABC", "00A6F012", "00A75678",
    "00B9C356", "00B45678", "00B5BC12", "00B61234", "00B77890", "00B8DEAB", "00B93434", "00BA9090",
    "00C3FEDC", "00C79876", "00C83210", "00C97654", "00CA1098", "00CB5432", "00CC9876", "00CD3210",
    "00D1BA54", "00D25432", "00D39876", "00D43210", "00D57654", "00D61098", "00D75454", "00D89898",
    "00E5AABB", "00E6DDEE", "00E71122", "00E84455", "00E97788", "00EAAABB", "00EBDDEE", "00EC1122",
    "00F8CCFF", "00F9FF33", "00FA3366", "00FB6699", "00FC99CC", "00FDCCFF", "00FEFF33", "00FF3333",
    "00844567", "0085ABCD", "00861234", "0087789A", "0088DEF0", "00893456", "008A9ABC", "008BF012",
    "009289EF", "0093EF56", "009456BC", "0095BC12", "00961278", "00977834", "0098DECD", "00993434",

    "00A7A5B4", "00A11234", "00A2789A", "00A3DEF0", "00A43456", "00A59ABC", "00A6F012", "00A75678",
    "00B9C356", "00B45678", "00B5BC12", "00B61234", "00B77890", "00B8DEAB", "00B93434", "00BA9090",
    "00C3FEDC", "00C79876", "00C83210", "00C97654", "00CA1098", "00CB5432", "00CC9876", "00CD3210",
    "00D1BA54", "00D25432", "00D39876", "00D43210", "00D57654", "00D61098", "00D75454", "00D89898",
    "00E5AABB", "00E6DDEE", "00E71122", "00E84455", "00E97788", "00EAAABB", "00EBDDEE", "00EC1122",
    "00F8CCFF", "00F9FF33", "00FA3366", "00FB6699", "00FC99CC", "00FDCCFF", "00FEFF33", "00FF3333",
    "00844567", "0085ABCD", "00861234", "0087789A", "0088DEF0", "00893456", "008A9ABC", "008BF012",
    "009289EF", "0093EF56", "009456BC", "0095BC12", "00961278", "00977834", "0098DECD", "00993434",

    "00A7A5B4", "00A11234", "00A2789A", "00A3DEF0", "00A43456", "00A59ABC", "00A6F012", "00A75678",
    "00B9C356", "00B45678", "00B5BC12", "00B61234", "00B77890", "00B8DEAB", "00B93434", "00BA9090",
    "00C3FEDC", "00C79876", "00C83210", "00C97654", "00CA1098", "00CB5432", "00CC9876", "00CD3210",
    "00D1BA54", "00D25432", "00D39876", "00D43210", "00D57654", "00D61098", "00D75454", "00D89898",
    "00E5AABB", "00E6DDEE", "00E71122", "00E84455", "00E97788", "00EAAABB", "00EBDDEE", "00EC1122",
    "00F8CCFF", "00F9FF33", "00FA3366", "00FB6699", "00FC99CC", "00FDCCFF", "00FEFF33", "00FF3333",
    "00844567", "0085ABCD", "00861234", "0087789A", "0088DEF0", "00893456", "008A9ABC", "008BF012",
    "009289EF", "0093EF56", "009456BC", "0095BC12", "00961278", "00977834", "0098DECD", "00993434",
]'''

'''original_data_array = [
   "00A7", "A5B4", "00A1", "1234", "00A2", "789A", "00A3", "DEF0", "00A4", "3456", "00A5", "9ABC", "00A6", "F012", "00A7", "5678",
   "00B9", "C356", "00B4", "5678", "00B5", "BC12", "00B6", "1234", "00B7", "7890", "00B8", "DEAB", "00B9", "3434", "00BA", "9090",
   "00C3", "FEDC", "00C7", "9876", "00C8", "3210", "00C9", "7654", "00CA", "1098", "00CB", "5432", "00CC", "9876", "00CD", "3210",
   "00D1", "BA54", "00D2", "5432", "00D3", "9876", "00D4", "3210", "00D5", "7654", "00D6", "1098", "00D7", "5454", "00D8", "9898",
   "00E5", "AABB", "00E6", "DDEE", "00E7", "1122", "00E8", "4455", "00E9", "7788", "00EA", "AABB", "00EB", "DDEE", "00EC", "1122",
   "00F8", "CCFF", "00F9", "FF33", "00FA", "3366", "00FB", "6699", "00FC", "99CC", "00FD", "CCFF", "00FE", "FF33", "00FF", "3333",
   "0084", "4567", "0085", "ABCD", "0086", "1234", "0087", "789A", "0088", "DEF0", "0089", "3456", "008A", "9ABC", "008B", "F012",
   "0092", "89EF", "0093", "EF56", "0094", "56BC", "0095", "BC12", "0096", "1278", "0097", "7834", "0098", "DECD", "0099", "3434"
]'''

'''reference_data = [
    "0B3B", "0700", "0300", "01FF", "063F", "0515", "02FE", "FFFF",
    "FFFC", "04F8", "FE03", "FE01", "FFFF", "00F7", "01FF", "0002",
    "FD00", "FDFE", "FF00", "FFFF", "F501", "FFFA", "FF00", "FF00",
    "0004", "00FC", "0000", "FF00", "FF05", "00FF", "FFFF", "01FF",
    "FD01", "FE01", "00FE", "FF00", "FEFD", "FFFF", "00FF", "FEFF",
    "0002", "00FD", "FF00", "FEFF", "FC00", "0000", "0001", "00FF",
    "0000", "FFFF", "0000", "FF00", "0000", "0000", "00FF", "FEFF",
    "0001", "0000", "00FF", "FFFE", "0000", "0100", "00FF", "FFFF"
]'''

reference_data = [
    "FF60", "0000", "0000", "0000", "0C3B", "0700", "0301", "0100",
    "0740", "0516", "03FE", "00FF", "0000", "0000", "0000", "0000",
    "0008", "0000", "0000", "0000", "FFFD", "05F9", "FE03", "FE01",
    "0000", "00F7", "02FF", "0002", "0000", "0000", "0000", "0000",
    "00F0", "0000", "0000", "0000", "FD01", "FEFE", "0000", "0000",
    "F602", "FFFB", "FF01", "FF01", "0000", "0000", "0000", "0000",
    "0006", "0000", "0000", "0000", "0006", "01FC", "0000", "0001",
    "FF06", "01FF", "00FF", "0100", "0000", "0000", "0000", "0000",
    "00FF", "0000", "0000", "0000", "FE01", "FF01", "00FF", "FF01",
    "FFFE", "FF00", "01FF", "FF00", "0000", "0000", "0000", "0000",
    "00FE", "0000", "0000", "0000", "0103", "00FE", "0000", "FF00",
    "FC00", "0000", "0001", "0000", "0000", "0000", "0000", "0000",
    "0000", "0000", "0000", "0000", "0100", "FF00", "0101", "0001",
    "0001", "0000", "01FF", "FFFF", "0000", "0000", "0000", "0000",
    "0001", "0000", "0000", "0000", "0102", "0001", "0100", "00FF",
    "0001", "0100", "00FF", "00FF", "0000", "0000", "0000", "0000"
]

block_size = 16

# convert to 8x8 2d array, transpose, then convert back to 1d array
#original_data_array = np.array(original_data_array).reshape(block_size, block_size).T.flatten()
#print(f"\n Input Data Shape: {original_data_array.shape}")
'''original_data = ""
for i in range(len(original_data_array)):
    original_data += original_data_array[i]'''


data = ""


class ErrorTracker:
    def __init__(self):
        self.mismatched_transfers = 0
        self.total_transfers = 0
        self.error_details = []

    def check_transfer(self, received_data, reference_data, iteration):
        self.total_transfers += 1
        has_mismatch = False
        mismatches = []

        for i, (received, reference) in enumerate(zip(received_data, reference_data)):
            if received != reference:
                has_mismatch = True
                mismatches.append({
                    'index': i,
                    'received': received,
                    'reference': reference
                })

        if has_mismatch:
            self.mismatched_transfers += 1
            self.error_details.append({
                'iteration': iteration,
                'mismatches': mismatches
            })

    def print_statistics(self):
        print("\n=== Error Statistics ===")
        print(f"Total transfers: {self.total_transfers}")
        print(f"Mismatched transfers: {self.mismatched_transfers}")
        print(f"Error rate: {(self.mismatched_transfers / self.total_transfers) * 100:.2f}%")

        if self.mismatched_transfers > 0:
            print("\nDetailed Error Report:")
            for error in self.error_details:
                print(f"\nIteration {error['iteration']}:")
                print("Index | Received | Reference")
                print("------|----------|----------")
                for mismatch in error['mismatches']:
                    print(f"{mismatch['index']:5d} | {mismatch['received']:8s} | {mismatch['reference']}")


def print_data(data):
    # Print received data in formatted array
    print("\nReceived data array:")
    print("[")
    for i in range(0, len(data), 8):
        row = ", ".join(data[i:i + 8])
        print("    " + row + ",")
    print("]")


def convert_to_hex_values(data):
    hex_values = []
    # Ensure we only process complete pairs of bytes
    data_length = len(data) - (len(data) % 2)  # Adjust length to be even
    for i in range(0, data_length, 2):
        if i + 1 < len(data):  # Check if we have a complete pair
            value = (data[i + 1] << 8) | data[i]
            hex_str = format(value & 0xFFFF, '04X')
            hex_values.append(hex_str)
    return hex_values


def compare_data(original_data, received_data, error_tracker, iteration):
    for i in range(len(received_data)):
        received = received_data[i]
        original = original_data[i]
        if received != original:
            error_tracker.record_error(i, received, original, iteration)


def format_data(original_data_array):
    # Reverse array order
    #data_array = original_data_array[::-1]
    data_array = original_data_array.copy()
    data = ""
    # Reverse byte order within each word
    for i in range(len(data_array)):
        data_array[i] = "".join(map(str.__add__, data_array[i][-2::-2], data_array[i][-1::-2]))

    #print("Reversed data array:")
    print(data_array)

    # Create continuous data string
    for i in range(len(data_array)):
        data += data_array[i]

    return data


def process_received_data(returned_data):
    try:
        # Find index of start marker
        start_marker_index = returned_data.index("0B3B")

        # Take exactly 64 values starting from the marker
        processed_data = returned_data[start_marker_index:start_marker_index + 64]

        # If we don't have enough data after the marker, pad with original data
        if len(processed_data) < 64:
            remaining_needed = 64 - len(processed_data)
            processed_data.extend(returned_data[start_marker_index + len(processed_data):start_marker_index + 64])

        num_removed_start = start_marker_index

    except ValueError:
        print("Warning: Start marker '0B3B' not found in data")
        print("Data: \n")
        print_data(returned_data)
        processed_data = returned_data[:64]  # Take first 64 values if marker not found
        num_removed_start = 0

    return processed_data, num_removed_start


def process_hex_array(hex_array, output_rows, output_cols):
    # Convert hex strings to array of characters (2 chars per byte)
    hex_chars = np.array([list(s) for s in hex_array.flatten()])
    hex_chars = hex_chars.reshape(-1, 4)  # reshape to group 4 chars together (2 bytes)

    # Convert pairs of hex chars to integers
    high_bytes = np.array([int(h, 16) for h in [''.join(pair) for pair in hex_chars[:, :2]]])
    low_bytes = np.array([int(h, 16) for h in [''.join(pair) for pair in hex_chars[:, 2:]]])

    # Convert to signed bytes
    high_bytes = np.where(high_bytes > 127, high_bytes - 256, high_bytes)
    low_bytes = np.where(low_bytes > 127, low_bytes - 256, low_bytes)

    # Interleave high and low bytes
    result = np.empty(len(high_bytes) * 2, dtype=np.int8)
    result[::2] = high_bytes
    result[1::2] = low_bytes

    return result.reshape(output_rows, output_cols)


def decode_data(original_data_array):
    # Reverse byte order within each word
    for i in range(len(original_data_array)):
        original_data_array[i] = "".join(map(str.__add__, original_data_array[i][-2::-2], original_data_array[i][-1::-2]))

    # Split into left and right arrays and reshape to 8x4
    left_temp = []
    right_temp = []
    for row in range(8):
        start_idx = row * 8
        left_temp.extend(original_data_array[start_idx:start_idx + 4])
        right_temp.extend(original_data_array[start_idx + 4:start_idx + 8])

    # Convert to 2D arrays
    left_array = np.array(left_temp).reshape(8, 4)
    right_array = np.array(right_temp).reshape(8, 4)


    print("Left Array:")
    print(left_array)

    print("\nRight Array:")
    print(right_array)
    print("\n")

    # Create 8x8 array for final result
    final_array = np.zeros((8, 8), dtype=np.int8)

    # Process each row
    # Process each element
    result = np.zeros((8, 8), dtype=np.int8)
    for i in range(8):
        for j in range(4):
            # Get current hex value
            hex_val = left_array[i][j]

            # Split into two 8-bit values
            high_byte = int(hex_val[:2], 16)
            low_byte = int(hex_val[2:], 16)

            # Convert to signed integers
            if high_byte > 127:
                high_byte -= 256
            if low_byte > 127:
                low_byte -= 256

            # Store in result array
            result[i][j * 2] = high_byte
            result[i][j * 2 + 1] = low_byte

    # Print result
    #result = np.fliplr(result)
    #print("Recieved Data Array from FPGA:\n")
    #print(result)
    print("\n")
    print("left Recieved Data Array from FPGA:\n")
    print(result)

    result = np.zeros((8, 8), dtype=np.int8)
    for i in range(8):
        for j in range(4):
            # Get current hex value
            hex_val = right_array[i][j]

            # Split into two 8-bit values
            high_byte = int(hex_val[:2], 16)
            low_byte = int(hex_val[2:], 16)

            # Convert to signed integers
            if high_byte > 127:
                high_byte -= 256
            if low_byte > 127:
                low_byte -= 256

            # Store in result array
            result[i][j * 2] = high_byte
            result[i][j * 2 + 1] = low_byte

    # Print result
    #result = np.fliplr(result)
    print("\n")
    print("right Recieved Data Array from FPGA:\n")
    print(result)

    return result



def run_iteration(usb, original_data, error_tracker, iteration):
    data = format_data(original_data)
    #print(f"Formatted data: {data}")
    txlen = usb.send(bytes.fromhex(data))
    print(f"Sent data length (bytes): {txlen}")
    print(f"Sent data length (16b words): {len(data)}")
    time.sleep(0.01)
    returned_data = usb.recv(txlen)
    breakpoint()
    print(f"Received data length (bytes): {len(returned_data)}")

    returned_data = convert_to_hex_values(returned_data)
    print(f"Returned data length (16b words): {len(returned_data)}")

    error_tracker.check_transfer(returned_data, reference_data, iteration)
    return returned_data


def convert_2d_to_4d(block, block_size):
    """Convert a 2D matrix to a 4D matrix of blocks"""
    h, w = block.shape
    x_size = h // block_size
    y_size = w // block_size

    # Reshape to create blocks
    # First reshape to (x_size, block_size, y_size, block_size)
    # Then transpose to get desired block organization
    block_tiles = block.reshape(x_size, block_size, -1, block_size).transpose(0, 2, 1, 3)

    return np.array(block_tiles)

if __name__ == '__main__':
    usb = USB_FTX232H_FT60X_sync245mode(device_to_open_list=
                                        (('FTX232H', 'USB <-> Serial Converter'),
                                         ('FT60X', 'FTDI SuperSpeed-FIFO Bridge')))

    original_data = original_data_array.copy()
    error_tracker = ErrorTracker()
    NUM_ITERATIONS = 1

    print(f"Starting {NUM_ITERATIONS} test iterations...")

    for i in range(NUM_ITERATIONS):
        if (i + 1) % 1000 == 0:
            print(f"\rRunning iteration {i + 1}/{NUM_ITERATIONS}", end="", flush=True)
        returned_data = run_iteration(usb, original_data, error_tracker, i + 1)
        if i == 0:
            print("\n\nFirst iteration received data:")
            print_data(returned_data)

    print("\n\nTest complete!")
    error_tracker.print_statistics()
    print("\nDecoding data...")
    returned_data = np.array(returned_data).reshape(8, 64)
    print(f"Returned data shape: {returned_data.shape}")
    print(f"Returned data: {returned_data}")

    for i in range(8):
        decode_data(returned_data[i])

    usb.close()

