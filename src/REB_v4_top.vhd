----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:13:28 06/30/2015 
-- Design Name: 
-- Module Name:    REB_v4_top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

use work.ads8634_and_mux_top_package.all;

entity REB_v4_top is

  port (
    ------ Clock signals ------
    -- PGP serdes clk
    PgpRefClk_P : in std_logic;
    PgpRefClk_M : in std_logic;

    ------ PGP signals ------
    PgpRx_P : in  std_logic;
    PgpRx_M : in  std_logic;
    PgpTx_P : out std_logic;
    PgpTx_M : out std_logic;

    ------ CCD 1 ------
    -- CCD ADC
    adc_data_t_ccd_1 : in  std_logic_vector(7 downto 0);
    adc_data_b_ccd_1 : in  std_logic_vector(7 downto 0);
    adc_cnv_ccd_1    : out std_logic;
    adc_sck_ccd_1    : out std_logic;

    -- ASPIC signals
    ASPIC_r_up_ccd_1_p   : out std_logic;
    ASPIC_r_up_ccd_1_n   : out std_logic;
    ASPIC_r_down_ccd_1_p : out std_logic;
    ASPIC_r_down_ccd_1_n : out std_logic;
    ASPIC_clamp_ccd_1_p  : out std_logic;
    ASPIC_clamp_ccd_1_n  : out std_logic;
    ASPIC_reset_ccd_1_p  : out std_logic;
    ASPIC_reset_ccd_1_n  : out std_logic;
    ASPIC_nap_ccd_1      : out std_logic;

    -- ASPIC control signals
    ASPIC_miso_ccd_1      : in  std_logic; 
    ASPIC_ss_t_ccd_1      : out std_logic;
    ASPIC_ss_b_ccd_1      : out std_logic;
    ASPIC_spi_reset_ccd_1 : out std_logic;
    ASPIC_sclk_ccd_1      : out std_logic;
    ASPIC_mosi_ccd_1      : out std_logic;

    -- CCD Clocks signals
    par_clk_ccd_1_p    : out std_logic_vector(3 downto 0);
    par_clk_ccd_1_n    : out std_logic_vector(3 downto 0);
    ser_clk_ccd_1_p    : out std_logic_vector(2 downto 0);
    ser_clk_ccd_1_n    : out std_logic_vector(2 downto 0);
    reset_gate_ccd_1_p : out std_logic;
    reset_gate_ccd_1_n : out std_logic;

    -- CCD BIAS DAC
    ldac_C_BIAS_ccd_1 : out std_logic;
    din_C_BIAS_ccd_1  : out std_logic;
    sync_C_BIAS_ccd_1 : out std_logic;
    sclk_C_BIAS_ccd_1 : out std_logic;


    ------ CCD 2 ------
    -- CCD ADC
    adc_data_t_ccd_2 : in  std_logic_vector(7 downto 0);
    adc_data_b_ccd_2 : in  std_logic_vector(7 downto 0);
    adc_cnv_ccd_2    : out std_logic;
    adc_sck_ccd_2    : out std_logic;

    -- ASPIC signals
    ASPIC_r_up_ccd_2_p   : out std_logic;
    ASPIC_r_up_ccd_2_n   : out std_logic;
    ASPIC_r_down_ccd_2_p : out std_logic;
    ASPIC_r_down_ccd_2_n : out std_logic;
    ASPIC_clamp_ccd_2_p  : out std_logic;
    ASPIC_clamp_ccd_2_n  : out std_logic;
    ASPIC_reset_ccd_2_p  : out std_logic;
    ASPIC_reset_ccd_2_n  : out std_logic;
    ASPIC_nap_ccd_2      : out std_logic;

-- ASPIC control signals
    ASPIC_miso_ccd_2      : in  std_logic;
    ASPIC_ss_t_ccd_2      : out std_logic;
    ASPIC_ss_b_ccd_2      : out std_logic;
    ASPIC_spi_reset_ccd_2 : out std_logic;
    ASPIC_sclk_ccd_2      : out std_logic;
    ASPIC_mosi_ccd_2      : out std_logic;

    -- CCD Clocks signals
    par_clk_ccd_2_p    : out std_logic_vector(3 downto 0);
    par_clk_ccd_2_n    : out std_logic_vector(3 downto 0);
    ser_clk_ccd_2_p    : out std_logic_vector(2 downto 0);
    ser_clk_ccd_2_n    : out std_logic_vector(2 downto 0);
    reset_gate_ccd_2_p : out std_logic;
    reset_gate_ccd_2_n : out std_logic;

    -- CCD BIAS DAC
    ldac_C_BIAS_ccd_2 : out std_logic;
    din_C_BIAS_ccd_2  : out std_logic;
    sync_C_BIAS_ccd_2 : out std_logic;
    sclk_C_BIAS_ccd_2 : out std_logic;

    ------ CCD 3 ------
    -- CCD ADC
    adc_data_t_ccd_3 : in  std_logic_vector(7 downto 0);
    adc_data_b_ccd_3 : in  std_logic_vector(7 downto 0);
    adc_cnv_ccd_3    : out std_logic;
    adc_sck_ccd_3    : out std_logic;

    -- ASPIC signals
    ASPIC_r_up_ccd_3_p   : out std_logic;
    ASPIC_r_up_ccd_3_n   : out std_logic;
    ASPIC_r_down_ccd_3_p : out std_logic;
    ASPIC_r_down_ccd_3_n : out std_logic;
    ASPIC_clamp_ccd_3_p  : out std_logic;
    ASPIC_clamp_ccd_3_n  : out std_logic;
    ASPIC_reset_ccd_3_p  : out std_logic;
    ASPIC_reset_ccd_3_n  : out std_logic;
    ASPIC_nap_ccd_3      : out std_logic;

    -- ASPIC control signals
    ASPIC_miso_ccd_3      : in  std_logic;
    ASPIC_ss_t_ccd_3      : out std_logic;
    ASPIC_ss_b_ccd_3      : out std_logic;
    ASPIC_spi_reset_ccd_3 : out std_logic;
    ASPIC_sclk_ccd_3      : out std_logic;
    ASPIC_mosi_ccd_3      : out std_logic;

    -- CCD Clocks signals
    par_clk_ccd_3_p    : out std_logic_vector(3 downto 0);
    par_clk_ccd_3_n    : out std_logic_vector(3 downto 0);
    ser_clk_ccd_3_p    : out std_logic_vector(2 downto 0);
    ser_clk_ccd_3_n    : out std_logic_vector(2 downto 0);
    reset_gate_ccd_3_p : out std_logic;
    reset_gate_ccd_3_n : out std_logic;

    -- CCD BIAS DAC
    ldac_C_BIAS_ccd_3 : out std_logic;
    din_C_BIAS_ccd_3  : out std_logic;
    sync_C_BIAS_ccd_3 : out std_logic;
    sclk_C_BIAS_ccd_3 : out std_logic;


    -- V & I sensors  
    LTC2945_SCL : inout std_logic;
    LTC2945_SDA : inout std_logic;

    LTC2945n15_SCL : inout std_logic;
    LTC2945n15_SDA : inout std_logic;

    --          ------ Temperature ------
    -- DREB PCB temperature
    sda_temp0 : inout std_logic;
    scl_temp0 : inout std_logic;

    -- REB PCB temperature
    sda_temp1 : inout std_logic;
    scl_temp1 : inout std_logic;
    sda_temp2 : inout std_logic;
    scl_temp2 : inout std_logic;

--      -- CCD temperatures
    csb_24ADC  : out std_logic;
    sclk_24ADC : out std_logic;
    din_24ADC  : out std_logic;
    dout_24ADC : in  std_logic;

    ------ bias and Temp ADC ------
    bias_t_adc_miso         : in  std_logic;
    bias_t_adc_cs           : out std_logic;
    bias_t_adc_sclk         : out std_logic;
    bias_t_adc_mosi         : out std_logic;
    bias_t_adc_sam_mux_en   : out std_logic;
    bias_t_adc_bias_mux_en  : out std_logic;
    bias_t_adc_sam_mux_sel  : out std_logic_vector(2 downto 0);
    bias_t_adc_bias_mux_sel : out std_logic_vector(2 downto 0);
    bias_t_adc_shdn         : out std_logic;  -- 0 means Shutdown 

    ------ DACs ------
-- CCD clock rails DAC
    ldac_RAILS      : out std_logic;
    din_RAILS       : out std_logic;
    sclk_RAILS      : out std_logic;
    sync_RAILS_dac0 : out std_logic;
    sync_RAILS_dac1 : out std_logic;

-- CCD heaters
    ldac_HTR : out std_logic;
    din_HTR  : out std_logic;
    sync_HTR : out std_logic;
    sclk_HTR : out std_logic;

-- bacbias sw
    backbias_clamp : out std_logic;
    backbias_ssbe  : out std_logic;

    ------ MISC ------
-- Resistors
    r_add          : in    std_logic_vector(7 downto 0);
-- Test port
    TEST           : out   std_logic_vector(12 downto 0);
-- Test led
    TEST_LED       : out   std_logic_vector(6 downto 0);
-- Power ON reset
    Pwron_Rst_L    : in    std_logic;
-- Power down CCD ADC opamp (active low)
    CCD_OPAMP_PD   : out   std_logic;
-- DC-DC power sync
    PWR_SYNC1      : out   std_logic;
-- REB serial number
    reb_sn_onewire : inout std_logic
    );

end REB_v4_top;

