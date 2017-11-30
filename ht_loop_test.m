model_2 = mphload('ht_draft');

for i = 1:4
    % ybco primary
    for j = 1:40
        % 热源注入
        label_2 = strcat('hs',num2str(j));
        model_2.physics('ht').feature(label_2).set('Q', num2str(1e12));
    end

    % ybco secondary
    for j = 41:80
        % 热源注入
        label_2 = strcat('hs',num2str(j));
        model_2.physics('ht').feature(label_2).set('Q', num2str(1e12));
    end

    % sub primary
    % 热源注入
    model_2.physics('ht').feature('hs81').set('Q', num2str(1e12));

    % sub secondary
    % 热源注入
    model_2.physics('ht').feature('hs82').set('Q', num2str(1e12));
    if floor(i/2) ~= i/2
        model_2.sol('sol1').runAll;
        mphmean(model_2,'T','surface','selection',index_sub_p, 'dataset', 'dset1')
        if i == 1
            model_2.study('std1').feature('time').set('useinitsol', 'on');
            model_2.study('std1').feature('time').set('initmethod', 'sol');
            model_2.study('std1').feature('time').set('initstudy', 'std2');
            model_2.study('std1').feature('time').set('solnum', 'last');
        end
    else
        model_2.sol('sol2').runAll;
        mphmean(model_2,'T','surface','selection',index_sub_p, 'dataset', 'dset2')
    end
end