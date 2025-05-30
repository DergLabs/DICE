library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

package mipi_parameters is

    constant FPGA_SERIES            : string := "ULTRASCALE_PLUS";
    constant ENABLE_COLOR_BAR_TEST  : boolean := false;     -- Enable Color Bar Test Pattern

    constant LANES                  : integer := 4;         -- Number of MIPI D-PHY lanes, 2 for IMX219, 4 for IMX477
    constant SERDES_DATA_WIDTH      : integer := 8;         -- ISERDES output bit width
    constant PIXEL_WIDTH            : integer := 10;        -- Bits/pixel from camera
    constant PIXELS_PER_CLOCK       : integer := 4;         -- Output pixels per clock, set to 2 for 2 Lane MIPI and 4 for 4 Lane MIPI
    constant USE_LP_FRAME_DETECT    : boolean := false;     -- 1 uses start frame packet as frame sync, 0 uses LP singals
    constant GENERATE_IDELAYCTRL    : boolean := true;      -- Generate IDELAYCTRL

    constant DPHY_TERM              : boolean := false;     -- Enable D-PHY termination
    constant DHY0_INVERT            : boolean := false;     -- Invert DPHY0 P/N polirity
    constant DHY1_INVERT            : boolean := false;     -- Invert DPHY1 P/N polirity
    constant DHY2_INVERT            : boolean := false;     -- Invert DPHY2 P/N polirity
    constant DHY3_INVERT            : boolean := false;     -- Invert DPHY3 P/N polirity

    constant DPHY0_SKEW             : natural := 10;        -- DPHY0 skew
    constant DPHY1_SKEW             : natural := 10;        -- DPHY1 skew
    constant DPHY2_SKEW             : natural := 10;        -- DPHY2 skew             
    constant DPHY3_SKEW             : natural := 10;        -- DPHY3 skew

    constant VIDEO_RESOLUTION       : string := "3840P_30"; -- Video resolution

    constant VIDEO_HLENGTH          : natural := 4056;      -- Total visible and blanking pixels per line
    constant VIDEO_VLENGTH          : natural := 3040;      -- Total visible and blanking lines per frame
    constant VIDEO_HSYNC_POL        : boolean := true;      -- Hsync polarity: true for positive sync, false for negative sync
    constant VIDEO_HSYNC_LEN        : natural := 88;        -- Horizontal sync length in pixels
    constant VIDEO_HBP_LEN          : natural := 122;       -- Horizontal back porch length (excluding sync)
    constant VIDEO_H_VISIBLE        : natural := 3840;      -- Number of visible pixels per line

    constant VIDEO_VSYNC_POL        : boolean := true;      -- Vsync polarity: true for positive sync, false for negative sync
    constant VIDEO_VSYNC_LEN        : natural := 3;         -- Vertical sync length in lines
    constant VIDEO_VBP_LEN          : natural := 23;        -- Vertical back porch length (excluding sync)
    constant VIDEO_V_VISIBLE        : natural := 2160;      -- Number of visible lines per frame


end package mipi_parameters;