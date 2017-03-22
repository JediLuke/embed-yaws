-module(api).
-include_lib("yaws/include/yaws_api.hrl").

-export([out/1]).


%%% Usage of this appmod
%%% the.server.ip.address:PORTNUM/api/params


out(Arg) ->
    Uri = yaws_api:request_url(Arg),
    Method = (Arg#arg.req)#http_request.method,
    [ _BasePath | Params] = string:tokens(Uri#url.path, "/"),
    % io:format("Arg: ~p~n", [Arg]),
    handle(Arg, Method, Params).


%% -----------------------------------------------------------------
%% API handler methods
%% -----------------------------------------------------------------

handle(_Arg, 'GET', ["test"]) ->
    [{status, 200}, {html, "Test HTML response."}];

% handle(_Arg, 'GET', ["v1", "devices", D, "properties", P, "history"]) ->
%     {DeviceId, _} = string:to_integer(D),
%     {PropertyId, _} = string:to_integer(P),
%
%     Datapoints = esb:list_device_datapoints(DeviceId, PropertyId, ?APIKEY),
%     Struct = [convert_to_json(datapoint, Datapoint) || Datapoint <- Datapoints],
%
%     [{status, 200}, {html, json2:encode(Struct)}];

handle(_Arg, _Method, _Params) ->
    [{status, 404}, {html, "not found"}].


%% -----------------------------------------------------------------
%% Helper methods
%% -----------------------------------------------------------------