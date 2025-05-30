from app_libraries import *

image_path = "flowers1.png"  # Replace with your image path
EN_SUBSAMPLE = False
EN_OUTPUT_FILTER = False
EN_FILE_GEN = False
DCT_KERNEL_SIZE = 8
ycrcb_datatype = np.float32
dct_datatype = np.float32
idct_datatype = np.float32

current_images = None
# k values from 0 to 16 in powers of 2
k_values = [0] + [0.125 * (2 ** i) for i in range(8)]  # 0, 0.125 to 32
res_values = [128 * (2 ** i) for i in range(6)]   # 128 to 4096
sigma_values = [0.1 * i for i in range(1, 11)]  # 0.1 to 1.0
edge_threshold_values = [10 * i for i in range(1, 11)]  # 10 to 100
border_width_values = [i for i in range(1, 6)]  # 1 to 5 pixels
sigma_spatial_values = [0.5 * i for i in range(1, 11)]  # 0.5 to 5.0
sigma_intensity_values = [5 * i for i in range(1, 21)]  # 5 to 100
deblock_strength_values = [i for i in range(1, 11)]  # 1 to 10
deblock_threshold_values = [i * 2 for i in range(1, 11)]  # 2 to 20

zoom_scales = {}  # Dictionary to store zoom scales for each window
WINDOW_ORIGINAL = 'Original Image'
WINDOW_PROCESSED = 'Processed Image'
WINDOW_CHANNELS = 'Channel Visualization'
WINDOW_CONTROLS = 'Controls'
active_window = WINDOW_ORIGINAL  # Track which window is currently active

processing_queue = queue.Queue()
current_task = None
processing_thread = None
last_trackbar_update = 0
TRACKBAR_DELAY = 0.1  # 100ms delay between updates
display_needs_update = False  # New flag to track when display should update
