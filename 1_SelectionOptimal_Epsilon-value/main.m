%^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
%              main comparison
%^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

%% epsilon = 0.01
	epsilon = 0.01;
	[x, y_nbr_iter_VI_001, y_nbr_iter_PI_001, y_Exec_time_VI_001,y_Exec_time_PI_001, y_nbr_diff_actions_VI_PI_001]= comparison_VI_PI(epsilon);

	% saving data
	save('DATAS/DATAS_iter_ep-0.01.mat','x','y_nbr_iter_VI_001','y_nbr_iter_PI_001');
	save('DATAS/DATAS_Exec_time_ep-0.01.mat','x','y_Exec_time_VI_001','y_Exec_time_PI_001');
	save('DATAS/DATAS_diff_actions_VI_PI_ep-0.01.mat','x','y_nbr_diff_actions_VI_PI_001');


%% epsilon = 0.1
	epsilon = 0.1;
	[x, y_nbr_iter_VI_01, y_nbr_iter_PI_01, y_Exec_time_VI_01,y_Exec_time_PI_01, y_nbr_diff_actions_VI_PI_01]= comparison_VI_PI(epsilon);

	% saving data
	save('DATAS/DATAS_iter_ep-0.1.mat','x','y_nbr_iter_VI_01','y_nbr_iter_PI_01');
	save('DATAS/DATAS_Exec_time_ep-0.1.mat','x','y_Exec_time_VI_01','y_Exec_time_PI_01');
	save('DATAS/DATAS_diff_actions_VI_PI_ep-0.1.mat','x','y_nbr_diff_actions_VI_PI_01');

%% epsilon = 0.5
	epsilon = 0.5;
	[x, y_nbr_iter_VI_05, y_nbr_iter_PI_05, y_Exec_time_VI_05,y_Exec_time_PI_05, y_nbr_diff_actions_VI_PI_05]= comparison_VI_PI(epsilon);

	% saving data
	save('DATAS/DATAS_iter_ep-0.5.mat','x','y_nbr_iter_VI_05','y_nbr_iter_PI_05');
	save('DATAS/DATAS_Exec_time_ep-0.5.mat','x','y_Exec_time_VI_05','y_Exec_time_PI_05');
	save('DATAS/DATAS_diff_actions_VI_PI_ep-0.5.mat','x','y_nbr_diff_actions_VI_PI_05');