# Variables used

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_data`, `y_data` and `subject_data` contain merged datasets.
* `features` contains the correct names for the `x_data` dataset, which are applied to the column names stored in `mean_std`, a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the `activities` variable.
* `combined_data` merges `x_data`, `y_data` and `subject_data` in a big dataset using cbind().
* Finally, `tidy_data` contains the relevant averages which will be later stored in a `.txt` file. 