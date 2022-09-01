/*
What is Callback?
 A callback is a plain JavaScript function passed to some method as an argument
 It is to be executed after another function has finished executing, hence the name ‘call back‘.
used in asynchronous functions, where one function has to wait for another function (like waiting for a file to load).
*/
//  program that shows the delay in execution

function greet() {
    console.log('Hello world');
}

function sayName(name) {
    console.log('Hello' + ' ' + name);
}

// calling the function
setTimeout(greet, 2000);
sayName('John');

//-------------------------------------------------------------------------------------------------
//The setTimeout() method executes a block of code after the specified time. The method executes the code only once.

// program to display a text using setTimeout method
function greet() {
    console.log('Hello world');
}

setTimeout(greet, 3000);
console.log('This message is shown first');