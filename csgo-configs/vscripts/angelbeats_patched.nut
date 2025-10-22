// Translated by koen (STEAM_1:1:114921174)

function lock()
{
	EntFire("command", "Command", "say ** Main door is locked. Take the side door **", 0.0);
}

function SetText_1()
{
	EntFire("game_text_1", "SetText", "Yuri :", 0.0);
	EntFire("game_text_2", "SetText", "A zombie virus has emerged!", 0.0);
	EntFire("game_text_3", "SetText", "Head to the guild for weapons!", 0.0);
	EntFire("game_text_4", "SetText", "Yusa, lead the way.", 0.0);
	EntFire("game_text_*", "Display", "", 0.2);

	EntFire("game_text_1", "SetText", "Yusa :", 8.0);
	EntFire("game_text_2", "SetText", "Roger. Everyone head to the gym", 8.0);
	EntFire("game_text_3", "SetText", "The guild underneath it.", 8.0);
	EntFire("game_text_4", "SetText", "The main door is locked, so take the side door", 8.0);
	EntFire("game_text_*", "Display", "", 8.2);

	EntFire("game_text_1", "SetText", "Yusa :", 16.0);
	EntFire("game_text_2", "SetText", "Look out, Kanade is ahead", 16.0);
	EntFire("game_text_3", "SetText", "She seems unusual...", 16.0);
	EntFire("game_text_4", "SetText", "<< Beware of her Sonic Blades >>", 16.0);
	EntFire("game_text_*", "Display", "", 16.2);
}

function overlays_1()
{
	EntFire("tongxun_s", "PlaySound", "", 0.0);
	EntFire("overlays_ylz_s", "StartOverlays", "", 0.0);
	EntFire("overlays_ylz_s", "StopOverlays", "", 7.0);
	EntFire("overlays_ylz_e", "StartOverlays", "", 7.0);
	EntFire("overlays_ylz_e", "StopOverlays", "", 7.3);
	EntFire("tongxun_e", "PlaySound", "", 7.2);

	EntFire("tongxun_s", "PlaySound", "", 8.0);
	EntFire("overlays_yz_s", "StartOverlays", "", 8.0);
	EntFire("overlays_yz_s", "StopOverlays", "", 15.0);
	EntFire("overlays_yz_e", "StartOverlays", "", 15.0);
	EntFire("overlays_yz_e", "StopOverlays", "", 15.3);
	EntFire("tongxun_e", "PlaySound", "", 15.2);

	EntFire("tongxun_s", "PlaySound", "", 16.0);
	EntFire("overlays_yz_s", "StartOverlays", "", 16.0);
	EntFire("overlays_yz_s", "StopOverlays", "", 20.0);
	EntFire("overlays_yz_e", "StartOverlays", "", 20.0);
	EntFire("overlays_yz_e", "StopOverlays", "", 20.3);
	EntFire("tongxun_e", "PlaySound", "", 20.2);
}

function SetText_3()
{
	EntFire("game_text_1", "SetText", "Kanade :", 2.0);
	EntFire("game_text_2", "SetText", "<< Sonic Blade >>", 2.0);
	EntFire("game_text_3", "SetText", "", 2.0);
	EntFire("game_text_4", "SetText", "", 2.0);
	EntFire("game_text_*", "Display", "", 2.2);

	EntFire("game_text_1", "SetText", "Yui :",6.0);
	EntFire("game_text_2", "SetText", "Why would Kanade attack us?", 6.0);
	EntFire("game_text_3", "SetText", "Aren't we friends?", 6.0);
	EntFire("game_text_4", "SetText", "", 6.0);
	EntFire("game_text_*", "Display", "", 6.2);
}

function overlays_3()
{
	EntFire("tongxun_s", "PlaySound", "", 2.0);
	EntFire("overlays_xiaozou_s", "StartOverlays", "", 2.0);
	EntFire("overlays_xiaozou_s", "StopOverlays", "", 5.0);
	EntFire("overlays_xiaozou_e", "StartOverlays", "", 5.0);
	EntFire("overlays_xiaozou_e", "StopOverlays", "", 5.3);
	EntFire("tongxun_e", "PlaySound", "", 5.2);

	EntFire("tongxun_s", "PlaySound", "", 6.0);
	EntFire("overlays_yy_s", "StartOverlays", "", 6.0);
	EntFire("overlays_yy_s", "StopOverlays", "", 10.0);
	EntFire("overlays_yy_e", "StartOverlays", "", 10.0);
	EntFire("overlays_yy_e", "StopOverlays", "", 10.3);
	EntFire("tongxun_e", "PlaySound", "", 10.2);
}