architecture Behavioral of REB_v4_top is

  component LsstSci is
    generic (
      -------------------------------------------------------------------------
      -- RAFT_DATA_CONVERSION specifies the method used to put the 18 bit
      -- raft data into the 16 bit PGP pipe.
      --
      -- Currently, the choices are:
      -- ZERO_EXTEND_32: Zero extend the data to 32 bits (halves bandwidth)
      -- TRUNC_LOW_2   : Truncate the low 2 bits (loses precision)
      -------------------------------------------------------------------------
      RAFT_DATA_CONVERSION : string
      );      
    port (

      -------------------------------------------------------------------------
      -- FPGA Interface
      -------------------------------------------------------------------------
      FpgaRstL : in std_logic;

      PgpClkP : in  std_logic;
      PgpClkM : in  std_logic;
      PgpRxP  : in  std_logic;
      PgpRxM  : in  std_logic;
      PgpTxP  : out std_logic;
      PgpTxM  : out std_logic;

      -------------------------------------------------------------------------
      -- Clock/Reset Generator Interface
      -------------------------------------------------------------------------
      ClkOut : out std_logic;
      RstOut : out std_logic;

      -------------------------------------------------------------------------
      -- Debug Interface
      -------------------------------------------------------------------------
      PgpLocLinkReadyOut : out std_logic;
      PgpRemLinkReadyOut : out std_logic;

      -------------------------------------------------------------------------
      -- SCI Register Encoder/Decoder Interface
      -------------------------------------------------------------------------
      RegClk    : in  std_logic;
      RegRst    : in  std_logic;
      RegAddr   : out std_logic_vector(23 downto 0);
      RegReq    : out std_logic;
      RegOp     : out std_logic;
      RegDataWr : out std_logic_vector(31 downto 0);
      RegWrEn   : out std_logic_vector(31 downto 0);
      RegAck    : in  std_logic;
      RegFail   : in  std_logic;
      RegDataRd : in  std_logic_vector(31 downto 0);

      -------------------------------------------------------------------------
      -- Data Encoder Interface
      -------------------------------------------------------------------------
      DataClk  : in std_logic;
      DataWrEn : in std_logic;
      DataSOT  : in std_logic;
      DataEOT  : in std_logic;
      DataIn   : in std_logic_vector(17 downto 0);

      -------------------------------------------------------------------------
      -- Status Block Interface
      -------------------------------------------------------------------------
      StatusClk  : in  std_logic;
      StatusRst  : in  std_logic;
      StatusAddr : in  std_logic_vector(23 downto 0);
      StatusReg  : out std_logic_vector(31 downto 0);

      -------------------------------------------------------------------------
      -- Chipscope Control Bus
      -------------------------------------------------------------------------
      CScopeControl : inout std_logic_vector(35 downto 0)
      );

  end component;

  component REB_v4_cmd_interpreter is
    port (reset                    : in  std_logic;
          clk                      : in  std_logic;
-- signals from/to SCI
          regReq                   : in  std_logic;  -- with this line the master start a read/write procedure (1 to start)
          regOp                    : in  std_logic;  -- this line define if the procedure is read or write (1 to write)
          regAddr                  : in  std_logic_vector(23 downto 0);  -- address bus
          statusReg                : in  std_logic_vector(31 downto 0);  -- status reg bus. The RCI handle this bus and this machine pass it to the sure if he wants to read it
          regWrEn                  : in  std_logic_vector(31 downto 0);  -- write enable bus. This bus enables the data write bits
          regDataWr_masked         : in  std_logic_vector(31 downto 0);  -- data write bus masked. Is the logical AND of data write bus and write enable bus
          regAck                   : out std_logic;  -- acknowledge line to activate when the read/write procedure is completed
          regFail                  : out std_logic;  -- line to activate when an error occurs during the read/write procedure
          regDataRd                : out std_logic_vector(31 downto 0);  -- data bus to RCI used to transfer read data
          StatusReset              : out std_logic;  -- status block reset   
-- Base Register Set signals            
          busy_bus                 : in  std_logic_vector(31 downto 0);  -- busy bus is composed by the different register sets busy
          time_base_actual_value   : in  std_logic_vector(63 downto 0);  -- time base value 
          trig_tm_value_SB         : in  std_logic_vector(63 downto 0);  -- Status Block trigger time 
          trig_tm_value_TB         : in  std_logic_vector(63 downto 0);  -- Time Base trigger time
          trig_tm_value_seq        : in  std_logic_vector(63 downto 0);  -- Sequencer Trigger time
          trig_tm_value_V_I        : in  std_logic_vector(63 downto 0);  -- Voltage and current sens trigger time
          trig_tm_value_pcb_t      : in  std_logic_vector(63 downto 0);  -- PCB temperature Trigger time
          trigger_ce_bus           : out std_logic_vector(31 downto 0);  -- bus to enable register sets trigger. To trigger a register set that stops itself use en AND val                                      
          trigger_val_bus          : out std_logic_vector(31 downto 0);  -- bus of register sets trigger values  
          load_time_base_lsw       : out std_logic;  -- ce signal to load the time base lsw
          load_time_base_MSW       : out std_logic;  -- ce signal to load the time base MSW
          cnt_preset               : out std_logic_vector(63 downto 0);  -- preset value for the time base counter
          Mgt_avcc_ok              : in  std_logic;
          Mgt_accpll_ok            : in  std_logic;
          Mgt_avtt_ok              : in  std_logic;
          V3_3v_ok                 : in  std_logic;
          Switch_addr              : in  std_logic_vector(7 downto 0);
-- Image parameters
          image_size               : in  std_logic_vector(31 downto 0);  -- this register contains the image size
          image_patter_read        : in  std_logic;  -- this register gives the state of image patter gen. 1 is ON
          ccd_sel_read             : in  std_logic_vector(2 downto 0);  -- this register contains the CCD to drive
          image_size_en            : out std_logic;  -- this line enables the register where the image size is written
          image_patter_en          : out std_logic;  -- this register enable the image patter gen. 1 is ON
          ccd_sel_en               : out std_logic;  -- register enable for CCD acquisition selector
-- Sequencer
          seq_time_mem_readbk      : in  std_logic_vector(15 downto 0);  -- time memory read bus
          seq_out_mem_readbk       : in  std_logic_vector(31 downto 0);  -- time memory read bus
          seq_prog_mem_readbk      : in  std_logic_vector(31 downto 0);  -- sequencer program memory read
          seq_time_mem_w_en        : out std_logic;  -- this signal enables the time memory write
          seq_out_mem_w_en         : out std_logic;  -- this signal enables the output memory write
          seq_prog_mem_w_en        : out std_logic;  -- this signal enables the program memory write
          seq_step                 : out std_logic;  -- this signal send the STEP to the sequencer. Valid on in infinite loop (the machine jump out from IL to next function)   
          seq_stop                 : out std_logic;  -- this signal send the STOP to the sequencer. Valid on in infinite loop (the machine jump out from IL to next function)
          enable_conv_shift_in     : in  std_logic;  -- this signal enable the adc_conv shifter (the adc_conv is shifted 1 clk every time is activated)
          enable_conv_shift        : out std_logic;  -- this signal enable the adc_conv shifter (the adc_conv is shifted 1 clk every time is activated)
          init_conv_shift          : out std_logic;  -- this signal initialize the adc_conv shifter (the adc_conv is shifted 1 clk every time is activated)
          start_add_prog_mem_en    : out std_logic;
          start_add_prog_mem_rbk   : in  std_logic_vector(9 downto 0);
          seq_ind_func_mem_we      : out std_logic;
          seq_ind_func_mem_rdbk    : in  std_logic_vector(3 downto 0);
          seq_ind_rep_mem_we       : out std_logic;
          seq_ind_rep_mem_rdbk     : in  std_logic_vector(23 downto 0);
          seq_ind_sub_add_mem_we   : out std_logic;
          seq_ind_sub_add_mem_rdbk : in  std_logic_vector(9 downto 0);
          seq_ind_sub_rep_mem_we   : out std_logic;
          seq_ind_sub_rep_mem_rdbk : in  std_logic_vector(15 downto 0);
          seq_op_code_error        : in  std_logic;
          seq_op_code_error_add    : in  std_logic_vector(9 downto 0);
          seq_op_code_error_reset  : out std_logic;
-- ASPIC
          aspic_config_r_ccd_1     : in  std_logic_vector(15 downto 0);
          aspic_config_r_ccd_2     : in  std_logic_vector(15 downto 0);
          aspic_config_r_ccd_3     : in  std_logic_vector(15 downto 0);
          aspic_op_end             : in  std_logic;
          aspic_start_trans        : out std_logic;
          aspic_start_reset        : out std_logic;
-- CCD bias DAC         
          ccd_1_bias_load_start    : out std_logic;
          ccd_1_bias_ldac_start    : out std_logic;
          ccd_2_bias_load_start    : out std_logic;
          ccd_2_bias_ldac_start    : out std_logic;
          ccd_3_bias_load_start    : out std_logic;
          ccd_3_bias_ldac_start    : out std_logic;
-- CCD clock rails DAC          
          clk_rail_load_start      : out std_logic;
          clk_rail_ldac_start      : out std_logic;
-- Heater DAC           
          htr_load_start           : out std_logic;
          htr_ldac_start           : out std_logic;
-- DREB voltage and current sensors
          v6_voltage               : in  std_logic_vector(15 downto 0);
          v6_voltage_error         : in  std_logic;
          v6_current               : in  std_logic_vector(15 downto 0);
          v6_current_error         : in  std_logic;
          v9_voltage               : in  std_logic_vector(15 downto 0);
          v9_voltage_error         : in  std_logic;
          v9_current               : in  std_logic_vector(15 downto 0);
          v9_current_error         : in  std_logic;
          v24_voltage              : in  std_logic_vector(15 downto 0);
          v24_voltage_error        : in  std_logic;
          v24_current              : in  std_logic_vector(15 downto 0);
          v24_current_error        : in  std_logic;
          v40_voltage              : in  std_logic_vector(15 downto 0);
          v40_voltage_error        : in  std_logic;
          v40_current              : in  std_logic_vector(15 downto 0);
          v40_current_error        : in  std_logic;
          vn15_voltage             : in  std_logic_vector(15 downto 0);
          vn15_voltage_error       : in  std_logic;
          vn15_current             : in  std_logic_vector(15 downto 0);
          vn15_current_error       : in  std_logic;
-- DREB temperature
          T1_dreb                  : in  std_logic_vector(15 downto 0);
          T1_dreb_error            : in  std_logic;
          T2_dreb                  : in  std_logic_vector(15 downto 0);
          T2_dreb_error            : in  std_logic;
-- REB temperature gr1
          T1_reb_gr1               : in  std_logic_vector(15 downto 0);
          T1_reb_gr1_error         : in  std_logic;
          T2_reb_gr1               : in  std_logic_vector(15 downto 0);
          T2_reb_gr1_error         : in  std_logic;
          T3_reb_gr1               : in  std_logic_vector(15 downto 0);
          T3_reb_gr1_error         : in  std_logic;
          T4_reb_gr1               : in  std_logic_vector(15 downto 0);
          T4_reb_gr1_error         : in  std_logic;
-- REB temperature gr2
          T1_reb_gr2               : in  std_logic_vector(15 downto 0);
          T1_reb_gr2_error         : in  std_logic;
          T2_reb_gr2               : in  std_logic_vector(15 downto 0);
          T2_reb_gr2_error         : in  std_logic;
          T3_reb_gr2               : in  std_logic_vector(15 downto 0);
          T3_reb_gr2_error         : in  std_logic;
          T4_reb_gr2               : in  std_logic_vector(15 downto 0);
          T4_reb_gr2_error         : in  std_logic;
-- bias and temp ADC 
          bias_t_adc_busy          : in  std_logic;
          bias_t_adc_data          : in  array716;
          bias_t_adc_start_t       : out std_logic;
          bias_t_adc_start_b       : out std_logic;
          bias_t_adc_start_r       : out std_logic;
-- CCD temperature
          ccd_temp_busy            : in  std_logic;
          ccd_temp                 : in  std_logic_vector(23 downto 0);
          ccd_temp_start           : out std_logic; 
          ccd_temp_start_reset     : out std_logic;
-- REB 1wire serial number
          reb_onewire_reset        : out std_logic;
          reb_sn_crc_ok            : in  std_logic;
          reb_sn_dev_error         : in  std_logic;
          reb_sn                   : in  std_logic_vector(47 downto 0);
          reb_sn_timeout           : in  std_logic;
-- back bias switch
          back_bias_sw_rb          : in  std_logic;
          back_bias_cl_rb          : in  std_logic;
          en_back_bias_sw          : out std_logic;
-- multiboot
          start_multiboot          : out std_logic;
-- XADC
          xadc_drdy_out            : in  std_logic;
          xadc_ot_out              : in  std_logic;  -- Over-Temperature alarm output
          xadc_vccaux_alarm_out    : in  std_logic;  -- VCCAUX-sensor alarm output
          xadc_vccint_alarm_out    : in  std_logic;  -- VCCINT-sensor alarm output
          xadc_user_temp_alarm_out : in  std_logic;  -- Temperature-sensor alarm output
          xadc_vbram_alarm_out     : in  std_logic;  -- VCCINT-sensor alarm output
          xadc_alarm_out           : in  std_logic;  -- OR'ed output of all the Alarms
          xadc_channel_out         : in  std_logic_vector (4 downto 0);
          xadc_do_out              : in  std_logic_vector(15 downto 0);
          xadc_den_in              : out std_logic;
-- DC/DC clock enable
          dcdc_clk_en_in           : in  std_logic;
          dcdc_clk_en              : out std_logic
          );
  end component;

  component base_reg_set_top is
    port (
      clk                : in  std_logic;
      reset              : in  std_logic;
      en_time_base_cnt   : in  std_logic;
      load_time_base_lsw : in  std_logic;
      load_time_base_MSW : in  std_logic;
      StatusReset        : in  std_logic;
      trigger_TB         : in  std_logic;
      trigger_seq        : in  std_logic;
      trigger_V_I_read   : in  std_logic;
      trigger_temp_pcb   : in  std_logic;
      cnt_preset         : in  std_logic_vector(63 downto 0);
      cnt_busy           : out std_logic;
      cnt_actual_value   : out std_logic_vector(63 downto 0);
      trig_tm_value_SB   : out std_logic_vector(63 downto 0);
      trig_tm_value_TB   : out std_logic_vector(63 downto 0);
      trig_tm_value_seq  : out std_logic_vector(63 downto 0);
      trig_tm_value_V_I  : out std_logic_vector(63 downto 0);
      trig_tm_value_pcb  : out std_logic_vector(63 downto 0)
      );
  end component;

  component sequencer_v3_top is
    port (
      reset                    : in  std_logic;  -- syncronus reset
      clk                      : in  std_logic;  -- clock
      start_sequence           : in  std_logic;
      program_mem_we           : in  std_logic;
      seq_mem_w_add            : in  std_logic_vector(9 downto 0);
      seq_mem_data_in          : in  std_logic_vector(31 downto 0);
      prog_mem_redbk           : out std_logic_vector(31 downto 0);
      program_mem_init_en      : in  std_logic;
      program_mem_init_add_rbk : out std_logic_vector(9 downto 0);
      ind_func_mem_we          : in  std_logic;
      ind_func_mem_redbk       : out std_logic_vector(3 downto 0);
      ind_rep_mem_we           : in  std_logic;
      ind_rep_mem_redbk        : out std_logic_vector(23 downto 0);
      ind_sub_add_mem_we       : in  std_logic;
      ind_sub_add_mem_redbk    : out std_logic_vector(9 downto 0);
      ind_sub_rep_mem_we       : in  std_logic;
      ind_sub_rep_mem_redbk    : out std_logic_vector(15 downto 0);
      time_mem_w_en            : in  std_logic;
      time_mem_readbk          : out std_logic_vector(15 downto 0);
      out_mem_w_en             : in  std_logic;
      out_mem_readbk           : out std_logic_vector(31 downto 0);
      stop_sequence            : in  std_logic;
      step_sequence            : in  std_logic;
      op_code_error_reset      : in  std_logic;
      op_code_error            : out std_logic;
      op_code_error_add        : out std_logic_vector(9 downto 0);
      sequencer_busy           : out std_logic;
      sequencer_out            : out std_logic_vector(31 downto 0);
      end_sequence             : out std_logic
--       CScopeControl                          : inout std_logic_vector(35 downto 0)
      );
  end component;

  component sequencer_aligner_shifter_top is
    generic(start_adc_bit : natural := 12);
    port (
      clk           : in  std_logic;
      reset         : in  std_logic;
      shift_on_en   : in  std_logic;
      shift_on      : in  std_logic;
      init_shift    : in  std_logic;
      sequencer_in  : in  std_logic_vector(31 downto 0);
      shift_on_out  : out std_logic;
      sequencer_out : out std_logic_vector(31 downto 0)
      );
  end component;

  component ADC_data_handler_v4 is
    port (
      reset             : in  std_logic;
      clk               : in  std_logic;
      testmode_rst      : in  std_logic;
      testmode_col      : in  std_logic; 
      start_of_img      : in  std_logic;  -- this signal is generated by the user (using the sequencer) and has to arrive before the first trigger
      end_of_img        : in  std_logic;  -- this signal is generated by the user (using the sequencer) and has to arrive after the last  ADC trasfer
      end_sequence      : in  std_logic;  -- this signal is the end of sequence generated by the sequencer and is used as a timeot to generate EOF.
      trigger           : in  std_logic;  -- this signal start the operations (ADC conv and send data to PGP)
      en_test_mode      : in  std_logic;  -- register enable for pattern test mode
      test_mode_in      : in  std_logic;  -- test mode in 
      en_load_ccd_sel   : in  std_logic;  -- register enable for CCD enable
      ccd_sel_in        : in  std_logic_vector(2 downto 0);  -- register to select which CCD acquire (1, 2 or 3) 
      ccd_sel_out       : out std_logic_vector(2 downto 0);  -- register to select which CCD acquire (1, 2 or 3) 
      SOT               : out std_logic;  -- Start of Image
      EOT               : out std_logic;  -- End of Image
      write_enable      : out std_logic;  -- signal to write the image in the PGP
      test_mode_enb_out : out std_logic;
      data_out          : out std_logic_vector(17 downto 0);  -- 18 bits ADC word 
      adc_data_ccd_1    : in  std_logic_vector(15 downto 0);  -- CCD ADC data 
      adc_cnv_ccd_1     : out std_logic;  -- ADC conv
      adc_sck_ccd_1     : out std_logic;  -- ADC serial clock
      adc_data_ccd_2    : in  std_logic_vector(15 downto 0);  -- CCD ADC data 
      adc_cnv_ccd_2     : out std_logic;  -- ADC conv
      adc_sck_ccd_2     : out std_logic;  -- ADC serial clock
      adc_data_ccd_3    : in  std_logic_vector(15 downto 0);  -- CCD ADC data 
      adc_cnv_ccd_3     : out std_logic;  -- ADC conv
      adc_sck_ccd_3     : out std_logic   -- ADC serial clock
      );
  end component;

  component aspic_3_spi_link_top_mux is
    port (
      clk                : in  std_logic;
      reset              : in  std_logic;
      start_link_trans   : in  std_logic;
      start_reset        : in  std_logic;
      miso_ccd1          : in  std_logic;
      miso_ccd2          : in  std_logic;
      miso_ccd3          : in  std_logic;
      word2send          : in  std_logic_vector(31 downto 0);
      aspic_mosi         : out std_logic;
      ss_t_ccd1          : out std_logic;
      ss_t_ccd2          : out std_logic;
      ss_t_ccd3          : out std_logic;
      ss_b_ccd1          : out std_logic;
      ss_b_ccd2          : out std_logic;
      ss_b_ccd3          : out std_logic;
      aspic_sclk         : out std_logic;
      aspic_n_reset      : out std_logic;
      busy               : out std_logic;
      d_slave_ready_ccd1 : out std_logic;
      d_slave_ready_ccd2 : out std_logic;
      d_slave_ready_ccd3 : out std_logic;
      d_from_slave_ccd1  : out std_logic_vector(15 downto 0);
      d_from_slave_ccd2  : out std_logic_vector(15 downto 0);
      d_from_slave_ccd3  : out std_logic_vector(15 downto 0)
      );
  end component;

  component ad53xx_DAC_top is
    port (
      clk         : in  std_logic;
      reset       : in  std_logic;
      start_write : in  std_logic;
      start_ldac  : in  std_logic;
      d_to_slave  : in  std_logic_vector(15 downto 0);
      mosi        : out std_logic;
      ss          : out std_logic;
      sclk        : out std_logic;
      ldac        : out std_logic
      );
  end component;

  component dual_ad53xx_DAC_top is
    port (
      clk         : in  std_logic;
      reset       : in  std_logic;
      start_write : in  std_logic;
      start_ldac  : in  std_logic;
      d_to_slave  : in  std_logic_vector(16 downto 0);
      mosi        : out std_logic;
      ss_dac_0    : out std_logic;
      ss_dac_1    : out std_logic;
      sclk        : out std_logic;
      ldac        : out std_logic
      );
  end component;

  component ad56xx_DAC_top is
    port (
      clk         : in  std_logic;
      reset       : in  std_logic;
      start_write : in  std_logic;
      start_ldac  : in  std_logic;
      d_to_slave  : in  std_logic_vector(23 downto 0);
      mosi        : out std_logic;
      ss          : out std_logic;
      sclk        : out std_logic;
      ldac        : out std_logic
      );
  end component;


  component ltc2945_multi_read_top is
    port (
      clk               : in    std_logic;
      reset             : in    std_logic;
      start_procedure   : in    std_logic;
      busy              : out   std_logic;
      error_v6_voltage  : out   std_logic;
      v6_voltage_out    : out   std_logic_vector(15 downto 0);
      error_v6_current  : out   std_logic;
      v6_current_out    : out   std_logic_vector(15 downto 0);
      error_v9_voltage  : out   std_logic;
      v9_voltage_out    : out   std_logic_vector(15 downto 0);
      error_v9_current  : out   std_logic;
      v9_current_out    : out   std_logic_vector(15 downto 0);
      error_v24_voltage : out   std_logic;
      v24_voltage_out   : out   std_logic_vector(15 downto 0);
      error_v24_current : out   std_logic;
      v24_current_out   : out   std_logic_vector(15 downto 0);
      error_v40_voltage : out   std_logic;
      v40_voltage_out   : out   std_logic_vector(15 downto 0);
      error_v40_current : out   std_logic;
      v40_current_out   : out   std_logic_vector(15 downto 0);
      sda               : inout std_logic;  --serial data output of i2c bus
      scl               : inout std_logic   --serial clock output of i2c bus
      );
  end component;

  component ltc2945_single_read_top is
    port (
      clk              : in    std_logic;
      reset            : in    std_logic;
      start_procedure  : in    std_logic;
      busy             : out   std_logic;
      error_v1_voltage : out   std_logic;
      v1_voltage_out   : out   std_logic_vector(15 downto 0);
      error_v1_current : out   std_logic;
      v1_current_out   : out   std_logic_vector(15 downto 0);
      sda              : inout std_logic;  --serial data output of i2c bus
      scl              : inout std_logic   --serial clock output of i2c bus
      );
  end component;

  component adt7420_temp_multiread_2_top is
    port (
      clk             : in    std_logic;
      reset           : in    std_logic;
      start_procedure : in    std_logic;
      busy            : out   std_logic;
      error_T1        : out   std_logic;
      T1_out          : out   std_logic_vector(15 downto 0);
      error_T2        : out   std_logic;
      T2_out          : out   std_logic_vector(15 downto 0);
      sda             : inout std_logic;  --serial data output of i2c bus
      scl             : inout std_logic   --serial clock output of i2c bus
      );
  end component;

  component adt7420_temp_multiread_4_top is
    port (
      clk             : in    std_logic;
      reset           : in    std_logic;
      start_procedure : in    std_logic;
      busy            : out   std_logic;
      error_T1        : out   std_logic;
      T1_out          : out   std_logic_vector(15 downto 0);
      error_T2        : out   std_logic;
      T2_out          : out   std_logic_vector(15 downto 0);
      error_T3        : out   std_logic;
      T3_out          : out   std_logic_vector(15 downto 0);
      error_T4        : out   std_logic;
      T4_out          : out   std_logic_vector(15 downto 0);
      sda             : inout std_logic;  --serial data output of i2c bus
      scl             : inout std_logic   --serial clock output of i2c bus 
      );
  end component;


  component ads8634_and_mux_top
    port (
      clk                  : in  std_logic;
      reset                : in  std_logic;
      start_multiread      : in  std_logic;
      start_singleread     : in  std_logic;
      start_read_adc_reg   : in  std_logic;
      mux_address_in       : in  std_logic_vector(5 downto 0);
      data_to_adc          : in  std_logic_vector(15 downto 0);
      miso                 : in  std_logic;
      mosi                 : out std_logic;
      ss                   : out std_logic;
      sclk                 : out std_logic;
      link_busy            : out std_logic;
      pwd_line             : out std_logic;
      mux_sam_en_out       : out std_logic;
      mux_bias_en_out      : out std_logic;
      mux_sam_address_out  : out std_logic_vector(2 downto 0);
      mux_bias_address_out : out std_logic_vector(2 downto 0);
      data_out             : out array716);
  end component;




  component ad7794_top is
    port (
      clk             : in  std_logic;
      reset           : in  std_logic;
      start           : in  std_logic;
      start_reset     : in  std_logic;
      read_write      : in  std_logic;
      ad7794_dout_rdy : in  std_logic;
      reg_add         : in  std_logic_vector(2 downto 0);
      d_to_slave      : in  std_logic_vector(15 downto 0);
      ad7794_din      : out std_logic;
      ad7794_cs       : out std_logic;
      ad7794_sclk     : out std_logic;
      busy            : out std_logic;
      d_from_slave    : out std_logic_vector(23 downto 0)
      );
  end component;

  component onewire_iface
    generic (
      CheckCRC   : boolean;
      ADD_PULLUP : boolean;
      CLK_DIV    : integer range 0 to 12);
    port (
      sys_clk     : in    std_logic;    -- system clock (50Mhz)
      latch_reset : in    std_logic;
      sys_reset   : in    std_logic;    -- active high syn. reset 
      dq          : inout std_logic;    -- connect to the 1-wire bus
      dev_error   : out   std_logic;
      data        : out   std_logic_vector(7 downto 0);    -- data output
      data_valid  : out   std_logic;    -- data output valid (20us strobe)
      crc_ok      : out   std_logic;    -- crc ok signal (active high)
      timeout     : out   std_logic;    -- timeout signal ~10ms
      sn_data     : out   std_logic_vector(47 downto 0));  -- parallel out
  end component;

  component clk_2MHz_generator is
    port (
      clk             : in  std_logic;
      reset           : in  std_logic;
      clk_2MHz_en     : in  std_logic;
      clk_2MHz_en_in  : in  std_logic;
      clk_2MHz_en_out : out std_logic;
      clk_2MHz_out    : out std_logic
      );
  end component;

  component dcm_user_clk
    port
      (                                 -- Clock in ports
        CLK_IN1  : in  std_logic;
        -- Clock out ports
        CLK_OUT1 : out std_logic;
        CLK_OUT2 : out std_logic;

        -- Status and control signals
        LOCKED : out std_logic
        );
  end component;

  component ff_ce is
    port (
      reset    : in  std_logic;         -- syncronus reset
      clk      : in  std_logic;         -- clock
      data_in  : in  std_logic;         -- data in
      ce       : in  std_logic;         -- clock enable
      data_out : out std_logic);        -- data out
  end component;

  component ff_ce_pres is
    port (
      preset   : in  std_logic;
      clk      : in  std_logic;
      data_in  : in  std_logic;
      ce       : in  std_logic;
      data_out : out std_logic
      ); 
  end component;

  component led_blink is
    port (
      clk_in  : in  std_logic;
      led_out : out std_logic);
  end component;

  component multiboot_fsm is
    port (
      TRIGGER : in std_logic;
      SYSCLK  : in std_logic
      );
  end component;

  component mon_xadc
    port (
      DADDR_IN            : in  std_logic_vector (6 downto 0);  -- Address bus for the dynamic reconfiguration port
      DCLK_IN             : in  std_logic;  -- Clock input for the dynamic reconfiguration port
      DEN_IN              : in  std_logic;  -- Enable Signal for the dynamic reconfiguration port
      DI_IN               : in  std_logic_vector (15 downto 0);  -- Input data bus for the dynamic reconfiguration port
      DWE_IN              : in  std_logic;  -- Write Enable for the dynamic reconfiguration port
      BUSY_OUT            : out std_logic;  -- ADC Busy signal
      CHANNEL_OUT         : out std_logic_vector (4 downto 0);  -- Channel Selection Outputs
      DO_OUT              : out std_logic_vector (15 downto 0);  -- Output data bus for dynamic reconfiguration port
      DRDY_OUT            : out std_logic;  -- Data ready signal for the dynamic reconfiguration port
      EOC_OUT             : out std_logic;  -- End of Conversion Signal
      EOS_OUT             : out std_logic;  -- End of Sequence Signal
      OT_OUT              : out std_logic;  -- Over-Temperature alarm output
      VCCAUX_ALARM_OUT    : out std_logic;  -- VCCAUX-sensor alarm output
      VCCINT_ALARM_OUT    : out std_logic;  -- VCCINT-sensor alarm output
      USER_TEMP_ALARM_OUT : out std_logic;  -- Temperature-sensor alarm output
      VBRAM_ALARM_OUT     : out std_logic;  -- VCCINT-sensor alarm output
      ALARM_OUT           : out std_logic;  -- OR'ed output of all the Alarms
      VP_IN               : in  std_logic;  -- Dedicated Analog Input Pair
      VN_IN               : in  std_logic
      );
  end component;

