## คำถามที่ 4. วิเคราะห์การใช้น้ำมันในการบิน และ route ในการเดินทางว่าผู้โดยสารนิยมใช้เส้นทางไหนในการบินมากที่สุด
## เราจะแบ่งเป็นการเทียบความเร็วที่เครื่องบินใช้ โดยเทียบจากสายการบิน และรูทการบิน

## 4.1 เทียบจากสายการบิน
## speed (miles/hr) >> v=s/t
flights_speed <- flights %>%
  mutate(speed = distance/(air_time/60)) ## change min >> hour

graph_speed <- ggplot(flights_speed,
       mapping = aes(distance, air_time)) +
  geom_smooth(method = "loess")


## carrier vs speed
flights_speed %>%
  select(carrier, distance, speed, air_time) %>%
  group_by(carrier) %>%
  summarise(avg_speed = mean(speed, na.rm = TRUE)) %>%
  arrange(desc(avg_speed))

##  Ans สายการบิน HA มีความเร็วเฉลี่ยมากที่สุด หรือบินเร็วสุด = ใช้เวลาน้อยที่สุด ทำให้ลูกค้าอาจจะมาใช้บริการของสายการบินนี้เยอะเพราะข้อดีตรงนี้ แต่ยังไงก็ตามสายการบินนี้ยังต้องปรับปรุงเรื่องการ delay ของเครื่องบินอยู่ เพราะมีการ delay มากสุดเป็นอันดับแรก [จากข้อมูลจากข้อที่แล้ว]

## ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## 4.2 เทียบเป็นรูทการบิน
## หาว่ารูทไหนใช้เชื้อเพลิงน้อยสุด

## origin & dest
route_flight <- flights_speed %>%
  select(origin, dest, speed) %>%
  group_by(origin, dest) %>%
  summarise(avg_route_speed = mean(speed, na.rm = TRUE)) %>%
  arrange(desc(avg_route_speed))

route_flight

## Ans route ที่บินจาก JFK to STT ใช้ความเร็ว (speed) เฉลี่ยมากที่สุด อาจจะอนุมานได้ว่าไฟท์นี้น่าจะใช้เชื้อเพลิงน้อยที่สุด (ถ้าเราขอ assume ให้ทุกเครื่องบินมีอัตราการเผาผลาญน้ำมันเท่ากันหมด)