function SetText_4()
{
	EntFire("game_text_1", "SetText", "Yuri :", 0.0);
	EntFire("game_text_2", "SetText", "Remember the shadow from earlier?", 0.0);
	EntFire("game_text_3", "SetText", "Seems like the virus & shadow controls humans", 0.0);
	EntFire("game_text_4", "SetText", "Kanade is being controled!");
	EntFire("game_text_*", "Display", "", 0.2);

	EntFire("game_text_1", "SetText", "Yui :", 6.0);
	EntFire("game_text_3", "SetText", "What do we do?", 6.0);
	EntFire("game_text_3", "SetText", "", 6.0);
	EntFire("game_text_4", "SetText", "", 6.0);
	EntFire("game_text_*", "Display", "", 6.2);

	EntFire("game_text_1", "SetText", "Yuri :",11.0);
	EntFire("game_text_2", "SetText", "We should focus on our safety", 11.0);
	EntFire("game_text_3", "SetText", "She isn't in any life-threatening danger", 11.0);
	EntFire("game_text_4", "SetText", "Head to the guild first, then think of something", 11.0);
	EntFire("game_text_*", "Display", "", 11.2);

}

function overlays_4()
{
	EntFire("tongxun_s", "PlaySound", "", 0.0);
	EntFire("overlays_ylz_s", "StartOverlays", "", 0.0);
	EntFire("overlays_ylz_s", "StopOverlays", "", 5.0);
	EntFire("overlays_ylz_e", "StartOverlays", "", 5.0);
	EntFire("overlays_ylz_e", "StopOverlays", "", 5.3);
	EntFire("tongxun_e", "PlaySound", "", 5.2);

	EntFire("tongxun_s", "PlaySound", "", 6.0);
	EntFire("overlays_yy_s", "StartOverlays", "", 6.0);
	EntFire("overlays_yy_s", "StopOverlays", "", 10.0);
	EntFire("overlays_yy_e", "StartOverlays", "", 10.0);
	EntFire("overlays_yy_e", "StopOverlays", "", 10.3);
	EntFire("tongxun_e", "PlaySound", "", 10.2);

	EntFire("tongxun_s", "PlaySound", "", 11.0);
	EntFire("overlays_ylz_s", "StartOverlays", "", 11.0);
	EntFire("overlays_ylz_s", "StopOverlays", "", 16.0);
	EntFire("overlays_ylz_e", "StartOverlays", "", 16.0);
	EntFire("overlays_ylz_e", "StopOverlays", "", 16.3);
	EntFire("tongxun_e", "PlaySound", "", 16.2);
}

function SetText_5()
{
	EntFire("game_text_1", "SetText", "Yusa :", 0.0);
	EntFire("game_text_2", "SetText", "Entrance is under the stage", 0.0);
	EntFire("game_text_3", "SetText", "The switch is by the computers", 0.0);
	EntFire("game_text_4", "SetText", "Defend while I open the door", 0.0);
	EntFire("game_text_*", "Display", "", 0.2);
}

function overlays_5()
{
	EntFire("tongxun_s", "PlaySound", "", 0.0);
	EntFire("overlays_yz_s", "StartOverlays", "", 0.0);
	EntFire("overlays_yz_s", "StopOverlays", "", 5.0);
	EntFire("overlays_yz_e", "StartOverlays", "", 5.0);
	EntFire("overlays_yz_e", "StopOverlays", "", 5.3);
	EntFire("tongxun_e", "PlaySound", "", 5.2);
}

function SetText_6()
{
	EntFire("game_text_1", "SetText", "Yusa :", 0.0);
	EntFire("game_text_2", "SetText", "The door opens in 30s", 0.0);
	EntFire("game_text_3", "SetText", "Defend here", 0.0);
	EntFire("game_text_4", "SetText", "", 0.0);
	EntFire("game_text_*", "Display", "", 0.2);

	EntFire("game_text_1", "SetText", "Yusa :", 30.0);
	EntFire("game_text_2", "SetText", "Door is open. Let's go.", 30.0);
	EntFire("game_text_3", "SetText", "", 30.0);
	EntFire("game_text_4", "SetText", "", 30.0);
	EntFire("game_text_*", "Display", "", 30.2);
}

