speedForward = 40;
speedBackward = -50;

brick.SetColorMode(2, 2);

while 1     
	    %Move Forward
	    brick.MoveMotor('A', speedForward);
	    brick.MoveMotor('D', speedForward);
	    
	    %Get Sensor Readings
	    color = brick.ColorCode(2);
        distancef = brick.UltrasonicDist(1);
        pause(0.1);
        distances = brick.UltrasonicDist(3);
        pause(0.1);
	    %Color Decisions
	    if color == 5 
            pause(0.1);
	        disp('red');
            brick.MoveMotor('A', 0);
            brick.MoveMotor('D', 0);
	        pause(4); 
	    elseif color == 2 || color == 3
	        disp('blue/green');
	        %run('kbrdcontrol');
            brick.StopAllMotors();
	        pause(6);
	    end 
	    
	    %Navigation
	    if distancef < 40 %if hit wall in front
            brick.StopMotor('AD', 'Brake');
            pause(1);
            distances = brick.UltrasonicDist(3);
            if distances < 40 %if there is a wall on the left
                turnRight(brick);
            else %if there is no wall on the left
                turnLeft(brick);
            end
        else   
        end
end 

function turnRight(brick)
disp("Turning Right: ");
brick.MoveMotor('A', 0);
brick.MoveMotor('D', 0);
brick.MoveMotor('A', 100);
pause(0.95);
brick.StopMotor('A', 'Brake');
end
                
function turnLeft(brick)
disp("Turning Left");
brick.MoveMotor('A', 0);
brick.MoveMotor('D', 0);
brick.MoveMotor('D', 100);
pause(0.95);
brick.StopMotor('AD', 'Brake');
end