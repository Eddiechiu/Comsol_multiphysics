% DerongQ 2017.9
% 完整电路模型，考虑原副边互感

% u-电源电压， r-平台内阻， L1/L2-原/副边电感， M-互感， Rs1/Rs2-超导带材等效并联电阻， n-带材n值
% sigma_1 = sum( Ec * 2 * pi * r / Ic^n ) 便于函数传参
% 时间间隔为 1e-5 秒。
% x(1)是原边超导层电流，x(2)是副边超导层电流，i1是原边总电流，i2是副边总电流

function F = circuit_circulation_improved(x, u, r, L1, L2, M, Usc_p, Usc_s, Rs1, Rs2, i1_pre, i2_pre, t_step)

i1 = x(1) + Usc_p / Rs1; % 原边电流
i2 = x(2) + Usc_s / Rs2; % 副边电流

F = [
    -u + i1 * r + Usc_p + (L1 * (i1 - i1_pre) - M * (i2 - i2_pre)) / t_step; % 原边电压方程 
    Usc_s + (L2 * (i2 - i2_pre) - M * (i1 - i1_pre)) / t_step; % 副边电压方程
    ];

%{
Usc_p = -(Rs1*(M^2*i1_pre - M^2*i_sc_p - L1*L2*i1_pre + L1*L2*i_sc_p - L2*t_step*u - Rs2*t_step^2*u + ...
 Rs2*i_sc_p*r*t_step^2 - L1*Rs2*i1_pre*t_step + L1*Rs2*i_sc_p*t_step + M*Rs2*i2_pre*t_step - M*Rs2*i_sc_s*t_step + ...
 L2*i_sc_p*r*t_step))/(L1*L2 - M^2 + L1*Rs2*t_step + L2*Rs1*t_step + L2*r*t_step + Rs1*Rs2*t_step^2 + Rs2*r*t_step^2)
    
Usc_s = -(Rs2*(M^2*i2_pre - M^2*i_sc_s - L1*L2*i2_pre + L1*L2*i_sc_s - M*t_step*u - L2*Rs1*i2_pre*t_step + L2*Rs1*i_sc_s*t_step + ...
 M*Rs1*i1_pre*t_step - M*Rs1*i_sc_p*t_step - L2*i2_pre*r*t_step + L2*i_sc_s*r*t_step + M*i1_pre*r*t_step))/(L1*L2 - M^2 + L1*Rs2*t_step + ...
 L2*Rs1*t_step + L2*r*t_step + Rs1*Rs2*t_step^2 + Rs2*r*t_step^2)
   
%}













