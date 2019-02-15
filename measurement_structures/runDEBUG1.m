clear 



level=1;
load_variables1;
Inow=I3322;

[L pL]=maxBell_local1(Inow);
L=L
[NS,pNS]=maxBell_NPA1(Inow,0);
NS=NS
[Q,pQ]=maxBell_NPA1(Inow,level);
Q=Q

R12=[1 2]; %Restriction to x=1 and x=2

[L12Q,pL12Q]=maxBell_localRestricted1(Inow, R12,level);
L12Q=L12Q
[LQ_2conv, pLQ_2conv p_pairs]=maxBell_localRestrictedCONV1(Inow,level);
LQ_2conv
% pLQ_2conv_ij=isLOC_restrictedCONV1(pLQ_2conv,level);
pLQ_2conv_ij=p_pairs;
p12_un=pLQ_2conv_ij{1};
p23_un=pLQ_2conv_ij{2};
p31_un=pLQ_2conv_ij{3};

q12=sum(sum(p12_un(:,:,1,1)));
q23=sum(sum(p23_un(:,:,1,1)));
q31=sum(sum(p31_un(:,:,1,1)));

p12=p12_un/q12;
p23=p23_un/q23;
p31=p31_un/q31;

p_test=NaN(2,2,3,3);

for x=1:3
    for y=1:3
        for a=1:2
            for b=1:2
                p_test(a,b,x,y) = q12*p12(a,b,x,y) + q23*p23(a,b,x,y) + q31*p31(a,b,x,y);
            end
        end
    end
end


p12A=NaN(2,3,3);
for x=1:3
    for y=1:3
        for a=1:2
                p12A(a,x,y)=p12(a,1,x,y)+p12(a,2,x,y);
        end
    end
end
p12A