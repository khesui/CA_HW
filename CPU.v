module CPU
(
    clk_i,
    rst_i,
    start_i
);

// Ports
input               clk_i;
input               rst_i;
input               start_i;

wire [31:0] pc_i, pc_o;
wire [31:0] instruction;

wire RegDst, ALUSrc, RegWrite;
wire [1:0] ALUOp;
wire [31:0] RegData1;
wire [31:0] RegData2;
wire [4:0] WriteRegAddr;
wire [31:0] WriteRegData;
wire [31:0] SignedExtendImmediate;
wire [31:0] ALUSrcData2;

wire [2:0] ALUCtrl;
wire Zero;

Control Control(
    .Op_i       (instruction [31:26]),
    .RegDst_o   (RegDst),
    .ALUOp_o    (ALUOp),
    .ALUSrc_o   (ALUSrc),
    .RegWrite_o (RegWrite)
);



Adder Add_PC(
    .data1_in   (pc_o),
    .data2_in   (4),
    .data_o     (pc_i)
);


PC PC(
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .start_i    (start_i),
    .pc_i       (pc_i),
    .pc_o       (pc_o)
);

Instruction_Memory Instruction_Memory(
    .addr_i     (pc_o),
    .instr_o    (instruction)
);

Registers Registers(
    .clk_i      (clk_i),
    .RSaddr_i   (instruction [25:21]),
    .RTaddr_i   (instruction [20:16]),
    .RDaddr_i   (WriteRegAddr),
    .RDdata_i   (WriteRegData),
    .RegWrite_i (RegWrite),
    .RSdata_o   (RegData1),
    .RTdata_o   (RegData2)
);


MUX5 MUX_RegDst(
    .data1_i    (instruction[20:16]),
    .data2_i    (instruction[15:11]),
    .select_i   (RegDst),
    .data_o     (WriteRegAddr)
);



MUX32 MUX_ALUSrc(
    .data1_i    (RegData2),
    .data2_i    (SignedExtendImmediate),
    .select_i   (ALUSrc),
    .data_o     (ALUSrcData2)
);



Signed_Extend Signed_Extend(
    .data_i     (instruction[15:0]),
    .data_o     (SignedExtendImmediate)
);



ALU ALU(
    .data1_i    (RegData1),
    .data2_i    (ALUSrcData2),
    .ALUCtrl_i  (ALUCtrl),
    .data_o     (WriteRegData),
    .Zero_o     (Zero)
);



ALU_Control ALU_Control(
    .funct_i    (instruction[5:0]),
    .ALUOp_i    (ALUOp),
    .ALUCtrl_o  (ALUCtrl)
);


endmodule

