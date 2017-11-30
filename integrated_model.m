
tic
%% Comsol domin ���
index_ybco_p = [82 83 84 85 86 87 88 89 98 99 100 101 102 103 104 105 114 115 116 117 118 119 120 121 130 131 132 133 134 135 136 137 146 147 148 149 150 151 152 153];
index_ybco_s = [2 3 4 5 6 7 8 9 18 19 20 21 22 23 24 25 34 35 36 37 38 39 40 41 50 51 52 53 54 55 56 57 66 67 68 69 70 71 72 73];
index_sub_p = [90 91 92 93 94 95 96 97 106 107 108 109 110 111 112 113 122 123 124 125 126 127 128 129 138 139 140 141 142 143 144 145 154 155 156 157 158 159 160 161];
index_sub_s = [10 11 12 13 14 15 16 17 26 27 28 29 30 31 32 33 42 43 44 45 46 47 48 49 58 59 60 61 62 63 64 65 74 75 76 77 78 79 80 81];

%% ��·ģ�ͳ�ʼ��
r = 17e-3; % ƽ̨����
L1 = 0.213e-3; %ԭ/���ߵ��
L2 = 0.22e-3; 
M = 0.209e-3; %����
i1_pre = 0; % ԭ/���߳�ʼ����
i2_pre = 0;
Rs1 = rho(77) * 1.9133e7; % ԭ�����鳤��14.35 m    Rs1 = rho(T_sub_p) * 14.35 / (0.15e-3 * 5e-3)
Rs2 = rho(77) * 1.8667e7; % �������鳤��14 m

% ��������
Ec = 1e-4;
IcB = 40; % 40 A
n = 17;

% ���������ʼ��
time_step = 1e-5;
steps = 100; % ÿ������2000��

S_ybco = 0.1e-3 * 5e-3; % ����������
S_sub = 0.15e-3 * 5e-3; % �ǳ���������

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

% ��������ѹ��
Usc_p = 0;
Usc_s = 0;

% ÿ��Jc
Jc_p = ones(1,40) * 40 / S_ybco;
Jc_s = ones(1,40) * 40 / S_ybco;

% ÿ���¶ȷֲ�
T_ybco_p = ones(1,40) * 77;
T_ybco_s = ones(1,40) * 77;
T_sub_p = 77;
T_sub_s = 77;

Br_p = zeros(1,40);
Bz_p = zeros(1,40);
Br_s = zeros(1,40);
Bz_s = zeros(1,40);

% �����
x1 = 0; 
x2 = 0;

hwait = waitbar(0, 'begin !');
toc

