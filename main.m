
% First Step:  Filter_RD
[ data,t,Minority_data,Minority_label,Majority_data,Majority_label ] = Filter_RD( Minority_data,Minority_label,Majority_data,Majority_label,k )；
% Second Step: CreateS ynthetic Samples based on relative density
[Synthetic_samples,Synthetic_label]=CreateSyntheticSamples(Minority_data,Minority_label,Majority_data,Majority_label,N,k)
