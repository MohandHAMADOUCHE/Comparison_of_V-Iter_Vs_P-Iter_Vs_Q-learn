clc
clear

load('.\DATAS\DATAS_iter_.mat')
load('.\DATAS\DATAS_Exec_time_.mat')
load('.\DATAS\DATAS_diff_actions_.mat')

%% drawing of the comparison graphs of the number of iterations between the three methods
	figure();
	plot(x,y_nbr_iter_PI,'-','color','blue')
	hold on
	plot(x,y_nbr_iter_VI,'-','color','red')
	hold on
	plot(x,y_nbr_iter_Ql,'-','color','green')
	legend('Number\_Iter\_PolicyIeration','Number\_Iter\_ValueIteration','Number\_Iter\_Q-learning');
	legend('boxoff')
	set(gca,'fontweight','bold');
	xlabel('Grid row / column size "s"');
	xlim([4 55]);
	ylabel('Iterations');  
	ylim([-10000 1000000]);
	hold off


%% drawing of the comparison graphs of the execution time between the three methods
	figure();
	plot(x,y_Exec_time_PI,'-','color','blue')
	hold on
	plot(x,y_Exec_time_VI,'-','color','red')
	hold on
	plot(x,y_Exec_time_Ql,'-','color','green')
	legend('Exec\_Time\_PolicyIeration','Exec\_Time\_ValueIteration', 'Exec\_Time\_Q-learning') 
	legend('boxoff')
	set(gca,'fontweight','bold');
	xlabel('Grid row / column size "s"');
	ylabel('Time_{seconds}');
	xlim([4 55]);
	ylim([-4 190]);
	hold off


%% drawing of the comparison graphs of the number of different actions between the two methods
	figure();
	plot(x,y_nbr_diff_actions_VI_Ql,'*','color','red')
	legend('nbr\_different\_actions\_PI\_Ql')
	legend('boxoff')
	set(gca,'fontweight','bold');
	xlabel('Grid row / column size "s"');
	ylabel('Actions');
	xlim([4 55]);
	ylim([-20 1300])
	hold off