%% ��ѭ��
for i = 1:steps
    tic % ��¼ÿ������ʱ��
    str = ['step ', num2str(i), ':   ', num2str(i/steps * 100), ' % completed...'];
    waitbar(i/steps, hwait, str); % ������
    u = 30 * sqrt(2) * sin(2 * pi * 50 * i * time_step); % ��Դ��ѹ
    x = fsolve(@(x) circuit_circulation(x, u, r, L1, L2, M, Usc_p, Usc_s, Rs1, Rs2, i1_pre, i2_pre, time_step), [x1, x2]);
    
    i1_shunt = Usc_p / Rs1; % ԭ�߻��������
    J_sub_p = i1_shunt / S_sub;
    i2_shunt = Usc_s / Rs2; % ���߻��������
    J_sub_s = i2_shunt / S_sub;
    
    % ʵ���У�Uc * (x(1) / IcB)^n�ļ����Ƕ����ͣ������comsol�����
    i1_pre = x(1) + i1_shunt; % ԭ���ܵ���
    i2_pre = x(2) + i2_shunt; % �����ܵ���
    
    % ����4��������ͨ��comsolģ��
    x1 = x(1); % ԭ�߳��������
    J_ybco_p = x1 / S_ybco;
    x2 = x(2); % ���߳��������
    J_ybco_s = x2 / S_ybco;
    
    u_source(i) = u;
    current_p_HTS(i) = x1;
    current_s_HTS(i) = x2;
    current_p_total(i) = i1_pre;
    current_s_total(i) = i2_pre;
    
   %% COMSOL ���ģ�����롢����
    model_1 = mphload('mfh');
    % �����ܶ�ע��
    model_1.physics('mfh').feature('ecd1').set('Je', {'0'; num2str(J_ybco_p) ; '0'}); % ybco primary
    model_1.physics('mfh').feature('ecd2').set('Je', {'0'; num2str(J_ybco_s) ; '0'}); % ybco secondary
    model_1.physics('mfh').feature('ecd3').set('Je', {'0'; num2str(J_sub_p) ; '0'}); % sub primary
    model_1.physics('mfh').feature('ecd4').set('Je', {'0'; num2str(J_sub_s) ; '0'}); % sub secondary
    % ����
    model_1.sol('sol1').runAll;
    
    % ȡ�ų�ֵ
    for j = 1:40
        Br_p(j) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_p(j));
        Bz_p(j) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_p(j));
        Br_s(j) = mphint2(model_1, 'mfh.Br / (S_ybco)', 'surface', 'selection', index_ybco_s(j));
        Bz_s(j) = mphint2(model_1, 'mfh.Bz / (S_ybco)', 'surface', 'selection', index_ybco_s(j));        
    end
    
    %% COMSOL ����ģ�����롢����
    model_2 = mphload('ht');
    % ybco primary
    for j = 1:40
        % ��Դע��
        Q_ybco_p = Ec * (J_ybco_p / Jc_p(j))^n * J_ybco_p;
        label_2 = strcat('hs',num2str(j));
        model_2.physics('ht').feature(label_2).set('Q', num2str(Q_ybco_p));
        % ��ʼ�¶�����
        label_3 = strcat('init',num2str(j+1));
        model_2.physics('ht').feature(label_3).set('Tinit', num2str(T_ybco_p(j)));
    end
    % ybco secondary
    for j = 41:80
        % ��Դע��
        Q_ybco_s = Ec * (J_ybco_s / Jc_s(j-40))^n * J_ybco_s;
        label_2 = strcat('hs',num2str(j));
        model_2.physics('ht').feature(label_2).set('Q', num2str(Q_ybco_s));
        % ��ʼ�¶�����
        label_3 = strcat('init',num2str(j+1));
        model_2.physics('ht').feature(label_3).set('Tinit', num2str(T_ybco_s(j-40)));
    end
    % sub primary
    % ��Դע��
    Q_sub_p = J_sub_p^2 * rho(T_sub_p);
    model_2.physics('ht').feature('hs81').set('Q', num2str(Q_sub_p));
    % ��ʼ�¶�����
    model_2.physics('ht').feature('init82').set('Tinit', num2str(T_sub_p));
    % sub secondary
    % ��Դע��
    Q_sub_s = J_sub_s^2 * rho(T_sub_s);
    model_2.physics('ht').feature('hs82').set('Q', num2str(Q_sub_s));
    % ��ʼ�¶�����
    model_2.physics('ht').feature('init83').set('Tinit', num2str(T_sub_s));
    
    % ����
    model_2.sol('sol1').runAll;
    
    % ȡ�¶�ֵ��ͬʱ����Jc
    for j = 1:40
        temp = mphint2(model_2, 'T / (0.5[m^2])', 'surface', 'selection', index_ybco_p(j));
        T_ybco_p(j) = temp(2);
        temp = mphint2(model_2, 'T / (0.5[m^2])', 'surface', 'selection', index_ybco_s(j));
        T_ybco_s(j) = temp(2);
        Jc_p(j) = Jc_calculation(Br_p(j), Bz_p(j), T_ybco_p(j));
        Jc_s(j) = Jc_calculation(Br_s(j), Bz_s(j), T_ybco_s(j));
    end
    
    T_ybco_p_record(i) = mean(T_ybco_p);
    T_ybco_s_record(i) = mean(T_ybco_s);
    
    % �ǳ�����ƽ���¶ȼ���
    temp = mphint2(model_2, 'T / (40 * 0.75[m^2])', 'surface', 'selection', index_sub_p);
    T_sub_p = temp(2);
    T_sub_p_record(i) = T_sub_p;
    
    temp = mphint2(model_2, 'T / (40 * 0.75[m^2])', 'surface', 'selection', index_sub_s);
    T_sub_s = temp(2);
    T_sub_s_record(i) = T_sub_s;
    % �ǳ�����������
    Rs1 = rho(T_sub_p) * 1.9133e7; % ԭ�����鳤��14.35 m  Rs1 = rho(T_sub_p) * 14.35 / (0.15e-3 * 5e-3)
    Rs2 = rho(T_sub_s) * 1.8667e7; % �������鳤��14 m
    
    Usc_p = 0;
    Usc_s = 0;
    
    for j = 1:40
        r_p = 56.5 + floor(index_ybco_p(j) / 16) * 0.25;
        r_s = 55.05 + floor(index_ybco_s(j) / 16) * 0.25;
        Usc_p = Usc_p + Ec * (J_ybco_p / Jc_p(j))^n * 2 * pi * r_p / 1000;
        Usc_s = Usc_s + Ec * (J_ybco_s / Jc_s(j))^n * 2 * pi * r_s / 1000;
    end
    U_sc_r_p(i) = Usc_p;
    U_sc_r_s(i) = Usc_s;
    toc
end 