tic
tic
%% Comsol domin 编号
index_ybco_p = [82 83 84 85 86 87 88 89 98 99 100 101 102 103 104 105 114 115 116 117 118 119 120 121 130 131 132 133 134 135 136 137 146 147 148 149 150 151 152 153];
index_ybco_s = [2 3 4 5 6 7 8 9 18 19 20 21 22 23 24 25 34 35 36 37 38 39 40 41 50 51 52 53 54 55 56 57 66 67 68 69 70 71 72 73];
index_sub_p = [90 91 92 93 94 95 96 97 106 107 108 109 110 111 112 113 122 123 124 125 126 127 128 129 138 139 140 141 142 143 144 145 154 155 156 157 158 159 160 161];
index_sub_s = [10 11 12 13 14 15 16 17 26 27 28 29 30 31 32 33 42 43 44 45 46 47 48 49 58 59 60 61 62 63 64 65 74 75 76 77 78 79 80 81];

% %% Comsol mfh 磁场计算
% model_1 = mphload('mfh');
% model_1.physics('mfh').feature('ecd1').set('Je', {'0'; '1' ; '0'}); % ybco primary
% model_1.physics('mfh').feature('ecd2').set('Je', {'0'; '0' ; '0'}); % ybco secondary
% model_1.physics('mfh').feature('ecd3').set('Je', {'0'; '0' ; '0'}); % sub primary
% model_1.physics('mfh').feature('ecd4').set('Je', {'0'; '0' ; '0'}); % sub secondary
% model_1.sol('sol1').runAll;
% 
% Bz_ybcoP_to_ybcoP = zeros(1,40);
% Bz_ybcoP_to_ybcoS = zeros(1,40);
% 
% Br_ybcoP_to_ybcoP = zeros(1,40);
% Br_ybcoP_to_ybcoS = zeros(1,40);
% 
% for i = 1:40
%     Bz_ybcoP_to_ybcoP(i) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_p(i));
%     Bz_ybcoP_to_ybcoS(i) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_s(i));
% 
%     Br_ybcoP_to_ybcoP(i) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_p(i));
%     Br_ybcoP_to_ybcoS(i) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_s(i));
% end
% 
% model_1 = mphload('mfh');
% model_1.physics('mfh').feature('ecd1').set('Je', {'0'; '0' ; '0'}); % ybco primary
% model_1.physics('mfh').feature('ecd2').set('Je', {'0'; '1' ; '0'}); % ybco secondary
% model_1.physics('mfh').feature('ecd3').set('Je', {'0'; '0' ; '0'}); % sub primary
% model_1.physics('mfh').feature('ecd4').set('Je', {'0'; '0' ; '0'}); % sub secondary
% model_1.sol('sol1').runAll;
% 
% Bz_ybcoS_to_ybcoP = zeros(1,40);
% Bz_ybcoS_to_ybcoS = zeros(1,40);
% 
% Br_ybcoS_to_ybcoP = zeros(1,40);
% Br_ybcoS_to_ybcoS = zeros(1,40);
% 
% for i = 1:40
%     Bz_ybcoS_to_ybcoP(i) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_p(i));
%     Bz_ybcoS_to_ybcoS(i) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_s(i));
%     
%     Br_ybcoS_to_ybcoP(i) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_p(i));
%     Br_ybcoS_to_ybcoS(i) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_s(i));
% end
% 
% model_1 = mphload('mfh');
% model_1.physics('mfh').feature('ecd1').set('Je', {'0'; '0' ; '0'}); % ybco primary
% model_1.physics('mfh').feature('ecd2').set('Je', {'0'; '0' ; '0'}); % ybco secondary
% model_1.physics('mfh').feature('ecd3').set('Je', {'0'; '1' ; '0'}); % sub primary
% model_1.physics('mfh').feature('ecd4').set('Je', {'0'; '0' ; '0'}); % sub secondary
% model_1.sol('sol1').runAll;
% 
% Bz_subP_to_ybcoP = zeros(1,40);
% Bz_subP_to_ybcoS = zeros(1,40);
% 
% Br_subP_to_ybcoP = zeros(1,40);
% Br_subP_to_ybcoS = zeros(1,40);
% 
% for i = 1:40
%     Bz_subP_to_ybcoP(i) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_p(i));
%     Bz_subP_to_ybcoS(i) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_s(i));
%     
%     Br_subP_to_ybcoP(i) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_p(i));
%     Br_subP_to_ybcoS(i) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_s(i));
% end
% 
% model_1 = mphload('mfh');
% model_1.physics('mfh').feature('ecd1').set('Je', {'0'; '0' ; '0'}); % ybco primary
% model_1.physics('mfh').feature('ecd2').set('Je', {'0'; '0' ; '0'}); % ybco secondary
% model_1.physics('mfh').feature('ecd3').set('Je', {'0'; '0' ; '0'}); % sub primary
% model_1.physics('mfh').feature('ecd4').set('Je', {'0'; '1' ; '0'}); % sub secondary
% model_1.sol('sol1').runAll;
% 
% Bz_subS_to_ybcoP = zeros(1,40);
% Bz_subS_to_ybcoS = zeros(1,40);
% 
% Br_subS_to_ybcoP = zeros(1,40);
% Br_subS_to_ybcoS = zeros(1,40);
% 
% for i = 1:40
%     Bz_subS_to_ybcoP(i) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_p(i));
%     Bz_subS_to_ybcoS(i) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_s(i));
%     
%     Br_subS_to_ybcoP(i) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_p(i));
%     Br_subS_to_ybcoS(i) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_s(i));
% end

