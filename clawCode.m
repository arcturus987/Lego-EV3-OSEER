autoMode = true;
InitKeyboard();
global key

while autoMode
    pause(0.1);
    switch key
        case 'uparrow' 
            disp('up')
        brick.MoveMotor('A', 40);
        brick.MoveMotor('D', 40); 

        case 'downarrow'
            disp('down')
        brick.MoveMotor('A', -100);
        brick.MoveMotor('D', -100); 

        case 'leftarrow'
            disp('left')
            brick.MoveMotor('D', 60);

        case 'rightarrow'
            disp('right')
            brick.MoveMotor('A', 60);
            

        case 0
            disp('no key')
            brick.StopMotor('A'); 
            brick.StopMotor('D'); 

        case 'q'
            autoMode=false;

        case 'a'
            disp('Claw goes down')
            brick.MoveMotor('B', 1);
        case 's'
            disp('Claw goes up')
            brick.MoveMotor('B', -10);
    end
end