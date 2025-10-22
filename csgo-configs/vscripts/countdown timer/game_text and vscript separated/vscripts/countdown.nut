// Initialize variable strings to be null
l1 <- null;
l2 <- null;

// Set each case for every single timer you want displayed
// You MUST make separate function blocks for each different timer (and message)
// Maps can refer to your vscript with
//  "<output>" "countdown,RunScriptCode,timer1(),<delay>,<refire>"

//If you want to just display a countdown for 10 seconds
function timer1() {
	ChudTimer(10);
}

//If you want to display text + countdown for 10 seconds
//Format: "l1" + timer + "l2" -> "Defend for "10" seconds"
function timer2() {
	l1 = "Defend for "
	l2 = " seconds"
	ChudTextTimer(10);
}

//Use ChudTime if you want numbers only
function ChudTimer(amount) {
	local i = amount;
	local j;
	for (j = amount; j > 0; j--) {
		EntFire("chud", "SetText", j, i-j);
		EntFire("chud", "Display", "", i-j);
	}
}

//Use ChudTextTimer if you want your trigger to show both text and number
function ChudTextTimer(amount) {
	local i = amount;
	local j;
	for (j = amount;j > 0;j--) {
		EntFire("chudtext", "SetText", l1 + j.tostring() + l2, i-j);
		EntFire("chudtext", "Display", "", i-j);
	}
}