%% 电路模型初始化
r = 17e-3; % 平台内阻
L1 = 0.213e-3; %原/副边电感
L2 = 0.22e-3; 
M = 0.209e-3; %互感
i1_pre = 0; % 原/副边初始电流
i2_pre = 0;
Rs1 = rho(77) * 1.9133e7; % 原边绕组长度14.35 m    Rs1 = rho(T_sub_p) * 14.35 / (0.15e-3 * 5e-3)
Rs2 = rho(77) * 1.8667e7; % 副边绕组长度14 m

% 超导参数
Ec = 1e-4;
IcB = 40; % 40 A
n = 28;

% 程序参数初始化
time_step = 1e-5;
steps = 2000; % 每个周期2000步

S_ybco = 0.1e-3 * 5e-3; % 超导层截面积
S_sub = 0.15e-3 * 5e-3; % 非超导层截面积

u_source = zeros(1,steps);
current_p_total = zeros(1,steps);
current_s_total = zeros(1,steps);
current_p_HTS = zeros(1,steps);
current_s_HTS = zeros(1,steps);
U_sc_r_p = zeros(1,steps);
U_sc_r_s = zeros(1,steps);

T_ybco_p_record = zeros(1,steps);
T_ybco_s_record = zeros(1,steps);
T_sub_p_record = zeros(1,steps);
T_sub_s_record = zeros(1,steps);
min_Jc_p = zeros(1,steps);
min_Jc_s = zeros(1,steps);

% 超导阻形压降
Usc_p = 0;
Usc_s = 0;
J_sub_p = 0;
J_sub_s = 0;
temp_Usc_s = 0;
temp_Usc_p = 0;

% 每段Jc
Jc_p = ones(1,40) * 40 / S_ybco;
Jc_s = ones(1,40) * 40 / S_ybco;

% 每段温度分布
T_ybco_p = ones(1,40) * 77;
T_ybco_s = ones(1,40) * 77;
T_sub_p = 77;
T_sub_s = 77;

Br_p = zeros(1,40);
Bz_p = zeros(1,40);
Br_s = zeros(1,40);
Bz_s = zeros(1,40);

hwait = waitbar(0, 'begin !');
toc

