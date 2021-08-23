pragma solidity >=0.7.0 <0.9.0;

contract Coin{
    address public minter;
    mapping(address => uint) public balances;
    
    event Sent(address from, address to, uint amount);
    
    constructor(){
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver]+= amount;
        
    }

     function send(address receiver, uint amount) public{
        require(amount<=balances[msg.sender], "Insufficent balances");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
         
    }
    

}


/*address is a datatype declare new variable value of the minter person that created this contract  every account with a  smart contract has an address it's used to send and receive ether it's like a bank account number mapping is a data type in solidity minter is the name we're giving it 
allows store an association quickly  get a value corresponding to key basically lik e a dictionary  mapping address to uint address to a value greater than zero public 
balances is the name we're giving it next we're going to make a construction function constructor function run directly when content created used to access variables directly 
msg is keyword that allows us to access some special variables that is available for us from the block chain that are sent through when the contract is called
msg.sender which returns the address of the wallet that called the contract and in this case called the contract and created it 
we need to have the possibility to mint  therefore create new coins -> create a function requires two parameters : declare datatypes as  address for the receiver when the create of this contract what account this newly minted coin will be sent to
and uint for the amount we want to make sure the person calling this function therefore create and mint new coins is the right person 
is actually the creator of it so we know who is the creator so what solidity gives us is this function called require
require is what you call a convenience function it guarantees validity of a  conditions that cannot be detected before executed checks a certain input that we will add in a second contract, state, variables what ever is needed and it returns values from calls to external contracts  
returns once confirmed it moves on to next line of code and if and if isn't confirmed then error anyone who is trying to call this function that isn't the minter won't be able to require the (msg.sender) so the current one the current one calling has to be equal to the minterrequire that the amount is less than a certain value 
if both require conditions are met: modify our mapping here  balances find the receiver (address) that was sent through the contract in our map of balances 
we're going to change the uint which is the  mapped value by adding the amount so whatever new value that was created by the creator of this contract will be added to the existing value of the address as the amount
that function was our first function that allows us to mint and create new coins 
second function  we need to send coins between addresses 
require that the amount is greater than or equal to whatever balance this person's address has if not send message back to user Insufficient balance
*we can create events Ethereum and solidity has events which are inheritable members of contracts when you call them they 
causes the arguments that you pass and stored in the transactions log and the transactions log is a special data structure 
in the blockchain it's a log that is associated  with the log of the contract and are incorporated into the blockchain and stay there as long as the block is accessible 
which in theory could be forever so this is the kind of functions these events have to declare the fact that it is an event and give it a name were going to call it 
whenever our user sends some coins to someone else we want to the fact that it was sent and who it was sent to to be recorded so once this function is done  we want to log 
this data in the blockchain . we're going to log the address from so where this coin came from and where it's going how much and in order to trigger it with an emit function 
emit sent function this event that we created that allows us to log this information inside of the blockchain
so after this our coin is done our smart contract is done we can go to test it out go compile it 
*//*  
can copy the address of the minter the creator from the account drop down box
in the deployed contracts down arrow in mint input box :
<address of the person who minted it> . <the amount ex 150>

this calls our mint function 
0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2.150


{ "address receiver": "0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c", "uint256 amount": "150" } //only owner can can create
//0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db but we can send them to a different address which is a wallet 
Now check our original wallet again {
	"0": "uint256: 100"
}
Now the other wallet can send coins 

Event: when you call an event is causes the arguments to be stored in the transactions log 
Emit: Keyword used to call Events
Constructor: function that is run directly when the contract is created */




            
                            
                            
    
}

                       