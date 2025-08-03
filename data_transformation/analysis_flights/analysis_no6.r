## คำถามที่ 6. What's the most route (origin, dest) that client like?

flights %>%
  group_by(carrier) %>%
  summarise(num_origin = n_distinct(origin),
            num_dest = n_distinct(dest),
            num_flight = n()) %>%
  arrange(desc(num_flight))

## Ans คนใช้บริการสายการบิน YX มากที่สุด เพราะจำนวนเที่ยวบินรวมกันเยอะที่สุด

## ------------------------------------------------------------------------------------------------------------------------------------------------------

## สายการบิน YX ผู้โดยสายนิยมใช้บริการรูทไหนมากที่สุด

flights %>%
  group_by(carrier, origin, dest) %>%
  summarise(num_flights = n(), 
            .groups = 'drop') %>%
  arrange(desc(num_flights))

## Ans คนใช้สายการบิน DL ในการไปเที่ยวรูท LGA to ATL มากที่สุด