%% 总循环
for i = 1:steps
    tic % 记录每步运行时间
    str = ['step ', num2str(i), ':   ', num2str(roundn(i/steps * 100, -2)), ' % completed...'];
    waitbar(i/steps, hwait, str); % 进度条
    
    u = 40 * sqrt(2) * sin(2 * pi * 50 * i * time_step); % 电源电压
    
    error_judje = 0.005;
    error_percent = 1;
    cal_n = 0;
    alpha = 0.51;
    % 电路模型 -> 电流
    i_sc_p = -(L1*L2*Usc_p - M^2*Usc_p + M^2*Rs1*i1_pre - L1*L2*Rs1*i1_pre + L2*Rs1*Usc_p*time_step + ...
            M*Rs1*Usc_s*time_step - L2*Rs1*time_step*u + L2*Usc_p*r*time_step)/(Rs1*(- M^2 + L1*L2 + L2*r*time_step));
    i_sc_s = -(L1*L2*Usc_s - M^2*Usc_s + M^2*Rs2*i2_pre + Rs2*Usc_s*r*time_step^2 - L1*L2*Rs2*i2_pre + L1*Rs2*Usc_s*time_step + M*Rs2*Usc_p*time_step + ...
            L2*Usc_s*r*time_step - M*Rs2*time_step*u - L2*Rs2*i2_pre*r*time_step + M*Rs2*i1_pre*r*time_step)/(Rs2*(- M^2 + L1*L2 + L2*r*time_step));
    
    while abs(error_percent) > error_judje
        if cal_n > 10000
            pause();
        end
        
        J_ybco_p = i_sc_p / S_ybco;
        J_ybco_s = i_sc_s / S_ybco;
        i1_shunt = Usc_p / Rs1; % 原边基带层电流
        J_sub_p = i1_shunt / S_sub;
        i2_shunt = Usc_s / Rs2; % 副边基带层电流
        J_sub_s = i2_shunt / S_sub;
        
        Usc_p = 0;
        Usc_s = 0;
        tic
        % 磁场模型 -> 电压
        for j = 1:40
            r_p = 56.5 + floor(index_ybco_p(j) / 16) * 0.25;
            Br_p(j) = J_ybco_p * Br_ybcoP_to_ybcoP(j) + J_ybco_s * Br_ybcoS_to_ybcoP(j) + J_sub_p * Br_subP_to_ybcoP(j) + J_sub_s * Br_subS_to_ybcoP(j);
            Bz_p(j) = J_ybco_p * Bz_ybcoP_to_ybcoP(j) + J_ybco_s * Bz_ybcoS_to_ybcoP(j) + J_sub_p * Bz_subP_to_ybcoP(j) + J_sub_s * Bz_subS_to_ybcoP(j);
            Jc_p(j) = Jc_calculation(Br_p(j), Bz_p(j), T_ybco_p(j));
            if Jc_p(j) < abs(J_ybco_p)
                Usc_p = Usc_p + Ec * 2 * pi * r_p * J_ybco_p / Jc_p(j);
            else
                Usc_p = Usc_p + Ec * (J_ybco_p / Jc_p(j))^n * 2 * pi * r_p;
            end
            
            r_s = 55.05 + floor(index_ybco_s(j) / 16) * 0.25;
            Br_s(j) = J_ybco_p * Br_ybcoP_to_ybcoS(j) + J_ybco_s * Br_ybcoS_to_ybcoS(j) + J_sub_p * Br_subP_to_ybcoS(j) + J_sub_s * Br_subS_to_ybcoS(j);
            Bz_s(j) = J_ybco_p * Bz_ybcoP_to_ybcoS(j) + J_ybco_s * Bz_ybcoS_to_ybcoS(j) + J_sub_p * Bz_subP_to_ybcoS(j) + J_sub_s * Bz_subS_to_ybcoS(j);
            Jc_s(j) = Jc_calculation(Br_s(j), Bz_s(j), T_ybco_s(j));
            if Jc_s(j) < abs(J_ybco_s)
                Usc_s = Usc_s + Ec * 2 * pi * r_p * J_ybco_s / Jc_s(j);
            else
                Usc_s = Usc_s + Ec * (J_ybco_s / Jc_s(j))^n * 2 * pi * r_s;
            end
        end
        
        i_sc_p_last = i_sc_p;
        i_sc_p = -(L1*L2*Usc_p - M^2*Usc_p + M^2*Rs1*i1_pre - L1*L2*Rs1*i1_pre + L2*Rs1*Usc_p*time_step + ...
            M*Rs1*Usc_s*time_step - L2*Rs1*time_step*u + L2*Usc_p*r*time_step)/(Rs1*(- M^2 + L1*L2 + L2*r*time_step));
        
        i_sc_s_last = i_sc_s;
        i_sc_s = -(L1*L2*Usc_s - M^2*Usc_s + M^2*Rs2*i2_pre + Rs2*Usc_s*r*time_step^2 - L1*L2*Rs2*i2_pre + L1*Rs2*Usc_s*time_step + M*Rs2*Usc_p*time_step + ...
            L2*Usc_s*r*time_step - M*Rs2*time_step*u - L2*Rs2*i2_pre*r*time_step + M*Rs2*i1_pre*r*time_step)/(Rs2*(- M^2 + L1*L2 + L2*r*time_step));
        
        cal_n
        
        [i_sc_p, i_sc_s]
        
        error_ip = i_sc_p - i_sc_p_last
        error_is = i_sc_s - i_sc_s_last
        
        i_sc_p = i_sc_p - rand(1) * error_ip;
        i_sc_s = i_sc_s - rand(1) * error_is;
        
        [i_sc_p, i_sc_s]
        
        cal_n = cal_n + 1;
        error_percent = abs(error_ip / i_sc_p);
        error_judje = 0.005 + floor(cal_n / 500) * 0.001;
        toc
    end

    min_Jc_p(i) = min(Jc_p);
    min_Jc_s(i) = min(Jc_s);
    U_sc_r_p(i) = Usc_p;
    U_sc_r_s(i) = Usc_s;

    i1_pre = i_sc_p + i1_shunt; % 原边总电流
    i2_pre = i_sc_s + i2_shunt; % 副边总电流
    
    u_source(i) = u;
    current_p_HTS(i) = i_sc_p;
    current_s_HTS(i) = i_sc_s;
    current_p_total(i) = i1_pre;
    current_s_total(i) = i2_pre;
    
