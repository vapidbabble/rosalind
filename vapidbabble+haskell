import Test.QuickCheck

dna :: [Char] -> [Char] -> [Int]
dna valids dnastr= [ c | x<-valids, let c = (length.filter (==x)) dnastr, c>0 ] 

prop_testdna = dna "ACGT" "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC" == [20,12,17,21]
