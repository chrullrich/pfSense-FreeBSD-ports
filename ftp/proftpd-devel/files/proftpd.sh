#!/bin/sh
#
# $FreeBSD$
#

# PROVIDE: proftpd
# REQUIRE: DAEMON
# BEFORE: LOGIN
# KEYWORD: FreeBSD shutdown

#
# Add the following lines to /etc/rc.conf to enable proftpd:
#
#proftpd_enable="YES"
#
# See proftpd(8) for flags
#

. %%RC_SUBR%%

name=proftpd
rcvar=`set_rcvar`

command=%%PREFIX%%/libexec/proftpd
pidfile=/var/run/proftpd.pid
required_files=%%PREFIX%%/etc/proftpd.conf

stop_postcmd=stop_postcmd

stop_postcmd()
{
  rm -f $pidfile
}

# set defaults

proftpd_enable=${proftpd_enable:-"NO"}
proftpd_flags=${proftpd_flags:-""}

load_rc_config $name
run_rc_command "$1"
