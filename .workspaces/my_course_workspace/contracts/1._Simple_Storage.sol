pragma solidity >=0.4.16 <0.9.0;
//declare the version with pragma
contract SimpleStorage{
    uint public storedData; //uint is a variable higher than zero
//this is not availible outside of our contract unless we use 
//change uint storedData to uint public storedData
    //match the declared type above 
    function set(uint x) public{ 
        storedData = x;
    }
    // doesnt require any parameters  view never changes the state of the function it's just for viewing 
    //anyone can change the value anyone can access to certain uses based on balance in their wallet
    //by default uint is 0
    function get() public view returns(uint){ 
        return storedData;

    }  
        
    }