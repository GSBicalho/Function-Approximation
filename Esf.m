function Esf
    First      = [-1.1 -1.1 -1.1 -1.1];
    Last       = [ 1.1  1.1  1.1  1.1];
    Division   = [ 5    5    5    5  ];
    FirstPoint = [ 0    0    0    1  ];
    
    %Approximating using the MarchingSimplex method
    MarchingSimplex(4, 1, First, Last, Division, @esfera4, 'esfera4.pol');
    
    %Approximating using the ContinuationSimplex method
    ContinuationSimplex(4, 1, First, Last, Division, FirstPoint, @esfera4, 'esfera4_cont.pol');
    
    return 

    function [f] = esfera2(n,v) 
      f(1) = v(1)*v(1) + v(2)*v(2) - 1;
      return
    end 

    function [f] = esfera3(n,v) 
      f(1) = v(1)*v(1) + v(2)*v(2) + v(3)*v(3) - 1;
      return
    end 

    function [f] = esfera4(n,v) 
      f(1) = v(1)*v(1) + v(2)*v(2) + v(3)*v(3) + v(4)*v(4) - 1;
      return
    end 

    function [f] = esfera5(n,v) 
      f(1) = v(1)*v(1) + v(2)*v(2) + v(3)*v(3) + v(4)*v(4) + v(5)*v(5) - 1;
      return
    end 

    function [f] = kleinBottle(n,v) 
      R = 1;
      P = 0.8;
      
      theta = v(1);
      ve = v(2);
      weird_e = 0.08;
      
      f(1) = R * (cos(theta/2) * cos(ve) - sin(theta/2) * sin(2*ve)) - v(3);
      f(2) = R * (sin(theta/2) * cos(ve) + cos(theta/2) * sin(2*ve)) - v(4);
      f(3) = P * cos(theta) * (1 + weird_e * sin(ve)) - v(5);
      f(4) = P * sin(theta) * (1 + weird_e * sin(ve)) - v(6);
    end
    
    function [f] = flat_torus(n,params) 

      v = params(1);
      u = params(2);
      
      x = (sin(v/2) + 0.1) * cos(u);
      y = (sin(v/2) + 0.1) * sin(u);
      z = sin(v);
      w = cos(v);
      
      f(1) = x - params(3);
      f(2) = y - params(4);
      f(3) = z - params(5);
      f(4) = w - params(6);
      
    end

 end 