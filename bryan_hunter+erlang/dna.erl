-module(dna).
-export([test/0,test/1]).

test() ->
	Dataset = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC",
	"20 12 17 21" == test(Dataset).

test(Dataset) -> 
	{A, C, G, T} = walk(Dataset, {0,0,0,0}),
	lists:concat([A, " ", C, " ", G, " ", T]).

%% - Private

walk([Head|Tail], Counts) ->
	walk(Tail, bump_count(Head, Counts));
walk([], Result) ->
	Result.

bump_count($A, {A,C,G,T}) ->
	{A+1,C,G,T};
bump_count($C, {A,C,G,T}) ->
	{A,C+1,G,T};
bump_count($G, {A,C,G,T}) ->
	{A,C,G+1,T};
bump_count($T, {A,C,G,T}) ->
	{A,C,G,T+1}.