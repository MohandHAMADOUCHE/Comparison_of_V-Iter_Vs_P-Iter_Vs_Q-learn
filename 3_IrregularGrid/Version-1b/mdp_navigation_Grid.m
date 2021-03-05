function [P, R] = mdp_navigation_grille (s)

S=s;                            % nombre d'états
A = 10                          % nbr of actionss
% class 1
proba_vect_class_1= [0.7 0.1];
% class 2
proba_vect_class_2= [0.4 0.2 1];
% class 3
proba_vect_class_3= [0.55 0.15 1];
% class 4
proba_vect_class_4= [0.46 0.18 1];
% class 5
proba_vect_class_5= [0.28 0.24 1];


reward_vect = [-100 100];
x = sqrt(S);

%--------- Proba
P(:,:,:) = zeros(S, S, A);
R(:,:) = zeros(S,A);

%% class 1
% s1  
    % Haut(A1)
    P(1,4,1) = proba_vect_class_1(1); P(1,1,1) = proba_vect_class_1(2)*2; P(1,2,1) = proba_vect_class_1(2);
    % gauche(A2)
    P(1,1,2) = proba_vect_class_1(1) + proba_vect_class_1(2); P(1,2,2) = proba_vect_class_1(2); P(1,5,2) = proba_vect_class_1(2);
    % droite (A3)
    P(1,2,3) = proba_vect_class_1(1); P(1,1,3) = proba_vect_class_1(2); P(1,5,3) = proba_vect_class_1(2);
    % bas(A4)
    P(1,1,4) = proba_vect_class_1(1) + proba_vect_class_1(2); P(1,2,4) = proba_vect_class_1(2); P(1,5,4) = proba_vect_class_1(2);
% s7
    % Haut(A1)
    P(7,11,1) = proba_vect_class_1(1); P(7,3,1) = proba_vect_class_1(2);    P(7,6,1) = proba_vect_class_1(2); P(7,8,1) = proba_vect_class_1(2);
    % gauche(A2)
    P(7,6,2) = proba_vect_class_1(1); P(7,3,2) = proba_vect_class_1(2);    P(7,8,2) = proba_vect_class_1(2); P(7,11,2) = proba_vect_class_1(2);
    % droite (A3)
    P(7,8,3) = proba_vect_class_1(1); P(7,3,3) = proba_vect_class_1(2);    P(7,6,3) = proba_vect_class_1(2); P(7,11,3) = proba_vect_class_1(2);
    % bas(A4)
    P(7,3,4) = proba_vect_class_1(1); P(7,6,4) = proba_vect_class_1(2);    P(7,8,4) = proba_vect_class_1(2); P(7,11,4) = proba_vect_class_1(2);
% s12   
    % Haut(A1)
    P(12,16,1) = proba_vect_class_1(1); P(12,8,1) = proba_vect_class_1(2); P(12,11,1) = proba_vect_class_1(2); P(12,12,1) = proba_vect_class_1(2);
    % gauche(A2)
    P(12,11,2) = proba_vect_class_1(1); P(12,8,2) = proba_vect_class_1(2); P(12,12,2) = proba_vect_class_1(2); P(12,16,2) = proba_vect_class_1(2);
    % droite (A3)
    P(12,16,3) = proba_vect_class_1(1); P(12,8,3) = proba_vect_class_1(2); P(12,11,3) = proba_vect_class_1(2); P(12,16,3) = proba_vect_class_1(2);
    % bas(A4)
    P(12,8,4) = proba_vect_class_1(1); P(12,11,4) = proba_vect_class_1(2); P(12,12,4) = proba_vect_class_1(2); P(12,16,4) = proba_vect_class_1(2);

%% class 2   
% s2  
    % Haut(A1)
    P(2,2,1) = proba_vect_class_2(1) + proba_vect_class_2(2) ; P(2,1,1) = proba_vect_class_2(2);   P(2,3,1) = proba_vect_class_2(2);
    % gauche(A2)
    P(2,1,2) = proba_vect_class_2(1) ; P(2,2,2) = proba_vect_class_2(2)*2;   P(2,3,2) = proba_vect_class_2(2);
    % droite (A3)
    P(2,3,3) = proba_vect_class_2(1) ; P(2,2,3) = proba_vect_class_2(2)*2;   P(2,1,3) = proba_vect_class_2(2);
    % bas(A4)
    P(2,2,4) = proba_vect_class_2(1) + proba_vect_class_2(2); P(2,1,4) = proba_vect_class_2(2);   P(2,3,4) = proba_vect_class_2(2);
    % A5
    P(2,2,5) = 1;
