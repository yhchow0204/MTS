%_________________________________________________________________________%
%  FilterData.m                                                           %
%                                                                         %
%  Developed in MATLAB R2022a                                             %
%                                                                         %
%  Programmer: YHCHOW                                                     %
%                                                                         %
%_________________________________________________________________________%
function [Filter_Healthy,Filter_Unhealthy] = FilterData(Filter_Dataset,Filter_OutputColumn,Filter_HealthyDataSeperator)

%Get Healthy Dataset
HData = Filter_Dataset(Filter_Dataset{:,Filter_OutputColumn} == Filter_HealthyDataSeperator,:); %Select sample that fits with HealthyDataSeperator
HData(:,Filter_OutputColumn) = []; %Remove result column
Filter_Healthy = table2array(HData);

%Get Unhealthy Dataset
UHData = Filter_Dataset(Filter_Dataset{:,Filter_OutputColumn} ~= Filter_HealthyDataSeperator,:);%Select sample that NOT fits with HealthyDataSeperator
UHData(:,Filter_OutputColumn)=[]; %Remove result column
Filter_Unhealthy = table2array(UHData);

end

