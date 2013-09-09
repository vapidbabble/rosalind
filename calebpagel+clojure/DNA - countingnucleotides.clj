(ns dnamatch)

;; Attempt to solve Rosalind - DNA - Counting DNA Nucleotides

(def *pieces* ["A" "C" "G" "T"])

(defn matcher [stringtomatch]
  (re-pattern stringtomatch)
  )

(defn matches [dna, letter]
  (re-seq (matcher letter) dna)
  )

(defn matchcounter [dna, letter]
  (if (> (count (matches dna letter)) 0)
      (count (matches dna letter))
          0)
  )

 (defn dnamapper [sequence pieces]
     (cons (matchcounter sequence (first pieces))
        (if (not (empty? (rest pieces)))
                (dnamapper sequence (rest pieces))))
)

(dnamapper "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC" *pieces*)
(dnamapper "AAAAA" *pieces*)
(dnamapper "CCCCC" *pieces*)
(dnamapper "GGGGG" *pieces*)
(dnamapper "TTTTT" *pieces*)
(dnamapper "ACGT" *pieces*)