% s8  
    % Haut(A1)
    P(8,12,1) = proba_vect_class_2(1) ; P(8,4,1) = proba_vect_class_2(2);   P(8,7,1) = proba_vect_class_2(2); P(8,8,1) = proba_vect_class_2(2);
    % gauche(A2)
    P(8,7,2) = proba_vect_class_2(1) ; P(8,4,2) = proba_vect_class_2(2);   P(8,8,2) = proba_vect_class_2(2); P(8,12,2) = proba_vect_class_2(2);
    % droite (A3)
    P(8,8,3) = proba_vect_class_2(1) ; P(8,4,3) = proba_vect_class_2(2);   P(8,7,3) = proba_vect_class_2(2); P(8,12,3) = proba_vect_class_2(2);
    % bas(A4)
    P(8,4,4) = proba_vect_class_2(1) ; P(8,7,4) = proba_vect_class_2(2);   P(8,8,4) = proba_vect_class_2(2); P(8,12,4) = proba_vect_class_2(2);
    % A5
    P(8,8,5) = 1;
% s13  
    % Haut(A1)
    P(13,13,1) = proba_vect_class_2(1) + proba_vect_class_2(2) ; P(13,9,1) = proba_vect_class_2(2);   P(13,14,1) = proba_vect_class_2(2); 
    % gauche(A2)
    P(13,13,2) = proba_vect_class_2(1) + proba_vect_class_2(2) ; P(13,9,2) = proba_vect_class_2(2);   P(13,14,2) = proba_vect_class_2(2); 
    % droite (A3)
    P(13,14,3) = proba_vect_class_2(1) ; P(13,13,3) = proba_vect_class_2(2) * 2 ;   P(13,9,3) = proba_vect_class_2(2); 
    % bas(A4)
    P(13,9,4) = proba_vect_class_2(1) ; P(13,13,4) = proba_vect_class_2(2)*2;   P(13,14,4) = proba_vect_class_2(2); 
    % A5
    P(13,13,5) = 1;

%% class 3 
% s3
    % Haut(A1)
     P(3,7,1) = proba_vect_class_3(1); P(3,2,1) = proba_vect_class_3(2); P(3,3,1) = proba_vect_class_3(2); P(3,4,1) = proba_vect_class_3(2);
    % gauche(A2)
    P(3,2,2) = proba_vect_class_3(1) ; P(3,3,2) = proba_vect_class_3(2);   P(3,4,2) = proba_vect_class_3(2); P(3,7,2) = proba_vect_class_3(2); 
    % droite (A3)
    P(3,4,3) = proba_vect_class_3(1) ; P(3,2,3) = proba_vect_class_3(2);   P(3,3,3) = proba_vect_class_3(2); P(3,7,3) = proba_vect_class_3(2); 
    % bas(A4)
    P(3,3,4) = proba_vect_class_3(1) ; P(3,2,4) = proba_vect_class_3(2);   P(3,4,4) = proba_vect_class_3(2); P(3,7,3) = proba_vect_class_3(2); 
    % A5
    P(3,3,5) = 1;
    % A6
    P(3,3,6) = 1;    
    % A7
    P(3,3,7) = 1;
% s9
    % Haut(A1)
     P(9,13,1) = proba_vect_class_3(1); P(9,5,1) = proba_vect_class_3(2); P(9,9,1) = proba_vect_class_3(2); P(9,10,1) = proba_vect_class_3(2);
    % gauche(A2)
    P(9,9,2) = proba_vect_class_3(1) ; P(9,5,2) = proba_vect_class_3(2);   P(9,10,2) = proba_vect_class_3(2); P(9,13,2) = proba_vect_class_3(2); 
    % droite (A3)
    P(9,10,3) = proba_vect_class_3(1) ; P(9,5,3) = proba_vect_class_3(2);   P(9,9,3) = proba_vect_class_3(2); P(9,13,3) = proba_vect_class_3(2); 
    % bas(A4)
    P(9,5,4) = proba_vect_class_3(1) ; P(9,9,4) = proba_vect_class_3(2);   P(9,10,4) = proba_vect_class_3(2); P(9,13,3) = proba_vect_class_3(2); 
    % A5
    P(9,9,5) = 1;
    % A6
    P(9,9,6) = 1;    
    % A7
    P(9,9,7) = 1;  
