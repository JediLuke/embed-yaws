embed_yaws
=====

Working example of embedding yaws inside a larger Erlang application. Also has a simple API implemented using appmods.

Note: This example is incompatible with windows ("There's no official support for rebar3 yet in yaws" 23/2/2016) - https://github.com/klacke/yaws/issues/254

FreeBSD Build
-------------

See: https://www.digitalocean.com/community/tutorial_series/getting-started-with-freebsd
See: https://www.digitalocean.com/community/tutorials/recommended-steps-for-new-freebsd-10-1-servers

For some reason (build error) application:start(embed_yaws) fails, so manually starting it for now (this isn't meant to be a production release just an example code).

    $ sudo pkg install git
    $ sudo pkg install erlang
    $ sudo pkg install rebar3

    $ rebar3 shell
    $ ybed_sup:start_link()

Examples
--------

