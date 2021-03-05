function [V, policy, cpu_time] = mdp_policy_fini(P, R, discount, policy0, max_iter, eval_type)




cpu_time = cputime;

global mdp_VERBOSE;

% check of arguments
if iscell(P); S = size(P{1},1); else S = size(P,1); end;
if iscell(P); A = length(P); else A = size(P,3); end

if discount <= 0 || discount >= 1
    disp('--------------------------------------------------------')
    disp('MDP Toolbox ERROR: Discount rate must be in ]0; 1[')
    disp('--------------------------------------------------------')
elseif nargin > 3 && (size(policy0,1)~=S || any(mod(policy0,1)) || any(policy0<1)|| any(policy0>A) )
    disp('--------------------------------------------------------')
    disp('MDP Toolbox ERROR: policy0 must a (Sx1) vector with integer from 1 to A')
    disp('--------------------------------------------------------')
elseif nargin > 4 && max_iter <= 0
    disp('--------------------------------------------------------')
    disp('MDP Toolbox ERROR: The maximum number of iteration must be upper than 0')
    disp('--------------------------------------------------------')
else
    
    PR = mdp_computePR(P,R);

    % initialization of optional arguments
    if nargin < 6; eval_type = 0; end;
    if nargin < 5; max_iter = 1000; end;
    if nargin < 4;
        % initialization of policy: 
        % the one wich maximizes the expected immediate reward
        [nil, policy0] = mdp_bellman_operator(P,PR,discount,zeros(S,1))
      
    end;
    
    if mdp_VERBOSE; disp('  Iteration  Number_of_different_actions'); end;
    
    iter = 0;
    policy = policy0;
     for i=1 :5
        if  (eval_type==0)   
            V = mdp_eval_policy_matrix(P,PR,discount,policy)         
        else
            V = mdp_eval_policy_iterative(P,PR,discount,policy);
        end;
        [nil, policy_next] = mdp_bellman_operator(P,PR,discount,V);
        
	n_different = sum(policy_next ~= policy);

            policy = policy_next;
      
    end;
    
end; 

cpu_time = cputime - cpu_time;
