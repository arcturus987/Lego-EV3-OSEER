userInput = "y";
while userInput=="y"
    x = input("Enter car movement : ",'s'); %This section is for the inputs
    if x == "4"
        brick.MoveMotor('C',100);
        pause(0.6);
        brick.StopAllMotors();
    elseif x == "6"
        brick.MoveMotor('A',100);
        pause(0.6);
        brick.StopAllMotors();    
    elseif x == "8"
        brick.MoveMotor('C',100);
        brick.MoveMotor('A',100);
        pause(3)
    elseif x == "2"
        brick.MoveMotor('C',-100);
        brick.MoveMotor('A',-100);
        pause(3)
    else
        disp("Enter valid statement"); %For inputs other than specified ones
    end
    brick.StopAllMotors()
    userInput = input("Continue : (y/n)",'s'); %Continuation of the session
end
userInput = "n";
