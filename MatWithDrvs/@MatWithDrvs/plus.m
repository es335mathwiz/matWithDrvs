function sumMwd=plus(mwdA,mwdB)
[mwdA,mwdB]=promoteDouble(mwdA,mwdB);
if(sameVars(mwdA,mwdB))
sumMwd=semiClone(mwdA);
sumMwd.theMat=getTheMat(mwdA)+getTheMat(mwdB);
sumMwd.theMatDrv01=...
sumAll(getTheMatDrv01(mwdA),getTheMatDrv01(mwdB),mwdA.numVars);
sumMwd.theMatDrv02=...
sumAll(getTheMatDrv02(mwdA),getTheMatDrv02(mwdB),mwdA.secDrvs);
else
error('matWithDrvs.plus: A+B with different numVars')
end

function theSum=sumAll(aDrvs,bDrvs,numItems)
theSum=cellArray(numItems);
for ii=1:numItems
    theSum{ii}=aDrvs{ii}+bDrvs{ii};
end
