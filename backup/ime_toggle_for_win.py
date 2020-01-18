import os
import platform
if os.name != 'nt' and platform.system() != 'Windows':
    sys.exit()

import sys
import ctypes
from ctypes import wintypes
#from ctypes import POINTER, WINFUNCTYPE
#from ctypes import byref
#from ctypes.wintypes import BOOL, HANDLE, DWORD


WM_IME_CONTROL = 0x0283
IMC_GETOPENSTATUS = 0x05
IMC_SETOPENSTATUS = 0x06
IMC_GETCONVERSIONMODE = 0x0001
IMC_SETCONVERSIONMODE = 0x0002

IME_CMODE_ALPHANUMERIC = 0x0000
IME_CMODE_NATIVE = 0x0001
IME_CMODE_CHARCODE = 0x0020

hwnd = ctypes.windll.user32.GetForegroundWindow()
imwd = ctypes.windll.imm32.ImmGetDefaultIMEWnd(hwnd)

conversion = ctypes.windll.user32.SendMessageW(imwd, WM_IME_CONTROL, IMC_GETCONVERSIONMODE, 0)

if conversion & IME_CMODE_NATIVE != 0:
    print('a')
else:
    print('n')

if len(sys.argv) > 1:
    if sys.argv[1] == 'a':  # alphanumeric
        ctypes.windll.user32.SendMessageW(imwd, WM_IME_CONTROL, IMC_SETCONVERSIONMODE, IME_CMODE_ALPHANUMERIC)
    elif sys.argv[1] == 'n': # native
        ctypes.windll.user32.SendMessageW(imwd, WM_IME_CONTROL, IMC_SETCONVERSIONMODE, IME_CMODE_NATIVE)

    sys.exit()

if conversion & IME_CMODE_NATIVE != 0:
    ctypes.windll.user32.SendMessageW(imwd, WM_IME_CONTROL, IMC_SETCONVERSIONMODE, IME_CMODE_ALPHANUMERIC)
else:
    ctypes.windll.user32.SendMessageW(imwd, WM_IME_CONTROL, IMC_SETCONVERSIONMODE, IME_CMODE_NATIVE)
