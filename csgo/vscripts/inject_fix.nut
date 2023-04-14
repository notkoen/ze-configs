::injectfix_ent <- null;
function RunInjectFix(scriptent)
{
	if (::injectfix_ent == null || !::injectfix_ent.IsValid())
		::injectfix_ent = Entities.FindByName(null,scriptent);

	if (::injectfix_ent == null || !::injectfix_ent.IsValid())					// Just nullify all functions just in case
	{
		printl("RunInjectFix ERROR : manager not found - logic might break as a result!");
		::OnGameEvent_player_say_raw<-function(p){}
		::OnGameEvent_player_connect_raw<-function(p){}
		::OnGameEvent_player_disconnect_raw<-function(p){}
		::OnGameEvent_player_changename_raw<-function(p){}
		return;
	}

	::OnGameEvent_player_say_raw<-function(p){
		::injectfix_ent.GetScriptScope().OnPlayerChat(p.userid,p.text);}
	::OnGameEvent_player_connect_raw<-function(p){
		::injectfix_ent.GetScriptScope().OnPlayerConnect(p.name,p.userid,p.networkid);}
	::OnGameEvent_player_disconnect_raw<-function(p){
		::injectfix_ent.GetScriptScope().OnPlayerDisconnect(p.userid,p.reason,p.name,p.networkid);}
	::OnGameEvent_player_changename_raw<-function(p){
		::injectfix_ent.GetScriptScope().OnPlayerChangeName(p.userid,p.oldname,p.newname);}
}