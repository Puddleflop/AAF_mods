// BRIEFING - GENERAL ///////////////////////////////////////////////////////////////////////
//
// This is the general briefing that every player will get by default. 
//
// The full briefing has been collapsed onto one page for ease of readability. As a bonus, it also has nifty coloured headings!
// The <br/> is the new line command, basically just a carriage return to make it more readable. If you want extra space, that's how you do it.
// If you don't want to list the weather or don't have special rules, just delete that block. Just make sure to not delete the "]]; at the end or the script will break.
// The method for changing font colour is illustrated below, its just using standard hex colour codes you can get out of photoshop or something similar. The colours used below are just examples, make them neon pink and green if you want.
// If you want clickable links, its more or less HTML links, the following will create a clickable link on the words Town Name to the location of a marker with the name Marker_Town_Name: <marker name='Marker_Town_Name'>Town Name</marker>.
//
/////////////////////////////////////////////////////////////////////////////////////////////

player createDiaryRecord["Diary", ["Mission", "<font color='#8547d6'>Situation</font color><br/>
MISSION SITUATION GOES HERE.<br/><br/>

<font color='#00a8c1'>Mission</font color><br/>
MISSION INFORMATION GOES HERE.<br/><br/>

<font color='#ffa200'>Time And Weather</font color><br/>
TIME AND WEATHER INFORMATION GOES HERE.<br/><br/>

<font color='#eb9cff'>Civilian Presence</font color><br/>
CIVILIAN PRESENCE INFORMATION GOES HERE.<br/><br/>

<font color='#98ffae'>Rules</font color><br/>
INFORMATION ON ANY SPECIAL RULES GOES HERE.<br/><br/>

<font color='#ffc13c'>Respawns</font color><br/>
DESCRIBE METHODS AND RESTRICTIONS ON REINSERTS."]];