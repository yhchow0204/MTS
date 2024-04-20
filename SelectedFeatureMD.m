function [SFMD_MDOutput] = SelectedFeatureMD(SFMD_Feature,SFMD_HData,SFMD_UData)

%Find how many element ==1 in experimental number && limit the column to Total variables only
    SFMD_Index = find(SFMD_Feature==1); 
    
    %Select feature depends on OA table
    SFMD_HDataPerRow = SFMD_HData(:,SFMD_Index);
    SFMD_UDataPerRow = SFMD_UData(:,SFMD_Index);
   
    %Rebuild MS
    [SFMD_MSAverage,SFMD_MSStd,SFMD_Correlation]=BuildMS(SFMD_HDataPerRow);
   
    %Calculate MD for Abnormal Data
    SFMD_MDOutput = MDCalculation(SFMD_UDataPerRow,SFMD_MSAverage,SFMD_MSStd,SFMD_Correlation);

end