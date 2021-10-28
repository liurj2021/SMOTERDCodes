function [Synthetic_samples,Synthetic_label]=SMOTE_RDGeneration(Minority_data,Minority_label,N,k)
%%
% SMOTE
% parameter 1: oversample factor f 
% parameter 2: k
%%
Synthetic_samples=[];
Synthetic_label=[];
%% (1) calculate k nearest neighbors of each samples in Minority_data
NN_Matrix = knnsearch(Minority_data,Minority_data,'k',k+1);% 返回排好序的索引和距离
NN_Matrix(:,1)=[];
%% (2)
for i=1:length(Minority_data)
    [new_samples,new_label]=SMOTE_RDPopulate(N(i),Minority_data,Minority_label,i,NN_Matrix,k);
    Synthetic_samples=[Synthetic_samples;new_samples];
    Synthetic_label=[Synthetic_label;new_label];
end

end

