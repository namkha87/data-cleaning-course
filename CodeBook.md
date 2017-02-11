Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAcc-XYZ and timeGyro-XYZ. These time domain signals (prefix 'time' to denote time, 'freq' to indicate frequency domain signals) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcc-XYZ and timeGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerk-XYZ and timeBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freqBodyAcc-XYZ, freqBodyAccJerk-XYZ, freqBodyGyro-XYZ, freqBodyAccJerkMag, freqBodyGyroMag, freqBodyGyroJerkMag. (Note the 'freq' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- timeBodyAcc-XYZ
- timeGravityAcc-XYZ
- timeBodyAccJerk-XYZ
- timeBodyGyro-XYZ
- timeBodyGyroJerk-XYZ
- timeBodyAccMag
- timeGravityAccMag
- timeBodyAccJerkMag
- timeBodyGyroMag
- timeBodyGyroJerkMag
- freqBodyAcc-XYZ
- freqBodyAccJerk-XYZ
- freqBodyGyro-XYZ
- freqBodyAccMag
- freqBodyAccJerkMag
- freqBodyGyroMag
- freqBodyGyroJerkMag


The set of variables that were estimated from these signals are: 

- mean(): Mean value

- std(): Standard deviation

The complete list of variables
=================
1. activity
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
2. subjectId

  An integer number to identify the person performing activities
  
3. timeBodyAccMeanX
4. timeBodyAccMeanY
5. timeBodyAccMeanZ
6. timeBodyAccStdX
7. timeBodyAccStdY
8. timeBodyAccStdZ
9. timeGravityAccMeanX
10. timeGravityAccMeanY
11. timeGravityAccMeanZ
12. timeGravityAccStdX
13. timeGravityAccStdY
14. timeGravityAccStdZ
15. timeBodyAccJerkMeanX
16. timeBodyAccJerkMeanY
17. timeBodyAccJerkMeanZ
18. timeBodyAccJerkStdX
19. timeBodyAccJerkStdY
20. timeBodyAccJerkStdZ
21. timeBodyGyroMeanX
22. timeBodyGyroMeanY
23. timeBodyGyroMeanZ
24. timeBodyGyroStdX
25. timeBodyGyroStdY
26. timeBodyGyroStdZ
27. timeBodyGyroJerkMeanX
28. timeBodyGyroJerkMeanY
29. timeBodyGyroJerkMeanZ
30. timeBodyGyroJerkStdX
31. timeBodyGyroJerkStdY
32. timeBodyGyroJerkStdZ
33. timeBodyAccMagMean
34. timeBodyAccMagStd
35. timeGravityAccMagMean
36. timeGravityAccMagStd
37. timeBodyAccJerkMagMean
38. timeBodyAccJerkMagStd
39. timeBodyGyroMagMean
40. timeBodyGyroMagStd
41. timeBodyGyroJerkMagMean
42. timeBodyGyroJerkMagStd
43. freqBodyAccMeanX
44. freqBodyAccMeanY
45. freqBodyAccMeanZ
46. freqBodyAccStdX
47. freqBodyAccStdY
48. freqBodyAccStdZ
49. freqBodyAccJerkMeanX
50. freqBodyAccJerkMeanY
51. freqBodyAccJerkMeanZ
52. freqBodyAccJerkStdX
53. freqBodyAccJerkStdY
54. freqBodyAccJerkStdZ
55. freqBodyGyroMeanX
56. freqBodyGyroMeanY
57. freqBodyGyroMeanZ
58. freqBodyGyroStdX
59. freqBodyGyroStdY
60. freqBodyGyroStdZ
61. freqBodyAccMagMean
62. freqBodyAccMagStd
63. freqBodyBodyAccJerkMagMean
64. freqBodyBodyAccJerkMagStd
65. freqBodyBodyGyroMagMean
66. freqBodyBodyGyroMagStd
67. freqBodyBodyGyroJerkMagMean
68. freqBodyBodyGyroJerkMagStd