% s14
    % Haut(A1)
     P(14,14,1) = proba_vect_class_3(1); P(14,10,1) = proba_vect_class_3(2); P(14,13,1) = proba_vect_class_3(2); P(14,15,1) = proba_vect_class_3(2);
    % gauche(A2)
    P(14,13,2) = proba_vect_class_3(1) ; P(14,10,2) = proba_vect_class_3(2);   P(14,14,2) = proba_vect_class_3(2); P(14,15,2) = proba_vect_class_3(2); 
    % droite (A3)
    P(14,15,3) = proba_vect_class_3(1) ; P(14,10,3) = proba_vect_class_3(2);   P(14,13,3) = proba_vect_class_3(2); P(14,14,3) = proba_vect_class_3(2); 
    % bas(A4)
    P(14,10,4) = proba_vect_class_3(1) ; P(14,13,4) = proba_vect_class_3(2);   P(14,14,4) = proba_vect_class_3(2); P(14,15,3) = proba_vect_class_3(2); 
    % A5
    P(14,14,5) = 1;
    % A6
    P(14,14,6) = 1;    
    % A7
    P(14,14,7) = 1;  
        
%% class 4
% s4
    % Haut(A1)
     P(4,8,1) = proba_vect_class_4(1); P(4,3,1) = proba_vect_class_4(2); P(4,4,1) = proba_vect_class_4(2)*2; 
    % gauche(A2)
    P(4,3,2) = proba_vect_class_4(1) ; P(4,4,2) = proba_vect_class_4(2)*2;   P(4,8,2) = proba_vect_class_4(2); 
    % droite (A3)
    P(4,4,3) = proba_vect_class_4(1) + proba_vect_class_4(2) ; P(4,3,3) = proba_vect_class_4(2);   P(4,8,3) = proba_vect_class_4(2); 
    % bas(A4)
    P(4,4,4) = proba_vect_class_4(1) + proba_vect_class_4(2) ; P(4,3,4) = proba_vect_class_4(2);   P(4,8,4) = proba_vect_class_4(2); 
    % A9
    P(4,4,9) = 1;
    % A10
    P(4,4,10) = 1;    
% s10
    % Haut(A1)
     P(10,14,1) = proba_vect_class_4(1); P(10,9,1) = proba_vect_class_4(2); P(10,10,1) = proba_vect_class_4(2); P(10,11,1) = proba_vect_class_4(2); 
    % gauche(A2)
    P(10,9,2) = proba_vect_class_4(1) ; P(10,10,2) = proba_vect_class_4(2);   P(10,11,2) = proba_vect_class_4(2); P(10,14,2) = proba_vect_class_4(2); 
    % droite (A3)
    P(10,11,3) = proba_vect_class_4(1); P(10,9,3) = proba_vect_class_4(2);   P(10,10,3) = proba_vect_class_4(2); P(10,14,3) = proba_vect_class_4(2); 
    % bas(A4)
    P(10,10,4) = proba_vect_class_4(1); P(10,9,4) = proba_vect_class_4(2);   P(10,11,4) = proba_vect_class_4(2); P(10,14,4) = proba_vect_class_4(2);  
    % A9
    P(10,10,9) = 1;
    % A10
    P(10,10,10) = 1;      
