%% 2017.12.13版本 参数alpha、k、Bc已根据实验值更新
% 原边超导带参数

function F = Jc_calculation_p(Br, Bz, T)
lambda = 1.8303e9;
alpha = 0.7283;
Tc = 92;
if T > Tc
    T = 91.99;
end
k = 0.4795;
Bc = 0.09262;
JcT = lambda * (1 - (T./Tc).^2).^(3/2);
F = JcT ./ (1 + (sqrt(k^2 * Bz.^2 + Br.^2)/Bc).^alpha);