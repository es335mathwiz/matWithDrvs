%addpath G:/git/matWithDrvsBothQ/examples

%matclipse aparently modifyies matlab command line behavior by putting 
%some conflicting .m files early in the matlab path
warning('off','MATLAB:dispatcher:nameConflict')

gitRepo='G:/git/matWithDrvsBothQ';
addpath([gitRepo '/UndefinedObj']);
addpath([gitRepo '/UndefinedObj/tests']);
tc=UndefinedTest;
ts=matlab.unittest.TestSuite.fromClass(?UndefinedTest);
res=run(ts);
warning('on','MATLAB:dispatcher:nameConflict')
