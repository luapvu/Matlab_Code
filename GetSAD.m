function iSAD = GetSAD(currentFrame, referenceFrame, y, x, iMVy, iMVx, iSAD0)

iSAD = 0;
for i=1:16
    for j=1:16
        iSAD = iSAD + abs(currentFrame(y+i,x+j) - referenceFrame(y+iMVy+i, x+iMVx+j));
        
        if iSAD > iSAD0
            return;
        end
    end
end

end