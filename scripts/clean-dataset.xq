import module namespace functx = "http://www.functx.com"; 
for $record in //record
let $subjects:= tokenize(fn:normalize-space($record/Asiasanat), '; ')
for $subject in $subjects
    let $fullname_reversed:=$subject[contains(., ' ')]
    let $fullname_tokenized:=tokenize(lower-case($fullname_reversed), ' ')
    let $name:= <name>{string-join((functx:capitalize-first($fullname_tokenized[2]),functx:capitalize-first($fullname_tokenized[1])), ' ')}</name>
    let $to_print:= 
    if(string-length($name)>3)
    then <name>{data($name)}</name>
    else ()
return if (not(empty($to_print))) then
insert node $to_print into $record/persons
else()

    
