module Fetch_tb;

    // 페치 모듈 인스턴스화
    Fetch fetch_inst (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .memory(memory)
    );

    // 입력 신호 생성
    reg clk = 0;
    reg reset = 0;
    wire [3:0] instruction;      // 읽어온 명령어를 모니터링하기 위한 와이어
    reg [15:0] memory;           // 명령어 메모리를 초기화하기 위한 레지스터

    // 클럭 생성
    always #5 clk = ~clk;  // 5ns 주기로 클럭 토글

    // 초기화 및 시뮬레이션
    initial begin
        // 명령어 메모리 초기화
        memory[0] = 4'b0001;  // 주소 0: 명령어 0001
        memory[1] = 4'b0010;  // 주소 1: 명령어 0010
        memory[2] = 4'b0100;  // 주소 2: 명령어 0100
        memory[3] = 4'b1000;  // 주소 3: 명령어 1000

        // 리셋 후 클럭 대기
        reset = 1;
        #10;
        reset = 0;

        // 페치 동작 테스트
        #20;  // 20ns 대기 후 instruction 확인 (주소 0)
        #20;  // 20ns 대기 후 instruction 확인 (주소 1)
        #20;  // 20ns 대기 후 instruction 확인 (주소 2)
        #20;  // 20ns 대기 후 instruction 확인 (주소 3)

        $display("Simulation completed");
        $finish;  // 시뮬레이션 종료
    end

endmodule
