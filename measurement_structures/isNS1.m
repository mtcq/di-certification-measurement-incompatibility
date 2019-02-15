function [piAB,Daxl,Dbyl]=isNS1(p)

dS=size(p);
Oa=dS(1);
Ob=dS(2);
Ia=dS(3);
Ib=dS(4);

Daxl=Dax_MATRIX1(Oa,Ia);
nLA=Oa^Ia;  %Count the deterministic vertices

Dbyl=Dax_MATRIX1(Ob,Ib);
nLB=Ob^Ib;  %Count the deterministic vertices

p12A=NaN(2,3,3);
for x=1:Ia
    for y=1:Ib
        for a=1:Oa
                p12A(a,x,y)=p12(a,1,x,y)+p12(a,2,x,y);
        end
    end
end

  cvx_begin SDP 
  variable piAB(nLA,nLB)
  
 %Impose the constraint that piAB must be positive and sum to norm<=1
  sum=0;
  for lA=1:nLA
     for lB=1:nLB
          piAB(lA,lB)>=0;
          sum=sum+piAB(lA,lB);
     end    
 end
sum<=1;
 
 for a=1:Oa
     for b=1:Ob
         for x=1:Ia
             for y=1:Ib
                  aux=0;
 for lA=1:nLA
     for lB=1:nLB
          aux=aux+piAB(lA,lB)*Daxl(a,x,lA)*Dbyl(b,y,lB);        
     end    
 end

  p(a,b,x,y)==aux;
             end
         end
     end
 end
 

  cvx_end


end