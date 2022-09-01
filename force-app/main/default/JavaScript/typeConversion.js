//Type Conversion and Coercion -
	// type coversion 
	console.log(Number('20')+5);
	console.log(Number('test')); //NAN
	console.log(String(10));
	
	// automatic type coercion 
	console.log('I am having ' + 15 + ' certifications ' ); // number will be converted to text , + operator to alway number 
	console.log('20'-'10');
	console.log('20'/'10');
	console.log('20'>'10');

    let day = 'Wednesday';
switch(day) {
    case 'Sunday':
        console.log(`This is Sunday`);
    case 'Monday':
        console.log(`This is Monday`);
    case 'Tuesday':
        console.log(`This is Tuesday`);
        break;
    case 'Wednesday':
    case 'Thrusday':
        console.log(`This is Wednesday or Thrusday`);
        break;
    case 'Friday':
        console.log(`This is Friday`);
        break;
    case 'Saturday':
        console.log(`This is Saturday`);
        break;
    default:
        console.log(`Invalid Day`);
}
