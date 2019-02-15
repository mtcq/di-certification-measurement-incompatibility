function [piAB,Daxl,Dbyl]=isLOC1(p)

%Function that imposes the LP constraints required by a distribution p
%local
%The probability should be written as a tensor in the form of p(a,b,x,y)

dS=size(p); %Size of the inequality
Oa=dS(1); %Number of outputs for Alice
Ob=dS(2); %Number of outputs for Bob
Ia=dS(3); %Number of inputs for Alice
Ib=dS(4); %Number of inputs for Bob

Daxl=Dax_MATRIX1(Oa,Ia); %Create all the deterministic strategies for Alice
nLA=Oa^Ia;  %Count the deterministic vertices

Dbyl=Dax_MATRIX1(Ob,Ib);%Create all the deterministic strategies for Alice
nLB=Ob^Ib;  %Count the deterministic vertices


  cvx_begin SDP %Start SDP
  variable piAB(nLA,nLB) %SDPvar for the distribution on the hidden variable \lambda
  
 %Impose the constraint that piAB must be positive and sum to norm<=1
  expression sum %This is in principle not necessary
  sum=0;
  for lA=1:nLA
     for lB=1:nLB
          piAB(lA,lB)>=0;
          sum=sum+piAB(lA,lB);
     end    
 end
sum<=1;
 
%Impose that the local model should be equivalent to the distribution p
 for a=1:Oa
     for b=1:Ob
         for x=1:Ia
             for y=1:Ib
                 clear aux %in principle not necessary
                 expression aux %in principle not necessary
                  %aux=0; %in principle not necessary
 for lA=1:nLA
     for lB=1:nLB
          aux=aux+piAB(lA,lB)*Daxl(a,x,lA)*Dbyl(b,y,lB);        
     end    
 end

  p(a,b,x,y)==aux; %For every a,b,x,y, the LHV model should be equal to p
             end
         end
     end
 end
 

  cvx_end


end