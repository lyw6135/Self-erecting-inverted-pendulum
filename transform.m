A=[0 1 0 2 3];
B=[0 1 0 2 3];
C=[0 1 0 2 3];
D=[1 1 1 1 1];
function newp= transform(theta,A,B,C)
    t=[cos(theta) -sin(theta) 0 0; 
        sin(theta) cos(theta) 0 0;
        0 0 1 0;
        0 0 0 1];
    points = [A;B;C;D];
    newp = t*points;
end

    