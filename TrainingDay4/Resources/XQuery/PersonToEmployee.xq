(:: pragma bea:global-element-parameter parameter="$person1" element="Person" location="../XSDs/Person.xsd" ::)
(:: pragma bea:global-element-return element="Employee" location="../XSDs/Employee.xsd" ::)

declare namespace xf = "http://tempuri.org/TrainingDay4/Resources/XQuery/PersonToEmployee/";

declare function xf:PersonToEmployee($person1 as element(Person))
    as element(Employee) {
        <Employee>
            <Name>{ concat($person1/FirstName ,' ', $person1/LastName) }</Name>
            <Address>{ data($person1/City) }</Address>
            <Age>{ data($person1/Age) }</Age>
            <Position>{ data($person1/JobDesc) }</Position>
        </Employee>
};

declare variable $person1 as element(Person) external;

xf:PersonToEmployee($person1)
