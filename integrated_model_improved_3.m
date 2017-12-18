%% 2017.11 版本
% 三个环嵌套迭代计算
% 外部电路环：更新外部电压；
% 中间电压环：更新超导阻性压降；
% 内部电流环：分配超导层、金属层电流。

%% 2017.11.16
% ht模型删除液氮domin，将液氮的沸腾传热曲线设置为绕组的边界条件。

%% 2017.11.21
% 记录原副边超导层最高/低温度。

%% 2017.11.24
% 修复bug，mf、ht模型不同，模型序号修改
% ybco电阻计算时，半径单位错误

%% 2017.11.29
% 对能量注入取绝对值，避免电流方向导致的符号错误

%% 2017.12.13
% 更换原边的所有参数


tic % 总运行时间
% mfh编号
index_ybco_p_mfh = [82 83 84 85 86 87 88 89 98 99 100 101 102 103 104 105 114 115 116 117 118 119 120 121 130 131 132 133 134 135 136 137 146 147 148 149 150 151 152 153];
index_ybco_s_mfh = [2 3 4 5 6 7 8 9 18 19 20 21 22 23 24 25 34 35 36 37 38 39 40 41 50 51 52 53 54 55 56 57 66 67 68 69 70 71 72 73];
index_sub_p_mfh = [90 91 92 93 94 95 96 97 106 107 108 109 110 111 112 113 122 123 124 125 126 127 128 129 138 139 140 141 142 143 144 145 154 155 156 157 158 159 160 161];
index_sub_s_mfh = [10 11 12 13 14 15 16 17 26 27 28 29 30 31 32 33 42 43 44 45 46 47 48 49 58 59 60 61 62 63 64 65 74 75 76 77 78 79 80 81];

index_ybco_p_ht = index_ybco_p_mfh;
index_ybco_s_ht = index_ybco_s_mfh - 1;
index_sub_p_ht = index_sub_p_mfh;
index_sub_s_ht = index_sub_s_mfh - 1;

%% Comsol mfh 磁场计算
model_1 = mphload('mfh_new');
model_1.physics('mfh').feature('ecd1').set('Je', {'0'; '1' ; '0'}); % ybco primary
model_1.physics('mfh').feature('ecd2').set('Je', {'0'; '0' ; '0'}); % ybco secondary
model_1.physics('mfh').feature('ecd3').set('Je', {'0'; '0' ; '0'}); % sub primary
model_1.physics('mfh').feature('ecd4').set('Je', {'0'; '0' ; '0'}); % sub secondary
model_1.sol('sol1').runAll;

Bz_ybcoP_to_ybcoP = zeros(1,40);
Bz_ybcoP_to_ybcoS = zeros(1,40);

Br_ybcoP_to_ybcoP = zeros(1,40);
Br_ybcoP_to_ybcoS = zeros(1,40);

for i = 1:40
    Bz_ybcoP_to_ybcoP(i) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_p_mfh(i));
    Bz_ybcoP_to_ybcoS(i) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_s_mfh(i));

    Br_ybcoP_to_ybcoP(i) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_p_mfh(i));
    Br_ybcoP_to_ybcoS(i) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_s_mfh(i));
end

model_1 = mphload('mfh_new');
model_1.physics('mfh').feature('ecd1').set('Je', {'0'; '0' ; '0'}); % ybco primary
model_1.physics('mfh').feature('ecd2').set('Je', {'0'; '1' ; '0'}); % ybco secondary
model_1.physics('mfh').feature('ecd3').set('Je', {'0'; '0' ; '0'}); % sub primary
model_1.physics('mfh').feature('ecd4').set('Je', {'0'; '0' ; '0'}); % sub secondary
model_1.sol('sol1').runAll;

Bz_ybcoS_to_ybcoP = zeros(1,40);
Bz_ybcoS_to_ybcoS = zeros(1,40);

Br_ybcoS_to_ybcoP = zeros(1,40);
Br_ybcoS_to_ybcoS = zeros(1,40);

for i = 1:40
    Bz_ybcoS_to_ybcoP(i) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_p_mfh(i));
    Bz_ybcoS_to_ybcoS(i) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_s_mfh(i));
    
    Br_ybcoS_to_ybcoP(i) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_p_mfh(i));
    Br_ybcoS_to_ybcoS(i) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_s_mfh(i));
end

model_1 = mphload('mfh_new');
model_1.physics('mfh').feature('ecd1').set('Je', {'0'; '0' ; '0'}); % ybco primary
model_1.physics('mfh').feature('ecd2').set('Je', {'0'; '0' ; '0'}); % ybco secondary
model_1.physics('mfh').feature('ecd3').set('Je', {'0'; '1' ; '0'}); % sub primary
model_1.physics('mfh').feature('ecd4').set('Je', {'0'; '0' ; '0'}); % sub secondary
model_1.sol('sol1').runAll;