%    %% COMSOL 传热模型载入、运算
%     model_2 = mphload('ht');
%     % ybco primary
%     for j = 1:40
%         % 热源注入
%         if abs(J_ybco_p) < Jc_p(j)
%             Q_ybco_p = Ec * abs((J_ybco_p / Jc_p(j))^n * J_ybco_p);
%         else
%             Q_ybco_p = Ec * abs(J_ybco_p);
%         end
%         label_2 = strcat('hs',num2str(j));
%         model_2.physics('ht').feature(label_2).set('Q', num2str(Q_ybco_p));
%         % 初始温度设置
%         label_3 = strcat('init',num2str(j+1));
%         model_2.physics('ht').feature(label_3).set('Tinit', num2str(T_ybco_p(j)));
%     end
%     % ybco secondary
%     for j = 41:80
%         % 热源注入
%         if abs(J_ybco_s) < Jc_s(j-40)
%             Q_ybco_s = Ec * (J_ybco_s / Jc_s(j-40))^n * J_ybco_s;
%         else
%             Q_ybco_s = Ec * abs(J_ybco_s);
%         end
%         label_2 = strcat('hs',num2str(j));
%         model_2.physics('ht').feature(label_2).set('Q', num2str(Q_ybco_s));
%         % 初始温度设置
%         label_3 = strcat('init',num2str(j+1));
%         model_2.physics('ht').feature(label_3).set('Tinit', num2str(T_ybco_s(j-40)));
%     end
%     % sub primary
%     % 热源注入
%     Q_sub_p = J_sub_p^2 * rho(T_sub_p);
%     model_2.physics('ht').feature('hs81').set('Q', num2str(Q_sub_p));
%     % 初始温度设置
%     model_2.physics('ht').feature('init82').set('Tinit', num2str(T_sub_p));
%     % sub secondary
%     % 热源注入
%     Q_sub_s = J_sub_s^2 * rho(T_sub_s);
%     model_2.physics('ht').feature('hs82').set('Q', num2str(Q_sub_s));
%     % 初始温度设置
%     model_2.physics('ht').feature('init83').set('Tinit', num2str(T_sub_s));
%     
%     % 运行
%     model_2.sol('sol1').runAll;
%     
%     % 取温度值
%     for j = 1:40
%         temp = mphint2(model_2, 'T / (0.5[m^2])', 'surface', 'selection', index_ybco_p(j));
%         T_ybco_p(j) = temp(2);
%         temp = mphint2(model_2, 'T / (0.5[m^2])', 'surface', 'selection', index_ybco_s(j));
%         T_ybco_s(j) = temp(2);
%     end
%     
%     T_ybco_p_record(i) = mean(T_ybco_p);
%     T_ybco_s_record(i) = mean(T_ybco_s);
%     
%     % 非超导层平均温度计算
%     temp = mphint2(model_2, 'T / (40 * 0.75[m^2])', 'surface', 'selection', index_sub_p);
%     T_sub_p = temp(2);
%     T_sub_p_record(i) = T_sub_p;
%     
%     temp = mphint2(model_2, 'T / (40 * 0.75[m^2])', 'surface', 'selection', index_sub_s);
%     T_sub_s = temp(2);
%     T_sub_s_record(i) = T_sub_s;
%     % 非超导层电阻计算
%     Rs1 = rho(T_sub_p) * 1.9133e7; % 原边绕组长度14.35 m  Rs1 = rho(T_sub_p) * 14.35 / (0.15e-3 * 5e-3)
%     Rs2 = rho(T_sub_s) * 1.8667e7; % 副边绕组长度14 m

    toc
end
plot(current_p_total, 'r-'); hold on
plot(current_p_HTS, 'b-'); hold on

toc
