## เป็นการทำโจทย์ต่อจากข้อเมื่อกี้
## 2. In 2023, What are the top 3 months with the most flights?

top_month <- flights %>%
  group_by(month) %>%
  summarise(num_flight = n()) %>%
  arrange(desc(num_flight)) %>%
  head(3)

ggplot(data = top_month,
       mapping = aes(month,num_flight)) +
       geom_col(fill = "Salmon") +
  theme_minimal() +
  labs(title = "top 3 months of flights")

## Ans เดือนที่ 3, 5, และ 4 มีคนขึ้นเครื่องบินมากที่สุด
