### BASE SCRIPT ##


use strict;
use vars qw($VERSION %IRSSI);

use Irssi qw(command_bind signal_add signal_add_first signal_stop signal_continue);
#use Irssi;
$VERSION = '0.20';
%IRSSI = (
	authors		=> 'Nobody',
	contact		=> 'base@nobody.non',
	name		=> 'none',
	description	=> 'none',
	license		=> 'GPL', ## No change!
);
my $cat;
my $cfg;
my $def;
my $msg2;
## Configuration ! 

$cat = "BASE";
$cfg = "BASE_CFG";
$def = "NO";

sub procline() { 
	my $tmp;
	$tmp=$msg2;

	## EDIT ONLY "$tmp" VARIABLE
	$tmp = $msg2;
#	$tmp = "test";
	## EDIT ONLY "$tmp" VARIABLE!

	$msg2 = $tmp;
}

sub modifytxt($msg,$server, $win_item) {
	my ($msg, $server, $win_item) = @_;
	my $status;
	$status = Irssi::settings_get_bool($cfg);
	if ($status eq 1) {
		$msg2 = $msg;
		procline;
		Irssi::signal_continue($msg2, $server, $win_item);
	}
	
}

signal_add_first("send text", "modifytxt");
Irssi::settings_add_bool($cat,$cfg, $def);