-- chipscope
  component DREB_V2_icon
    port (
      CONTROL0 : inout std_logic_vector(35 downto 0);
      CONTROL1 : inout std_logic_vector(35 downto 0));
  end component;

  component DREB_v2_ila
    port (
      CONTROL : inout std_logic_vector(35 downto 0);
      CLK     : in    std_logic;
      TRIG0   : in    std_logic_vector(95 downto 0);
      TRIG1   : in    std_logic_vector(95 downto 0));
  end component;



-- Clocks
  signal pgpRefClk   : std_logic;
  signal usrClk      : std_logic;
  signal clk_100_Mhz : std_logic;
  signal clk_50_Mhz  : std_logic;

-- Reset
  signal n_rst      : std_logic;
  signal usrRst     : std_logic;
  signal sync_res   : std_logic;
  signal sync_res_1 : std_logic;
  signal sync_res_2 : std_logic;

-- SCI signals
  signal pgpLocLinkReady : std_logic;
  signal pgpRemLinkReady : std_logic;
  signal regReq          : std_logic;
  signal regOp           : std_logic;
  signal RegAddr         : std_logic_vector(23 downto 0);
  signal RegDataWr       : std_logic_vector(31 downto 0);
  signal regAck          : std_logic;
  signal regFail         : std_logic;
  signal RegDataRd       : std_logic_vector(31 downto 0);
  signal RegWrEn         : std_logic_vector(31 downto 0);
  signal dataWrEn        : std_logic;
  signal dataSOT         : std_logic;
  signal dataEOT         : std_logic;
  signal image_in        : std_logic_vector(17 downto 0);
  signal StatusAddr      : std_logic_vector(23 downto 0);
  signal StatusReg       : std_logic_vector(31 downto 0);
  signal StatusRst       : std_logic;

  -- CMD interpreter signals
  signal regDataWr_masked   : std_logic_vector(31 downto 0);
  signal busy_bus           : std_logic_vector(31 downto 0);
  signal trigger_ce_bus     : std_logic_vector(31 downto 0);
  signal trigger_val_bus    : std_logic_vector(31 downto 0);
  signal load_time_base_lsw : std_logic;
  signal load_time_base_MSW : std_logic;
  signal cnt_preset         : std_logic_vector(63 downto 0);

  -- BRS signals
  signal time_base_actual_value : std_logic_vector(63 downto 0);
  signal trig_tm_value_SB       : std_logic_vector(63 downto 0);
  signal trig_tm_value_TB       : std_logic_vector(63 downto 0);
  signal trig_tm_value_seq      : std_logic_vector(63 downto 0);
  signal trig_tm_value_V_I      : std_logic_vector(63 downto 0);
  signal trig_tm_value_pcb_t    : std_logic_vector(63 downto 0);
  signal time_base_busy         : std_logic;

  -- sequencer signals
  signal sequencer_busy           : std_logic;
  signal seq_time_mem_readbk      : std_logic_vector(15 downto 0);
  signal seq_out_mem_readbk       : std_logic_vector(31 downto 0);
  signal seq_prog_mem_readbk      : std_logic_vector(31 downto 0);
  signal seq_time_mem_w_en        : std_logic;
  signal seq_out_mem_w_en         : std_logic;
  signal seq_prog_mem_w_en        : std_logic;
  signal seq_start                : std_logic;
  signal seq_step                 : std_logic;
  signal seq_stop                 : std_logic;
  signal sequencer_outputs        : std_logic_vector(31 downto 0);
  signal sequencer_outputs_int    : std_logic_vector(31 downto 0);
  signal enable_conv_shift        : std_logic;
  signal enable_conv_shift_out    : std_logic;
  signal init_conv_shift          : std_logic;
  signal end_sequence             : std_logic;
  signal start_add_prog_mem_en    : std_logic;
  signal start_add_prog_mem_rbk   : std_logic_vector(9 downto 0);
  signal seq_ind_func_mem_we      : std_logic;
  signal seq_ind_func_mem_rdbk    : std_logic_vector(3 downto 0);
  signal seq_ind_rep_mem_we       : std_logic;
  signal seq_ind_rep_mem_rdbk     : std_logic_vector(23 downto 0);
  signal seq_ind_sub_add_mem_we   : std_logic;
  signal seq_ind_sub_add_mem_rdbk : std_logic_vector(9 downto 0);
  signal seq_ind_sub_rep_mem_we   : std_logic;
  signal seq_ind_sub_rep_mem_rdbk : std_logic_vector(15 downto 0);
  signal seq_op_code_error        : std_logic;
  signal seq_op_code_error_reset  : std_logic;
  signal seq_op_code_error_add    : std_logic_vector(9 downto 0);


