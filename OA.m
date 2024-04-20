function [OA_ResultTable] = OA(OA_OAselected,OA_HData,OA_UData)


% Remove extra features from OAselected based on the actual number of features 
OA_OATable= OA_OAselected(:,1:size(OA_UData,2));

% Create a OASNR table with OATable and empty last column
OA_OASNRTable = OA_OATable;
OA_OASNRTable(:,end+1) = NaN;

% Calculate SNR value based on each combination of feature
for row = 1:1:size(OA_OATable,1)
   
    %Calculate MD of each OA combination
    [OA_OAPerFMD]=SelectedFeatureMD(OA_OATable(row,:),OA_HData,OA_UData);
   
    %Calculate SNR using SNRCalculation function and fill in the last column
    OA_OASNRTable(row,end)=SNRCalculation(OA_OAPerFMD);
end

OA_ResultTable = OA_OASNRTable;

end