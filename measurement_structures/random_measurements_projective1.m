function MA=random_measurements_projective1(N,d)
% Generates 'N' Random qudit prjective measurements
%The output of this function consists of d by d matrices indexed by
%MA(:,:,a,x), where a stands for outputs and x for inputs

MA=zeros(d,d,d,N);

for x=1:N
    U=RandomUnitary(d);
for a=1:d
    aux=zeros(d);
    aux(a,a)=1;
    aux=U*aux*U';
    MA(:,:,a,x)=aux;

end
end

end