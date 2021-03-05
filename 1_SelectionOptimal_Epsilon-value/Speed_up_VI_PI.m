%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Speed up Value Iter. / Policy Iter.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('.\DATAS\1_DATAS_Exec_time_ep-0.01.mat')
load('.\DATAS\2_DATAS_Exec_time_ep-0.01.mat')
load('.\DATAS\3_DATAS_Exec_time_ep-0.01.mat')
load('.\DATAS\4_DATAS_Exec_time_ep-0.01.mat')
load('.\DATAS\5_DATAS_Exec_time_ep-0.01.mat')

y_Exec_time_PI_=y_Exec_time_PI + y_Exec_time_PI_2 + y_Exec_time_PI_3 + y_Exec_time_PI_4 + y_Exec_time_PI_5;
y_Exec_time_PI_average = y_Exec_time_PI_/ 5;
y_Exec_time_VI_=y_Exec_time_VI + y_Exec_time_VI_2 + y_Exec_time_VI_3 + y_Exec_time_VI_4 + y_Exec_time_VI_5;
y_Exec_time_VI_average= y_Exec_time_VI_/5; 


for i = 1: 52
	speedup_VI_PI_(i)= y_Exec_time_VI_average(i) / y_Exec_time_PI_average(i);
end
 
figure()
	plot(x, speedup_VI_PI_,'--','color','blue')
	xlim([4 55]);
	legend('Exec\_time\_VI / Exec\_time\_PI')
	set(gca,'fontweight','bold');
	xlabel('Grid row / column size "s"');
	ylabel('Speed up');