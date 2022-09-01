/*
Promises are used to handle asynchronous operations in JavaScript.
They are easy to manage when dealing with multiple asynchronous operation
A promise has four states:
1) fulfilled: Action related to the promise succeeded
2) rejected: Action related to the promise failed
3) pending: Promise is still pending i.e not fulfilled or rejected yet
4) settled: Promise has fulfilled or rejected


let promise = new Promise(function(resolve, reject){
     //do something
})


*/

const count = true;

let countValue = new Promise(function (resolve, reject) {
    if (count) {
        resolve("There is a count value.");
    } else {
        reject("There is no count value");
    }
});

console.log(countValue);

/**
 * Promises are useful when you have to handle more than one asynchronous task, one after another. For that, we use promise chaining
 * 
 */


// returns a promise

let coValue = new Promise(function (resolve, reject) {
    //resolve("Promise resolved");
    reject("Promise reject");
  });
  
  // executes when promise is resolved successfully
  
  coValue.then(function successValue(result) {
      console.log(result);
    },)
  
// executes if there is an error
.catch(function errorValue(result) {
        console.log(result);
    },)
    // add other blocks of code
.finally( function greet() {
        console.log('This code is executed.');
    }
);