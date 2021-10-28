function [RD,AbosuluteDensity_minority,AbosuluteDensity_Majority,MinorityKNN,MajorityKNN]= RelativeDensity(data,t,Minority_data,Minority_label,Majority_data,Majority_label,k )

%%
MinorityKNN=knnsearch(Minority_data,data,'NSMethod','kdtree','K',k);
MinorityKNN(:,1)=[];
MajorityKNN=knnsearch(Majority_data,data,'NSMethod','kdtree','K',k);
MajorityKNN(:,1)=[];
%%
AbosuluteDensity_minority=zeros(size(data,1),1);
AbosuluteDensity_Majority=zeros(size(data,1),1);
AbosuluteDensity_HO=zeros(size(data,1),1);
AbosuluteDensity_HE=zeros(size(data,1),1);
RD=zeros(size(data,1),1);
for i=1:size(data,1)
    pos1=MinorityKNN(i,:);
    AbosuluteDensity_minority(i)=k/sum(pdist2(Minority_data(pos1,:),data(i,:)));
    pos2=MajorityKNN(i,:);
    AbosuluteDensity_Majority(i)=k/sum(pdist2(Majority_data(pos2,:),data(i,:)));
    if t(i)==1
        AbosuluteDensity_HO(i)=AbosuluteDensity_minority(i);
        AbosuluteDensity_HE(i)=AbosuluteDensity_Majority(i);
    else
        AbosuluteDensity_HO(i)=AbosuluteDensity_Majority(i);
        AbosuluteDensity_HE(i)=AbosuluteDensity_minority(i);
    end
    RD(i)=AbosuluteDensity_HO(i)/AbosuluteDensity_HE(i);
end
end