% s15
    % Haut(A1)
    P(15,15,1) = proba_vect_class_4(1); P(15,11,1) = proba_vect_class_4(2); P(15,14,1) = proba_vect_class_4(2); P(15,16,1) = proba_vect_class_4(2); 
    % gauche(A2)
    P(15,14,2) = proba_vect_class_4(1) ; P(15,11,2) = proba_vect_class_4(2);   P(15,15,2) = proba_vect_class_4(2); P(15,16,2) = proba_vect_class_4(2); 
    % droite (A3)
    P(15,16,3) = proba_vect_class_4(1); P(15,11,3) = proba_vect_class_4(2);   P(15,14,3) = proba_vect_class_4(2); P(15,15,3) = proba_vect_class_4(2); 
    % bas(A4)
    P(15,11,4) = proba_vect_class_4(1); P(15,14,4) = proba_vect_class_4(2);   P(15,15,4) = proba_vect_class_4(2); P(15,16,4) = proba_vect_class_4(2);  
    % A9
    P(15,15,9) = 1;
    % A10
    P(15,15,10) = 1;    

    
%% class 5
% s5
    % Haut(A1)
    P(5,9,1) = proba_vect_class_5(1); P(5,5,1) = proba_vect_class_5(2)*2; P(5,1,1) = proba_vect_class_5(2);
    % gauche(A2)
    P(5,5,2) = proba_vect_class_5(1) + proba_vect_class_5(2) ; P(5,1,2) = proba_vect_class_5(2);   P(5,9,2) = proba_vect_class_5(2);
    % droite (A3)
    P(5,5,3) = proba_vect_class_5(1) + proba_vect_class_5(2); P(5,1,3) = proba_vect_class_5(2);   P(5,9,3) = proba_vect_class_5(2);  
    % bas(A4)
    P(5,1,4) = proba_vect_class_5(1); P(5,5,4) = proba_vect_class_5(2)*2;   P(5,9,4) = proba_vect_class_5(2);  
    % A5
    P(5,5,5) = 1;
    % A7
    P(5,5,7) = 1;    
    % A8
    P(5,5,8) = 1;    
% s11
    % Haut(A1)
    P(11,15,1) = proba_vect_class_5(1); P(11,7,1) = proba_vect_class_5(2); P(11,10,1) = proba_vect_class_5(2); P(11,12,1) = proba_vect_class_5(2);
    % gauche(A2)
    P(11,10,2) = proba_vect_class_5(1); P(11,7,2) = proba_vect_class_5(2);   P(11,12,2) = proba_vect_class_5(2); P(11,15,2) = proba_vect_class_5(2);
    % droite (A3)
    P(11,12,3) = proba_vect_class_5(1); P(11,7,3) = proba_vect_class_5(2);   P(11,10,3) = proba_vect_class_5(2); P(11,15,3) = proba_vect_class_5(2);
    % bas(A4)
    P(11,7,4) = proba_vect_class_5(1); P(11,10,4) = proba_vect_class_5(2);   P(11,12,4) = proba_vect_class_5(2); P(11,15,4) = proba_vect_class_5(2); 
    % A5
    P(11,11,5) = 1;
    % A7
    P(11,11,7) = 1;    
    % A8
    P(11,11,8) = 1;     
% s16
    % Haut(A1)
    P(16,16,1) = proba_vect_class_5(1) + proba_vect_class_5(2); P(16,12,1) = proba_vect_class_5(2); P(16,15,1) = proba_vect_class_5(2); 
    % gauche(A2)
    P(16,15,2) = proba_vect_class_5(1); P(16,12,2) = proba_vect_class_5(2);   P(16,16,2) = proba_vect_class_5(2) * 2; 
    % droite (A3)
    P(16,16,3) = proba_vect_class_5(1) + proba_vect_class_5(2); P(16,12,3) = proba_vect_class_5(2);   P(16,15,3) = proba_vect_class_5(2); 
    % bas(A4)
    P(16,12,4) = proba_vect_class_5(1); P(16,15,4) = proba_vect_class_5(2);   P(16,16,4) = proba_vect_class_5(2)*2;
    % A5
    P(16,16,5) = 1;
    % A7
    P(16,16,7) = 1;    
    % A8
    P(16,16,8) = 1;      
    
%% Rewards
	R(:,1) = -1;
    R(:,2) = -1;
    R(:,3) = -1;
    R(:,4) = -1;
    R(:,5) = -1;
    R(:,6) = -1;
    R(:,7) = -1;
    R(:,8) = -1;
    R(:,9) = -1;
    R(:,10) = -1;
     % CAS PARTICULIERS
    R(8,:) = -100;
    R(16,:) = 100;
    
end