-- Image handler signals
--      signal image_size                               : std_logic_vector(31 downto 0);
  signal image_patter_read : std_logic;
--      signal image_size_en                    : std_logic;
  signal image_patter_en   : std_logic;
  signal ADC_trigger       : std_logic;
  signal CCD_sel_en        : std_logic;
  signal CCD_sel           : std_logic_vector(2 downto 0);
  signal start_of_img      : std_logic;
  signal end_of_img        : std_logic;
  signal pattern_reset     : std_logic;

  -- ASPIC config signals
  signal aspic_start_trans    : std_logic;
  signal aspic_start_reset    : std_logic;
  signal aspic_busy           : std_logic;
  signal aspic_config_r_ccd_1 : std_logic_vector (15 downto 0);
  signal aspic_config_r_ccd_2 : std_logic_vector (15 downto 0);
  signal aspic_config_r_ccd_3 : std_logic_vector (15 downto 0);
  signal ASPIC_spi_reset_int  : std_logic;
  signal ASPIC_sclk_int       : std_logic;
  signal ASPIC_mosi_int       : std_logic;

  -- CCD bias DAC
  signal bias_load_start_ccd_1 : std_logic;
  signal bias_ldac_start_ccd_1 : std_logic;
  signal bias_load_start_ccd_2 : std_logic;
  signal bias_ldac_start_ccd_2 : std_logic;
  signal bias_load_start_ccd_3 : std_logic;
  signal bias_ldac_start_ccd_3 : std_logic;

  -- CCD clock rails DAC
  signal clk_rail_load_start : std_logic;
  signal clk_rail_ldac_start : std_logic;

  -- Heaters DAC
  signal htr_load_start   : std_logic;
  signal htr_ldac_start   : std_logic;
  -- CCD 1 signals
  signal par_clk_ccd_1    : std_logic_vector(3 downto 0);
  signal ser_clk_ccd_1    : std_logic_vector(2 downto 0);
  signal reset_gate_ccd_1 : std_logic;
  signal adc_data_ccd_1   : std_logic_vector(15 downto 0);

-- CCD 2 signals
  signal par_clk_ccd_2    : std_logic_vector(3 downto 0);
  signal ser_clk_ccd_2    : std_logic_vector(2 downto 0);
  signal reset_gate_ccd_2 : std_logic;
  signal adc_data_ccd_2   : std_logic_vector(15 downto 0);

-- CCD 3 signals
  signal par_clk_ccd_3    : std_logic_vector(3 downto 0);
  signal ser_clk_ccd_3    : std_logic_vector(2 downto 0);
  signal reset_gate_ccd_3 : std_logic;
  signal adc_data_ccd_3   : std_logic_vector(15 downto 0);

  -- ASPIC CCD 1
  signal ASPIC_r_up_ccd_1   : std_logic;
  signal ASPIC_r_down_ccd_1 : std_logic;
  signal ASPIC_clamp_ccd_1  : std_logic;
  signal ASPIC_reset_ccd_1  : std_logic;

  -- ASPIC CCD 2
  signal ASPIC_r_up_ccd_2   : std_logic;
  signal ASPIC_r_down_ccd_2 : std_logic;
  signal ASPIC_clamp_ccd_2  : std_logic;
  signal ASPIC_reset_ccd_2  : std_logic;

  -- ASPIC CCD 3
  signal ASPIC_r_up_ccd_3   : std_logic;
  signal ASPIC_r_down_ccd_3 : std_logic;
  signal ASPIC_clamp_ccd_3  : std_logic;
  signal ASPIC_reset_ccd_3  : std_logic;

-- ltc2945 V & I sensors read
  signal V_I_read_start     : std_logic;
  signal V_I_busy           : std_logic;
  signal V_I_n15_busy       : std_logic;
  signal v6_voltage         : std_logic_vector(15 downto 0);
  signal v6_voltage_error   : std_logic;
  signal v6_current         : std_logic_vector(15 downto 0);
  signal v6_current_error   : std_logic;
  signal v9_voltage         : std_logic_vector(15 downto 0);
  signal v9_voltage_error   : std_logic;
  signal v9_current         : std_logic_vector(15 downto 0);
  signal v9_current_error   : std_logic;
  signal v24_voltage        : std_logic_vector(15 downto 0);
  signal v24_voltage_error  : std_logic;
  signal v24_current        : std_logic_vector(15 downto 0);
  signal v24_current_error  : std_logic;
  signal v40_voltage        : std_logic_vector(15 downto 0);
  signal v40_voltage_error  : std_logic;
  signal v40_current        : std_logic_vector(15 downto 0);
  signal v40_current_error  : std_logic;
  signal vn15_voltage       : std_logic_vector(15 downto 0);
  signal vn15_voltage_error : std_logic;
  signal vn15_current       : std_logic_vector(15 downto 0);
  signal vn15_current_error : std_logic;

-- PCB temperature
  signal temp_read_start : std_logic;
  signal temp_busy       : std_logic;

-- DREB temperature
  signal DREB_temp_busy : std_logic;
  signal T1_dreb        : std_logic_vector(15 downto 0);
  signal T1_dreb_error  : std_logic;
  signal T2_dreb        : std_logic_vector(15 downto 0);
  signal T2_dreb_error  : std_logic;

--REB temperature gr1
  signal REB_temp_busy_gr1 : std_logic;
  signal T1_reb_gr1        : std_logic_vector(15 downto 0);
  signal T1_reb_gr1_error  : std_logic;
  signal T2_reb_gr1        : std_logic_vector(15 downto 0);
  signal T2_reb_gr1_error  : std_logic;
  signal T3_reb_gr1        : std_logic_vector(15 downto 0);
  signal T3_reb_gr1_error  : std_logic;
  signal T4_reb_gr1        : std_logic_vector(15 downto 0);
  signal T4_reb_gr1_error  : std_logic;

-- REB temperature gr2
  signal REB_temp_busy_gr2 : std_logic;
  signal T1_reb_gr2        : std_logic_vector(15 downto 0);
  signal T1_reb_gr2_error  : std_logic;
  signal T2_reb_gr2        : std_logic_vector(15 downto 0);
  signal T2_reb_gr2_error  : std_logic;
  signal T3_reb_gr2        : std_logic_vector(15 downto 0);
  signal T3_reb_gr2_error  : std_logic;
  signal T4_reb_gr2        : std_logic_vector(15 downto 0);
  signal T4_reb_gr2_error  : std_logic;

-- Bias and Temp ADC 
  signal start_multiread  : std_logic;
  signal start_singleread : std_logic;
  signal start_regread    : std_logic;
  signal bias_t_adc_busy  : std_logic;
  signal bias_t_adc_d_out : array716;


-- CCD temperature 
  signal ccd_temp_busy  : std_logic;
  signal ccd_temp       : std_logic_vector(23 downto 0);
  signal ccd_temp_start : std_logic; 
    signal ccd_temp_start_reset : std_logic;

------ MISC ------
-- test led
  signal test_led_int : std_logic_vector(5 downto 0);
  signal dcm_locked   : std_logic;

-- back bias switch signals
  signal en_back_bias_sw     : std_logic;
  signal back_bias_sw_int    : std_logic;
  signal back_bias_clamp_int : std_logic;

-- test port
  signal test_port : std_logic_vector(12 downto 0); 

-- REB 1wire serial number
    signal reb_onewire_reset : std_logic;
  signal reb_sn_crc_ok    : std_logic;
  signal reb_sn_dev_error : std_logic;
  signal reb_sn           : std_logic_vector(47 downto 0);
  signal reb_sn_timeout   : std_logic;

--dc_dc converter sync
  signal dcdc_clk_en_out : std_logic;
  signal dcdc_clk_en     : std_logic;

-- multiboot
  signal start_multiboot : std_logic;
  signal mb_en           : std_logic;
  signal mb_en_1         : std_logic;
  signal mb_en_2         : std_logic;

-- xadc

  signal xadc_daddr_in            : std_logic_vector (6 downto 0);  -- Address bus for the dynamic reconfiguration port
  signal xadc_dclk_in             : std_logic;  -- Clock input for the dynamic reconfiguration port
  signal xadc_den_in              : std_logic;  -- Enable Signal for the dynamic reconfiguration port
  signal xadc_di_in               : std_logic_vector (15 downto 0);  -- Input data bus for the dynamic reconfiguration port
  signal xadc_dwe_in              : std_logic;  -- Write Enable for the dynamic reconfiguration port
  signal xadc_busy_out            : std_logic;  -- ADC Busy signal
  signal xadc_channel_out         : std_logic_vector (4 downto 0);  -- Channel Selection Outputs
  signal xadc_do_out              : std_logic_vector (15 downto 0);  -- Output data bus for dynamic reconfiguration port
  signal xadc_drdy_out            : std_logic;  -- Data ready signal for the dynamic reconfiguration port
  signal xadc_eoc_out             : std_logic;  -- End of Conversion Signal
  signal xadc_eos_out             : std_logic;  -- End of Sequence Signal
  signal xadc_ot_out              : std_logic;  -- Over-Temperature alarm output
  signal xadc_vccaux_alarm_out    : std_logic;  -- VCCAUX-sensor alarm output
  signal xadc_vccint_alarm_out    : std_logic;  -- VCCINT-sensor alarm output
  signal xadc_user_temp_alarm_out : std_logic;  -- Temperature-sensor alarm output
  signal xadc_vbram_alarm_out     : std_logic;  -- VCCINT-sensor alarm output
  signal xadc_alarm_out           : std_logic;  -- OR'ed output of all the Alarms




