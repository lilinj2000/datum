

% cath_0_5 = VarName1;
% cath_0_5(:, 2) = num2cell(VarName4);

% xeon_32016 = VarName1;
% xeon_32016(:, 2) = num2cell(VarName4);

% zack_12345 = VarName1;
% zack_12345(:, 2) = num2cell(VarName4);
% 
% % zack_12335 = VarName1;
% % zack_12335(:, 2) = num2cell(VarName4);
% 
% % zack_12325 = VarName1;
% % zack_12325(:, 2) = num2cell(VarName4);

% zack_22235 = VarName1;
% zack_22235(:, 2) = num2cell(VarName4);

% zeta_12345 = VarName1;
% zeta_12345(:, 2) = num2cell(VarName4);

% zeta_22235 = VarName1;
% zeta_22235(:, 2) = num2cell(VarName4);

cath_0_5_timestamp = char(cath_0_5(:, 1));
xeon_32016_timestamp = char(xeon_32016(:, 1));
zack_12345_timestamp = char(zack_12345(:, 1));
% zack_12335_timestamp = char(zack_12335(:, 1));
% zack_12325_timestamp = char(zack_12325(:, 1));
zack_22235_timestamp = char(zack_22235(:, 1));
zeta_12345_timestamp = char(zeta_12345(:, 1));
zeta_22235_timestamp = char(zeta_22235(:, 1));

% common time stamp
common_time_stamp = intersect(cath_0_5_timestamp, xeon_32016_timestamp, 'rows');

common_time_stamp = intersect(zack_12345_timestamp, common_time_stamp, 'rows');
% common_time_stamp = intersect(zack_12335_timestamp, common_time_stamp, 'rows');
% common_time_stamp = intersect(zack_12325_timestamp, common_time_stamp, 'rows');
common_time_stamp = intersect(zack_22235_timestamp, common_time_stamp, 'rows');
common_time_stamp = intersect(zeta_12345_timestamp, common_time_stamp, 'rows');
common_time_stamp = intersect(zeta_22235_timestamp, common_time_stamp, 'rows');

% common data rows
cath_0_5_delay = find(ismember(cath_0_5_timestamp, common_time_stamp, 'rows'));
xeon_32016_delay = find(ismember(xeon_32016_timestamp, common_time_stamp, 'rows'));
zack_12345_delay = find(ismember(zack_12345_timestamp, common_time_stamp, 'rows'));
% zack_12335_delay = find(ismember(zack_12335_timestamp, common_time_stamp, 'rows'));
% zack_12325_delay = find(ismember(zack_12325_timestamp, common_time_stamp, 'rows'));
zack_22235_delay = find(ismember(zack_22235_timestamp, common_time_stamp, 'rows'));
zeta_12345_delay = find(ismember(zeta_12345_timestamp, common_time_stamp, 'rows'));
zeta_22235_delay = find(ismember(zeta_22235_timestamp, common_time_stamp, 'rows'));

% construt the result data
result_delay = cell(0);
result_delay(:, 1) = cellstr(common_time_stamp);

result_delay(:, 2) = cath_0_5(cath_0_5_delay, 2);
result_delay(:, 3) = xeon_32016(xeon_32016_delay, 2);

result_delay(:, 4) = zack_12345(zack_12345_delay, 2);
% result_delay(:, 5) = zack_12335(zack_12335_delay, 2);
% result_delay(:, 6) = zack_12325(zack_12325_delay, 2);
result_delay(:, 5) = zack_22235(zack_22235_delay, 2);
result_delay(:, 6) = zeta_12345(zeta_12345_delay, 2);
result_delay(:, 7) = zeta_22235(zeta_22235_delay, 2);

result_relate_delay = [];
for ii=2:7
    result_relate_delay(:, ii-1) = cell2mat(result_delay(:, ii)) - cell2mat(result_delay(:, 2));
end

for ii=2:6
    result_std(ii-1) = std(result_relate_delay(:, ii));
    result_mean(ii-1) = mean(result_relate_delay(:, ii));
    result_max(ii-1) = max(result_relate_delay(:, ii));
    result_min(ii-1) = min(result_relate_delay(:, ii));
    
    [p, x] = ecdf(result_relate_delay(:, ii));
    x_67(ii-1) = x(max(find(p<=0.67))-1);
    x_95(ii-1) = x(max(find(p<=0.95))-1);
end

xele_vs_zeusing = result_relate_delay(:,6) - result_relate_delay(:, 2);

clear cath_0_5_timestamp xeon_32016_timestamp;
clear zack_12345_timestamp zack_12335_timestamp zack_12325_timestamp zack_22235_timestamp;
clear zeta_12345_timestamp zeta_22235_timestamp;
clear common_time_stamp cath_0_5_delay xeon_32016_delay;
clear zack_12345_delay zack_12335_delay zack_12325_delay zack_22235_delay;
clear zeta_12345_delay zeta_22235_delay;
clear ii;
% dfittool



[p, x] = ecdf(xele_vs_zeusing);
x_67_xele_vs_zeusing = x(max(find(p<=0.67))-1);
x_95_xele_vs_zeusing = x(max(find(p<=0.95))-1);

clear p x;

% x_67_xele_vs_zeusing_w25 = horzcat(x_67_xele_vs_zeusing_w25, x_67_xele_vs_zeusing);
% x_95_xele_vs_zeusing_w25 = horzcat(x_95_xele_vs_zeusing_w25, x_95_xele_vs_zeusing);

% xele_vs_zeusing_w25 = vertcat(xele_vs_zeusing_w25, xele_vs_zeusing);

% plot(x_67_xele_vs_zeusing_w27);
% hold on;
% plot(x_95_xele_vs_zeusing_w27);
% legend('67%', '95%');



