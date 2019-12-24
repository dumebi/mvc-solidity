pragma solidity >=0.4.0 <0.6.0;

library ZombieStruct {
    struct Zombie {
        string name;
        uint dna;
        uint32 level;
        uint32 readyTime;
        uint16 winCount;
        uint16 lossCount;
    }

    struct ZombieData {
        mapping (uint256 => Zombie) zombies;
        mapping (uint => address) zombieToOwner;
        mapping (address => uint) ownerZombieCount;
        uint256 zombieIndex;
    }
}