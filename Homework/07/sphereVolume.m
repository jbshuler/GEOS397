<<<<<<< HEAD
function V=sphereVolume(r);
V=(4/3)*pi*r.^3;
=======
function V=sphereVolume(r)
V=(4/3)*pi*r.^3
>>>>>>> origin/GEOS_Shuler

if r==0
    error('Error. r cannot equal zero.')
end
if r<0
    error('Error. r cannot be a negative value.')
end

end