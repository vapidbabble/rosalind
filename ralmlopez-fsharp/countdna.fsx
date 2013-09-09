let data = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
let list = Array.toList (data.ToCharArray())

let count_dna list =
    let rec count list (A,C,G,T) =
        match list with 
        | 'A'::xs -> count xs (A+1,C,G,T)
        | 'C'::xs -> count xs (A,C+1,G,T)
        | 'G'::xs -> count xs (A,C,G+1,T)
        | 'T'::xs -> count xs (A,C,G,T+1)
        | _::xs -> count xs (A,C,G,T)
        | [] -> (A,C,G,T)
    count list (0,0,0,0)

let (A,C,G,T) = count_dna list
printfn "%i %i %i %i" A C G T 
