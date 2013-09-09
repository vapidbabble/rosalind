%%%-------------------------------------------------------------------
%%% @author Bradford Winfrey <bradford.winfrey@gmail.com>
%%% @copyright (C) 2013, Bradford Winfrey
%%% @doc
%%%
%%% @end
%%% Created :  8 Sep 2013 by Bradford Winfrey <bradford.winfrey@gmail.com>
%%%-------------------------------------------------------------------
-module(rna).

-include_lib("eunit/include/eunit.hrl").
%% API
-export([transcribe/1]).

%%%===================================================================
%%% API
%%%===================================================================
transcribe([])    -> <<>>;
transcribe(<<>>)  -> <<>>;
transcribe(Dataset) when is_list(Dataset) ->
    transcribe(list_to_binary(Dataset));
transcribe(Dataset) when is_binary(Dataset) ->
    transcribe(Dataset, <<>>);
transcribe(_) -> <<>>.

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------

%%%===================================================================
%%% Internal functions
%%%===================================================================
transcribe(<<>>, Output) -> Output;
transcribe(<<$T,Rest/binary>>, Output) ->
  transcribe(Rest, <<Output/binary, $U>>);
transcribe(<<M:1/binary,Rest/binary>>, Output) ->
  transcribe(Rest, <<Output/binary,M/binary>>).

%%%% TEST %%%%

transcribe_test() ->
    Sample = "GATGGAACTTGACTACGTAAATT",
    ?assertMatch(<<"GAUGGAACUUGACUACGUAAAUU">>, transcribe(Sample)).

