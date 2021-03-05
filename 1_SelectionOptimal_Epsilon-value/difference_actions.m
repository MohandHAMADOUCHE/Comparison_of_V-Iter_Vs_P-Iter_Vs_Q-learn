function [n_different] = difference_actions(policy_PI,policy_VI,s)
	n_different = 0
	x=sqrt(s);
	for i = 1 : s
		if (i ~=  x+2) || (i ~=  s) || (i ~=  s-2*x)
			if policy_PI(i) ~= policy_VI(i)
	  			n_different = n_different + 1;
			end
		end
	end
end