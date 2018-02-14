#####################################################
##						  						   ##
##    Server Notices Segregation to Extra Windows  ## 
##		for the XChat Client 			 		   ##
##                                          	   ##
##    @2005 written by mathews for GamesNet        ##
##    @2007 modified by Frozen for GRNet           ##
##                                                 ##
#####################################################
##						   ##
## The original Idea of adding extra windows on    ##
## the XChat client was firstly implemented by	   ##
## mathews_dm for GamesNet and each needs.	   ##
##						   ##
## Part of the code was erased/replaced and/or     ##
## modified by me in order to cover the needs of   ##
## an IRC Operator on a Bahamut IRCdaemon with	   ##
## Anope Services.				   				   ##
##		   				 						   ##
## Credits goes to mathews_dm for the basic/most   ##
## part of the code, Powered, KiD and Athan for    ##
## their own mIRC scripts for Server Notices	   ##
## Segregation which gave me the text to be added  ##
## in order to cover a GRNet's IRC Operator needs. ##
##												   ##
#####################################################

#####################################################
##          Do Not Edit Below This Line            ##
##        (Probably an explosion can happen..)     ##
#####################################################

$SCRIPTNAME = "XChat snotices segregation";
$VERSION = "2.5";
 
IRC::register($SCRIPTNAME,$VERSION,"","");
IRC::print("4Loaded $SCRIPTNAME $VERSION \n");
IRC::add_command_handler("", "window_input");
IRC::add_message_handler("NOTICE", "snotices_handler");

sub window_input {
	my $channel = IRC::get_info(2);
	$line = shift(@_);
	if($channel eq ".Chatops") {
		IRC::command("/chatops : $line");
		return 1;
	} elsif($channel eq ".WallOps") {
		IRC::command("/wallops : $line");
		return 1;
	} elsif($channel eq ".Locops") {
		IRC::command("/locops : $line");
		return 1;
	} elsif($channel eq ".Globals-Kills") {
		IRC::command("/globops : $line");
		return 1;
	}
	return 0;
}

