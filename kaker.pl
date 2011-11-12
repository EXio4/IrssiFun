### K4k3r scr1p7!

### Change keys to say l33t!
#### Boolean: kaker_mode ## ON/OFF 

use strict;
use vars qw($VERSION %IRSSI);

use Irssi qw(command_bind signal_add signal_add_first signal_stop signal_continue);
#use Irssi;
$VERSION = '0.20';
%IRSSI = (
	authors		=> 'EXio4',
	contact		=> 'exio4[dot]com[@]gmail[dot]com',
	name		=> 'kakermode',
	description	=> 'K4k3r m0d3 f0r y0u!.',
	license		=> 'GPL',
);


my $sent = 1;

sub kaker_own($msg,$server, $win_item) {
	my ($msg, $server, $win_item) = @_;
	my $status;
	$status = Irssi::settings_get_bool("kaker_mode");
	if ($status eq 1) {
		$msg =~ s/[aA]/4/g;
		$msg =~ s/[eE]/3/g;
		$msg =~ s/[Tt]/7/g;
		$msg =~ s/[Ii]/1/g;
		$msg =~ s/[Oo]/0/g;
		Irssi::signal_continue($msg, $server, $win_item);
	}
	
}

signal_add_first("send text", "kaker_own");
Irssi::settings_add_bool("l33t","kaker_mode", "OFF");

