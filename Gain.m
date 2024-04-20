function [G_GainResult] = Gain(G_OASNRTable,G_UData)

%Create empty array for Gain Table
[G_GainTable, G_L1Data, G_L2Data] = deal(zeros(1, size(G_UData, 2)));

%Extract OA and SNR column
G_OAColumn = G_OASNRTable(:,1:end-1);
G_SNRColumn = G_OASNRTable(:,end);

%Find the Gain value per feature
for Column = 1:1:size(G_UData,2)

    %Find the indices where features occur and do not occur
    G_PInd = (find(G_OAColumn(:,Column)==1));
    G_NInd = (find(G_OAColumn(:,Column)==2));

    %Find mean SNR per positive (occur) feature
    G_L1SNRData = mean(G_SNRColumn(G_PInd));
        if isnan(G_L1SNRData)
            G_L1SNRData = 0;
            warning("no features are selected")
        end

    %Find mean SNR per negative (not occur) feature
    G_L2SNRData = mean(G_SNRColumn(G_NInd));
        if isnan(G_L2SNRData)
            G_L2SNRData = 0;
            warning("all features are selected")
        end

    %Fill in each positive (occur) and negative （not occur) feature's mean SNR
    G_L1Data(1,Column) = G_L1SNRData;
    G_L2Data(1,Column) = G_L2SNRData;
    G_GainTable(1,Column) = G_L1SNRData - G_L2SNRData;
end
G_GainResult = [transpose(G_L1Data),transpose(G_L2Data),transpose(G_GainTable)];
end