function overlays_6()
{
	EntFire("tongxun_s", "PlaySound", "", 0.0);
	EntFire("overlays_yz_s", "StartOverlays", "", 0.0);
	EntFire("overlays_yz_s", "StopOverlays", "", 5.0);
	EntFire("overlays_yz_e", "StartOverlays", "", 5.0);
	EntFire("overlays_yz_e", "StopOverlays", "", 5.3);
	EntFire("tongxun_e", "PlaySound", "", 5.2);

	EntFire("tongxun_s", "PlaySound", "", 30.0);
	EntFire("overlays_yz_s", "StartOverlays", "",3 0.0);
	EntFire("overlays_yz_s", "StopOverlays", "", 33.0);
	EntFire("overlays_yz_e", "StartOverlays", "", 33.0);
	EntFire("overlays_yz_e", "StopOverlays", "", 33.3);
	EntFire("tongxun_e", "PlaySound", "", 33.2);
}

function SetText_7()
{
	EntFire("game_text_1", "SetText", "Yui :", 0.0);
	EntFire("game_text_2", "SetText", "Why are the traps activated?", 0.0);
	EntFire("game_text_3", "SetText", "Are they trying to kill us?", 0.0);
	EntFire("game_text_4", "SetText", "", 0.0);
	EntFire("game_text_*", "Display", "", 0.2);

	EntFire("game_text_1", "SetText", "Nakamura Yuri :", 5.0);
	EntFire("game_text_2", "SetText", "It's because there are zombies", 5.0);
	EntFire("game_text_3", "SetText", "That's why the traps are activated", 5.0);
	EntFire("game_text_4", "SetText", "Everyone, beware of traps!", 5.0);
	EntFire("game_text_*", "Display", "", 5.2);
}

function overlays_7()
{
	EntFire("tongxun_s", "PlaySound", "", 0.0);
	EntFire("overlays_yy_s", "StartOverlays", "", 0.0);
	EntFire("overlays_yy_s", "StopOverlays", "", 4.0);
	EntFire("overlays_yy_e", "StartOverlays", "", 4.0);
	EntFire("overlays_yy_e", "StopOverlays", "", 4.3);
	EntFire("tongxun_e", "PlaySound", "", 4.2);

	EntFire("tongxun_s", "PlaySound", "", 5.0);
	EntFire("overlays_ylz_s", "StartOverlays", "", 5.0);
	EntFire("overlays_ylz_s", "StopOverlays", "", 10.0);
	EntFire("overlays_ylz_e", "StartOverlays", "", 10.0);
	EntFire("overlays_ylz_e", "StopOverlays", "", 10.3);
	EntFire("tongxun_e", "PlaySound", "", 10.2);
}

function SetText_8()
{
	EntFire("game_text_1", "SetText", "Yusa :", 0.0);
	EntFire("game_text_2", "SetText", "Rock wall breaks in 15s", 0.0);
	EntFire("game_text_3", "SetText", "There might be a trap!", 0.0);
	EntFire("game_text_4", "SetText", "", 0.0);
	EntFire("game_text_*", "Display", "", 0.2);

	EntFire("game_text_1", "SetText", "Yuri :", 17.0);
	EntFire("game_text_2", "SetText", "Everyone stay and defend!", 17.0);
	EntFire("game_text_3", "SetText", "Do not retreat!", 17.0);
	EntFire("game_text_4", "SetText", "", 17.0);
	EntFire("game_text_*", "Display", "", 17.2);
}

function overlays_8()
{
	EntFire("tongxun_s", "PlaySound", "", 0.0);
	EntFire("overlays_yz_s", "StartOverlays", "", 0.0);
	EntFire("overlays_yz_s", "StopOverlays", "", 5.0);
	EntFire("overlays_yz_e", "StartOverlays", "", 5.0);
	EntFire("overlays_yz_e", "StopOverlays", "", 5.3);
	EntFire("tongxun_e", "PlaySound", "", 5.2);

	EntFire("tongxun_s", "PlaySound", "", 17.0);
	EntFire("overlays_ylz_s", "StartOverlays", "", 17.0);
	EntFire("overlays_ylz_s", "StopOverlays", "", 21.0);
	EntFire("overlays_ylz_e", "StartOverlays", "", 21.0);
	EntFire("overlays_ylz_e", "StopOverlays", "", 21.3);
	EntFire("tongxun_e", "PlaySound", "", 21.2);
}

