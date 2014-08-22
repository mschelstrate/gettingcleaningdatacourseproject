## Code Book that modifies and updates the codebooks included in dataset.
    Data Description:
        Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
        Triaxial Angular velocity from the gyroscope.
        A 561-feature vector with time and frequency domain variables.
        NOTE: Inertial values were not used in this project, only the derived and manually labeled values were.
    Variables:
        Features selected come from accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
        Time domain signals (prefix 't' to denote time) captured at a constant 50 Hz.
        Filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
        Acceleration signal separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
        Body linear acceleration and angular velocity derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
        Magnitude of three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
        Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
        The 561 features consists of 33 measurements with 17 estimations described in the HAR dataset. Only the mean and standard deviation estimations was used in this project.
            Thirty-three measurements considered, all 33 have been deemed to be useful in subsequent analyses:
                tBodyAcc-X
                tBodyAcc-Y
                tBodyAcc-Z
                tGravityAcc-X
                tGravityAcc-Y
                tGravityAcc-Z
                tBodyAccJerk-X
                tBodyAccJerk-Y
                tBodyAccJerk-Z
                tBodyGyro-X
                tBodyGyro-Y
                tBodyGyro-Z
                tBodyGyroJerk-X
                tBodyGyroJerk-Y
                tBodyGyroJerk-Z
                tBodyAccMag
                tGravityAccMag
                tBodyAccJerkMag
                tBodyGyroMag
                tBodyGyroJerkMag
                fBodyAcc-X
                fBodyAcc-Y
                fBodyAcc-Z
                fBodyAccJerk-X
                fBodyAccJerk-Y
                fBodyAccJerk-Z
                fBodyGyro-X
                fBodyGyro-Y
                fBodyGyro-Z
                fBodyAccMag
                fBodyAccJerkMag
                fBodyGyroMag
                fBodyGyroJerkMag
        Activity label.
            1 WALKING
            2 WALKING_UPSTAIRS
            3 WALKING_DOWNSTAIRS
            4 SITTING
            5 STANDING
            6 LAYING

    