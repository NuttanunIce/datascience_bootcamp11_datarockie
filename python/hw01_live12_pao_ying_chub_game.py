from random import choice # ต้อง import ก่อน ถึงจะใช้ function random ค่าใน list ได้

def game():
    #introduction
    print("Welcome to Pao Ying Chub game")
    name = input("Please tell your name: ")

    #set parameter ของเราก่อนเข้า loop
    com_score = 0
    user_score = 0
    draw = 0
    round_num = 1 # ให้ครั้งแรกที่เล่น นับเป็นรอบ 1 เลย

    # condition
    while True: # ให้วน loop จนกว่าจะเป็น False
        print(f"Start round {round_num}")

        user_choose = f"{name}, Please choose paper, scissors, hammer or quit'" # รับ input จาก user มาก่อนที่จะเข้าเงื่อนไข
        user_hand = input(user_choose).strip().lower() #ให้ผู้เล่นสามารถพิมพ์ตัวพิมพ์ใหญ่/เล็กก็ได้ เพราะทุกค่าที่ user พิมพ์มา เราจะตัดช่องว่างด้วย strip() และเปลี่ยนให้เป็นพิมพ์เล็กด้วย lower()

        # check syntax error and quit เช็คก่อนที่จะเข้าเงื่อนไขว่าใครแพ้ ใครชนะ
        # input syntax error
        if user_hand not in ("paper", "scissors", "hammer", "quit"):
            print("You filled wrong answer, please choose again")
            continue # ให้เริ่มวน loop ใหม่เลย >> มารอ input ใหม่
        
        # quit
        elif user_hand == "quit":
            round_num -= 1 # ถ้าจะออกจากเกมให้จำนวนรอบ - 1 ด้วย เพราะค่าตั้งต้นเราตั้งเป็น 1
            break # ออกจาก loop เลย
        

        # check condition Pao Ying Chub ถ้า user ให้ค่า input ถูกต้อง ให้เริ่มเช็คเงื่อนไขว่าใครแพ้ ใครชนะ

        # เมื่อ user ใส่ input ถูก ให้คอมมันสุ่มค่า com_hand ขึ้นมา show
        com_hand = choice(["paper", "scissors", "hammer"])
        print(f"com choose: {com_hand}")

        # draw เช็คถ้าเสมอกัน
        if user_hand == com_hand:
            print("It's a tie")
            draw += 1
            round_num += 1

        # win ถ้า user ชนะ
        elif ((user_hand == "paper" and com_hand == "hammer") or
             (user_hand == "hammer" and com_hand == "scissors") or
             (user_hand == "scissors" and com_hand == "paper")):
             print(f"{name} win")
             user_score += 1
             round_num += 1

        # lose ถ้า user แพ้
        else:
            print(f"{name} lose")
            com_score += 1
            round_num += 1
            

    # summary score
    print(f"We played {round_num} rounds")
    print(f"{name} score: {user_score}")
    print(f"Com score: {com_score}")
    print(f"Draw: {draw}")

    # ใส่เงื่อนไขเพื่อสรุปผลคะแนนของ user และ com
    if user_score == com_score:
        return("It's a draw")
    elif user_score > com_score:
        return(f"{name} win!, Congratulations")
    else:
        return(f"{name} lose, Let's try the next game")
