function [Synthetic_samples,Synthetic_label]=SMOTE_RDPopulate(N,Minority_data,Minority_label,base,NN_Matrix,k)
%%
numattrs=size(Minority_data,2);
Synthetic_samples=[];
Synthetic_label=[];
while N>0
    random_NN=ceil(rand*k);
    base_data=Minority_data(base,:);
    base_label=Minority_label(base,:);
    base_NNs=NN_Matrix(base,:);
    base_random_NN=base_NNs(random_NN);
    for i=1:numattrs
        dif=Minority_data(base_random_NN,i)-base_data(i);
        gap=rand;
        new_sample(i)=base_data(i)+gap*dif;
    end
    Synthetic_samples=[Synthetic_samples;new_sample];
    Synthetic_label=[Synthetic_label;base_label];
    N=N-1;
end

end

