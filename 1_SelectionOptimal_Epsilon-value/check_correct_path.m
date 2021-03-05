function [correct_path] = check_correct_path(policy_Ql, Next_state)
% fonction qui vérifie si pour un etat donné il exsite un chemin vers
% l'etat final matrix_size
	matrix_size = size(policy_Ql,1);
	correct_path = true;
	i = 1;
	while ((i < matrix_size) && (correct_path == true))
	    state = i;
	    precedent_state = 0;
	    if state == sqrt(matrix_size)+2 ; i = i + 1; continue; end; % obstacle
	    
	    while ((state < matrix_size) && (correct_path == true))  
	        action = policy_Ql(state);
	        [next_state] = Next_state(state, action);
	        if ((next_state == state) || (precedent_state == next_state) || ...
	            ((state == sqrt(matrix_size) && action == 1)))
	            correct_path = false;
	            break;
	        end
	        precedent_state = state;
	        state = next_state;
	    end
		i = i + 1; 
	end
end