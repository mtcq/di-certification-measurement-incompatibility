function MA=random_measurements_POVM1(Ia,Oa,d)
% Generates 'N' Random qudit POVM measurements sampled in the
%The output of this function consists of d by d matrices indexed by
%MA(:,:,a,x), where a stands for outputs and x for inputs

 MA=zeros(d,d,Oa,Ia);

for x=1:Ia
    M=RandomPOVM(d,Oa);
for a=1:Oa
    MA(:,:,a,x)=M{a};
end
end

end