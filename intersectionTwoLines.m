function Pr = intersectionTwoLines(line1, line2)
            
    x1 = line1(1);
    y1 = line1(2);
    dx1 = line1(3) - x1;
    dy1 = line1(4) - y1;
            
    x2 = line2(1);
    y2 = line2(2);
    dx2 = line2(3) - x2;
    dy2 = line2(4) - y2;
            
    Pr(1) = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
    Pr(2) = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);


end

