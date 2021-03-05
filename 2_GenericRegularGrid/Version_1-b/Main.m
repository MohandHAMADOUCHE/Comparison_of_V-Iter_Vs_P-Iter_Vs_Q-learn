%^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
%              main comparison
%^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

S = 55; 
start = 4;
discount = 0.99;
for i = start:S
    i 
    s = i^2;
    [P, R] = mdp_navigation_Grid (s); 
   
   	%% find the number of iterations of the Policy Iteration method
	    tic
	    [~, ~, policy_PI, iter1, cpu_time1] = mdp_policy_iteration(P, R, discount); 
	    time1 = toc;
	   	Exec_time_PI(i-3) = time1;
	   	iteration_PI(i-3) = iter1;
    
   	%% find the number of iterations of the Value Iteration method
	   	tic     
	   	[policy_VI, iter2, cpu_time2] = mdp_value_iteration(P, R, discount);
	   	time2 = toc;
	   	Exec_time_VI(i-3) = time2;
	   	iteration_VI(i-3) = iter2;
   
    %% find the number of iterations of the Qlearning method 
	    tic
	   	N = 1000000;
	    [~, ~, policy_Ql, iter3] = mdp_Q_learning(R, discount, N);
	   	time3 = toc;
	   	Exec_time_Ql(i-3) = time3;
	   	iteration_Ql(i-3) = iter3;
    
  	%% different actions between PI and VI
	   	[n_different_VI_PI] = difference_actions(policy_VI,policy_PI,s);
	   	different_actions_VI_PI(i-3) = n_different_VI_PI;
   	%% different actions between VI and Ql
	   	[n_different_VI_Ql] = difference_actions(policy_VI,policy_Ql,s);
	   	different_actions_VI_Ql(i-3) = n_different_VI_Ql;
   	%% different actions between PI and Ql
	   	[n_different_PI_Ql] = difference_actions(policy_PI,policy_Ql,s);
	   	different_actions_PI_Ql(i-3) = n_different_PI_Ql;
       
    %% réinit de P & R
	    P = [];
	    R = [];
end

x = start:S;
x = start:S;
y_nbr_iter_VI = iteration_VI(x-3);
y_nbr_iter_PI = iteration_PI(x-3);
y_nbr_iter_Ql = iteration_Ql(x-3);

y_Exec_time_VI = Exec_time_VI(x-3);
y_Exec_time_PI = Exec_time_PI(x-3);
y_Exec_time_Ql = Exec_time_Ql(x-3);

y_nbr_diff_actions_VI_Ql = different_actions_VI_Ql(x-3); 

%% saving data
	save('DATAS/DATAS_iter_.mat','x','y_nbr_iter_VI','y_nbr_iter_PI','y_nbr_iter_Ql')
	save('DATAS/DATAS_Exec_time_.mat','x','y_Exec_time_VI','y_Exec_time_PI','y_Exec_time_Ql')
	save('DATAS/DATAS_diff_actions_.mat','x','y_nbr_diff_actions_VI_Ql') 
