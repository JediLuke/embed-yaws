embed_yaws
=====

Working example of embedding yaws inside a larger Erlang application. Also has a simple API implemented using appmods.

Note: This example is incompatible with windows ("There's no official support for rebar3 yet in yaws" 23/2/2016) - https://github.com/klacke/yaws/issues/254. Works fine on FreeBSD.

FreeBSD Build
-------------
See: http://www.bsdguides.org/2005/hardening-freebsd/
See: https://www.digitalocean.com/community/tutorials/recommended-steps-for-new-freebsd-10-1-servers

    $ sudo pkg install git
    $ sudo pkg install erlang
    $ sudo pkg install rebar3

Inside the embed-yaws directory (where README.md and rebar.config live). The directory can be changed in ybed.erl

	$ mkdir logs

To start the application, including embedded yaws

    $ rebar3 shell
    1> application:start(embed_yaws).

Links
-----

	www.jediluke.tech
	www.jediluke.tech/api/test

