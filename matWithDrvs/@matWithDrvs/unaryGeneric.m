
function theGenericMwd=unaryGeneric(funcHandle,mwdA)
theGenericMwd=semiClone(mwdA);

theGenericMwd.theMat=funcHandle(getTheMat(mwdA));
if(theGenericMwd.numVars>0)
theGenericMwd.theMatDrv01=...
unaryGenericAll(funcHandle,getTheMatDrv01(mwdA),mwdA.numVars);
theGenericMwd.theMatDrv02=...
unaryGenericAll(funcHandle,getTheMatDrv02(mwdA),mwdA.secDrvs);
end

function theRes=unaryGenericAll(funcHandle,aDrvs,numItems)
theRes=cell(numItems);
for ii=1:numItems
theRes{ii}=funcHandle(aDrvs{ii});
end


