function [P, R] = mdp_navigation_grille (s, proba_vect, reward_vect)

S=s;                            % nombre d'états
proba_vect= [0.1 0.8 0.1];
reward_vect = [-100 100];
x=sqrt(S);

VA1 = zeros(3,S);     % Calcul Voisin pour ACTION : haut  
 for i=1 :3
  if i  == 1                       % voisin gauche
     for j=1 :S 
        if mod(j,x)==1
           VA1(i,j)=j;
        else    
           VA1(i,j)=j-1;
        end
     end
  elseif i == 2                   % voisin haut ( p=0.8 )
      for j=1 :S 
        if j>S-x
           VA1(i,j)=j;
        else    
           VA1(i,j)=j+x;
        end
      end
  else                            % voisin droite 
      for j=1 :S 
        if mod(j,x)==0
           VA1(i,j)=j;
        else    
           VA1(i,j)=j+1;
        end
      end
  end
 end 
 VA1(1,x+3)= x+3; VA1(2,2)= 2; VA1(3,x+1)= x+1;     % changement à cause de obstacle, case 6   

  
 VA2 = zeros(3,S);                 % Calcul Voisin pour ACTION : gauche 
 for i=1 :3                        
  if i  == 1                       % voisin gauche
     for j=1 :S 
        if j<x+1
           VA2(i,j)=j;
        else    
           VA2(i,j)=j-x;
        end
     end
  elseif i == 2                   % voisin haut ( p=0.8 )
      for j=1 :S 
        if mod(j,x)==1
           VA2(i,j)=j;
        else    
           VA2(i,j)=j-1;
        end
      end
  else                            % voisin droite
      for j=1 :S 
        if j>S-x
           VA2(i,j)=j;
        else    
           VA2(i,j)=j+x;
        end
      end     
  end   
 end     
VA2(1,2*x+2)= 2*x+2; VA2(2,x+3)= x+3;  VA2(3,2)= 2;  
  
 VA3 = zeros(3,S);               % Calcul Voisin pour ACTION : droite
 for i=1 :3
  if i  == 1                     % voisin gauche
     for j=1 :S 
        if j>S-x
           VA3(i,j)=j;
        else    
           VA3(i,j)=j+x;
        end
     end
  elseif i == 2                 % voisin haut
      for j=1 :S 
        if mod(j,x)==0
           VA3(i,j)=j;
        else    
           VA3(i,j)=j+1;
        end
      end
  else                          % voisin droite
      for j=1 :S 
        if j<x+1
           VA3(i,j)=j;
        else    
           VA3(i,j)=j-x;
        end
      end     
  end   
 end     
VA3(1,2)= 2; VA3(2,x+1)= x+1; VA3(3,2*x+2)= 2*x+2;   
      
V = cat(3, VA1, VA2, VA3);


% Calcul des matrice de transitions

               % Mat P pour ACTION : haut ================
PA1 = zeros(S,S);                              
for i=1 :S-1                                   
PA1(i,V(1,i,1))=proba_vect(1);PA1(i,V(2,i,1))=proba_vect(2);PA1(i,V(3,i,1))=proba_vect(3);
end

% CAS PARTICULIERS

PA1(S-2*x,S-1-2*x)=0;  PA1(S-2*x,S-2*x)=0;   PA1(S-2*x,S-x)=0;                      % case qui correspond au reward = -1  (CASE 8)
PA1(x+2,x+1)=0;  PA1(x+2,x+3)=0;  PA1(x+2,2*x+2) =0;                                % obstacle  (CASE 6)
PA1(x+1,x+1)=proba_vect(1)+proba_vect(3);                                           % changement à cause de l'obstacle (Case 5 )
PA1(S-x+1,V(1,S-x+1,1),1)=proba_vect(1)+proba_vect(2);                              % case 13


               % Mat P pour ACTION : gauche ================
                                              
 PA2 = zeros(S,S);                        
 for i=1 :S-1
 PA2(i,V(2,i,2))=proba_vect(2);PA2(i,V(1,i,2))=proba_vect(1);  PA2(i,V(3,i,2))=proba_vect(3);
 end
 
 % CAS PARTICULIERS
PA2(S-2*x,S-1-2*x)=0;  PA2(S-2*x,S-3*x)=0;   PA2(S-2*x,S-x)=0;                                     % case qui correspond au reward = -1  (CASE 8)
PA2(x+2,x+1)=0;  PA2(x+2,2)=0;PA2(x+2,2*x+2)=0;                                                    % obstacle (CASE 6)
PA2(2,2)=proba_vect(1)+proba_vect(3);                                                              % changement à cause de l'obstacle ( Case 2)
PA2(1,1)=proba_vect(1)+proba_vect(2);                                                              %case 1
PA2(S-x+1,S-x+1)=proba_vect(1)+proba_vect(2);                                                      %case 13     

 
              % Mat P pour ACTION : droite ================
PA3 = zeros(S,S);                          
for i=1 :S-1
PA3(i,V(2,i,3))=proba_vect(2);PA3(i,V(1,i,3))=proba_vect(1);  PA3(i,V(3,i,3))=proba_vect(3);
end
 % CAS PARTICULIERS
   
PA3(S-2*x,S-2*x)=0;  PA3(S-2*x,S-3*x)=0;   PA3(S-2*x,S-x)=0;                   % case qui correspond au reward = -1  (CASE 8)
PA3(x+2,x+3)=0;  PA3(x+2,2)=0;PA3(x+2,2*x+2)=0;                                % obstacle (CASE 6)
PA3(2,2)=proba_vect(1)+proba_vect(3);                                          % case  2
PA3(x,x)=proba_vect(1)+proba_vect(2);                                          % case 4 
   
      
  
  
   
RA1=zeros(S,1)-1; RA1(S)=reward_vect(2); RA1(S-2*x)=reward_vect(1); %RA1(x+3)=reward_vect(2)/2;
RA2=zeros(S,1)-3;RA2(S)=reward_vect(2); RA2(S-2*x)=reward_vect(1); 
RA3=zeros(S,1)-1;RA3(S)=reward_vect(2); RA3(S-2*x)=reward_vect(1); 


% Cas 9 cases
%PA1(3,3)=proba_vect(1); PA1(3,6)=proba_vect(2); PA1(3,2)=proba_vect(3);
%PA1(6,6)=0; PA1(6,9)=0;
%PA2(3,6)=proba_vect(1); PA2(3,2)=proba_vect(2);
%PA2(6,3)=0;PA2(6,9)=0;  PA2(6,6)=0;
%PA2(8,8)= proba_vect(3)+proba_vect(1);
%PA3(3,6)=proba_vect(1);
%PA3(6,3)=0;PA3(6,9)=0;  PA3(6,6)=0;
%PA3(8,8)= proba_vect(3)+proba_vect(1);  
P = cat(3,PA1,PA2,PA3); 
   
%RA1=zeros(S,1); RA1(S)=reward_vect(2); RA1(S-x)=reward_vect(1);
%RA2=zeros(S,1);RA2(S)=reward_vect(2); RA2(S-x)=reward_vect(1);
%RA3=zeros(S,1);RA3(S)=reward_vect(2); RA3(S-x)=reward_vect(1);
  R = [RA1 RA2 RA3];
end


     
     