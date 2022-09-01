public class SOSLqueryDemo {
     
}




















//FIND {Acme Inc 1} IN ALL FIELDS RETURNING Account(Name) LIMIT 5
    //FIND {Get Cloudy} IN NAME FIELDS RETURNING Account(Name), Contact(FirstName,LastName,Email) LIMIT 5
    //FIND {Acm*} RETURNING Account(id,Name LIMIT 6 OFFSET 5 )
    //offset will return records 1 ex 6-5=1
    //
    //
    //
    //

/*

------1 ---SOQL(Salesforce Object Query Language):

SOQL is a Salesforce Object Query Language, retrieves the records from the database by using SELECT keyword.
SOQL is used if we know in which object the data is present.
In SOQL we can query data from single object and as well as multiple objects that are related to each other.
We can query on all fields of any datatype.
We can use SOQL in Triggers and classes.
We can perform DML operation on query results.

------2  --SOSL(Salesforce Object Search Language):

SOSL is a Salesforce Object Search Language, retrieves the records from the database by using the FIND keyword.
SOSL is used if we don’t know in which object the data is present.
We can retrieve multiple objects and field values efficiently when the objects may or may not be related to each other.
We can query only on fields whose data type is text, phone and Email.
We can use in classes but not in Triggers.
We cannot perform DML operation on search result.


*/