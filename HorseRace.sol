pragma solidity ^0.4.18;

import './HorseHelper.sol';

contract HorseRace is HorseHelper {
    uint64 raceStakes;
    uint8 fieldSize;
    uint64 startTime;
    uint64 endTime;
    uint grandPrize;
    uint randNonce;

    address public winner;
    address[] public horsesInRace;
    address[] public losers;
    
    function HorseRace(uint64 _stakes) public {
        raceStakes = _stakes;
    }
    
    function randMod(uint _modulus) internal returns(uint) {
        randNonce++;
        return uint(keccak256(now, msg.sender, randNonce)) % _modulus;
    }
    
    function enterRace(address horse) public payable {
        require(fieldSize < 3);
        require(msg.value >= raceStakes);
        // uint id = horsesInRace.push(horse) - 1;
        horsesInRace.push(horse);
        fieldSize++;
    }
    
    function startRace() external {
        require(fieldSize == 3);
        
    }
}