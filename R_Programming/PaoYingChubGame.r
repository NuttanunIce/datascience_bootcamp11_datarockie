## Pao Ying Chub Game
## เกมนี้จะเล่นไปเรื่อย ๆ จนกว่าผู้เล่นจะออกจากเกม
## มีทักทายผู้เล่นเมื่อเข้าเกม และเมื่อออกจากเกมให้สรุปผลคะแนน (แพ้ ชนะ และเสมอ)

game <- function() {
  ## intro เพื่อคุยกับ user ก่อนเล่นเกม
  print("Welcome to Pao Ying Chub Game!!")
  name <- readline("Your name: ")
  print(paste("Hello",name))
  
  ## parameter ประกาศตัวแปร
  com_choose <- c("paper", "scissors", "hammer")
  your_score <- 0
  com_score <- 0
  we_draw <- 0
  round <- 1
  
  # while(TRUE) is infinite loop จะทำไปเรื่อย ๆ จนกว่าจะ FALSE ถึงออกจาก loop
  while (TRUE) { 
    print(paste("Let's start the game round:",round))
    your_hand <- readline("Please choose one option 'paper, scissors, hammer or quit' : ") ## รับค่า input จาก user
    com_hand <- sample(com_choose,1) ## สุ่มค่าจาก vector ที่ชื่อ com_choose
    
    ## winner กรณีชนะ
    if ((your_hand == "paper" & com_hand == "hammer") |
            (your_hand == "scissors" & com_hand == "paper") |
            (your_hand == "hammer" & com_hand == "scissors")) {
             your_score <- your_score + 1 ## updated คะแนนของ user 1 แต้ม
             round <- round + 1 ## updated รอบการเล่น 1 ครั้ง
             message("You Win!") ## ใช้ meaasge เพื่อ print ค่าเป็นสีออกมา
             } 
    
    ## lose
    else if ((your_hand == "paper" & com_hand == "scissors") |
            (your_hand == "scissors" & com_hand == "hammer") |
            (your_hand == "hammer" & com_hand == "paper")) {
              com_score <- com_score + 1 ## updated คะแนนของ com_hand 1 แต้ม
              round <- round + 1 ## updated รอบการเล่น 1 ครั้ง
              message("You lose")
            } 
    
    ## draw
    else if (your_hand == com_hand) {
      we_draw <- we_draw + 1 ## updated ตัวแปรเก็บรอบที่เสมอกัน ไว้เพื่อรอสรุปหลังจบเกม แต่ไม่ต้อง updated คะแนนของ user, com_hand
      round <- round + 1 ## updated รอบการเล่น 1 ครั้ง
      message("Draw")
    } 
  
    ## quit กรณีจะออกจากเกม
    else if (your_hand == "quit") {
            round <- round - 1 ## ให้ลบรอบการเล่นเกมไป 1 ครั้ง เนื่องจากครั้งที่เราพิมพ์ quit คือเราไม่ได้เล่นเกม แต่เราจะออกจากเกมแล้ว / ถ้าไม่ (-1) ตอนสรุปมันจะนับค่ารอบนี้มารวมด้วย
            break # Exit the while loop
    }
    
    
    ## syntax error / wrong input value ถ้าเราพิมพ์ผิด
    else {
      message("Syntax error, Please choose option again")
      next # Skip the rest of this iteration of this loop and start new loop / ใส่เพื่อข้าม loop นี้ไป แล้วเริ่ม loop ใหม่เลย ไม่นับ loop นี้
      print(your_hand)
    }
    

    ## after finite if_else >> show summary in each round แสดงสรุปคะแนนของแต่ละรอบ
    print(paste(name,"hand:",your_hand, "| com hand:", com_hand))
    print(paste(name,"score:",your_score,"| com score:", com_score))
    
  }
  
  
  ## summary score เมื่อเล่นจบแล้วจะสรุปคะแนนทั้งหมด
  message("Thank you for join this game. I hope to play with you next time")
  print("Summary")
  print(paste("You were playing in",round,"round"))
  print(paste("Win:",your_score,"| Draw:",we_draw,"| Lose:",com_score))
  
  ## condition to print text after playing / เข้าเงื่อนไข if else เพื่อดูว่าชนะ แพ้ เสมอ เท่าไร และควร show ข้อความอะไรขึ้นมา
    if (com_score == your_score) {
      print("We are draw, Let's more dual next time")
    } else if (com_score > your_score) {
      print("Congratulation! You are winner")
    } else {
      print("You are lose, Let's try it again")
    }
  
}
