function [ newp2 ] = trans2( theta2,L1,L2,A2,B2,C2,D2 )
      t2=[cos(theta2) -sin(theta2) 0 0; 
          0 0 -1 (L1+L2);
          sin(theta2) cos(theta2) 0 0;
          0 0 0 1];
        points2 = [A2;B2;C2;D2];
        newp2 = t2* points2;  
end

