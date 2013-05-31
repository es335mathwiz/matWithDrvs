function aMwd=setTheMatDrv01(aMwd,someCells)
if(~isa(someCells,'cell'))
error('setTheMatDrv01: must be cell array of matrices')
else
if(~(size(someCells,1)==aMwd.numVars))
error('setTheMatDrv01: wrong number of matrices')
else
aMwd.theMatDrv01=someCells;
end
end;