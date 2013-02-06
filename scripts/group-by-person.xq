<mentions_in_press>{
for $record in //record
for $person in $record/persons/name

group by $person
return <press_mention><fullname>{$person}</fullname><year>{$record/Vuosi}</year></press_mention>
}</mentions_in_press>