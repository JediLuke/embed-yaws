%%====================================================================
%%
%% @author Luke Taylor
%% @doc yaws supervisor module.
%% @end
%%
%%====================================================================
-module('ybed_sup').
-behaviour(supervisor).
-define(SERVER, ?MODULE).

%% API
-export([start_link/0]).

%% ------------------------------------------------------------------
%% API functions
%% ------------------------------------------------------------------

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ------------------------------------------------------------------
%% Supervisor functions
%% ------------------------------------------------------------------
init([]) ->

    %%% Ybed (yaws worker proc)
    Ybed = #{
            id => ybed,
         start => {ybed, start, []},
       restart => permanent,
      shutdown => 5000,
          type => worker,
       modules => [ybed]
       },

    ChildSpecs = [Ybed],
    ok = supervisor:check_childspecs(ChildSpecs),

    SupFlags = #{
        strategy => one_for_one,
       intensity => 1,             % Max restarts
          period => 5              % Max timeout
          },            

   {ok, {SupFlags, ChildSpecs}}.



%% ------------------------------------------------------------------
%% Internal functions
%% ------------------------------------------------------------------