function SetText_9()
{
	EntFire("game_text_1", "SetText", "Yusa :", 0.0);
	EntFire("game_text_2", "SetText", "C4 explodes in 15s", 0.0);
	EntFire("game_text_3", "SetText", "Watch out! The rock is a trap!", 0.0);
	EntFire("game_text_4", "SetText", "Run!", 0.0);
	EntFire("game_text_*", "Display", "", 0.2);
}

function overlays_9() {
	EntFire("tongxun_s", "PlaySound", "", 0.0);
	EntFire("overlays_yz_s", "StartOverlays", "", 0.0);
	EntFire("overlays_yz_s", "StopOverlays", "", 5.0);
	EntFire("overlays_yz_e", "StartOverlays", "", 5.0);
	EntFire("overlays_yz_e", "StopOverlays", "", 5.3);
	EntFire("tongxun_e", "PlaySound", "", 5.2);
}

function SetText_10() {
	EntFire("game_text_1", "SetText", "Yusa :", 0.0);
	EntFire("game_text_2", "SetText", "Glass door closes in 5s", 0.0);
	EntFire("game_text_3", "SetText", "Beward of lasers from the shadow!", 0.0);
	EntFire("game_text_4", "SetText", "Lasers will cut you in half if you can't dodge!", 0.0);
	EntFire("game_text_*", "Display", "", 0.2);
}


function overlays_10() {
	EntFire("tongxun_s", "PlaySound", "", 0.0);
	EntFire("overlays_yz_s", "StartOverlays", "", 0.0);
	EntFire("overlays_yz_s", "StopOverlays", "", 5.0);
	EntFire("overlays_yz_e", "StartOverlays", "", 5.0);
	EntFire("overlays_yz_e", "StopOverlays", "", 5.3);
	EntFire("tongxun_e", "PlaySound", "", 5.2);
}

function SetText_11() {
	EntFire("game_text_1", "SetText", "Yusa :", 0.0);
	EntFire("game_text_2", "SetText", "Rock wall breaks in 25s", 0.0);
	EntFire("game_text_3", "SetText", "Watch out! The cieling is falling!", 0.0);
	EntFire("game_test_4", "SetText", "Run when the door opens or you'll get crushed!", 0.0);
	EntFire("game_text_*", "Display", "", 0.2);

	EntFire("game_text_1", "SetText", "Yusa :", 40.0);
	EntFire("game_text_2", "SetText", "Beawre of the floor tiles!", 40.0);
	EntFire("game_text_3", "SetText", "If I remember, the floor breaks!", 40.0);
	EntFire("game_text_4", "SetText", "Hug the pillars and the walls!", 40.0);
	EntFire("game_text_*", "Display", "", 40.2);
}

function overlays_11() {
	EntFire("tongxun_s", "PlaySound", "" , 0.0);
	EntFire("overlays_yz_s", "StartOverlays", "", 0.0);
	EntFire("overlays_yz_s", "StopOverlays", "", 5.0);
	EntFire("overlays_yz_e", "StartOverlays", "", 5.0);
	EntFire("overlays_yz_e", "StopOverlays", "", 5.3);
	EntFire("tongxun_e", "PlaySound", "", 5.2);

	EntFire("tongxun_s", "PlaySound", "", 40.0);
	EntFire("overlays_yz_s", "StartOverlays", "", 40.0);
	EntFire("overlays_yz_s", "StopOverlays", "", 44.0);
	EntFire("overlays_yz_e", "StartOverlays", "", 44.0);
	EntFire("overlays_yz_e", "StopOverlays", "", 44.3);
	EntFire("tongxun_e", "PlaySound", "", 44.2);
}

function SetText_12() {
	EntFire("game_text_1", "SetText", "Yusa :", 3.0);
	EntFire("game_text_2", "SetText", "There's water below...", 3.0);
	EntFire("game_text_3", "SetText", "Sorry... but idk how to swim...", 3.0);
	EntFire("game_text_4", "SetText", "*bubbling noises*", 3.0);
	EntFire("game_text_*", "Display", "", 3.2);

	EntFire("game_text_1", "SetText", "Yui :", 9.0);
	EntFire("game_text_2", "SetText", "Ah! Yusa!", 9.0);
	EntFire("game_text_3", "SetText", "<< Yusa was swept away by the water... >>", 9.0);
	EntFire("game_text_4", "SetText", "<< We've lost all traces of Yusa... >>", 9.0);
	EntFire("game_text_*", "Display", "", 9.2);
}

