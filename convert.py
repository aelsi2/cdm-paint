#!/usr/bin/env python3

import cv2
import sys
from pathlib import Path

def get_value(frame, row, index):
    result = 0
    for i in range(8):
        column = index * 8 + i
        result *= 2
        if frame[row, column][0] > 127:
            result += 1
    return result

in_path = sys.argv[1]
out_path = Path(in_path).stem + ".img" if len(sys.argv) < 3 else sys.argv[2]

cap = cv2.VideoCapture(in_path)
total = cap.get(cv2.CAP_PROP_FRAME_COUNT)
count = 0
out = open(out_path, "w")
out.write("v2.0 raw\n")
while True:
    ret,frame = cap.read()
    count += 1
    hex_frame = '\n'.join(['{:02x}'.format(get_value(frame, row, index)) for row in range(32) for index in [1, 0, 3, 2]])
    out.write(hex_frame)
    out.write("\n")
    if count == total:
        break
print(count)
out.close()
cap.release()