-- chipscope
  signal CONTROL0       : std_logic_vector(35 downto 0);
  signal CONTROL1       : std_logic_vector(35 downto 0);
  signal DREB_v2_ila_in : std_logic_vector(95 downto 0);

  signal ASPIC_ss_t_ccd_1_int : std_logic;
  signal ASPIC_ss_t_ccd_2_int : std_logic;
  signal ASPIC_ss_t_ccd_3_int : std_logic;

  signal ASPIC_ss_b_ccd_1_int : std_logic;
  signal ASPIC_ss_b_ccd_2_int : std_logic;
  signal ASPIC_ss_b_ccd_3_int : std_logic;


  signal bias_t_adc_mosi_int : std_logic;
  signal bias_t_adc_cs_int   : std_logic;
  signal bias_t_adc_sclk_int : std_logic;
  signal bias_t_adc_shdn_int : std_logic;

begin

  regDataWr_masked         <= regDataWr and regWrEn;
  StatusAddr(23 downto 10) <= (others => '0');
  StatusAddr(9 downto 0)   <= regAddr(9 downto 0);
  test_led_int(0)          <= pgpLocLinkReady;
  test_led_int(1)          <= pgpRemLinkReady;
  test_led_int(5)          <= dcm_locked;
--test_led_int(4)                               <= '1';
--test_led_int(2)                               <= ASPIC_miso_ccd_3;
  busy_bus                 <= x"000000" & "00" & temp_busy & V_I_n15_busy & V_I_busy & sequencer_busy & time_base_busy & '0';
  adc_data_ccd_1           <= adc_data_t_ccd_1 & adc_data_b_ccd_1;
  adc_data_ccd_2           <= adc_data_t_ccd_2 & adc_data_b_ccd_2;
  adc_data_ccd_3           <= adc_data_t_ccd_3 & adc_data_b_ccd_3;

-- trigger signals
  seq_start       <= trigger_val_bus(2) and trigger_ce_bus(2);
  V_I_read_start  <= trigger_val_bus(3) and trigger_ce_bus(3);
  temp_read_start <= trigger_val_bus(4) and trigger_ce_bus(4);

-- temperature signals
  temp_busy <= DREB_temp_busy or REB_temp_busy_gr1 or REB_temp_busy_gr2;

------------ Sequencer's signals assignment ------------
-- CCD 1
  ASPIC_r_up_ccd_1   <= sequencer_outputs(0) and CCD_sel(0);
  ASPIC_r_down_ccd_1 <= sequencer_outputs(1) and CCD_sel(0);
  ASPIC_reset_ccd_1  <= sequencer_outputs(2) and CCD_sel(0);
  ASPIC_clamp_ccd_1  <= sequencer_outputs(3) and CCD_sel(0);
  ser_clk_ccd_1(0)   <= sequencer_outputs(4) and CCD_sel(0);
  ser_clk_ccd_1(1)   <= sequencer_outputs(5) and CCD_sel(0);
  ser_clk_ccd_1(2)   <= sequencer_outputs(6) and CCD_sel(0);
  reset_gate_ccd_1   <= sequencer_outputs(7) and CCD_sel(0);
  par_clk_ccd_1(0)   <= sequencer_outputs(8) and CCD_sel(0);
  par_clk_ccd_1(1)   <= sequencer_outputs(9) and CCD_sel(0);
  par_clk_ccd_1(2)   <= sequencer_outputs(10) and CCD_sel(0);
  par_clk_ccd_1(3)   <= sequencer_outputs(11) and CCD_sel(0);

-- CCD 2
  ASPIC_r_up_ccd_2   <= sequencer_outputs(0) and CCD_sel(1);
  ASPIC_r_down_ccd_2 <= sequencer_outputs(1) and CCD_sel(1);
  ASPIC_reset_ccd_2  <= sequencer_outputs(2) and CCD_sel(1);
  ASPIC_clamp_ccd_2  <= sequencer_outputs(3) and CCD_sel(1);
  ser_clk_ccd_2(0)   <= sequencer_outputs(4) and CCD_sel(1);
  ser_clk_ccd_2(1)   <= sequencer_outputs(5) and CCD_sel(1);
  ser_clk_ccd_2(2)   <= sequencer_outputs(6) and CCD_sel(1);
  reset_gate_ccd_2   <= sequencer_outputs(7) and CCD_sel(1);
  par_clk_ccd_2(0)   <= sequencer_outputs(8) and CCD_sel(1);
  par_clk_ccd_2(1)   <= sequencer_outputs(9) and CCD_sel(1);
  par_clk_ccd_2(2)   <= sequencer_outputs(10) and CCD_sel(1);
  par_clk_ccd_2(3)   <= sequencer_outputs(11) and CCD_sel(1);

-- CCD 3
  ASPIC_r_up_ccd_3   <= sequencer_outputs(0) and CCD_sel(2);
  ASPIC_r_down_ccd_3 <= sequencer_outputs(1) and CCD_sel(2);
  ASPIC_reset_ccd_3  <= sequencer_outputs(2) and CCD_sel(2);
  ASPIC_clamp_ccd_3  <= sequencer_outputs(3) and CCD_sel(2);
  ser_clk_ccd_3(0)   <= sequencer_outputs(4) and CCD_sel(2);
  ser_clk_ccd_3(1)   <= sequencer_outputs(5) and CCD_sel(2);
  ser_clk_ccd_3(2)   <= sequencer_outputs(6) and CCD_sel(2);
  reset_gate_ccd_3   <= sequencer_outputs(7) and CCD_sel(2);
  par_clk_ccd_3(0)   <= sequencer_outputs(8) and CCD_sel(2);
  par_clk_ccd_3(1)   <= sequencer_outputs(9) and CCD_sel(2);
  par_clk_ccd_3(2)   <= sequencer_outputs(10) and CCD_sel(2);
  par_clk_ccd_3(3)   <= sequencer_outputs(11) and CCD_sel(2);

  ADC_trigger   <= sequencer_outputs(12);
  start_of_img  <= sequencer_outputs(13);
  end_of_img    <= sequencer_outputs(14);
  pattern_reset <= sequencer_outputs(16);

------------ Chips NAP mode lines ------------
--CCD 1 
--      ASPIC_nap_ccd_1         <= '1'; -- ASPIC2 nap mode active low
  ASPIC_nap_ccd_1 <= '0';

--CCD 2 
--      ASPIC_nap_ccd_2         <= '1'; -- ASPIC2 nap mode active low
  ASPIC_nap_ccd_2 <= '0';

--CCD 3 
--      ASPIC_nap_ccd_3         <= '1'; -- ASPIC2 nap mode active low
  ASPIC_nap_ccd_3 <= '0';

------------ Chips SPI link lines ------------
--chip_spi_sclk_ccd_1   <= ASPIC_sclk_int or CABAC_sclk_int;
--chip_spi_mosi_ccd_1   <= ASPIC_mosi_int or CABAC_mosi_int;
--
--chip_spi_sclk_ccd_2   <= ASPIC_sclk_int or CABAC_sclk_int;
--chip_spi_mosi_ccd_2   <= ASPIC_mosi_int or CABAC_mosi_int;
--
--chip_spi_sclk_ccd_3   <= ASPIC_sclk_int or CABAC_sclk_int;
--chip_spi_mosi_ccd_3   <= ASPIC_mosi_int or CABAC_mosi_int;
--
--CABAC_ss_ccd_1 <= CABAC_ss_t_ccd_1_int and CABAC_ss_b_ccd_1_int;
--CABAC_ss_ccd_2 <= CABAC_ss_t_ccd_2_int and CABAC_ss_b_ccd_2_int;
--CABAC_ss_ccd_3 <= CABAC_ss_t_ccd_3_int and CABAC_ss_b_ccd_3_int;

  ASPIC_sclk_ccd_1 <= ASPIC_sclk_int;
  ASPIC_sclk_ccd_2 <= ASPIC_sclk_int;
  ASPIC_sclk_ccd_3 <= ASPIC_sclk_int;

  ASPIC_mosi_ccd_1 <= ASPIC_mosi_int;
  ASPIC_mosi_ccd_2 <= ASPIC_mosi_int;
  ASPIC_mosi_ccd_3 <= ASPIC_mosi_int;

  ASPIC_spi_reset_ccd_1 <= ASPIC_spi_reset_int;
  ASPIC_spi_reset_ccd_2 <= ASPIC_spi_reset_int;
  ASPIC_spi_reset_ccd_3 <= ASPIC_spi_reset_int;

------------ assignment for test ------------
  test_port(10 downto 0) <= sequencer_outputs(10 downto 0);
  test_port(11)          <= sequencer_outputs(12);
  test_port(12)          <= sequencer_outputs(16);

-- Power down CCD ADC opamp (active low)
  CCD_OPAMP_PD <= '1';
-- sync for power supply (when 1 is in light load mode)
--      PWR_SYNC1               <= '1';

