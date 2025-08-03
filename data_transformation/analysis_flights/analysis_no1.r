library(dplyr)
library(nycflights23)
?flights

library(ggplot2)

View(flights)
glimpse(flights)

## คำถาม 1. วัน และเวลา (hour) ไหนที่คนต้องการขึ้นเครื่องบินมากที่สุด

install.packages("lubridate") # ใช้จัดการกับเวลา และวันที่ได้ดีมาก ๆ
library(lubridate) ## powerful R package designed for working with dates and times.

?lubridate

flights_weekday <- flights %>%  #เปลี่ยน/สร้าง column
  mutate(
    hour = lubridate::hour(time_hour), #เปลี่ยน data ใน column time_hour จาก วันที่ เวลา เป็น ชั่วโมง เฉย ๆ ใน column hour
    week_day = lubridate::wday(time_hour, label = TRUE, week_start = 7) #เปลี่ยนจากตัวเลขของวันในสัปดาห์ (1,2,..) กำหนด lable = TRUE คือเป็นตัวอักษร (sunday, monday,..)
  ) # week_start = 7	คือกำหนดให้ วันเริ่มต้นของสัปดาห์คือวันอาทิตย์ (ปกติค่า default คือ 1 = วันจันทร์)

View(flights_weekday)
glimpse(flights_weekday)


flight_hour <- flights_weekday %>%
  select(flight,hour,minute,week_day) %>%
  group_by(week_day,hour) %>%
  summarise(n_flights = n()) %>%
  arrange(desc(n_flights))

flight_hour

ggplot(data = flight_hour,
       mapping = aes(hour, n_flights)) +
       geom_col(fill = "Lightblue") +
  theme_minimal() +
  labs(title = "Flights Quantity vs. Hour")
  
## Ans คนนิยมขึ้นเครื่องบินวันจันทร์ เวลา 9 โมง มากที่สุด รองลงมาเป็นวันศุกร์ และวันพฤหัส เวลา 9 โมง
