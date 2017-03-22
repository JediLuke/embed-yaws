%%%-------------------------------------------------------------------
%% @doc embed_yaws top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(embed_yaws_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ------------------------------------------------------------------
%% Supervisor functions
%% ------------------------------------------------------------------

init([]) ->

	%%% yaws (webserver) supervisor
	Yaws = #{
			 id => ybed_sup,
		  start => {ybed_sup, start_link, []},
	    restart => permanent,
	   shutdown => 5000,
		   type => supervisor,
	   	modules => [ybed_sup]
	   	},

    Ybed = #{
            id => ybed,
         start => {ybed, start, []},
       restart => permanent,
      shutdown => 5000,
          type => worker,
       modules => [ybed]
       },

	%%% other childspecs here

	ChildSpecs = [Ybed],
	ok = supervisor:check_childspecs(ChildSpecs),

	SupFlags = #{
		strategy => one_for_one,
	   intensity => 1,             % Max restarts
		  period => 5			   % Max timeout
		  },            

   {ok, {SupFlags, ChildSpecs}}.


%%====================================================================
%% Internal functions
%%====================================================================