-- chipscope
  ASPIC_ss_t_ccd_1 <= ASPIC_ss_t_ccd_1_int;
  ASPIC_ss_t_ccd_2 <= ASPIC_ss_t_ccd_2_int;
  ASPIC_ss_t_ccd_3 <= ASPIC_ss_t_ccd_3_int;
  ASPIC_ss_b_ccd_1 <= ASPIC_ss_b_ccd_1_int;
  ASPIC_ss_b_ccd_2 <= ASPIC_ss_b_ccd_2_int;
  ASPIC_ss_b_ccd_3 <= ASPIC_ss_b_ccd_3_int;


  bias_t_adc_mosi <= bias_t_adc_mosi_int;
  bias_t_adc_cs   <= bias_t_adc_cs_int;
  bias_t_adc_sclk <= bias_t_adc_sclk_int;
  bias_t_adc_shdn <= bias_t_adc_shdn_int;



  LsstSci_0 : LsstSci
    generic map (
      -------------------------------------------------------------------------
      -- RAFT_DATA_CONVERSION specifies the method used to put the 18 bit
      -- raft data into the 16 bit PGP pipe.
      --
      -- Currently, the choices are:
      -- ZERO_EXTEND_32: Zero extend the data to 32 bits (halves bandwidth)
      -- TRUNC_LOW_2   : Truncate the low 2 bits (loses precision)
      -------------------------------------------------------------------------
      RAFT_DATA_CONVERSION => "TRUNC_LOW_2"
      )      
    port map (
      -------------------------------------------------------------------------
      -- FPGA Interface
      -------------------------------------------------------------------------

      FpgaRstL => n_rst,

      PgpClkP            => PgpRefClk_P,
      PgpClkM            => PgpRefClk_M,
      PgpRxP             => PgpRx_p,
      PgpRxM             => PgpRx_m,
      PgpTxP             => PgpTx_p,
      PgpTxM             => PgpTx_m,
      -------------------------------------------------------------------------
      -- Clock/Reset Generator Interface
      -------------------------------------------------------------------------
      ClkOut             => usrClk,
      RstOut             => usrRst,
      -------------------------------------------------------------------------
      -- Debug Interface
      -------------------------------------------------------------------------
      PgpLocLinkReadyOut => pgpLocLinkReady,
      PgpRemLinkReadyOut => pgpRemLinkReady,
      -------------------------------------------------------------------------
      -- SCI Register Encoder/Decoder Interface
      -------------------------------------------------------------------------
      RegClk             => clk_100_Mhz,
      RegRst             => sync_res,
      RegAddr            => RegAddr,
      RegReq             => regReq,
      RegOp              => regOp,
      RegDataWr          => RegDataWr,
      RegWrEn            => RegWrEn,
      RegAck             => regAck,
      RegFail            => regFail,
      RegDataRd          => RegDataRd,
      -------------------------------------------------------------------------
      -- Data Encoder Interface
      -------------------------------------------------------------------------
      DataClk            => clk_100_MHz,
      DataWrEn           => dataWrEn,
      DataSOT            => dataSOT,
      DataEOT            => dataEOT,
      DataIn             => image_in,
      -------------------------------------------------------------------------
      -- Status Block Interface
      -------------------------------------------------------------------------
      StatusClk          => clk_100_Mhz,
      StatusRst          => StatusRst,
      StatusAddr         => StatusAddr,
      StatusReg          => StatusReg,
      -------------------------------------------------------------------------
      -- Chipscope Control Bus
      -------------------------------------------------------------------------
      CScopeControl      => CONTROL1
--      CScopeControl => open
      );

  REB_v4_cmd_interpreter_0 : REB_v4_cmd_interpreter
    port map (
      reset                    => sync_res,
      clk                      => clk_100_Mhz,
-- signals from/to SCI
      regReq                   => regReq,  -- with this line the master start a read/write procedure (1 to start)
      regOp                    => regOp,  -- this line define if the procedure is read or write (1 to write)
      regAddr                  => regAddr,  -- address bus
      statusReg                => statusReg,  -- status reg bus. The RCI handle this bus and this machine pass it to the sure if he wants to read it
      regWrEn                  => RegWrEn,  -- write enable bus. This bus enables the data write bits
      regDataWr_masked         => regDataWr_masked,  -- data write bus masked. Is the logical AND of data write bus and write enable bus
      regAck                   => regAck,  -- acknowledge line to activate when the read/write procedure is completed
      regFail                  => regFail,  -- line to activate when an error occurs during the read/write procedure
      regDataRd                => regDataRd,  -- data bus to RCI used to transfer read data
      StatusReset              => statusRst,  -- status block reset
-- Base Register Set signals            
      busy_bus                 => busy_bus,  -- busy bus is composed by the different register sets busy
      time_base_actual_value   => time_base_actual_value,  -- time base value 
      trig_tm_value_SB         => trig_tm_value_SB,  -- Status Block trigger time 
      trig_tm_value_TB         => trig_tm_value_TB,  -- Time Base trigger time
      trig_tm_value_seq        => trig_tm_value_seq,  -- Sequencer Trigger time
      trig_tm_value_V_I        => trig_tm_value_V_I,  -- Voltage and current sens trigger time
      trig_tm_value_pcb_t      => trig_tm_value_pcb_t,  -- PCB temperature Trigger time
      trigger_ce_bus           => trigger_ce_bus,  -- bus to enable register sets trigger. To trigger a register set that stops itself use en AND val                                      
      trigger_val_bus          => trigger_val_bus,  -- bus of register sets trigger values  
      load_time_base_lsw       => load_time_base_lsw,  -- ce signal to load the time base lsw
      load_time_base_MSW       => load_time_base_MSW,  -- ce signal to load the time base MSW
      cnt_preset               => cnt_preset,  -- preset value for the time base counter
      Mgt_avcc_ok              => '0',
      Mgt_accpll_ok            => '0',
      Mgt_avtt_ok              => '0',
      V3_3v_ok                 => '0',
      Switch_addr              => r_add,
-- Image parameters
      image_size               => x"00000000",  -- this register contains the image size
      image_patter_read        => image_patter_read,  -- this register gives the state of image patter gen. 1 is ON
      ccd_sel_read             => CCD_sel,  -- this register contains the CCD to drive
      image_size_en            => open,  -- this line enables the register where the image size is written
      image_patter_en          => image_patter_en,  -- this register enable the image patter gen. 1 is ON
      ccd_sel_en               => CCD_sel_en,  -- register enable for CCD acquisition selector
-- Sequencer
      seq_time_mem_readbk      => seq_time_mem_readbk,  -- time memory read bus
      seq_out_mem_readbk       => seq_out_mem_readbk,  -- time memory read bus
      seq_prog_mem_readbk      => seq_prog_mem_readbk,  -- sequencer program memory read
      seq_time_mem_w_en        => seq_time_mem_w_en,  -- this signal enables the time memory write
      seq_out_mem_w_en         => seq_out_mem_w_en,  -- this signal enables the output memory write
      seq_prog_mem_w_en        => seq_prog_mem_w_en,  -- this signal enables the program memory write
      seq_step                 => seq_step,  -- this signal send the STEP to the sequencer. Valid on in infinite loop (the machine jump out from IL to next function)   
      seq_stop                 => seq_stop,  -- this signal send the STOP to the sequencer. Valid on in infinite loop (the machine jump out from IL to next function)
      enable_conv_shift_in     => enable_conv_shift_out,  -- this signal enable the adc_conv shifter (the adc_conv is shifted 1 clk every time is activated)
      enable_conv_shift        => enable_conv_shift,  -- this signal enable the adc_conv shifter (the adc_conv is shifted 1 clk every time is activated)
      init_conv_shift          => init_conv_shift,  -- this signal initialize the adc_conv shifter (the adc_conv is shifted 1 clk every time is activated)
      start_add_prog_mem_en    => start_add_prog_mem_en,
      start_add_prog_mem_rbk   => start_add_prog_mem_rbk,
      seq_ind_func_mem_we      => seq_ind_func_mem_we,
      seq_ind_func_mem_rdbk    => seq_ind_func_mem_rdbk,
      seq_ind_rep_mem_we       => seq_ind_rep_mem_we,
      seq_ind_rep_mem_rdbk     => seq_ind_rep_mem_rdbk,
      seq_ind_sub_add_mem_we   => seq_ind_sub_add_mem_we,
      seq_ind_sub_add_mem_rdbk => seq_ind_sub_add_mem_rdbk,
      seq_ind_sub_rep_mem_we   => seq_ind_sub_rep_mem_we,
      seq_ind_sub_rep_mem_rdbk => seq_ind_sub_rep_mem_rdbk,
      seq_op_code_error        => seq_op_code_error,
      seq_op_code_error_add    => seq_op_code_error_add,
      seq_op_code_error_reset  => seq_op_code_error_reset,
-- ASPIC
      aspic_config_r_ccd_1     => aspic_config_r_ccd_1,
      aspic_config_r_ccd_2     => aspic_config_r_ccd_2,
      aspic_config_r_ccd_3     => aspic_config_r_ccd_3,
      aspic_op_end             => aspic_busy,
      aspic_start_trans        => aspic_start_trans,
      aspic_start_reset        => aspic_start_reset,
-- CCD bias DAC         
      ccd_1_bias_load_start    => bias_load_start_ccd_1,
      ccd_1_bias_ldac_start    => bias_ldac_start_ccd_1,
      ccd_2_bias_load_start    => bias_load_start_ccd_2,
      ccd_2_bias_ldac_start    => bias_ldac_start_ccd_2,
      ccd_3_bias_load_start    => bias_load_start_ccd_3,
      ccd_3_bias_ldac_start    => bias_ldac_start_ccd_3,
-- CCD clock rails DAC          
      clk_rail_load_start      => clk_rail_load_start,
      clk_rail_ldac_start      => clk_rail_ldac_start,

-- Heater DAC           
      htr_load_start => htr_load_start,
      htr_ldac_start => htr_ldac_start,

-- DREB voltage and current sensors
      v6_voltage         => v6_voltage,
      v6_voltage_error   => v6_voltage_error,
      v6_current         => v6_current,
      v6_current_error   => v6_current_error,
      v9_voltage         => v9_voltage,
      v9_voltage_error   => v9_voltage_error,
      v9_current         => v9_current,
      v9_current_error   => v9_current_error,
      v24_voltage        => v24_voltage,
      v24_voltage_error  => v24_voltage_error,
      v24_current        => v24_current,
      v24_current_error  => v24_current_error,
      v40_voltage        => v40_voltage,
      v40_voltage_error  => v40_voltage_error,
      v40_current        => v40_current,
      v40_current_error  => v40_current_error,
      vn15_voltage       => vn15_voltage,
      vn15_voltage_error => vn15_voltage_error,
      vn15_current       => vn15_current,
      vn15_current_error => vn15_current_error,
-- DREB temperature
      T1_dreb            => T1_dreb,
      T1_dreb_error      => T1_dreb_error,
      T2_dreb            => T2_dreb,
      T2_dreb_error      => T2_dreb_error,
-- REB temperature gr1
      T1_reb_gr1         => T1_reb_gr1,
      T1_reb_gr1_error   => T1_reb_gr1_error,
      T2_reb_gr1         => T2_reb_gr1,
      T2_reb_gr1_error   => T2_reb_gr1_error,
      T3_reb_gr1         => T3_reb_gr1,
      T3_reb_gr1_error   => T3_reb_gr1_error,
      T4_reb_gr1         => T4_reb_gr1,
      T4_reb_gr1_error   => T4_reb_gr1_error,
-- REB temperature gr2
      T1_reb_gr2         => T1_reb_gr2,
      T1_reb_gr2_error   => T1_reb_gr2_error,
      T2_reb_gr2         => T2_reb_gr2,
      T2_reb_gr2_error   => T2_reb_gr2_error,
      T3_reb_gr2         => T3_reb_gr2,
      T3_reb_gr2_error   => T3_reb_gr2_error,
      T4_reb_gr2         => T4_reb_gr2,
      T4_reb_gr2_error   => T4_reb_gr2_error,

-- bias and temp ADC 
      bias_t_adc_busy    => bias_t_adc_busy,
      bias_t_adc_data    => bias_t_adc_d_out,
      bias_t_adc_start_t => start_multiread,
      bias_t_adc_start_b => start_singleread,
      bias_t_adc_start_r => start_regread,

-- CCD temperature
      ccd_temp_busy        => ccd_temp_busy,
      ccd_temp             => ccd_temp,
      ccd_temp_start       => ccd_temp_start, 
      ccd_temp_start_reset => ccd_temp_start_reset, 

-- REB 1wire serial number
      reb_onewire_reset => reb_onewire_reset,
      reb_sn_crc_ok     => reb_sn_crc_ok,
      reb_sn_dev_error  => reb_sn_dev_error,
      reb_sn            => reb_sn,
      reb_sn_timeout    => reb_sn_timeout,
-- back bias switch
      back_bias_sw_rb   => back_bias_sw_int,
      back_bias_cl_rb   => back_bias_clamp_int,
      en_back_bias_sw   => en_back_bias_sw,
-- multiboot
      start_multiboot   => start_multiboot,

-- XADC
      xadc_drdy_out            => xadc_drdy_out,
      xadc_ot_out              => xadc_ot_out,  -- Over-Temperature alarm output
      xadc_vccaux_alarm_out    => xadc_vccaux_alarm_out,  -- VCCAUX-sensor alarm output
      xadc_vccint_alarm_out    => xadc_vccint_alarm_out,  -- VCCINT-sensor alarm output
      xadc_user_temp_alarm_out => xadc_user_temp_alarm_out,  -- Temperature-sensor alarm output
      xadc_vbram_alarm_out     => xadc_vbram_alarm_out,  -- VCCINT-sensor alarm output
      xadc_alarm_out           => xadc_alarm_out,  -- OR'ed output of all the Alarms
      xadc_channel_out         => xadc_channel_out,
      xadc_do_out              => xadc_do_out,
      xadc_den_in              => xadc_den_in,

-- DC/DC clock enable
      dcdc_clk_en_in => dcdc_clk_en_out,
      dcdc_clk_en    => dcdc_clk_en
      );

  base_reg_set_top_0 : base_reg_set_top
    port map (
      clk                => clk_100_Mhz,
      reset              => sync_res,
      en_time_base_cnt   => trigger_ce_bus(1),
      load_time_base_lsw => load_time_base_lsw,
      load_time_base_MSW => load_time_base_MSW,
      StatusReset        => statusRst,
      trigger_TB         => trigger_val_bus(1),
      trigger_seq        => seq_start,
      trigger_V_I_read   => V_I_read_start,
      trigger_temp_pcb   => temp_read_start,
      cnt_preset         => cnt_preset,
      cnt_busy           => time_base_busy,
      cnt_actual_value   => time_base_actual_value,
      trig_tm_value_SB   => trig_tm_value_SB,
      trig_tm_value_TB   => trig_tm_value_TB,
      trig_tm_value_seq  => trig_tm_value_seq,
      trig_tm_value_V_I  => trig_tm_value_V_I,
      trig_tm_value_pcb  => trig_tm_value_pcb_t
      );

  Image_data_handler_0 : ADC_data_handler_v4
    port map (
      reset => sync_res,
      clk   => clk_100_Mhz,

      testmode_rst => pattern_reset,
      testmode_col => sequencer_outputs(8),

--              start_of_img                    => seq_start,                                                                   -- this signal is generated by the user (using the sequencer) and has to arrive before the first trigger
      start_of_img => start_of_img,
      end_of_img   => end_of_img,  -- this signal is generated by the user (using the sequencer) and has to arrive after the last  ADC trasfer
      end_sequence => end_sequence,  -- this signal is the end of sequence generated by the sequencer and is used as a timeot to generate EOF.

      trigger      => ADC_trigger,  -- this signal start the operations (ADC conv and send data to PGP)
      en_test_mode => image_patter_en,  -- register enable for patter test mode
      test_mode_in => regDataWr_masked(0),  -- test mode in 

      en_load_ccd_sel => CCD_sel_en,    -- register enable for CCD enable
      ccd_sel_in      => regDataWr_masked(2 downto 0),  -- register to select which CCD acquire (1, 2 or 3) 
      ccd_sel_out     => CCD_sel,  -- register to select which CCD acquire (1, 2 or 3) 

      SOT          => dataSOT,          -- Start of Image
      EOT          => dataEOT,          -- End of Image
      write_enable => dataWrEn,         -- signal to write the image in the PGP

      test_mode_enb_out => image_patter_read,
      data_out          => image_in,    -- 18 bits ADC word 

      adc_data_ccd_1 => adc_data_ccd_1,  -- CCD ADC data 
      adc_cnv_ccd_1  => adc_cnv_ccd_1,   -- ADC conv
      adc_sck_ccd_1  => adc_sck_ccd_1,   -- ADC serial clock

      adc_data_ccd_2 => adc_data_ccd_2,  -- CCD ADC data 
      adc_cnv_ccd_2  => adc_cnv_ccd_2,   -- ADC conv
      adc_sck_ccd_2  => adc_sck_ccd_2,   -- ADC serial clock

      adc_data_ccd_3 => adc_data_ccd_3,  -- CCD ADC data 
      adc_cnv_ccd_3  => adc_cnv_ccd_3,   -- ADC conv
      adc_sck_ccd_3  => adc_sck_ccd_3    -- ADC serial clock
      );

  sequencer_v3_0 : sequencer_v3_top
    port map (
      reset                    => sync_res,
      clk                      => clk_100_MHz,
      start_sequence           => seq_start,
      program_mem_we           => seq_prog_mem_w_en,
      seq_mem_w_add            => regAddr(9 downto 0),
      seq_mem_data_in          => regDataWr_masked,
      prog_mem_redbk           => seq_prog_mem_readbk,
      program_mem_init_en      => start_add_prog_mem_en,
      program_mem_init_add_rbk => start_add_prog_mem_rbk,
      ind_func_mem_we          => seq_ind_func_mem_we,
      ind_func_mem_redbk       => seq_ind_func_mem_rdbk,
      ind_rep_mem_we           => seq_ind_rep_mem_we,
      ind_rep_mem_redbk        => seq_ind_rep_mem_rdbk,
      ind_sub_add_mem_we       => seq_ind_sub_add_mem_we,
      ind_sub_add_mem_redbk    => seq_ind_sub_add_mem_rdbk,
      ind_sub_rep_mem_we       => seq_ind_sub_rep_mem_we,
      ind_sub_rep_mem_redbk    => seq_ind_sub_rep_mem_rdbk,
      time_mem_w_en            => seq_time_mem_w_en,
      time_mem_readbk          => seq_time_mem_readbk,
      out_mem_w_en             => seq_out_mem_w_en,
      out_mem_readbk           => seq_out_mem_readbk,
      stop_sequence            => seq_stop,
      step_sequence            => seq_step,
      op_code_error_reset      => seq_op_code_error_reset,
      op_code_error            => seq_op_code_error,
      op_code_error_add        => seq_op_code_error_add,
      sequencer_busy           => sequencer_busy,
      sequencer_out            => sequencer_outputs_int,
      end_sequence             => end_sequence
--       CScopeControl => CONTROL1
      );

  sequencer_aligner_shifter : sequencer_aligner_shifter_top
    generic map(start_adc_bit => 12)
    port map (
      clk           => clk_100_Mhz,
      reset         => sync_res,
      shift_on_en   => enable_conv_shift,
      shift_on      => regDataWr_masked(0),
      init_shift    => init_conv_shift,
      sequencer_in  => sequencer_outputs_int,
      shift_on_out  => enable_conv_shift_out,
      sequencer_out => sequencer_outputs
      );

