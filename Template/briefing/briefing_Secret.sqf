// BRIEFING - SECRET ////////////////////////////////////////////////////////////////////////
//
// This is the briefing designed just for you! It's intended to let you make notes on things you might need reminding of mid mission. I mostly made it to help with the ADHD but other people might find it handy too.
//
// The full briefing has been collapsed onto one page for ease of readability. As a bonus, it also has nifty coloured headings!
// The <br/> is the new line command, basically just a carriage return to make it more readable. If you want extra space, that's how you do it.
// If you don't want to list the weather or don't have special rules, just delete that block. Just make sure to not delete the "]]; at the end or the script will break.
// The method for changing font colour is illustrated below, its just using standard hex colour codes you can get out of photoshop or something similar. The colours used below are just examples, make them neon pink and green if you want.
// If you want clickable links, its more or less HTML links, the following will create a clickable link on the words Town Name to the location of a marker with the name Marker_Town_Name: <marker name='Marker_Town_Name'>Town Name</marker>.
//
/////////////////////////////////////////////////////////////////////////////////////////////

player createDiaryRecord["Diary", ["Zeus Notes", "<font color='#8547d6'>OPFOR</font color><br/>A place to remind yourself of exactly what units you're using. Remembering that you're fighting russians is good, being able to look it up and see you're fighting russians with EMR is better<br/><br/>

<font color='#98ffae'>Flow</font color><br/>
This is to remind yourself of key points of the mission flow if that's something you might want reminders of. Things like 'When they get to this town, that's when I send the tank at them'.<br/><br/>

<font color='#ffc13c'>Respawns</font color><br/>If there's anything special about respawns like needing to set up a TP pole or something, this is where you make a note of it."]];