Bz_subP_to_ybcoP = zeros(1,40);
Bz_subP_to_ybcoS = zeros(1,40);

Br_subP_to_ybcoP = zeros(1,40);
Br_subP_to_ybcoS = zeros(1,40);

for i = 1:40
    Bz_subP_to_ybcoP(i) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_p_mfh(i));
    Bz_subP_to_ybcoS(i) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_s_mfh(i));
    
    Br_subP_to_ybcoP(i) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_p_mfh(i));
    Br_subP_to_ybcoS(i) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_s_mfh(i));
end

model_1 = mphload('mfh_new');
model_1.physics('mfh').feature('ecd1').set('Je', {'0'; '0' ; '0'}); % ybco primary
model_1.physics('mfh').feature('ecd2').set('Je', {'0'; '0' ; '0'}); % ybco secondary
model_1.physics('mfh').feature('ecd3').set('Je', {'0'; '0' ; '0'}); % sub primary
model_1.physics('mfh').feature('ecd4').set('Je', {'0'; '1' ; '0'}); % sub secondary
model_1.sol('sol1').runAll;

Bz_subS_to_ybcoP = zeros(1,40);
Bz_subS_to_ybcoS = zeros(1,40);

Br_subS_to_ybcoP = zeros(1,40);
Br_subS_to_ybcoS = zeros(1,40);

for i = 1:40
    Bz_subS_to_ybcoP(i) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_p_mfh(i));
    Bz_subS_to_ybcoS(i) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_s_mfh(i));
    
    Br_subS_to_ybcoP(i) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_p_mfh(i));
    Br_subS_to_ybcoS(i) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_s_mfh(i));
end


%% 电路模型初始化
time_step = 1e-5;
steps = 2000; % 每个周期2000步

S_ybco = 0.05e-3 * 5e-3; % 超导层截面积
S_sub_s = 0.2e-3 * 5e-3; % 非超导层截面积-secondary
S_sub_p = 0.35e-3 * 5e-3; % 非超导层截面积-primary

r = 17e-3; % 平台内阻
L1 = 0.213e-3; %原/副边电感
L2 = 0.22e-3; 
M = 0.209e-3; %互感
i1_pre = 0; % 原/副边初始电流
i2_pre = 0;
Rs1 = rho_new(77) * 14.35 / S_sub_p; % 原边绕组长度14.35 m    Rs1 = rho(T_sub_p) * 14.35 / (0.15e-3 * 5e-3)
Rs2 = rho(77) * 14 / S_sub_s; % 副边绕组长度14 m

% 热传模型载入
model_2 = mphload('ht_new');

% 超导参数
Ec = 1e-4; % 1e-4 V/m
n = 28;

% 数据记录
u_source = zeros(1,steps);
current_p_total = zeros(1,steps);
current_s_total = zeros(1,steps);
current_p_HTS = zeros(1,steps);
current_s_HTS = zeros(1,steps);
U_sc_r_p = zeros(1,steps);
U_sc_r_s = zeros(1,steps);

T_ybco_p_record = zeros(1,steps);
T_ybco_p_record_max = zeros(1,steps);
T_ybco_p_record_min = zeros(1,steps);

T_ybco_s_record = zeros(1,steps);
T_ybco_s_record_max = zeros(1,steps);
T_ybco_s_record_min = zeros(1,steps);

T_sub_p_record = zeros(1,steps);
T_sub_s_record = zeros(1,steps);
cal_n_count = zeros(1,steps);

Jc_p_record = zeros(1,steps);
Jc_s_record = zeros(1,steps);
R_ybco_p_record = zeros(1,steps);
R_ybco_s_record = zeros(1,steps);

Rs1_record = zeros(1,steps);
Rs2_record = zeros(1,steps);
% 超导阻性压降
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

