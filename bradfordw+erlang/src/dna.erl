%%%-------------------------------------------------------------------
%%% @author Bradford Winfrey <bradford.winfrey@gmail.com>
%%% @copyright (C) 2013, Bradford Winfrey
%%% @doc
%%%
%%% @end
%%% Created :  8 Sep 2013 by Bradford Winfrey <bradford.winfrey@gmail.com>
%%%-------------------------------------------------------------------
-module(dna).

-include_lib("eunit/include/eunit.hrl").
%% API
-export([count/1]).

%%%===================================================================
%%% API
%%%===================================================================
count([]) ->
    "0 0 0 0";
count(<<>>) ->
    "0 0 0 0";
count(Dataset) when is_list(Dataset) ->
    count(list_to_binary(Dataset));
count(Dataset) when is_binary(Dataset) ->
    count(Dataset, {0,0,0,0});
count(_) ->
    "0 0 0 0".

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------

%%%===================================================================
%%% Internal functions
%%%===================================================================
count(<<>>, Counter) ->
  string:join([integer_to_list(T) || T <- tuple_to_list(Counter)], [$\s]);
count(<<$A,Rest/binary>>, {A,C,G,T}) ->
  count(Rest, {A+1,C,G,T});
count(<<$C,Rest/binary>>, {A,C,G,T}) ->
  count(Rest, {A,C+1,G,T});
count(<<$G,Rest/binary>>, {A,C,G,T}) ->
  count(Rest, {A,C,G+1,T});
count(<<$T,Rest/binary>>, {A,C,G,T}) ->
  count(Rest, {A,C,G,T+1});
count(<<_:1/binary,Rest/binary>>, Counters) ->
  count(Rest, Counters).

%%%% TEST %%%%


count_test() ->
    Sample = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC",
    ?assertMatch("20 12 17 21", count(Sample)).

