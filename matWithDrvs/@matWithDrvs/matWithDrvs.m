function mwd=matWithDrvs(varargin)
% matWithDrvs() -> an empty matrix for ``0th'' derivative and empty
% cell arrays for variable names and derivative matrices.
%
% matWithDrvs(M) -> matrix M for ``0th'' derivative and empty
% cell arrays for variable names and derivative matrices.
%
% matWithDrvs(M,{var1,...,varn}) -> matrix M for ``0th'' derivative 
% {var1,...,varn} for cell arrays for variable names and the
% corresponding number of conformable derivative matrices set to zero.
%
% matWithDrvs(M,{var1,...,varn}) -> matrix M for ``0th'' derivative 
% {var1,...,varn} for cell arrays for variable names and the
% corresponding number of conformable derivative matrices set to zero.
%
% matWithDrvs(M,{var1,...,varn},{Mdvar1,...,Mdvarn}) -> matrix M for ``0th'' derivative 
% {var1,...,varn} for cell arrays for variable names the ``1st'' derivative
% cell arrays set to {Mdvar1,...,Mdvarn} and the
% corresponding number of ``2nd'' order 
% conformable derivative matrices set to zero.
%
% matWithDrvs(M,{var1,...,varn},{Mdvar1,...,Mdvarn},{Mdvar1dvar1,Mdvar1dvar2,...,Mdvarndvarn}) -> matrix M for ``0th'' derivative 
% {var1,...,varn} for cell arrays for variable names the ``1st'' derivative
% cell arrays set to {Mdvar1,...,Mdvarn} and the
% corresponding number of ``2nd'' order 
% conformable derivative matrices set to {Mdvar1dvar1,Mdvar1dvar2,...,Mdvarndvarn}.
mwd.theMat=undefined('theMat from matWithDrvs');
mwd.theMatDrv01=undefined('theMatDrv01 from matWithDrvs');
mwd.theMatDrv02=undefined('theMatDrv02 from matWithDrvs');
mwd.theVarNames=undefined('theVarNames from matWithDrvs');
mwd.numVars=undefined('numVars from matWithDrvs');
mwd.secDrvs=undefined('from matWithDrvs');
mwd.evaluationPoint=undefined('evaluationPoint from matWithDrvs');

switch nargin

case 0
mwd=class(mwd,'matWithDrvs');

case 1
mwd.theMat=varargin{1};

mwd=class(mwd,'matWithDrvs');

case 2
mwd.theMat=varargin{1};
mwd.theVarNames=varargin{2};
mwd.numVars=length(mwd.theVarNames);
mwd.secDrvs=mwd.numVars*(mwd.numVars+1)/2;
mwd.theMatDrv01=undefined('from matWithDrvs');
mwd.theMatDrv02=undefined('from matWithDrvs');
mwd=class(mwd,'matWithDrvs');

case 3
mwd.theMat=varargin{1};
mwd.theVarNames=varargin{2};
mwd.numVars=length(mwd.theVarNames);
mwd.secDrvs=mwd.numVars*(mwd.numVars+1)/2;
[noRows,noCols]=size(mwd.theMat);
mwd.theMatDrv01=handleMats(varargin{3},noRows,noCols,mwd.numVars);
mwd.theMatDrv02=undefined('from matWithDrvs');
mwd=class(mwd,'matWithDrvs');

case 4
mwd.theMat=varargin{1};
mwd.theVarNames=varargin{2};
mwd.numVars=length(mwd.theVarNames);
mwd.secDrvs=mwd.numVars*(mwd.numVars+1)/2;
[noRows,noCols]=size(mwd.theMat);
mwd.theMatDrv01=handleMats(varargin{3},noRows,noCols,mwd.numVars);
mwd.theMatDrv02=handleMats(varargin{4},...
noRows,noCols,mwd.secDrvs);
mwd=class(mwd,'matWithDrvs');

otherwise
error('matWithDrvs constructor: too many args');
end


function spMats=handleMats(mats01,noRows,noCols,expecting)
if(and(isa(mats01,'cell'),length(mats01)==expecting))
[matsOK,spMats]=chkMats(mats01,noRows,noCols);
if(~matsOK)
error('matWithDrvs constructor: first deriv matrix wrong dimensions')
end
else
error('matWithDrvs constructor: first deriv matrix wrong dimensions')
end



function [theRes,spMats]=chkMats(mats,noRows,noCols)
numMats=length(mats);
spMats=cell(1,numMats);
theRes=1;
for ii=1:numMats
[thisRow,thisCol]=size(mats{ii});
if(or(thisRow~=noRows,thisCol~=noCols))
theRes=0;
end
spMats{ii}=sparse(mats{ii});
end

