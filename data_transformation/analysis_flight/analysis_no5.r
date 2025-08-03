## คำถามที่ 5. หาว่า route ว่าคนชอบไปรูทไหนมากสุด

# จำนวนสถานีต้นทาง
flights_speed %>%
  select(origin, dest) %>%
  group_by(dest) %>%
  summarise(n())

# จำนวนจุดหมาย
flights_speed %>%
  select(origin, dest) %>%
  group_by(dest) %>%
  summarise(n())


most_route <- flights_speed %>%
  select(origin, dest) %>%
  group_by(origin, dest) %>%
  summarise(count_route = n()) %>%
  arrange(desc(count_route))


## Ans คนชอบไปเที่ยวรูทที่ออกจาก JFK to LAX มา

## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------

## หาเพิ่มว่า คนที่ชอบไป รูทที่ออกจาก JFK to LAX กับสายการบินอะไรมากสุด


flights_speed %>%
  select(carrier, origin, dest) %>%
  group_by(carrier, origin, dest) %>%
  filter(origin == "JFK", dest == "LAX") %>%
  summarise(num_JFK_to_LAX = n()) %>%
  arrange(desc(num_JFK_to_LAX))

## Ans คนชอบไปเที่ยวรูทที่ออกจาก JFK to LAX มากที่สุด และ นิยมไปกับสายการบิน B6 มากที่สุด รองลงมาเป็น AA และ DL ตามลำดับ