function overlays_12() {
	EntFire("tongxun_s", "PlaySound", "", 3.0);
	EntFire("overlays_yz_s", "StartOverlays", "", 3.0);
	EntFire("overlays_yz_s", "StopOverlays", "", 8.0);
	EntFire("overlays_yz_e", "StartOverlays", "", 8.0);
	EntFire("overlays_yz_e", "StopOverlays", "", 8.3);
	EntFire("tongxun_e", "PlaySound", "", 8.2);

	EntFire("tongxun_s", "PlaySound", "", 9.0);
	EntFire("overlays_yy_s", "StartOverlays", "", 9.0);
	EntFire("overlays_yy_s", "StopOverlays", "", 14.0);
	EntFire("overlays_yy_e", "StartOverlays", "", 14.0);
	EntFire("overlays_yy_e", "StopOverlays", "", 14.3);
	EntFire("tongxun_e", "PlaySound", "", 14.2);
}

function SetText_13() {
	EntFire("game_text_1", "SetText", "Yuri :", 0.0);
	EntFire("game_text_2", "SetText", "Watch out!", 0.0);
	EntFire("game_text_3", "SetText", "Beward of the fans by the side!", 0.0);
	EntFire("game_text_4", "SetText", "We're almost there! Let's go!", 0.0);
	EntFire("game_text_*", "Display", "", 0.2);
}


function overlays_13() {
	EntFire("tongxun_s", "PlaySound", "", 0.0);
	EntFire("overlays_ylz_s", "StartOverlays", "", 0.0);
	EntFire("overlays_ylz_s", "StopOverlays", "", 5.0);
	EntFire("overlays_ylz_e", "StartOverlays", "", 5.0);
	EntFire("overlays_ylz_e", "StopOverlays", "", 5.3);
	EntFire("tongxun_e", "PlaySound", "", 5.2);
}

function SetText_14() {
	EntFire("game_text_1", "SetText", "Charlie  :", 0.0);
	EntFire("game_text_2", "SetText", "Impressive how you bypassed all the traps to reach the guild.", 0.0);
	EntFire("game_text_3", "SetText", "I'm Charlie, the Guild's manager. Defend for 30s more", 0.0);
	EntFire("game_text_4", "SetText", "Leave the remaining zombies to me and my secret weapon", 0.0);
	EntFire("game_text_*", "Display", "", 0.2);

	EntFire("game_text_1", "SetText", "Yuri :", 6.0);
	EntFire("game_text_2", "SetText", "Secret weapon?", 6.0);
	EntFire("game_test_3", "SetText", "What did you make this time?", 6.0);
	EntFire("game_text_4", "SetText", "", 6.0);
	EntFire("game_text_*", "Display", "", 6.2);

	EntFire("game_text_1", "SetText", "Charlie :", 10.0);
	EntFire("game_text_2", "SetText", "I created a tank! Am I awesome?!", 10.0);
	EntFire("game_text_3", "SetText", "", 10.0);
	EntFire("game_text_4", "SetText", "", 10.0);
	EntFire("game_text_*", "Display", "", 10.2);

	EntFire("game_text_1", "SetText", "Yuri :", 14.0);
	EntFire("game_text_2", "SetText", "A tank?", 14.0);
	EntFire("game_text_3", "SetText", "You managed to create such a weapon?!!", 14.0);
	EntFire("Game_text_4", "SetText", "That's incredible!", 14.0);
	EntFire("game_text_*", "Display", "", 14.2);

	EntFire("game_text_1", "SetText", "Charlie :", 19.0);
	EntFire("game_text_2", "SetText", "Of course! Do you not know who I am?", 19.0);
	EntFire("game_text_3", "SetText", "Prepare for a great show", 19.0);
	EntFire("game_text_4", "SetText", "", 19.0);
	EntFire("game_text_*", "Display", "", 19.2);

	EntFire("game_text_1", "SetText", "Charlie :", 25.0);
	EntFire("game_text_2", "SetText", "Everyone get in the bunker! Prepare for explosion!", 25.0);
	EntFire("game_text_3", "SetText", "3... 2... 1...", 25.0);
	EntFire("game_text_4", "SetText", "What?!! It blew up? I guess I'm not so awesome after all...", 25.0);
	EntFire("game_text_1", "Display", "", 25.2);
	EntFire("game_text_2", "Display", "", 25.2);
	EntFire("game_text_3", "Display", "", 30.2);
	EntFire("game_text_4", "Display", "", 33.2);

	EntFire("game_text_1", "SetText", "Yuri :", 36.0);
	EntFire("game_text_2", "SetText", "Idiot! If you can't build then don't test it!", 36.0);
	EntFire("game_text_3", "SetText", "Everyone get in the elevator! We're blowing the Guild up", 36.0);
	EntFire("game_text_4", "SetText", "Let's put these zombies to rest forever...", 36.0);
	EntFire("game_text_*", "Display", "", 36.2);
}

