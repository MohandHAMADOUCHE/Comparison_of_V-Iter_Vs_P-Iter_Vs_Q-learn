%^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
%              main comparison
%^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

% nbr max of states in mission planning is 13 -> we consider S = 16
S = 16; 
discount = 0.99;
[P, R] = mdp_navigation_Grid (S); 

for i= 1 : 100
	i
	%% find the number of iterations of the Policy Iteration method
		tic
		[~, ~, policy_PI, iter1, cpu_time1] = mdp_policy_iteration(P, R, discount); 
		time1 = toc;

	%% find the number of iterations of the Value Iteration method
		tic     
		[policy_VI, iter2, cpu_time2] = mdp_value_iteration(P, R, discount);
		time2 = toc;

	%% find the number of iterations of the Qlearning method 
		tic
		N = 1000000;
		[~, ~, policy_Ql, iter3] = mdp_Q_learning(R, discount, N);
		time3 = toc;

	%% actions diferentes entre PI et VI
		[n_different_VI_PI] = difference_actions(policy_VI,policy_PI,S);

		[n_different_VI_Ql] = difference_actions(policy_VI,policy_Ql,S);

		[n_different_PI_Ql] = difference_actions(policy_PI,policy_Ql,S);

	iteration_PI(i)=iter1;
	iteration_VI(i)=iter2;
	iteration_Ql(i)=iter3;

	Time_PI(i)=time1;
	Time_VI(i)=time2;
	Time_Ql(i)=time3;

	Different_VI_PI(i)=n_different_VI_PI;
	Different_VI_Ql(i)=n_different_VI_Ql;
	Different_PI_Ql(i)=n_different_PI_Ql;

end
   %% summary of 100 executions 
  
	min_Iter_PI= min(iteration_PI);
	min_Iter_VI= min(iteration_VI);
	min_Iter_Ql= min(iteration_Ql);

	max_Iter_PI= max(iteration_PI);
	max_Iter_VI= max(iteration_VI);
	max_Iter_Ql= max(iteration_Ql);

	Average_Iter_PI= mean(iteration_PI);
	Average_Iter_VI= mean(iteration_VI);
	Average_Iter_Ql= mean(iteration_Ql);

	min_Time_PI= min(Time_PI);
	min_Time_VI= min(Time_VI);
	min_Time_Ql= min(Time_Ql);

	max_Time_PI= max(Time_PI);
	max_Time_VI= max(Time_VI);
	max_Time_Ql= max(Time_Ql);

	Average_Time_PI= mean(Time_PI);
	Average_Time_VI= mean(Time_VI);
	Average_Time_Ql= mean(Time_Ql);

	min_Different_VI_PI= min(Different_VI_PI);
	min_Different_VI_Ql= min(Different_VI_Ql);
	min_Different_PI_Ql= min(Different_PI_Ql);
	max_Different_VI_PI= max(Different_VI_PI);
	max_Different_VI_Ql= max(Different_VI_Ql);
	max_Different_PI_Ql= max(Different_PI_Ql);

	Average_Different_VI_PI= mean(Different_VI_PI);
	Average_Different_VI_Ql= mean(Different_VI_Ql);
	Average_Different_PI_Ql= mean(Different_PI_Ql);
