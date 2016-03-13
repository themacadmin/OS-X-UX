#!/bin/bash
#
##########################################################################################
#
# Header begins
#
##########################################################################################
#
# Copyright (c) 2016, Miles A. Leacy IV.  All rights reserved.
#
#     This script may be copied, modified, and distributed freely as long as this header
#     remains intact and modifications are publicly shared with the Mac administrators'
#     community at large.
#
#     This script is provided "as is".  The author offers no warranty or guarantee of any
#     kind.
#
#     Use of this script is at your own risk.  The author takes no responsibility for loss
#     of use, loss of data, loss of job, loss of socks, the onset of armageddon, or any
#     other negative effects.
#
#     Test thoroughly in a lab environment before use on production systems.
#     When you think it's ok, test again.  When you're certain it's ok, test twice more.
#
##########################################################################################
#
# About This Script
#
# Name
#	openUrlAsUser.bash
#
# Usage
#	sudo openUrlAsUser.bash
#
# DESCRIPTION
#	Opens a URL as the logged in user, using the default web browser.
#
# VARIABLES
#	url
#		The URL to be opened
#
#	browser
#		Optional. The bundle identifier of the browser the URL will be opened with.
#	
#
##########################################################################################
#
# History
#
#	- Created by Miles Leacy on 2016 03 13
#
##########################################################################################
#
# Header ends
#
##########################################################################################
#
# Declare Variables
#
##########################################################################################

# HARDCODED VALUES ARE SET HERE
url=""
browser=""

# CHECK TO SEE IF A VALUE WAS PASSED IN PARAMETER 4 AND, IF SO, ASSIGN TO "url"
if [ "$4" != "" ] && [ "$url" == "" ]
then
    url=$4
fi

# CHECK TO SEE IF A VALUE WAS PASSED IN PARAMETER 5 AND, IF SO, ASSIGN TO "browser"
if [ "$5" != "" ] && [ "$browser" == "" ]
then
    browser="$5"
fi

# set "currentUser"
currentUser=$(/usr/bin/who | /usr/bin/awk '/console/{print $1}')

##########################################################################################
#
# Script begins
#
##########################################################################################

# CHECK TO SEE IF "browser" HAS A VALUE, AND IF SO, SET "browserArg"
if [ "$browser" != "" ]
then
    browserArg="-b $5"
else
	browserArg=""
fi


sudo -u $currentUser open "$4" "$browserArg"

exit 0
