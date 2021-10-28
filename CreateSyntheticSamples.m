function [Synthetic_samples,Synthetic_label]=CreateSyntheticSamples(Minority_data,Minority_label,Majority_data,Majority_label,N,k)
data=[Minority_data;Majority_data];
t=[Minority_label;Majority_label];
minority_id=[1:1:length(Minority_label)];
majority_id=[length(Minority_label)+1:length(t)];
%%
[RD,AbosuluteDensity_minority]= RelativeDensity(Minority_data,Minority_label,...
    Minority_data,Minority_label,Majority_data,Majority_label,k );
%%
RD=RD/sum(RD);
AbosuluteDensity_minority=1./AbosuluteDensity_minority;
%AbosuluteDensity_minority=(AbosuluteDensity_minority/sum(AbosuluteDensity_minority));
AbosuluteDensity_minority=AbosuluteDensity_minority/sum(AbosuluteDensity_minority);
w=RD.*AbosuluteDensity_minority;
w=w/sum(w);
%%
Total_generation=N*length(Minority_label);
weight=zeros(length(Minority_label),1);
for i=1:length(Minority_label)
    weight(i)=round(Total_generation*w(i));
end
[Synthetic_samples,Synthetic_label]=SMOTE_RDGeneration(Minority_data,Minority_label,weight,k);
%%
Minority_data=[Minority_data;Synthetic_samples];
Minority_label=[Minority_label;Synthetic_label];
%%
end

