%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Speed up   Q-learn. /  Value Iter. ( Policy Iter.) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('.\DATAS\DATAS_Exec_time_.mat')
load('.\DATAS\1DATAS_Exec_time_.mat')
load('.\DATAS\2DATAS_Exec_time_.mat')


Y_Exec_time_PI__=  (y_Exec_time_PI + y_Exec_time_PI_1 + y_Exec_time_PI_2)/3;
Y_Exec_time_VI__=  (y_Exec_time_VI + y_Exec_time_VI_1 + y_Exec_time_VI_2)/3;
Y_Exec_time_Ql__=  (y_Exec_time_Ql + y_Exec_time_Ql_1 + y_Exec_time_Ql_2)/3;

for i= 1: 52
    Y_Exec_time_QL_PI (i) = Y_Exec_time_Ql__(i) / Y_Exec_time_PI__(i);
    Y_Exec_time_QL_VI (i) = Y_Exec_time_Ql__(i) / Y_Exec_time_VI__(i);
end

figure()
plot (x, Y_Exec_time_QL_PI,'--','color','blue');
hold on 
plot (x, Y_Exec_time_QL_VI,'--','color','green');
legend('Exec\_time\_QL / Exec\_time\_PI','Exec\_time\_QL / Exec\_time\_VI');
legend('boxoff')
set(gca,'fontweight','bold');
xlabel('Grid row / column size "s"');
xlim([4 55]);
ylabel('Speed up');  
ylim([-50 5500]);
