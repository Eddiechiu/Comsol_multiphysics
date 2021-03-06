%% 2017.11版本 参数alpha、k、Bc已根据实验值更新
% 副边超导带

function F = Jc_calculation_s(Br, Bz, T)
lambda = 9.7615e8;
alpha = 0.627;
Tc = 92;
if T > Tc
    T = 91.99;
end
k = 0.367;
Bc = 0.0525;
JcT = lambda * (1 - (T./Tc).^2).^(3/2);
F = JcT ./ (1 + (sqrt(k^2 * Bz.^2 + Br.^2)/Bc).^alpha);