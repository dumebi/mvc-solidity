pragma solidity >=0.4.22 <0.6.0;

import "./ownable.sol";
import "./libGameStruct.sol";
import "./libGameFunc.sol";



contract Game is Ownable {
    using ZombieStruct for ZombieStruct.ZombieData;
    using ZombieStruct for ZombieStruct.Zombie;
    ZombieStruct.ZombieData zombieData;
    ZombieStruct.Zombie zombie;


    function createZombie(string _name, uint _dna) public returns (bool) {
        return ZombieController._createZombie(zombieData, zombie, _name, _dna);
    }

    function createRandomZombie(ExchangeStruct.ZombieData storage _self, ExchangeStruct.Zombie storage _zombie, string _name) public returns (bool) {
        return ZombieController._createZombie(zombieData, zombie, _name);
    }

}