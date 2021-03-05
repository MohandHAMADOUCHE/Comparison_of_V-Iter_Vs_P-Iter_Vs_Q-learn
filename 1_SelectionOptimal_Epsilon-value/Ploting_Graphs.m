clc
clear

    %% epsilon = 0.01
	    load('.\DATAS\DATAS_Exec_time_ep-0.01.mat')
	    load('.\DATAS\DATAS_iter_ep-0.01.mat')
	    load('.\DATAS\DATAS_diff_actions_ep-0.01.mat')
	    
    %% epsilon = 0.1
	    load('.\DATAS\DATAS_Exec_time_ep-0.1.mat')
	    load('.\DATAS\DATAS_iter_ep-0.1.mat')
	    load('.\DATAS\DATAS_diff_actions_ep-0.1.mat')
    
    %% epsilon = 0.5
	    load('.\DATAS\DATAS_Exec_time_ep-0.5.mat')
	    load('.\DATAS\DATAS_iter_ep-0.5.mat')
	    load('.\DATAS\DATAS_diff_actions_ep-0.5.mat')
    
    %% drawing of the comparison graphs of the number of iterations between the 2 methods
    figure();
    plot(x,y_nbr_iter_PI_001,'-','color','blue');
    hold on
    plot(x,y_nbr_iter_VI_001,'-','color','blue')
    hold on
    plot(x,y_nbr_iter_VI_01,'-')
    hold on
    plot(x,y_nbr_iter_VI_05,'-')
    legend('Number\_Iter\_PolicyIeration','Number\_Iter\_ValueIteration\_epsilon\_0.01','Number\_Iter\_ValueIteration\_epsilon\_0.1','Number\_Iter\_ValueIteration\_epsilon\_0.5');
    set(gca,'fontweight','bold');
    xlabel('Grid row / column size "s"');
    xlim([4 55]);
    ylabel('Iterations');  
    ylim([0 175]);
    legend('boxoff')
    
    %% drawing of the comparison graphs of the execution time between the 2 methods
    figure();
    plot(x,y_Exec_time_PI_001,'-','color','blue')
    hold on
    plot(x,y_Exec_time_VI_001,'-','color','red')
    hold on
    plot(x,y_Exec_time_VI_01,'-')
    hold on
    plot(x,y_Exec_time_VI_05,'-')
    legend('Exec\_Time\_PolicyIeration','Exec\_Time\_ValueIteration\_epsilon\_0.01','Exec\_Time\_ValueIteration\_epsilon\_0.1' ,'Exec\_Time\_ValueIteration\_epsilon\_0.5') 
    set(gca,'fontweight','bold');
    xlabel('Grid row / column size "s"');
    xlim([4 55]);
    ylabel('Time_{seconds}');
    ylim([-0.5 22]);
    legend('boxoff')
    hold off
    
 
    %% drawing of the comparison graphs of the number of different actions between the 2 methods
    figure();
    plot(x,y_nbr_diff_actions_VI_PI_001,'*','color','red')
    hold on
    plot(x,y_nbr_diff_actions_VI_PI_01,'-','color','blue')
    hold on
    plot(x,y_nbr_diff_actions_VI_PI_05,':','color','blue')
    hold on
    legend('nbr\_different\_actions 001','nbr\_different\_actions 01','nbr\_different\_actions 05')
    ylim([-0.5 1.5])
    legend('boxoff')
    xlabel('Grid row / column size "s"');
    ylabel('different actions');
    hold off   
    


    
    


