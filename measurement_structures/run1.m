clear %clear previous variables


load_variables1; %Load the list of Bell inequalities used in this project
level=3; %Set the NPA hiearchy level that will be used

Inow=I3322; %Set the inequality that will be analysed (in the full probability form)

[L pL]=maxBell_local1(Inow); %Calculate the local bound L, attainable by pL
L=L

[NS,pNS]=maxBell_NPA1(Inow,0); %Calculate the NS bound NS, attainable by pNS
NS=NS

[Q,pQ]=maxBell_NPA1(Inow,level); %Calculate quantum NPA leval bound Q, attainable by pQ
Q=(Q-L)/(NS-L)

%Calculate quantum NPA leval bound L^Q_intersetion, attainable by pQ
[LQ_inter,pQ]=maxBell_localRestrictedINTER1(Inow,level);
LQ_inter=(LQ_inter-L)/(NS-L)


%Calculate the L^Q_ij bound LijQ with NPA, attainable by pLijQ
R12=[1 2]; %Restriction to x=1 and x=2
[L12Q,pL12Q]=maxBell_localRestricted1(Inow, R12,level);  
L12Q=(L12Q-L)/(NS-L)

R23=[2 3]; %Restriction to x=2 and x=3
[L23Q,pL23Q]=maxBell_localRestricted1(Inow, R23,level); 
L23Q=(L23Q-L)/(NS-L)

R13=[1 3]; %Restriction to x=1 and x=3
[L13Q,pL13Q]=maxBell_localRestricted1(Inow, R13,level); 
L13Q=(L13Q-L)/(NS-L)

%Find the minimum and the maximum between all L^Q_ij
minLQ_ij=min([L12Q L23Q L13Q]) 
LQ_U=max([L12Q L23Q L12Q])   %Value corresponding to the union of all these sets

%Calculate the L^Q_2conv bound LQ_2conv with NPA, attainable by pLQ_2conv
[LQ_2conv, pLQ_2conv p_pairs]=maxBell_localRestrictedCONV1(Inow,level);
LQ_2conv=(LQ_2conv-L)/(NS-L)

%Print the values of the table
'Table for the quantum case, NPA level 1 or greater'
TableQ=[Q LQ_inter minLQ_ij LQ_U LQ_2conv]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Start the non-signalling case
%The non-signalling constraint corresponds to the of the 0th level of the
%NPA hiearchy

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

level=0;
%Calculate quantum NPA leval bound L^Q_intersetion, attainable by pQ
[LNS_inter,pLNS_inter]=maxBell_localRestrictedINTER1(Inow,level);
LNS_inter=(LNS_inter-L)/(NS-L)


%Calculate the L^Q_ij bound LijQ with NPA, attainable by pLijQ
R12=[1 2]; %Restriction to x=1 and x=2
[L12NS,pL12NS]=maxBell_localRestricted1(Inow, R12,level);  
L12NS=(L12NS-L)/(NS-L)

R23=[2 3]; %Restriction to x=2 and x=3
[L23NS,pL23NS]=maxBell_localRestricted1(Inow, R23,level); 
L23NS=(L23NS-L)/(NS-L)

R13=[1 3]; %Restriction to x=1 and x=3
[L13NS,pL13NS]=maxBell_localRestricted1(Inow, R13,level); 
L13NS=(L13NS-L)/(NS-L)

%Find the minimum and the maximum between all L^Q_ij
minLNS_ij=min([L12NS L23NS L12NS]) 
LNS_U=max([L12NS L23NS L12NS])   %Value corresponding to the union of all these sets

%Calculate the L^Q_2conv bound LQ_2conv with NPA, attainable by pLQ_2conv
[LNS_2conv, pLNS_2conv p_pairs]=maxBell_localRestrictedCONV1(Inow,level);
LNS_2conv=(LNS_2conv-L)/(NS-L)




%Print the values of the table
'Table for the quantum case, NPA level 1 or greater'
TableQ=[Q LQ_inter minLQ_ij LQ_U LQ_2conv]

'Table for non-signalling case'
TableNS=[LNS_inter minLNS_ij LNS_U LNS_2conv]

'Table with Q LQ_inter minLQ_ij LQ_U LQ_2conv LNS_inter minLNS_ij LNS_U LNS_2conv'
Table_Total=[Q LQ_inter minLQ_ij LQ_U LQ_2conv LNS_inter minLNS_ij LNS_U LNS_2conv]










