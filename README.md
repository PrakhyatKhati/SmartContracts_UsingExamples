# SmartContracts_UsingExamples
Here we will be learning to code and build different mini projects to get our hands dirty on smart contracts.
This are all the simple projects I am learning to get my hands dirty in solidity and Smart contract using solidity. 

##Some keypoints regarding Solidity Function:- 

Function functionName (<param_type> <param_name>) <visibility> <state mutability> [return (<return type>)]{....
.............
..........
...
}

Function getGreeting() public view returns(string memeory){

  return string(abi.encodePacked(greetingprefix))
}

// Function visibility specifiers:- 
1.Private
2. Internal 
3. External-: only visible externally, but can be accessed with this variable.
4.Public:- visible external and internally.. example is the getterfunction whenever you declare a state variable.
