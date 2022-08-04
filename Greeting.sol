// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Greeting{
    // these are stored on the blockchain and persist there. They are implicitly set.
    
    // The state variable when decleared with automatically create an getter function. 
    string public name;
    string public greetingPrefix ="Hello ";

    // Lets declare the constructure function:-
    // But here in the function argument we need to declare the variable type
    // Normarlly we use the memeory variable type in function argument.
    constructor(string memory initialName) {
        name=initialName;
    }
    //lets image we need to set the name again in the future
    function setName(string memory newName)public {
        name=newName;
    }
    // Now lets right a corrosping getter
    // Here view is because this function will not change data in the blockchain, similar there is pure which will not even read the data from the blockchain.
    function getGreeting() public view returns(string memory){
        //abi=contract Application Binary Interface.
        return string(abi.encodePacked(greetingPrefix, name));
    // the simple concatinate will not work in solidity, which is similar to that of the javascript, so we need to get the helper function
    }
}
