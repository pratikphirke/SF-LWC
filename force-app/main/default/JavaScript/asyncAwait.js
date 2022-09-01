/**
 * 
 * Async and Await are extensions of promises.
async keyword with a function to represent that the function is an asynchronous function. The async function returns a promise.



 */
// async function example

async function f() {
    console.log('Async function.');
    return Promise.resolve(1);
}

f().then(function(result) {
    console.log(result)
});

/*
The await keyword is used inside the async function to wait for the asynchronous operation.
*/
// a promise
let promise = new Promise(function (resolve, reject) {
    setTimeout(function () {
    resolve('Promise resolved')}, 4000); 
});

// async function
async function asyncFunc() {
    let result = await promise;    // wait until the promise resolves 

    console.log(result);
    console.log('hello');
}

// calling the async function
asyncFunc();