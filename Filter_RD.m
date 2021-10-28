function [ data,t,Minority_data,Minority_label,Majority_data,Majority_label ] = Filter_RD( Minority_data,Minority_label,Majority_data,Majority_label,k )
%%
data=[Minority_data;Majority_data];
t=[Minority_label;Majority_label];
minority_id=[1:1:length(Minority_label)];
majority_id=[length(Minority_label)+1:length(t)];
%%
RD= RelativeDensity(data,t,Minority_data,Minority_label,Majority_data,Majority_label,k );
pos=find(RD>=1);
%%
minority_id=intersect(minority_id,pos);
majority_id=intersect(majority_id,pos);
Minority_data=data(minority_id,:);
Minority_label=t(minority_id);
Majority_data=data(majority_id,:);
Majority_label=t(majority_id);
data=data(pos,:);
t=t(pos);
end

