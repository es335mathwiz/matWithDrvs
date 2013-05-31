classdef Undefined

properties (Hidden)
where='';
end


methods

function uObj=Undefined(varargin)
switch nargin
case 0
uObj.where='';
case 1
if(isa(varargin{1},'char'))
uObj.where=varargin{1};
else
    error('Undefined: constructor expects no arg or one class char arg');
end%if
otherwise
    error('Undefined: constructor expects no arument or one char arg');
end
%uObj=class(uObj,'Undefined');
end
end

end









