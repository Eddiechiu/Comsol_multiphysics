% DerongQ 2017.9
% ������·ģ�ͣ�����ԭ���߻���

% u-��Դ��ѹ�� r-ƽ̨���裬 L1/L2-ԭ/���ߵ�У� M-���У� Rs1/Rs2-�������ĵ�Ч�������裬 n-����nֵ
% sigma_1 = sum( Ec * 2 * pi * r / Ic^n ) ���ں�������
% ʱ����Ϊ 1e-5 �롣
% x(1)��ԭ�߳����������x(2)�Ǹ��߳����������i1��ԭ���ܵ�����i2�Ǹ����ܵ���

function F = circuit_circulation(x, u, r, L1, L2, M, Usc_p, Usc_s, Rs1, Rs2, i1_pre, i2_pre, t_step)
i1 = x(1) + Usc_p / Rs1; % ԭ�ߵ���
i2 = x(2) + Usc_s / Rs2; % ���ߵ���
F = [
    -u + i1 * r + Usc_p + (L1 * (i1 - i1_pre) - M * (i2 - i2_pre)) / t_step; % ԭ�ߵ�ѹ���� 
    Usc_s + (L2 * (i2 - i2_pre) - M * (i1 - i1_pre)) / t_step; % ���ߵ�ѹ����
    ];