%% 外部电路环
for i = 1:steps
    tic
    str = ['step ', num2str(i), ':   ', num2str(i/steps * 100), ' % completed...'];
    waitbar(i/steps, hwait, str); % 进度条
    
    u = 40 * sqrt(2) * sin(2 * pi * 50 * i * time_step); % 电源电压
    error_Usc_p_percent = 1;
    error_Usc_s_percent = 1;
    count_middle = 0; % 中环迭代记次
    error_judge = 1e-3; % 中环收敛条件
    % 中间电压环
    while error_Usc_p_percent > error_judge || error_Usc_s_percent > error_judge
        if count_middle > 500
            break;
        end
        alpha = 0.5;
        % 电路模型 -> 电流
        i1 = -(i1_pre*M^2 + Usc_s*time_step*M - L1*L2*i1_pre + L2*Usc_p*time_step - L2*time_step*u)/(- M^2 + L1*L2 + L2*r*time_step);
        i2 = -(M^2*i2_pre - L1*L2*i2_pre + L1*Usc_s*time_step + M*Usc_p*time_step - M*time_step*u + Usc_s*r*time_step^2 - L2*i2_pre*r*time_step + M*i1_pre*r*time_step)/(- M^2 + L1*L2 + L2*r*time_step);
        
        % 用于计算磁场的原副边平均电流密度(原副边电流应该是反向的，因此在磁场模型中，i2应该取负)
        J1 = i1 / (S_ybco + S_sub_p);
        J2 = -i2 / (S_ybco + S_sub_s);
        % 磁场模型 -> Jc
        for j = 1:40
            Br_p(j) = J1 * Br_ybcoP_to_ybcoP(j) + J2 * Br_ybcoS_to_ybcoP(j) + J1 * Br_subP_to_ybcoP(j) + J2 * Br_subS_to_ybcoP(j);
            Bz_p(j) = J1 * Bz_ybcoP_to_ybcoP(j) + J2 * Bz_ybcoS_to_ybcoP(j) + J1 * Bz_subP_to_ybcoP(j) + J2 * Bz_subS_to_ybcoP(j);
            Jc_p(j) = Jc_calculation_p(Br_p(j), Bz_p(j), T_ybco_p(j));

            Br_s(j) = J1 * Br_ybcoP_to_ybcoS(j) + J2 * Br_ybcoS_to_ybcoS(j) + J1 * Br_subP_to_ybcoS(j) + J2 * Br_subS_to_ybcoS(j);
            Bz_s(j) = J1 * Bz_ybcoP_to_ybcoS(j) + J2 * Bz_ybcoS_to_ybcoS(j) + J1 * Bz_subP_to_ybcoS(j) + J2 * Bz_subS_to_ybcoS(j);
            Jc_s(j) = Jc_calculation_s(Br_s(j), Bz_s(j), T_ybco_s(j));
        end  

        % 电流值符号，1为正，-1为负
        flag1 = 1;
        flag2 = 1;
        % 将总电流值变为非负
        if i1 < 0
            flag1 = -1;
        end
        Max_p = abs(i1);
        Min_p = 0;  % 原边超导电流最小值

        if i2 < 0
            flag2 = -1;
        end
        Max_s = abs(i2);
        Min_s = 0;
        
        i_ybco_p = Max_p / 2;
        J_ybco_p = i_ybco_p / S_ybco;
        i_sub_p = Max_p - i_ybco_p;

        i_ybco_s = Max_s / 2;
        J_ybco_s = i_ybco_s / S_ybco;
        i_sub_s = Max_s - i_ybco_s;

        error_Up_percent = 1; % 原边电压误差百分比
        error_Us_percent = 1; % 副边电压误差百分比
        error_ip_percent = 1; % 原边电流误差百分比
        error_is_percent = 1; % 副边电流误差百分比
        count_inner = 0; % 内环迭代记次

        % 内部电流环
        % 问题：初始时阻性压降极小（数量级1e-40附近），二分法迭代次数过多，难以满足收敛条件。
        % 处理：J_ybco << Jc时，超导层电压更容易收敛；J_ybco >> Jc时，金属层电压更容易收敛。因此针对不同情况采用不同的收敛条件
        while (error_Up_percent > 1e-5 && error_ip_percent > 1e-5) || (error_Us_percent > 1e-5 && error_is_percent > 1e-5)
            R_ybco_p = 0;
            R_ybco_s = 0;
            for j = 1:40
                r_p = 56.775 + floor((index_ybco_p_mfh(j) - 81) / 16) * 0.6;
                r_p = r_p / 1000;
                R_ybco_p = R_ybco_p + Ec * (J_ybco_p / Jc_p(j))^(n-1) / Jc_p(j) * 2 * pi * r_p / S_ybco;

                r_s = 55.025 + floor(index_ybco_s_mfh(j) / 16) * 0.25;
                r_s = r_s / 1000;
                R_ybco_s = R_ybco_s + Ec * (J_ybco_s / Jc_s(j))^(n-1) / Jc_s(j) * 2 * pi * r_s / S_ybco;
            end
            
            U_ybco_p = i_ybco_p * R_ybco_p;
            U_ybco_s = i_ybco_s * R_ybco_s;
            U_sub_p = i_sub_p * Rs1;
            U_sub_s = i_sub_s * Rs2;

            error_Up = U_ybco_p - U_sub_p;
            error_Up_percent = abs(error_Up / U_ybco_p);

            error_Us = U_ybco_s - U_sub_s;
            error_Us_percent = abs(error_Us / U_ybco_s);

            last_i_ybco_p = i_ybco_p;
            last_i_ybco_s = i_ybco_s;

            if error_Up > 0 % 如果超导电压 大于 金属层电压
                Max_p = i_ybco_p;
                i_ybco_p = (Max_p + Min_p) / 2;
                J_ybco_p = i_ybco_p / S_ybco;
                i_sub_p = abs(i1) - i_ybco_p;
            else
                Min_p = i_ybco_p;
                i_ybco_p = (Max_p + Min_p) / 2;
                J_ybco_p = i_ybco_p / S_ybco;
                i_sub_p = abs(i1) - i_ybco_p;
            end

            if error_Us > 0 % 如果超导电压 大于 金属层电压
                Max_s = i_ybco_s;
                i_ybco_s = (Max_s + Min_s) / 2;
                J_ybco_s = i_ybco_s / S_ybco;
                i_sub_s = abs(i2) - i_ybco_s;
            else
                Min_s = i_ybco_s;
                i_ybco_s = (Max_s + Min_s) / 2;
                J_ybco_s = i_ybco_s / S_ybco;
                i_sub_s = abs(i2) - i_ybco_s;
            end

            error_ip = i_ybco_p - last_i_ybco_p;
            error_ip_percent = abs(error_ip / i_ybco_p);
            error_is = i_ybco_s - last_i_ybco_s;
            error_is_percent = abs(error_is / i_ybco_s);

            count_inner = count_inner + 1; % 内环迭代记次
        end % 电流环结束
        
        i_ybco_p = flag1 * i_ybco_p;
        i_sub_p = flag1 * i_sub_p;
        i_ybco_s = flag2 * i_ybco_s;
        i_sub_s = flag2 * i_sub_s;
        
        last_Usc_p = Usc_p;
        last_Usc_s = Usc_s;
        
        if error_Up_percent < 1e-5
            Usc_p = i_sub_p * Rs1;
        else
            Usc_p = i_ybco_p * R_ybco_p;
        end

        if error_Us_percent < 1e-5
            Usc_s = i_sub_s * Rs2;
        else
            Usc_s = i_ybco_s * R_ybco_s;
        end
        
        error_Usc_p = Usc_p - last_Usc_p;
        error_Usc_s = Usc_s - last_Usc_s;
        error_Usc_p_percent = abs(error_Usc_p / Usc_p);
        error_Usc_s_percent = abs(error_Usc_s / Usc_s);
        
        Usc_p = Usc_p - 0.1 * error_Usc_p;
        Usc_s = Usc_s - 0.1 * error_Usc_s;
        count_middle = count_middle + 1; % 中环迭代记次
        error_judge = 1e-3 + floor(count_middle / 10) * 1e-3; % 放松收敛条件
    end % 电压环结束
    
