syms  i1 i2 u r L1 L2 M Usc_p Usc_s i1_pre i2_pre t_step

[i1, i2] = solve(u == i1 * r + Usc_p + (L1 * (i1 - i1_pre) - M * (i2 - i2_pre)) / t_step,...
    Usc_s + (L2 * (i2 - i2_pre) - M * (i1 - i1_pre)) / t_step == 0, i1, i2);