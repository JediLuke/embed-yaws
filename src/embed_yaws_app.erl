%%%-------------------------------------------------------------------
%% @doc embed_yaws public API
%% @end
%%%-------------------------------------------------------------------

-module(embed_yaws_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    embed_yaws_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