sub snotices_handler {
	my $server = IRC::get_info(3);
	$line = shift(@_);
	($blah, $nick, $host, $pm, $chan, $msg) = split (/ |!|:/, $line, 6);
########################################################################
################# Chatops/Globops/Locops/Wallops Window ################
########################################################################
	if($msg =~ /^\*\*\* ChatOps/) {
		IRC::command("/query -nofocus .Chatops");
		IRC::print_with_channel($msg,".Chatops",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* WallOps/) {
		IRC::command("/query -nofocus .Wallops");
		IRC::print_with_channel($msg,".Wallops",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* LocOps/) {
		IRC::command("/query -nofocus .Locops");
		IRC::print_with_channel($msg,".Locops",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Global -- from/) {
		IRC::command("/query -nofocus .Globals-Kills");
		IRC::print_with_channel($msg,".Globals-Kills",$server);
		return 1;
########################################################################
#################            Routing Window             ################
########################################################################
	} elsif($msg =~ /^\*\*\* Routing --/) {
		IRC::command("/query -nofocus .Routing");
		IRC::print_with_channel($msg,".Routing",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- *was connected/) {
		IRC::command("/query -nofocus .Routing");
		IRC::print_with_channel($msg,".Routing",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- Exiting server/) {
		IRC::command("/query -nofocus .Routing");
		IRC::print_with_channel($msg,".Routing",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- ERROR*(Server Exists)/) {
		IRC::command("/query -nofocus .Routing");
		IRC::print_with_channel($msg,".Routing",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Connection to/) {
		IRC::command("/query -nofocus .Routing");
		IRC::print_with_channel($msg,".Routing",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- ERROR*Server*already exists/) {
		IRC::command("/query -nofocus .Routing");
		IRC::print_with_channel($msg,".Routing",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- ERROR*from*Closing Link*Ping timeout/) {
		IRC::command("/query -nofocus .Routing");
		IRC::print_with_channel($msg,".Routing",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- services.irc.gr introducing/) {
		IRC::command("/query -nofocus .Routing");
		IRC::print_with_channel($msg,".Routing",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Lost server*during negotiation/) {
		IRC::command("/query -nofocus .Routing");
		IRC::print_with_channel($msg,".Routing",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- Link*dropped, no N* line/) {
		IRC::command("/query -nofocus .Routing");
		IRC::print_with_channel($msg,".Routing",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- Passing along SQUIT/) {
		IRC::command("/query -nofocus .Routing");
		IRC::print_with_channel($msg,".Routing",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- Blindly accepting dns result for/) {
		IRC::command("/query -nofocus .Routing");
		IRC::print_with_channel($msg,".Routing",$server);
		return 1;
########################################################################
#########               Connections - Throttles                #########
########################################################################
	} elsif($msg =~ /^\*\*\* Notice -- Client connecting/) {
		IRC::command("/query -nofocus .Connections");
		IRC::print_with_channel($msg,".Connections",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- Client exiting/) {
		IRC::command("/query -nofocus .Connections");
		IRC::print_with_channel($msg,".Connections",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- Invalid username:/) {
		IRC::command("/query -nofocus .Connections");
		IRC::print_with_channel($msg,".Connections",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- throttled connections from/) {
		IRC::command("/query -nofocus .Connections");
		IRC::print_with_channel($msg,".Connections",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- Forbidding Q/) {
		IRC::command("/query -nofocus .Connections");
		IRC::print_with_channel($msg,".Connections",$server);
		return 1;
########################################################################
#######                 Kills / K-Lines Windows                 ########
########################################################################
	} elsif($msg =~ /^\*\*\* Notice -- Received KILL message for/) {
		IRC::command("/query -nofocus .Globals-Kills");
		IRC::print_with_channel($msg,".Globals-Kills",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- K-Line active for*/) {
		IRC::command("/query -nofocus .KLines");
		IRC::print_with_channel($msg,".KLines",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- Autokill active for/) {
		IRC::command("/query -nofocus .Globals-Kills");
		IRC::print_with_channel($msg,".Globals-Kills",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- Z-line active for/) {
		IRC::command("/query -nofocus .Globals-Kills");
		IRC::print_with_channel($msg,".Gkibals-Kills",$server);
		return 1;
########################################################################
#######                       Flooders                          ########
########################################################################
	} elsif($msg =~ /^\*\*\* Notice -- Flood --*Exceeds/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- Flooder*target/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
########################################################################
#######                Spambots / Blocked Files                 ########
########################################################################
	} elsif($msg =~ /^\*\*\* Notice -- Rejecting possible/) {
		IRC::command("/query -nofocus .Infected");
		IRC::print_with_channel($msg,".Infected",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- User * \(*@*.*\) trying to join \\#* is a possible spambot/) {
		IRC::command("/query -nofocus .Infected");
		IRC::print_with_channel($msg,".Infected",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* possible spambot/) {
		IRC::command("/query -nofocus .Infected");
		IRC::print_with_channel($msg,".Infected",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- * sending forbidden filetyped/) {
		IRC::command("/query -nofocus .Infected");
		IRC::print_with_channel($msg,".Infected",$server);
		return 1;
########################################################################
#######                 Various Window                          ########
#                                                                      #
#    Stats, Admin, links, info , trace, motd, Requests, Whois, etc.    #
########################################################################
	} elsif($msg =~ /^\*\*\* Notice -- *has masked their hostname/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- *is now operator/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- Hacked ops on opless channel/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- TS/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- HTM/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- Resuming standard operation/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- Entering high-traffic mode/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- * set new HTM rate/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^NEW Max rate/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- Saved maxclient statistics/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- Cannot accept connections/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- New Max Local Clients/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- System clock running backwards/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- names abuser/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- * is rehashing/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- * is clearing temp klines while whistling/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- Saved maxclient statistics/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^HTM/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- Failed OPER attempt by/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- STATS/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- LINKS/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- * requested by/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- LINKS all requested by/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- nick collision on/) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	} elsif($msg =~ /^\*\*\* Notice -- WHOIS on you from/) {
		IRC::command("/query -nofocus .WHOIS");
		IRC::print_with_channel($msg,".WHOIS",$server);
		return 1;
########################################################################
#######    		The rest can be handled on .Various too..     ########
########################################################################
	} elsif($msg =~ /^\*\*\* Notice -- /) {
		IRC::command("/query -nofocus .Various");
		IRC::print_with_channel($msg,".Various",$server);
		return 1;
	}
	return 0;
}
1;
#Last update @ 14/05/2007.
#EOF
