# bash-compare-two-files

To execute script run `bash compare-files.sh`. 

Script will find two latest `.csv` files and compare their content. For now only a single-line csv files are allowed.
If you'd like to compare custom files please provide them as a parameters: `bash compare-files.sh <older-file> <newer-file>`.

## Unit tests

To run tests execute `./test/bats/bin/bats test/test.bats`.