-- ASPIC 3 and ASPIC 4 have the same SPI link           
  aspic_4_spi_link_top_mux_0 : aspic_3_spi_link_top_mux
    port map (
      clk                => clk_100_Mhz,
      reset              => sync_res,
      start_link_trans   => aspic_start_trans,
      start_reset        => aspic_start_reset,
      miso_ccd1          => ASPIC_miso_ccd_1,
      miso_ccd2          => ASPIC_miso_ccd_2,
      miso_ccd3          => ASPIC_miso_ccd_3,
      word2send          => regDataWr_masked,
      aspic_mosi         => ASPIC_mosi_int,
      ss_t_ccd1          => ASPIC_ss_t_ccd_1_int,
      ss_t_ccd2          => ASPIC_ss_t_ccd_2_int,
      ss_t_ccd3          => ASPIC_ss_t_ccd_3_int,
      ss_b_ccd1          => ASPIC_ss_b_ccd_1_int,
      ss_b_ccd2          => ASPIC_ss_b_ccd_2_int,
      ss_b_ccd3          => ASPIC_ss_b_ccd_3_int,
      aspic_sclk         => ASPIC_sclk_int,
      aspic_n_reset      => ASPIC_spi_reset_int,
      busy               => aspic_busy,
      d_slave_ready_ccd1 => open,
      d_slave_ready_ccd2 => open,
      d_slave_ready_ccd3 => open,
      d_from_slave_ccd1  => aspic_config_r_ccd_1,
      d_from_slave_ccd2  => aspic_config_r_ccd_2,
      d_from_slave_ccd3  => aspic_config_r_ccd_3
      );

  bias_DAC_ccd_1 : ad53xx_DAC_top
    port map (
      clk         => clk_100_Mhz,
      reset       => sync_res,
      start_write => bias_load_start_ccd_1,
      start_ldac  => bias_ldac_start_ccd_1,
      d_to_slave  => regDataWr_masked(15 downto 0),
      mosi        => din_C_BIAS_ccd_1,
      ss          => sync_C_BIAS_ccd_1,
      sclk        => sclk_C_BIAS_ccd_1,
      ldac        => ldac_C_BIAS_ccd_1
      );

  bias_DAC_ccd_2 : ad53xx_DAC_top
    port map (
      clk         => clk_100_Mhz,
      reset       => sync_res,
      start_write => bias_load_start_ccd_2,
      start_ldac  => bias_ldac_start_ccd_2,
      d_to_slave  => regDataWr_masked(15 downto 0),
      mosi        => din_C_BIAS_ccd_2,
      ss          => sync_C_BIAS_ccd_2,
      sclk        => sclk_C_BIAS_ccd_2,
      ldac        => ldac_C_BIAS_ccd_2
      );

  bias_DAC_ccd_3 : ad53xx_DAC_top
    port map (
      clk         => clk_100_Mhz,
      reset       => sync_res,
      start_write => bias_load_start_ccd_3,
      start_ldac  => bias_ldac_start_ccd_3,
      d_to_slave  => regDataWr_masked(15 downto 0),
      mosi        => din_C_BIAS_ccd_3,
      ss          => sync_C_BIAS_ccd_3,
      sclk        => sclk_C_BIAS_ccd_3,
      ldac        => ldac_C_BIAS_ccd_3
      );

  clk_rails_prog : dual_ad53xx_DAC_top
    port map (
      clk         => clk_100_Mhz,
      reset       => sync_res,
      start_write => clk_rail_load_start,
      start_ldac  => clk_rail_ldac_start,
      d_to_slave  => regDataWr_masked(16 downto 0),
      mosi        => din_RAILS,
      ss_dac_0    => sync_RAILS_dac0,
      ss_dac_1    => sync_RAILS_dac1,
      sclk        => sclk_RAILS,
      ldac        => ldac_RAILS
      );                

  HTR_DAC : ad56xx_DAC_top
    port map (
      clk         => clk_100_Mhz,
      reset       => sync_res,
      start_write => htr_load_start,
      start_ldac  => htr_ldac_start,
      d_to_slave  => regDataWr_masked(23 downto 0),
      mosi        => din_HTR,
      ss          => sync_HTR,
      sclk        => sclk_HTR,
      ldac        => ldac_HTR
      );

  ltc2945_V_I_sens : ltc2945_multi_read_top
    port map (
      clk               => clk_100_Mhz,
      reset             => sync_res,
      start_procedure   => V_I_read_start,
      busy              => V_I_busy,
      error_v6_voltage  => v6_voltage_error,
      v6_voltage_out    => v6_voltage,
      error_v6_current  => v6_current_error,
      v6_current_out    => v6_current,
      error_v9_voltage  => v9_voltage_error,
      v9_voltage_out    => v9_voltage,
      error_v9_current  => v9_current_error,
      v9_current_out    => v9_current,
      error_v24_voltage => v24_voltage_error,
      v24_voltage_out   => v24_voltage,
      error_v24_current => v24_current_error,
      v24_current_out   => v24_current,
      error_v40_voltage => v40_voltage_error,
      v40_voltage_out   => v40_voltage,
      error_v40_current => v40_current_error,
      v40_current_out   => v40_current,
      sda               => LTC2945_SDA,  --serial data output of i2c bus
      scl               => LTC2945_SCL   --serial clock output of i2c bus
      );

  ltc2945_V_I_sens_n15 : ltc2945_single_read_top
    port map (
      clk             => clk_100_Mhz,
      reset           => sync_res,
      start_procedure => V_I_read_start,
      busy            => V_I_n15_busy,

      error_v1_voltage => vn15_voltage_error,
      v1_voltage_out   => vn15_voltage,
      error_v1_current => vn15_current_error,
      v1_current_out   => vn15_current,
      sda              => LTC2945n15_SDA,  --serial data output of i2c bus
      scl              => LTC2945n15_SCL   --serial clock output of i2c bus
      );

  DREB_temp_read : adt7420_temp_multiread_2_top
    port map (
      clk             => clk_100_Mhz,
      reset           => sync_res,
      start_procedure => temp_read_start,
      busy            => DREB_temp_busy,
      error_T1        => T1_dreb_error,
      T1_out          => T1_dreb,
      error_T2        => T2_dreb_error,
      T2_out          => T2_dreb,
      sda             => sda_temp0,     --serial data output of i2c bus
      scl             => scl_temp0      --serial clock output of i2c bus
      );

  REB_temp_red_gr1 : adt7420_temp_multiread_4_top
    port map (
      clk             => clk_100_Mhz,
      reset           => sync_res,
      start_procedure => temp_read_start,
      busy            => REB_temp_busy_gr1,
      error_T1        => T1_reb_gr1_error,
      T1_out          => T1_reb_gr1,
      error_T2        => T2_reb_gr1_error,
      T2_out          => T2_reb_gr1,
      error_T3        => T3_reb_gr1_error,
      T3_out          => T3_reb_gr1,
      error_T4        => T4_reb_gr1_error,
      T4_out          => T4_reb_gr1,
      sda             => sda_temp1,
      scl             => scl_temp1
      );

  REB_temp_red_gr2 : adt7420_temp_multiread_4_top
    port map (
      clk             => clk_100_Mhz,
      reset           => sync_res,
      start_procedure => temp_read_start,
      busy            => REB_temp_busy_gr2,
      error_T1        => T1_reb_gr2_error,
      T1_out          => T1_reb_gr2,
      error_T2        => T2_reb_gr2_error,
      T2_out          => T2_reb_gr2,
      error_T3        => T3_reb_gr2_error,
      T3_out          => T3_reb_gr2,
      error_T4        => T4_reb_gr2_error,
      T4_out          => T4_reb_gr2,
      sda             => sda_temp2,
      scl             => scl_temp2
      );

  --bias_and_temp_adc : ad7490_and_mux_top 
  --    port map (
  --    clk                                             => clk_100_Mhz,
  --    reset                                           => sync_res,
  --    start_multiread         => start_multiread,
  --    start_singleread                => start_singleread,
  --    adc_and_mux_add         => regDataWr_masked(7 downto 0),
  --    miso                                            => bias_t_adc_miso,
  --    mosi                                            => bias_t_adc_mosi,
  --    ss                                                      => bias_t_adc_cs,
  --    sclk                                            => bias_t_adc_sclk,
  --    link_busy                               => bias_t_adc_busy,
  --    mux_en                                  => bias_t_adc_mux_en,
  --    mux_sel                                 => bias_t_adc_mux_sel,
  --    data_out                                        => bias_t_adc_d_out
  --    );

  --    bias_t_adc_buf_shdn     <= bias_t_adc_busy;


  bias_and_temp_adc : ads8634_and_mux_top
    port map (
      clk                  => clk_100_Mhz,
      reset                => sync_res,
      start_multiread      => start_multiread,
      start_singleread     => start_singleread,
      start_read_adc_reg   => start_regread,
      mux_address_in       => regDataWr_masked(21 downto 16),
      data_to_adc          => regDataWr_masked(15 downto 0),
      miso                 => bias_t_adc_miso,
      mosi                 => bias_t_adc_mosi_int,
      ss                   => bias_t_adc_cs_int,
      sclk                 => bias_t_adc_sclk_int,
      link_busy            => bias_t_adc_busy,
      pwd_line             => bias_t_adc_shdn_int,
      mux_sam_en_out       => bias_t_adc_sam_mux_en,
      mux_bias_en_out      => bias_t_adc_bias_mux_en,
      mux_sam_address_out  => bias_t_adc_sam_mux_sel,
      mux_bias_address_out => bias_t_adc_bias_mux_sel,
      data_out             => bias_t_adc_d_out);

  ccd_temperature_sensor : ad7794_top
    port map (
      clk             => clk_100_Mhz,
      reset           => sync_res,
      start           => ccd_temp_start,
      start_reset     => ccd_temp_start_reset,
      read_write      => regDataWr_masked(19),
      ad7794_dout_rdy => dout_24ADC,
      reg_add         => regDataWr_masked(18 downto 16),
      d_to_slave      => regDataWr_masked(15 downto 0),
      ad7794_din      => din_24ADC,
      ad7794_cs       => csb_24ADC,
      ad7794_sclk     => sclk_24ADC,
      busy            => ccd_temp_busy,
      d_from_slave    => ccd_temp
      );

  REB_1wire_sn : onewire_iface
    generic map (
      CheckCRC   => true,
      ADD_PULLUP => false,
      CLK_DIV    => 12)
    port map(
      sys_clk     => clk_100_Mhz,
      latch_reset => sync_res,
      sys_reset   => reb_onewire_reset,
      crc_ok      => reb_sn_crc_ok,
      dev_error   => reb_sn_dev_error,
      data        => open,
      data_valid  => open,
      sn_data     => reb_sn,
      timeout     => reb_sn_timeout,
      dq          => reb_sn_onewire);

  back_bias_sw : ff_ce 
    port map (
      reset    => sync_res,
      clk      => clk_100_Mhz,
      data_in  => regDataWr_masked(0),
      ce       => en_back_bias_sw,
      data_out => back_bias_sw_int); 

  back_bias_clamp_int <= not back_bias_sw_int;

  back_bias_reg : ff_ce
    port map (
      reset    => sync_res,
      clk      => clk_100_Mhz,
      data_in  => back_bias_sw_int,
      ce       => '1',
      data_out => backbias_ssbe); 

  back_bias_clamp_reg : ff_ce_pres
    port map (
      preset   => sync_res,
      clk      => clk_100_Mhz,
      data_in  => back_bias_clamp_int,
      ce       => '1',
      data_out => backbias_clamp);       


  dcdc_clk_gen : clk_2MHz_generator
    port map (
      clk             => clk_100_Mhz,
      reset           => sync_res,
      clk_2MHz_en     => dcdc_clk_en,
      clk_2MHz_en_in  => regDataWr_masked(0),
      clk_2MHz_en_out => dcdc_clk_en_out,
      clk_2MHz_out    => PWR_SYNC1
      );

  multiboot_fsm_0 : multiboot_fsm
    port map (
      TRIGGER => mb_en_2,
      SYSCLK  => clk_50_Mhz
      );
