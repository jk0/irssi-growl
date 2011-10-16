#   Copyright 2011 Josh Kearney
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

use strict;
use warnings;

use Irssi;
use vars qw($VERSION %IRSSI);

$VERSION = "0.0.1";

%IRSSI = (
    authors => "Josh Kearney",
    contact => "josh\@jk0.org",
    name => "irssi-growl",
    description => "Send Growl notifications upon new mentions or PMs.",
    license => "Apache License, Version 2.0",
    url => "https://github.com/jk0/irssi-growl"
);

sub msg_public {
    my ($server, $msg, $nick, $mask, $channel) = @_;

    if($msg =~ /$server->{nick}/i) {
        write_msg("$server->{chatnet} [$channel:$nick] $msg");
    }
}

sub msg_private {
    my ($server, $msg, $nick, $mask, $channel) = @_;

    write_msg("$server->{chatnet} [$nick] $msg");
}

sub write_msg {
    my ($text) = @_;

    open(FILE, ">>$ENV{HOME}/.irssi/growl");
    print FILE "$text\n";
    close(FILE);
}

Irssi::signal_add_last("message public", "msg_public");
Irssi::signal_add_last("message private", "msg_private");
