
function aMwd=setTheMatDrv02(aMwd,someCells)
if(~isa(someCells,'cell'))
    error('setTheMatDrv02: must be cell array of matrices')
else
if(~(size(someCells,1)==aMwd.numVars))
    error('setTheMatDrv02: wrong number of matrices')
else
aMwd.theMatDrv02=someCells;
end
end;