--
  flop1_mb : FD port map (D => start_multiboot, C => clk_50_Mhz, Q => mb_en);
  flop2_mb : FD port map (D => mb_en, C => clk_50_Mhz, Q => mb_en_1);

  mb_en_2 <= mb_en or mb_en_1;

  led_blink_0 : led_blink
    port map (
      clk_in  => clk_100_Mhz,
      led_out => test_led_int(3));

  dcm_user_clk_0 : dcm_user_clk
    port map
    (                                   -- Clock in ports
      CLK_IN1  => usrClk,
      -- Clock out ports
      CLK_OUT1 => clk_100_Mhz,
      CLK_OUT2 => clk_50_Mhz,
      -- Status and control signals
      LOCKED   => dcm_locked);


  monitor_xadc : mon_xadc
    port map (
      daddr_in            => xadc_daddr_in,
      dclk_in             => clk_100_Mhz,
      den_in              => xadc_den_in,
      di_in               => xadc_di_in,
      dwe_in              => xadc_dwe_in,
      busy_out            => xadc_busy_out,
      channel_out         => xadc_channel_out,
      do_out              => xadc_do_out,
      drdy_out            => xadc_drdy_out,
      eoc_out             => xadc_eoc_out,
      eos_out             => xadc_eos_out,
      ot_out              => xadc_ot_out,
      vbram_alarm_out     => xadc_vbram_alarm_out,
      vccaux_alarm_out    => xadc_vccaux_alarm_out,
      vccint_alarm_out    => xadc_vccint_alarm_out,
      user_temp_alarm_out => xadc_user_temp_alarm_out,
      alarm_out           => xadc_alarm_out,  -- OR'ed output of all the Alarms
      VP_IN               => '0',
      VN_IN               => '0'
      );

-- Resets
  -- Power on reset (goes to PGP part)
  Ureset : IBUF port map (O => n_rst, I => Pwron_Rst_L);

  -- sync reset for the user part (from PGP)
  flop1_res : FD port map (D => usrRst, C => clk_100_Mhz, Q => sync_res_1);
  flop2_res : FD port map (D => sync_res_1, C => clk_100_Mhz, Q => sync_res_2);
  flop3_res : FD port map (D => sync_res_2, C => clk_100_Mhz, Q => sync_res);

-- CCD 1
  U_ASPIC_r_up_ccd_1 : OBUFDS port map (I  => ASPIC_r_up_ccd_1,
                                        O  => ASPIC_r_up_ccd_1_p,
                                        OB => ASPIC_r_up_ccd_1_n);

  U_ASPIC_r_down_ccd_1 : OBUFDS port map (I  => ASPIC_r_down_ccd_1,
                                          O  => ASPIC_r_down_ccd_1_p,
                                          OB => ASPIC_r_down_ccd_1_n);

  U_ASPIC_clamp_ccd_1 : OBUFDS port map (I  => ASPIC_clamp_ccd_1,
                                         O  => ASPIC_clamp_ccd_1_p,
                                         OB => ASPIC_clamp_ccd_1_n);

  U_ASPIC_reset_ccd_1 : OBUFDS port map (I  => ASPIC_reset_ccd_1,
                                         O  => ASPIC_reset_ccd_1_p,
                                         OB => ASPIC_reset_ccd_1_n);

  par_clk_ccd_1_generate :
  for I in 0 to 3 generate
    U_par_clk_ccd_1 : OBUFDS
      port map (I  => par_clk_ccd_1(I),
                O  => par_clk_ccd_1_p(I),
                OB => par_clk_ccd_1_n(I));
  end generate;

  ser_clk_ccd_1_generate :
  for I in 0 to 2 generate
    U_ser_clk_ccd_1 : OBUFDS
      port map (I  => ser_clk_ccd_1(I),
                O  => ser_clk_ccd_1_p(I),
                OB => ser_clk_ccd_1_n(I));
  end generate;

  U_reset_gate_ccd_1 : OBUFDS port map (I  => reset_gate_ccd_1,
                                        O  => reset_gate_ccd_1_p,
                                        OB => reset_gate_ccd_1_n);


-- CCD 2
  U_ASPIC_r_up_ccd_2 : OBUFDS port map (I  => ASPIC_r_up_ccd_2,
                                        O  => ASPIC_r_up_ccd_2_p,
                                        OB => ASPIC_r_up_ccd_2_n);

  U_ASPIC_r_down_ccd_2 : OBUFDS port map (I  => ASPIC_r_down_ccd_2,
                                          O  => ASPIC_r_down_ccd_2_p,
                                          OB => ASPIC_r_down_ccd_2_n);

  U_ASPIC_clamp_ccd_2 : OBUFDS port map (I  => ASPIC_clamp_ccd_2,
                                         O  => ASPIC_clamp_ccd_2_p,
                                         OB => ASPIC_clamp_ccd_2_n);

  U_ASPIC_reset_ccd_2 : OBUFDS port map (I  => ASPIC_reset_ccd_2,
                                         O  => ASPIC_reset_ccd_2_p,
                                         OB => ASPIC_reset_ccd_2_n);

  par_clk_ccd_2_generate :
  for I in 0 to 3 generate
    U_par_clk_ccd_2 : OBUFDS
      port map (I  => par_clk_ccd_2(I),
                O  => par_clk_ccd_2_p(I),
                OB => par_clk_ccd_2_n(I));
  end generate;

  ser_clk_ccd_2_generate :
  for I in 0 to 2 generate
    U_ser_clk_ccd_2 : OBUFDS
      port map (I  => ser_clk_ccd_2(I),
                O  => ser_clk_ccd_2_p(I),
                OB => ser_clk_ccd_2_n(I));
  end generate;

  U_reset_gate_ccd_2 : OBUFDS port map (I  => reset_gate_ccd_2,
                                        O  => reset_gate_ccd_2_p,
                                        OB => reset_gate_ccd_2_n);


-- CCD 3
  U_ASPIC_r_up_ccd_3 : OBUFDS port map (I  => ASPIC_r_up_ccd_3,
                                        O  => ASPIC_r_up_ccd_3_p,
                                        OB => ASPIC_r_up_ccd_3_n);

  U_ASPIC_r_down_ccd_3 : OBUFDS port map (I  => ASPIC_r_down_ccd_3,
                                          O  => ASPIC_r_down_ccd_3_p,
                                          OB => ASPIC_r_down_ccd_3_n);

  U_ASPIC_clamp_ccd_3 : OBUFDS port map (I  => ASPIC_clamp_ccd_3,
                                         O  => ASPIC_clamp_ccd_3_p,
                                         OB => ASPIC_clamp_ccd_3_n);

  U_ASPIC_reset_ccd_3 : OBUFDS port map (I  => ASPIC_reset_ccd_3,
                                         O  => ASPIC_reset_ccd_3_p,
                                         OB => ASPIC_reset_ccd_3_n);

  par_clk_ccd_3_generate :
  for I in 0 to 3 generate
    U_par_clk_ccd_3 : OBUFDS
      port map (I  => par_clk_ccd_3(I),
                O  => par_clk_ccd_3_p(I),
                OB => par_clk_ccd_3_n(I));
  end generate;

  ser_clk_ccd_3_generate :
  for I in 0 to 2 generate
    U_ser_clk_ccd_3 : OBUFDS
      port map (I  => ser_clk_ccd_3(I),
                O  => ser_clk_ccd_3_p(I),
                OB => ser_clk_ccd_3_n(I));
  end generate;

  U_reset_gate_ccd_3 : OBUFDS port map (I  => reset_gate_ccd_3,
                                        O  => reset_gate_ccd_3_p,
                                        OB => reset_gate_ccd_3_n);



------ MISC ------                                  
-- leds
  Utest_led0 : OBUF port map (O => TEST_LED(0), I => test_led_int(0));
  Utest_led1 : OBUF port map (O => TEST_LED(1), I => test_led_int(1));
  Utest_led2 : OBUF port map (O => TEST_LED(2), I => test_led_int(2));
  Utest_led3 : OBUF port map (O => TEST_LED(3), I => test_led_int(3));
  Utest_led4 : OBUF port map (O => TEST_LED(4), I => test_led_int(4));
  Utest_led5 : OBUF port map (O => TEST_LED(5), I => test_led_int(5));

-- test points
  -- test port
  Utest0  : OBUF port map (O => TEST(0), I => test_port(0));
  Utest1  : OBUF port map (O => TEST(1), I => test_port(1));
  Utest2  : OBUF port map (O => TEST(2), I => test_port(2));
  Utest3  : OBUF port map (O => TEST(3), I => test_port(3));
  Utest4  : OBUF port map (O => TEST(4), I => test_port(4));
  Utest5  : OBUF port map (O => TEST(5), I => test_port(5));
  Utest6  : OBUF port map (O => TEST(6), I => test_port(6));
  Utest7  : OBUF port map (O => TEST(7), I => test_port(7));
  Utest8  : OBUF port map (O => TEST(8), I => test_port(8));
  Utest9  : OBUF port map (O => TEST(9), I => test_port(9));
  Utest10 : OBUF port map (O => TEST(10), I => test_port(10));
  Utest11 : OBUF port map (O => TEST(11), I => test_port(11));
  Utest12 : OBUF port map (O => TEST(12), I => test_port(12));


-- chipscope

  DREB_v2_0 : DREB_V2_icon
    port map (
      CONTROL0 => CONTROL0,
      CONTROL1 => CONTROL1);

  DREB_v2_ila_0 : DREB_v2_ila
    port map (
      CONTROL => CONTROL0,
      CLK     => clk_100_Mhz,
      TRIG0   => DREB_v2_ila_in,
      TRIG1   => DREB_v2_ila_in);

  DREB_v2_ila_in(0) <= regReq;
  DREB_v2_ila_in(1) <= regOp;
  DREB_v2_ila_in(2) <= regAck;

--DREB_v2_ila_in(26 downto 3)                   <= RegAddr;
--DREB_v2_ila_in(58 downto 27)                  <= RegDataWr;
--DREB_v2_ila_in(90 downto 59)                  <= RegDataRd;
--DREB_v2_ila_in(91)                                            <= regAck;





--DREB_v2_ila_in(3)     <= ASPIC_ss_t_ccd_1_int;
--DREB_v2_ila_in(4)     <= ASPIC_ss_t_ccd_2_int;        
--DREB_v2_ila_in(5)     <= ASPIC_ss_t_ccd_3_int;
--DREB_v2_ila_in(6)     <= ASPIC_ss_b_ccd_1_int;
--DREB_v2_ila_in(7)     <= ASPIC_ss_b_ccd_2_int;        
--DREB_v2_ila_in(8)     <= ASPIC_ss_b_ccd_3_int;
--
--DREB_v2_ila_in(9)             <= ASPIC_miso_ccd_1;
--DREB_v2_ila_in(10)    <= ASPIC_miso_ccd_2;
--DREB_v2_ila_in(11)    <= ASPIC_miso_ccd_3;
--
--
--DREB_v2_ila_in(12)    <= seq_start;
--DREB_v2_ila_in(13)    <= dataSOT;
--DREB_v2_ila_in(14)    <= dataEOT;


  DREB_v2_ila_in(3) <= bias_t_adc_miso;
  DREB_v2_ila_in(4) <= bias_t_adc_mosi_int;
  DREB_v2_ila_in(5) <= bias_t_adc_cs_int;
  DREB_v2_ila_in(6) <= bias_t_adc_sclk_int;
  DREB_v2_ila_in(7) <= bias_t_adc_busy;
  DREB_v2_ila_in(8) <= bias_t_adc_shdn_int;




end Behavioral;