function overlays_14() {
	EntFire("tongxun_s", "PlaySound", "", 0.0);
	EntFire("overlays_cl_s", "StartOverlays", "", 0.0);
	EntFire("overlays_cl_s", "StopOverlays", "", 5.0);
	EntFire("overlays_cl_e", "StartOverlays", "", 5.0);
	EntFire("overlays_cl_e", "StopOverlays", "", 5.3);
	EntFire("tongxun_e", "PlaySound", "", 5.2);

	EntFire("tongxun_s", "PlaySound", "", 6.0);
	EntFire("overlays_ylz_s", "StartOverlays", "", 6.0);
	EntFire("overlays_ylz_s", "StopOverlays", "", 9.0);
	EntFire("overlays_ylz_e", "StartOverlays", "", 9.0);
	EntFire("overlays_ylz_e", "StopOverlays", "", 9.3);
	EntFire("tongxun_e", "PlaySound", "", 9.2);

	EntFire("tongxun_s", "PlaySound", "", 10.0);
	EntFire("overlays_cl_s", "StartOverlays", "", 10.0);
	EntFire("overlays_cl_s", "StopOverlays", "", 13.0);
	EntFire("overlays_cl_e", "StartOverlays", "", 13.0);
	EntFire("overlays_cl_e", "StopOverlays", "", 13.3);
	EntFire("tongxun_e", "PlaySound", "", 13.2);

	EntFire("tongxun_s", "PlaySound", "", 14.0);
	EntFire("overlays_ylz_s", "StartOverlays", "", 14.0);
	EntFire("overlays_ylz_s", "StopOverlays", "", 18.0);
	EntFire("overlays_ylz_e", "StartOverlays", "", 18.0);
	EntFire("overlays_ylz_e", "StopOverlays", "", 18.3);
	EntFire("tongxun_e", "PlaySound", "", 18.2);

	EntFire("tongxun_s", "PlaySound", "", 19.0);
	EntFire("overlays_cl_s", "StartOverlays", "", 19.0);
	EntFire("overlays_cl_s", "StopOverlays", "", 24.0);
	EntFire("overlays_cl_e", "StartOverlays", "", 24.0);
	EntFire("overlays_cl_e", "StopOverlays", "", 24.3);
	EntFire("tongxun_e", "PlaySound", "", 24.2);

	EntFire("tongxun_s", "PlaySound", "", 25.0);
	EntFire("overlays_cl_s", "StartOverlays", "", 25.0);
	EntFire("overlays_cl_s", "StopOverlays", "", 33.0);
	EntFire("overlays_cl_e", "StartOverlays", "", 33.0);
	EntFire("overlays_cl_e", "StopOverlays", "", 33.3);
	EntFire("tongxun_e", "PlaySound", "", 33.2);

	EntFire("tongxun_s", "PlaySound", "", 36.0);
	EntFire("overlays_ylz_s", "StartOverlays", "", 36.0);
	EntFire("overlays_ylz_s", "StopOverlays", "", 40.0);
	EntFire("overlays_ylz_e", "StartOverlays", "", 40.0);
	EntFire("overlays_ylz_e", "StopOverlays", "", 40.3);
	EntFire("tongxun_e", "PlaySound", "", 40.2);
}

mode <- null;

function mode() {
	mode = 0;
}

function Change_mode() {
	mode = (mode + 1) % 2;
}

function health() {
	if (mode == 0) {
		EntFire("health_trigger_mult", "Enable", "", 0.2);
		EntFire("health_trigger_mult", "Disable", "", 8.0);
	}

	if (mode == 1) {
		EntFire("health_D_mode_maker", "ForceSpawn", "",0.2);
	}
}

function set_health_mes() {
	if (mode == 0) {
		EntFire("health_text", "SetText", "Current Mode: Normal Heal \nLook up and press E to change modes \nAbility: Heal your teammates \nCooldown: 60s", 0.0);
	}

	if (mode == 1) {
		EntFire("health_text", "SetText", "Current Mode: Poison \nLook up and press E to change modes \nAbility: Poisons zombies within an area \nCooldown: 60s", 0.0);
	}
}
