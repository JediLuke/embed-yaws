-module(api).

-include_lib("yaws/include/yaws_api.hrl").
%-include("../include/records.hrl").

-export([out/1]).

-define(APIKEY, 123).


out(Arg) ->
    Uri = yaws_api:request_url(Arg),
    Method = (Arg#arg.req)#http_request.method,
    [ _BasePath | Params] = string:tokens(Uri#url.path, "/"),

%    io:format("--------------~n"),
%    %io:format("Arg: ~p~n", [Arg]),
%    io:format("URI: ~p~n", [Uri]),
%    io:format("Method: ~p~n", [Method]),
%    io:format("Params: ~p~n", [Params]),
%    io:format("--------------~n"),

    handle(Arg, Method, Params).


%% -----------------------------------------------------------------
%% API handler methods
%% -----------------------------------------------------------------

%handle(_Arg, 'GET', []) ->
%    [{status, 200},
%     {html, "no args"}];


handle(_Arg, 'GET', ["artilects"]) ->
    %Devices = esb:list(devman, device, none, ?APIKEY),
	timer:sleep(5000),
    %%Struct = [convert_to_json(device, Device) || Device <- Devices],

    [{status, 200}, {html, "List of All artilects"}];

handle(_Arg, 'GET', ["test"]) ->
    %Devices = esb:list(devman, device, none, ?APIKEY),
    %%Struct = [convert_to_json(device, Device) || Device <- Devices],

    [{status, 200}, {html, "Testttt"}];

% handle(_Arg, 'GET', ["v1", "devices", D, "properties", P, "history"]) ->
%     {DeviceId, _} = string:to_integer(D),
%     {PropertyId, _} = string:to_integer(P),
%
%     Datapoints = esb:list_device_datapoints(DeviceId, PropertyId, ?APIKEY),
%     Struct = [convert_to_json(datapoint, Datapoint) || Datapoint <- Datapoints],
%
%     [{status, 200}, {html, json2:encode(Struct)}];
%
%
% handle(Arg, 'POST', ["v1", "devices", D, "properties", P ]) ->
%     {DeviceId, _} = string:to_integer(D),
%     {PropertyId, _} = string:to_integer(P),
%     PostData = binary_to_list(Arg#arg.clidata),
%
% %    io:format("PostData: ~p~n", [PostData]),
% %    io:format("Decoded: ~p~n", [json2:decode_string(PostData)]),
%
%     {ok, {struct, [Data]}} = json2:decode_string(PostData),
%     {"value", Value} = Data,
%
%     Datapoint = esb:create_device_datapoint(DeviceId, PropertyId, Value, ?APIKEY),
% %    io:format("Datapoint: ~p~n", [Datapoint]),
%
%     Struct = [convert_to_json(datapoint, Datapoint)],
%
%     [{status, 201}, {html, json2:encode(Struct)}];
%
% handle(Arg, 'GET', ["v1", "devices", D, "properties", P, V ]) ->
%     {DeviceId, _} = string:to_integer(D),
%     {PropertyId, _} = string:to_integer(P),
%     {Value, _} = string:to_integer(V),
%
%     Datapoint = esb:create_device_datapoint(DeviceId, PropertyId, Value, ?APIKEY),
%
%     Struct = [convert_to_json(datapoint, Datapoint)],
%
%     [{status, 201}, {html, json2:encode(Struct)}];


handle(_Arg, _Method, _Params) ->
    [{status, 404}, {html, "not found"}].


%% -----------------------------------------------------------------
%% Helper methods
%% -----------------------------------------------------------------
% convert_to_json(device, Record) ->
%     {
%         struct,
%         [
%             {"id",          Record#device.id},
%             {"name",        Record#device.name},
%             {"description", Record#device.description}
%         ]
%     };
%
% convert_to_json(datapoint, Datapoint) ->
%     {
%         struct,
%         [
%            {"datetime", Datapoint#datapoint.datetime},
%             {"value",    Datapoint#datapoint.value}
%         ]
%     }.
