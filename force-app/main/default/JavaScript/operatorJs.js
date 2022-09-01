//const num = 2;
//console.log(num + 2, num - 2, num / 2, num ** 3);

const firstName = 'Salesforce', lastName = 'Homies';
	console.log(firstName + ' ' + lastName);

// Templace Strings
	console.log(`${firstName} ${lastName}`);
    	
    let num = 5;

	// Arthematic Operators
	    // Unary Operator 
		num++;
		console.log('num: '+num);
	    // Binary Operator 
	    console.log(num + 5 - (8 - 7), num - 5, num * 5, num / 5, num ** 3);
	    // Ternary Operator 
		// Stmt 
		num > 0 ? console.log('num is > 0') : console.log('num is < 0');
		// expression 
		num = 'num is ' + (num > 0 ? '> 0' : '< 0');
		console.log('num: '+num);