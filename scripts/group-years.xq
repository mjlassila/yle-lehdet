<press_mentions_in_year>{
for $press_mention in //press_mention
let $years:=distinct-values($press_mention/year/Vuosi)
let $counts:= for $year in $years
              let $count:=count($press_mention/year/Vuosi[.=data($year)])
              order by $year
              return <year count='{$count}'>{$year}</year>
return <press_mention_per_year>
          <name>{$press_mention/fullname}</name>{
          for $count in $counts
            return $count
      }</press_mention_per_year>
    }</press_mentions_in_year>