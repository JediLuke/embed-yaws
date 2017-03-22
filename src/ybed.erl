%%====================================================================
%%
%% @author Luke Taylor
%%
%%====================================================================
-module('ybed').
-compile(export_all).

-define(LOG_DIR, "logs").
-define(DOCROOT, "src/web").

-include_lib("yaws/include/yaws.hrl").

%% API
-export([start/0]).


%%====================================================================
%% API functions
%%====================================================================
start() ->
    {ok, spawn(?MODULE, run, [])}.


%%====================================================================
%% Internal functions
%%====================================================================

run() ->
    %%application:stop(yaws),
    GconfList = [
        {id, "yaws"},
        {logdir, ?LOG_DIR}
        ],
    AppMods = [
        {"api", api}
        ].
    SconfList = [
        {port, 8080},
        {listen, {0,0,0,0}},
        {docroot, ?DOCROOT},
        {appmods, AppMods}
        ],

    {ok, SCList, GC, ChildSpecs} = yaws_api:embedded_start_conf(?DOCROOT, SconfList, GconfList, Id),
    [supervisor:start_child(ybed_sup, Ch) || Ch <- ChildSpecs],
    yaws_api:setconf(GC, SCList),
    
    {ok, self()}.