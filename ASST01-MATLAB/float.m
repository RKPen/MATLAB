function x=float(b,e,p)
    x=[];
    eps=b^(-p);
    emin=1 - (2^(e-1) - 1);
    emax=2^(e-1);
    max=1-eps;
    for i=1:p
        max= max + b^(-i);
    end
    for e=emin:emax
        for i=0:eps:max
            y= b^e * (1 + i);
            x=[x , y];
        end
    end
    x=[0 x];
end
