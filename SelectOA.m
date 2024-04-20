function [SelectOA_OAselected] = SelectOA(dataset)
% OA table definition

 OA_4  =importdata('Dataset/OAL4.mat');
 OA_8  =importdata('Dataset/OAL8.mat');
 OA_12  =importdata('Dataset/OAL12.mat');
 OA_16  =importdata('Dataset/OAL16.mat');
 OA_32  =importdata('Dataset/OAL32.mat');

if size(dataset,2)<= 3
        SelectOA_OAselected = OA_4;
elseif size(dataset,2)>3 && size(dataset,2)<= 7
        SelectOA_OAselected = OA_8;
elseif size(dataset,2)>7 && size(dataset,2)<=12
        SelectOA_OAselected = OA_12;
elseif size(dataset,2)>12 && size(dataset,2)<=15
        SelectOA_OAselected = OA_16;
elseif size(dataset,2)>15 && size(dataset,2)<=31
        SelectOA_OAselected = OA_32;
end