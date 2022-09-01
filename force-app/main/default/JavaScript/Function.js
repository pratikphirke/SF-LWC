// Functions 
console.log(calculateBill(500,5)); // This will work as soon as it is declrated atleast later

// Function Declartaion
function calculateBill(billAmount, numOfGuys) {
	let billStmt = `Each guy bill is ${billAmount}. Total bill for ${numOfGuys} guys is ${billAmount * numOfGuys}`;
	return billStmt;
}
//Arrow +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
const calcBill2 = (billAmount, numOfGuys) => billAmount * numOfGuys;
console.log(calcBill2(799,5));

// Function Expression---------------------------------------------------------------------------
const calcAge1 = function(birthYear) {
	return 2022 - birthYear;
}

// ES6 - Arrow Function
const calcAge2 = birthYear => 2022 - birthYear;
console.log(calcAge1(1996),calcAge2(1996));
//-------------------------------------------------------------------------------------------------cvx vdfr
const isEligible4License = birthYear => {
	const age = 2022 - birthYear;
	const isTrue = (age >=18 ? true : false);
	return isTrue
}
console.log(isEligible4License(26));