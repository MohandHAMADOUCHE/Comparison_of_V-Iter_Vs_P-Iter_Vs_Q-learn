function [Next_state] = neighbour(S, A);
Next_state = zeros(S,A);
sizeX= sqrt(S);
    for i=1:S;
        for j=1:A;
            switch j
                case 1   % action: up
                    if (i > (S-sizeX));  
                        Next_state(i,j)= i;
                    else
                        Next_state(i,j) = i + sizeX;
                    end
                case 2   % action: left
                    if (mod(i,sizeX) == 1);
                        Next_state(i,j) = i;
                    else 
                        Next_state(i,j) = i-1;
                    end
                otherwise   % action right 
                    if (mod(i,sizeX) == 0)
                        Next_state(i,j) = i;
                    else
                        Next_state(i,j)= i+1;
                    end
            end
        end
    end
    % obstacle case sizeX+2;
    Next_state(2,1) = 2;
    Next_state(sizeX+1,3) = sizeX+1;
    Next_state(sizeX+3,2) = sizeX+3;
end