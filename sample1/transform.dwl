%dw 2.0
output application/json
type formattedDateTime = String {format: "M/dd/yyyy K:mm:ss a"}
var columnNames = payload.columnNames
var rows = payload.rows
---
rows map ((item, index) -> {(item map(()->
if(columnNames[$$] == "DateCreated")((columnNames[$$]): $[1 to -2] as LocalDateTime {format:"yyyy-MM-dd H:mm:ss"} as formattedDateTime)
else ((columnNames[$$]): $)
))} )



//here I have mapped the columnNames to rows with the help of if-else condition and map operator formated the dateand time as per the requested output 