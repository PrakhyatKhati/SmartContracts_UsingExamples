// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// lets define our lottery contract
contract Lottery{
    //lets define our variables
    //addres of the owner of the contract
    address public owner;
    // List of the player and in array
    address payable[] public players;
    // keep track of the lottery winner
    uint public lotteryId;
    //Adddress who own the lottery
    mapping(uint => address payable) public lotteryHistory;
    //lets define construcute, here the construct wont take argument and need to set our owner address, common pattern to declare and get the addres of the person who 
    //deployed the smart contract.
    // this address the owner address
    constructor(){
        owner=msg.sender;
        lotteryId=1;
    } 
        // get winner by lottery
    function getWinnerByLottery(uint lotId) public view returns(address payable ){
        return lotteryHistory[lotId];
    }

        // lets get a get balance function 
    
    function getBalaance() public view returns(uint){
        return address(this).balance;
    }
    function getPlayers() public view returns (address payable[] memory ){
        return players;
    }
    //lets define function 
    // make it public and payable to enter the lottery
    function enter() public payable{
        //we need to require some money first to entry into the lottery, 

        require(msg.value > .01 ether);
        
        
        // here the msg.sender is the addres who invoked this function, could be the person who wanted to enter the lottery.
        // conveerting the address to payable address and add it to the payable address.
        // Player entering lottery.

        players.push(payable(msg.sender));

    }
    function getRandomNumber() public view returns(uint){
        // here we are trying to has the owner address and here the hashfunction takes only one parameter so we need to concatinate the two argument as one using the abi.
        return uint(keccak256(abi.encodePacked(owner,block.timestamp)));
    }

    function pickWinner() public onlyOwner {
       //Here to restrict insted of require we are using modifier
       // require(msg.sender == owner);

        //get an index from the array
        uint index = getRandomNumber()% players.length;
        // address(this)-> it gives refrence to the current smart contract and .balance will give the total balance hold by the smart contract
        players[index].transfer(address(this).balance);
        //reentry attack.. 
        lotteryId++;
        // Lotterywinner address
        lotteryHistory[lotteryId]=players[index];

        // after the winner we need to reset for the next round.
        players = new address payable[](0);
    }
    // restrict certain functionality using a require is old school and a common way but if we have similar in n number of restricit then we need to have custome modifier
    // so creating a reusable modifier
    modifier onlyOwner(){
        require(msg.sender == owner);
        _; // this is like require before anthings gets executed in the modifier used function
    }


    

    




}