%     count_inner;
%     count_middle;
%     Usc_p;
%     Usc_s;
    cal_n_count(i) = count_middle;
    U_sc_r_p(i) = Usc_p;
    U_sc_r_s(i) = Usc_s;

    i1_pre = i1;  % 原边总电流
    i2_pre = i2;  % 副边总电流
    
    u_source(i) = u;
    current_p_HTS(i) = i_ybco_p;
    current_s_HTS(i) = i_ybco_s;
    current_p_total(i) = i1_pre;
    current_s_total(i) = i2_pre;
    
    J_ybco_p = i_ybco_p / S_ybco;
    J_ybco_s = i_ybco_s / S_ybco;
    J_sub_p = (i1 - i_ybco_p) / S_sub_p;
    J_sub_s = (i2 - i_ybco_s) / S_sub_s;
    
    Jc_p_record(i) = max(Jc_p);
    Jc_s_record(i) = max(Jc_s);
    
    R_ybco_p_record(i) = R_ybco_p;
    R_ybco_s_record(i) = R_ybco_s;
   %% COMSOL 传热模型载入、运算
    % ybco primary 热源注入
    for j = 1:40
        Q_ybco_p = abs(Ec * (J_ybco_p / Jc_p(j))^n * J_ybco_p);
        label_2 = strcat('hs',num2str(j));
        model_2.physics('ht').feature(label_2).set('Q', num2str(Q_ybco_p));
    end
    
    % ybco secondary % 热源注入
    for j = 41:80
        Q_ybco_s = abs(Ec * (J_ybco_s / Jc_s(j-40))^n * J_ybco_s);
        label_2 = strcat('hs',num2str(j));
        model_2.physics('ht').feature(label_2).set('Q', num2str(Q_ybco_s));
    end
    
    % sub primary 热源注入
    Q_sub_p = J_sub_p^2 * rho_new(T_sub_p);
    model_2.physics('ht').feature('hs81').set('Q', num2str(Q_sub_p));
    
    % sub secondary 热源注入
    Q_sub_s = J_sub_s^2 * rho(T_sub_s);
    model_2.physics('ht').feature('hs82').set('Q', num2str(Q_sub_s));
    
    if floor(i/2) ~= i/2
        % 运行
        model_2.sol('sol1').runAll;
        % 超导层平均温度计算
        for j = 1:40
            temp = mphmean(model_2, 'T', 'surface', 'selection', index_ybco_p_ht(j), 'dataset', 'dset1');
            T_ybco_p(j) = temp(2);
            temp = mphmean(model_2, 'T', 'surface', 'selection', index_ybco_s_ht(j), 'dataset', 'dset1');
            T_ybco_s(j) = temp(2);
        end

        T_ybco_p_record(i) = mean(T_ybco_p);
        T_ybco_p_record_max(i) = max(T_ybco_p);
        T_ybco_p_record_min(i) = min(T_ybco_p);
        
        T_ybco_s_record(i) = mean(T_ybco_s);
        T_ybco_s_record_max(i) = max(T_ybco_s);
        T_ybco_s_record_min(i) = min(T_ybco_s);
        
        % 非超导层平均温度计算
        temp = mphmean(model_2, 'T', 'surface', 'selection', index_sub_p_ht, 'dataset', 'dset1');
        T_sub_p = temp(2);
        T_sub_p_record(i) = T_sub_p;

        temp = mphmean(model_2, 'T', 'surface', 'selection', index_sub_s_ht, 'dataset', 'dset1');
        T_sub_s = temp(2);
        T_sub_s_record(i) = T_sub_s;

        
        % study1迭代转换
        if i == 1
            model_2.study('std1').feature('time').set('useinitsol', 'on');
            model_2.study('std1').feature('time').set('initmethod', 'sol');
            model_2.study('std1').feature('time').set('initstudy', 'std2');
            model_2.study('std1').feature('time').set('solnum', 'last');
        end
        
    else
        % 运行
        model_2.sol('sol2').runAll;
        % 取温度值
        for j = 1:40
            temp = mphmean(model_2, 'T', 'surface', 'selection', index_ybco_p_ht(j), 'dataset', 'dset2');
            T_ybco_p(j) = temp(2);
            temp = mphmean(model_2, 'T', 'surface', 'selection', index_ybco_s_ht(j), 'dataset', 'dset2');
            T_ybco_s(j) = temp(2);
        end

        T_ybco_p_record(i) = mean(T_ybco_p);
        T_ybco_p_record_max(i) = max(T_ybco_p);
        T_ybco_p_record_min(i) = min(T_ybco_p);
        
        T_ybco_s_record(i) = mean(T_ybco_s);
        T_ybco_s_record_max(i) = max(T_ybco_s);
        T_ybco_s_record_min(i) = min(T_ybco_s);

        % 非超导层平均温度计算
        temp = mphmean(model_2, 'T', 'surface', 'selection', index_sub_p_ht, 'dataset', 'dset2');
        T_sub_p = temp(2);
        T_sub_p_record(i) = T_sub_p;

        temp = mphmean(model_2, 'T', 'surface', 'selection', index_sub_s_ht, 'dataset', 'dset2');
        T_sub_s = temp(2);
        T_sub_s_record(i) = T_sub_s;
    end
    
    % 非超导层电阻计算
    Rs1 = rho_new(T_sub_p) * 14.35 / S_sub_p; % 原边绕组长度14.35 m
    Rs2 = rho(T_sub_s) * 14 / S_sub_s; % 副边绕组长度14 m
    Rs1_record(i) = Rs1;
    Rs2_record(i) = Rs2;
    toc
end

subplot(2,1,1);
plot(T_ybco_p_record, 'r--'); hold on
plot(T_sub_p_record, 'r-'); hold on
plot(T_ybco_s_record, 'b--'); hold on
plot(T_sub_s_record, 'b-'); hold on

subplot(2,1,2);
plot(current_p_total, 'r-'); hold on
plot(current_p_HTS, 'r--'); hold on
plot(current_s_total, 'b-'); hold on
plot(current_s_HTS, 'b--'); hold on

plot(u_source * max(current_p_total) / max(u_source), 'k-'); hold on
toc % 总运行时间