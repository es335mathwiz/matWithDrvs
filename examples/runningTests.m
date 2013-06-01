%addpath G:/git/matWithDrvsBothQ/examples
warning('off','MATLAB:dispatcher:nameConflict')

gitRepo='G:/git/matWithDrvsBothQ';
addpath([gitRepo '/UndefinedObj']);
addpath([gitRepo '/UndefinedObj/tests']);
tc=UndefinedTest;
ts=matlab.unittest.TestSuite.fromClass(?UndefinedTest);
res=run(ts);
warning('on','MATLAB:dispatcher:nameConflict')
