// BRIEFING - AIR ///////////////////////////////////////////////////////////////////////////
//
// This is the briefing that players will get if they meet the conditions in initplayerlocal. The intent is to have all the important information about their asset to hand if platcom asks how much ammo they have or something along those lines.
//
// The full briefing has been collapsed onto one page for ease of readability. As a bonus, it also has nifty coloured headings!
// The <br/> is the new line command, basically just a carriage return to make it more readable. If you want extra space, that's how you do it.
// If you don't want to list the weather or don't have special rules, just delete that block. Just make sure to not delete the "]]; at the end or the script will break.
// The method for changing font colour is illustrated below, its just using standard hex colour codes you can get out of photoshop or something similar. The colours used below are just examples, make them neon pink and green if you want.
// If you want clickable links, its more or less HTML links, the following will create a clickable link on the words Town Name to the location of a marker with the name Marker_Town_Name: <marker name='Marker_Town_Name'>Town Name</marker>.
//
/////////////////////////////////////////////////////////////////////////////////////////////

player createDiaryRecord["Diary", ["Air Notes", "<font color='#eb9cff'>Platform</font color><br/>List the airframe here.<br/><br/>

<font color='#8547d6'>Loadout</font color><br/><br/>

List the weapon loadout and amount of ammo for each weapon.<br/><br/>

<font color='#55a255'>Resupply</font color><br/>
Say if there is resupply and where it is.<br/><br/>

<font color='#ffa200'>AA Defences</font color><br/>
List known AA threats (though you don't have to tell them all of them, surprises can be fun!).<br/><br/>

<font color='#98ffae'>Notes</font color><br/>
If there are any special rules like 'Don't blow up this building because it has the intel in it' then list them here."]];