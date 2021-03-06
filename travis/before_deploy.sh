#!/bin/sh

# Copyright (c) 2018 Benjamin Levy
#
# This file is part of FollowTheBeat.
#
# FollowTheBeat is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# FollowTheBeat is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with FollowTheBeat. If not, see <http://www.gnu.org/licenses/>.

# Prepare to deploy compiled release

set -ev

case $TRAVIS_OS_NAME in
linux)
	haxelib run lime deploy linux
	haxelib run lime deploy windows
	;;
osx)
	haxelib run lime deploy mac
	;;
*)
	echo "ERROR: Travis build running on unknown OS $TRAVIS_OS_NAME"
	exit 1
	;;
esac
