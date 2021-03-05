%^^^^^^^^^^^^^^^^^^^^^^^^^^^^
%     Programme principal
%^^^^^^^^^^^^^^^^^^^^^^^^^^^^
%--------------------------------
% Ls Etats de la mission Globale |    Actions BFM mission
% ----------------------------------------------------------------------------------------------------------------------------
% |   1    |    S_base          ||       A1   | décoller (take-off)
% |   2    |    S_WP1           ||       A2   | suivi de la trajectoire 
% |   3    |    S_WPi           ||       A3   | évitement d'obstacle
% |   4    |    S_WPf           ||       A4   | détection d'obstacle par fusion
% |   5    |    S_obst_det      ||       A5   | recherche de la zone 'T' pour atterrissage
% |   6    |    S_avoid         ||       A6   | recherche de zone libre pour atterrissage d'urgence
% |   7    |    S_fusion        ||       A7   | action d'atterrir utilisant l'asservissement par caméra
% |   8    |    S_zone "T" OK   ||       A8   | action de re-planning et atterrissage
% |   9    |    S_zone "T" NOK  ||       A9   | détection de cible potentielle
% |   10   |    S_zone OK       ||       A10  | action de retour à la base
% |   11   |    S_zone NOK      ||       A11  | détection d'obstacle par LIDAR.
% |   12   |    S_cible         ||       A12  | version initiale de l'application 'tracking' (version V0).
% |   13   |    S_V0            ||       A13  | version V1 de l'application 'tracking' (V0 + prefiltrage par histogramme).
% |   14   |    S_V1            ||       A14  | version V2 de l'application 'tracking' (V0 + re-dimension de l'image).
% |   15   |    S_V2            ||       A15  | version V3 de l'application 'tracking' (V0 + extra-stabilisation).
% |   16   |    S_V3            ||       A16  | version V4 de l'application 'tracking' (V1 + extra-stabilisation).
% |   17   |    S_V4            ||       A17  | version V5 de l'application 'tracking' (V2 + extra-stabilisation).
% |   18   |    S_V5            |---------------------------------------------------------------------------------------------
% |   19   |    S_Landing       |
% |   20   |    S_Crach         |
% -------------------------------

discount = 0.95;

%% construction et resolution du SUB-MDP NAVIGATION 
	nbr_S_Nav = 10; % 9;
	nbr_A_Nav = 9; % 6;
	proba_vect_Nav = [0.9 0.5 0.6 0.8 1.0]; % P_sys, P_ob_OK, P_SI, P_bat, P_land
	reward_vect_Nav = [5.0 100.0 10.0 20.0 15.0 15.0];  %  1:A1; 2:A18 ; 3:A19; 4:A5; 5:A8 & A7; 6:A20;
    
%% construction et resolution du SUB- MDP RECHERCHE ZONE ATTERRISSAGE
	nbr_S_Land = 12;
	nbr_A_Land = 8;
	proba_vect_Land = [0.9, 0.6, 0.3, 0.5, 0.5, 1];  % 1: P_sys, 2: P_SI, 3: P_SF, 4: P_app_T, 5: P_app_Z 6:P_land
	reward_vect_Land = [5.0, 40.0, 20.0, 25.0, 15.0, 40.0, 0.0]; %  1:A1, 2:A2, 3:A6; 4:A5; 5:A8 & A7; 6:A20; 7:A24 

 %% construction et resolution du SUB-MDP TRACKING
	nbr_S_Track = 13;
	nbr_A_Track = 11;
	proba_vect_Track = [0.9, 0.6, 0.8, 0.9, 0.72, 0.7, 0.0, 0.1, 0.6, 0.7, 0.1];  
				% 1: P_sys, 2: P_SI, 3: P_SF, 4: P_V0, 5: P_V1, 6:P_V2, 7:P_V3, 8:P_V4, 9:P_V5, 10: P_Det, 11:P_NOP 
	reward_vect_Track = [5.0, 35.0, 25.0, 85.0, 75.0, 55.0, 65.0, 45.0, 35.0, 15.0];  %1:A1, 2:A2, 3:A23; 4:A_V0; 5:A_V1 ; 6:A_V2; 7:A_V3; 8:A_V4; 9:A_V5, 10:A10

method = 3; 
    for i = 1 : 10
        i
        if method ~= 3 
            tmps1 = tic;
            [Policy_G1, Policy1, V1, Q1, P1, R1] = Const_res_SUB_MDP_Nav(proba_vect_Nav, reward_vect_Nav, nbr_S_Nav, nbr_A_Nav, discount, method);
            time_Nav(i) = toc(tmps1);

            tmps2 = tic;
            [Policy_G2, Policy2, V2, Q2, P2, R2] = Const_res_SUB_MDP_Land(proba_vect_Land, reward_vect_Land, nbr_S_Land, nbr_A_Land, discount, method);
            time_Land(i) = toc(tmps2);

            tmps3 = tic;
            [Policy_G3, Policy3, V3, Q3, P3, R3] = Const_res_SUB_MDP_Track(proba_vect_Track, reward_vect_Track, nbr_S_Track, nbr_A_Track, discount, method); 
            time_Track(i) = toc(tmps3);

            Max_Times(i) = max([time_Nav(i), time_Land(i), time_Track(i)]);
            Sum_Times(i) = time_Nav(i) + time_Land(i) + time_Track(i);
        else
            tmps1 = tic;
            [Policy_G1, Policy1, V1, Q1, P1, R1] = Const_res_SUB_MDP_Nav(proba_vect_Nav, reward_vect_Nav, nbr_S_Nav, nbr_A_Nav, discount, method);
            time_Nav(i) = toc(tmps1);
        end 
        clear -regexp ^V ^Q ^tmps;
    end
    
    if method ~= 3 
        Average_100_max_time = mean(Max_Times)
        Average_100_som_time = mean(Sum_Times)
    else
        Average_100_time_Nav = mean(time_Nav)
        Average_100_max_time_Nav = max(time_Nav)
    end
    
 