#!/bin/bash

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

GROWL_FILE=.irssi/growl

ps ax | awk '{if($0 ~ /.irssi\/growl/ && $1 ~ /[0-9]+/ && $4 !~ /awk/) print $1}' |
while read pid; do
kill -INT $pid
done

rm -f $GROWL_FILE && touch $GROWL_FILE && tail -f $GROWL_FILE
