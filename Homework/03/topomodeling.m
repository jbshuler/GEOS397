function z_t = topomodeling(z, kappa, dt, dx, tMax, t0, nNode)
zNew = zeros (nNode,tMax);
zNew(:,1) = z;
for it=t0+dt:dt:tMax;
    for ix=2:nNode-1;
    zNew(ix,it)=dt*kappa* ((zNew(ix+1,it-1) - 2*(zNew(ix,it-1)) + zNew(ix-1,it-1))/(dx^2)) + zNew(ix,it-1);
    end
end
z_t = zNew(:,tMax)