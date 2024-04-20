# MTS

Welcome to the Mahalanobis Taguchi System (MTS) for Feature Selection MATLAB code! This powerful tool combines the principles of Mahalanobis Distance (MD) and Taguchi's method, leveraging Orthogonal Array (OA) design and Signal-to-Noise Ratio (SNR) analysis to identify the most relevant features in your dataset.

- Input: supervised dataset with two level result

- Output: best features selected by MTS 

- Limitation: this code has a maximum limit of 31 factors 

The OA design used is based on https://www.york.ac.uk/depts/maths/tables/orthogonal.htm
Number of factors			OA
1-3							L4
4-7							L8
8-11						L12
12-15						L16
16-31						L32

**Note that this code select L32 not L64 for dataset that have 15<factors number<32

# User Configuration

	1. Prepare and import your own dataset in .csv filetype
	2. double click the dataset and select import selection
		![Import Dataset to MATLAB](https://github.com/yhchow0204/MTS/blob/main/README_Image/ImportDatasettoMATLAB.png)
	3. save the .mat file in your local space to avoid repeating step 1 and 2 each time
	4. Change the ResultColumn according to your dataset's result column.
		- In PIMA dataset the column to seperate healthy and unhealthy patient is in column 9
	5. Change the HealthyDataSeparator according to your dataset's healthy data value
		- In PIMA dataset, healthy patient has a value of 0, those with diabetes has a value of 1

# Result

The result:

![ResultofMTS](https://github.com/yhchow0204/MTS/blob/main/README_Image/Result.png)

If you find this code helpful for your academic work, I would greatly appreciate if you could assist in citing my work through this journal, which explores the Mahalanobis Taguchi System in conjunction with the Binary Whales Optimization Algorithm. https://semarakilmu.com.my/journals/index.php/applied_sciences_eng_tech/article/view/1856

