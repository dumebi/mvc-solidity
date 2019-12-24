pragma solidity >=0.4.0 <0.6.0;

import "./safemath.sol";
import "./libGameStruct.sol";

library ZombieController {
    using SafeMath for uint256;
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    uint cooldownTime = 1 days;
    event NewZombie(uint zombieId, string name, uint dna);

    ///////////////////////////////
    // GAME FUNCTION //
    //////////////////////////////

    /**
     * @dev Function to Create zombie
     * @param _self ZombieData Struct
     * @param _self ZombieData Struct
     * @param _symbol The token symbol.
     * @return A boolean that indicates if the token exists.
    */
    function _createZombie(ExchangeStruct.ZombieData storage _self, ExchangeStruct.Zombie storage _zombie, string _name, uint _dna) internal {
        uint8 digits = numDigits(_dna)
        require(digits == uint8(16), "A valid DNA needs 16 digits");
        _self.zombieIndex++;
        _self.zombies[_self.zombieIndex].name = _name;
        _self.zombies[_self.zombieIndex].dna = _dna;
        _self.zombies[_self.zombieIndex].level = 0;
        _self.zombies[_self.zombieIndex].name = uint32(now + cooldownTime);
        _self.zombies[_self.zombieIndex].name = 0;
        _self.zombies[_self.zombieIndex].name = 0;

        _self.zombieToOwner[_self.zombieIndex] = msg.sender;
        _self.ownerZombieCount[msg.sender] = _self.ownerZombieCount[msg.sender].add(1);
        emit NewZombie(_self.zombieIndex, _name, _dna);
        return true
    }

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function numDigits(int number) private view returns (uint8) {
        uint8 digits = 0;
        while (number != 0) {
            number /= 10;
            digits++;
        }
        return digits;
    }

    function _createRandomZombie(ExchangeStruct.ZombieData storage _self, ExchangeStruct.Zombie storage _zombie, string _name) internal {
        require(_self.ownerZombieCount[msg.sender] == 0, "User already has a zombie");
        uint randDna = _generateRandomDna(_name);
        randDna = randDna - randDna % 100;
        return _createZombie(_name, randDna);
    }
}