%brick = ConnectBrick("OSEER")
InitKeyboard;
speedForward = 40;
speedBackward = -50;
flag = true;
brick.SetColorMode(2, 2);

while flag

   distanceF = brick.UltrasonicDist(1);
   distanceL = brick.UltrasonicDist(3);

   if (distanceF > 30 && distanceL < 30) %case where front is open and left is closed
       goForwardBlock(brick);
       turnCount = 0;
       stop(brick);
   elseif (distanceF > 30 && distanceL > 30) %case where front is open and Left is open too
       if (turnCount == 1)
           stop(brick);
           goForwardBlock(brick);
           turnCount = 0;
           stop(brick);
       elseif (turnCount == 0)
           turnLeft(brick);
           turnCount = 1;
           stop(brick);
       end
   elseif (distanceF < 30 && distanceL > 30) %case where the front is closed but the Left is open
       stop(brick);
       turnLeft(brick);
       turnCount = 1;
       stop(brick);
   elseif (distanceF < 30 && distanceL < 30) %case where front is closed and left is closed too
       stop(brick);
       turnRight(brick);
       stop(brick);
       distanceF = brick.UltrasonicDist(1);
       distanceL = brick.UltrasonicDist(3);
       if (distanceF < 30 && distanceL < 30)
           stop(brick);
           turnRight(brick);
           stop(brick);
       elseif (distanceF > 30 && distanceL < 30)
           stop(brick);
           goForwardBlock(brick);
           turnCount = 0;
           stop(brick);
       elseif (distanceF < 30 && distanceL > 30)
           stop(brick);
           turnLeft(brick);
           turnCount = 1;
           stop(brick);
       end
   end

   checkColor(brick.ColorCode(2), brick)
   pause(0.05);
end

function stop(brick)
disp("Holding");
brick.MoveMotor('A', 0);
brick.MoveMotor('D', 0);
pause(1);
end

function stopRed(brick)
disp("Holding");
brick.MoveMotor('A', 0);
brick.MoveMotor('D', 0);
pause(4);
end

function goForwardBlock(brick)
disp("Moving block");
brick.MoveMotor('A', 40);
brick.MoveMotor('D', 40);
pause(4);
end

function turnRight(brick)
disp("Turning Right: ");
brick.MoveMotor('A', 100);
brick.MoveMotor('D', -100);
pause(0.4);
end
            
function turnLeft(brick)
disp("Turning Left");
brick.MoveMotor('A', -100);
brick.MoveMotor('D', 100);
pause(0.4);
end

function checkColor(color,brick)
if (color == 5)
    disp('Red Light');
    stopRed(brick);
elseif (color == 3)
    disp('Pickup');
    brick.StopMotor('AD');
    manualMode(brick);
elseif (color == 7)
    disp('drop off');
    brick.StopMotor('AD');
    manualMode(brick);
end
end

function manualMode(brick)
flag = true;
global key
while flag
    pause(0.1);
    switch key
        case 'uparrow' 
            disp('up')
        brick.MoveMotor('A', 20);
        brick.MoveMotor('D', 20); 

        case 'downarrow'
            disp('down')
        brick.MoveMotor('A', -100);
        brick.MoveMotor('D', -100); 
        case 'leftarrow'
            disp('left')
            brick.MoveMotor('A', -20);
            brick.MoveMotor('D', 20);

        case 'rightarrow'
            disp('right')
            brick.MoveMotor('A', 20);
            brick.MoveMotor('D', -20);
            

        case 0
            disp('no key')
            brick.StopMotor('A'); 
            brick.StopMotor('D'); 

        case 'q'
            flag = false;

        case 'a'
            disp('Claw goes down')
            brick.MoveMotor('B', 1);
        case 's'
            disp('Claw goes up')
            brick.MoveMotor('B', -20);
        case 'd'
            disp('victory')
            brick.MoveMotor('A', 100);
            brick.MoveMotor('D', -100);
    end
end
end