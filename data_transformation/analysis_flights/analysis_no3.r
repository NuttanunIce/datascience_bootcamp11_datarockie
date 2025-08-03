## คำถามที่ 3. ผลกระทบของสายการบิน (carrier) ที่มีผลต่อการเลือกโดยสารของลูกค้า (เครื่องบิน delay)

delay_impact <- flights %>%
  select(carrier,dep_delay,arr_delay) %>% 
  group_by(carrier) %>%
  summarise(avg_dep_delay = mean(dep_delay, na.rm = TRUE),
            avg_arr_delay = mean(arr_delay, na.rm = TRUE),
            count = n()) %>%
  arrange(desc(avg_arr_delay)) %>%
  filter(avg_arr_delay >= 0) ##  filter ไฟล์ที่ถึงจุดหมายเลท

delay_impact

## วาดกราฟดู
ggplot(data = delay_impact,
       mapping = aes(carrier, avg_dep_delay)) +
  geom_col(fill = "Red",
           alpha = 0.5) + 
  labs(title = "Avearge arrive time delay with carrier",
       x = "Carrier",
       y = "Avearge arrive time delay (min)",
       caption = "Using library(nycflights23) for analyst") +
  theme_minimal()

## Ans สายการบินของ flight F9 มาเลทที่สุด >> ลูกค้าต้องรอนานกว่าสายการบินอื่น ๆ ส่งผลให้ในอนาคตอาจทำให้คนมาใช้บริการลดลง
