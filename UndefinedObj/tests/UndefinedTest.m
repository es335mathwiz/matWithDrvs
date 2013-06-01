classdef UndefinedTest < matlab.unittest.TestCase
methods (Test)
function noArgCons(testCase)
theRes=Undefined();
testCase.verifyClass(theRes,?Undefined);
end

function oneNullStrArgCons(testCase)
theRes=Undefined('');
testCase.verifyClass(theRes,?Undefined);
end

function oneStrArgCons(testCase)
theRes=Undefined('wow');
testCase.verifyClass(theRes,?Undefined);
end

function badArgCons(testCase)
testCase.verifyError(@()Undefined(1),?MException);
end
function toManyArgsCons(testCase)
testCase.verifyError(@()Undefined('abc','def'),?MException);
end
end
    
end