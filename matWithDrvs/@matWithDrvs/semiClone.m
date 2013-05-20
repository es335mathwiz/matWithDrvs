function theRes=semiClone(mwdA)
theRes=matWithDrvs;
theRes.theVarNames=mwdA.theVarNames;
theRes.numVars=mwdA.numVars;
theRes.secDrvs=mwdA.secDrvs;
[noRows,noCols]=size(getTheMat(mwdA));
theRes.theMat=sparse(noRows,noCols);
[theRes.theMatDrv01,theRes.theMatDrv02]=...
zeroDrvMats(noRows,noCols,mwdA.numVars,mwdA.secDrvs);
