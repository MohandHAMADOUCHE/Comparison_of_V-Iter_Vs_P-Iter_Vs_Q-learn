

function [x, y_nbr_iter_VI, y_nbr_iter_PI, y_Exec_time_VI,y_Exec_time_PI, y_nbr_diff_actions_VI_PI]= comparison_VI_PI(epsilon)

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
	   	[policy_VI, iter2, cpu_time2] = mdp_value_iteration(P, R, discount, epsilon);
	   	time2 = toc;
	   	Exec_time_VI(i-3) = time2;
	   	iteration_VI(i-3) = iter2;
	    
	   	%% different actions between PI and VI
	   	[n_different_VI_PI] = difference_actions(policy_VI,policy_PI,s);
	   	different_actions_VI_PI(i-3) = n_different_VI_PI;
	   
		%% réinit de P & R
		P = [];
		R = [];
	end
	x = start:S;
	y_nbr_iter_VI = iteration_VI(x-3);
	y_nbr_iter_PI = iteration_PI(x-3);

	y_Exec_time_VI = Exec_time_VI(x-3);
	y_Exec_time_PI = Exec_time_PI(x-3);

	y_nbr_diff_actions_VI_PI = different_actions_VI_PI(x-3);

end

