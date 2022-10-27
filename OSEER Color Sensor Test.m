userInput = "y";
brick.SetColorMode(4, 2);
for color = brick.ColorCode(4)
    if color == 3 %Condition For color Green
        brick.MoveMotor('A',100);
        pause(0.5)
    elseif color == 5 %Condition For color Red
        brick.MoveMotor('D',100);
        pause(0.5)
    else %Condition if it detects nothing
        brick.MoveMotor('A',50);
        brick.MoveMotor('D',50);
        pause(0.5)
    end
    brick.StopAllMotors();
end