function bin = Dec2Bin(in)

%Add exception for integer inputs:
if in == 0 || isinteger(in) == 1 
    bin = ['0' '.' char(dec2bin(in,16))];
    return
end

decpart = dec2bin(floor(in));
in = in-floor(in);
n = -1;
floatpart = [];

while in~=0 || in>eps
    if in - 2^n < 0 
        floatpart = [floatpart '0'];
    else
        floatpart = [floatpart '1'];
        in = in - 2^n;
    end
    n = n - 1;
end

bin = [decpart '.' floatpart(1:16)];


