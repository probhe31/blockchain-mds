pragma solidity ^0.4.17;

import 'zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol';
import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

contract CatToken is ERC721Token, Ownable {
  string public constant name = "CatToken";
  string public constant symbol = "GRAD";

  uint dnaDigits = 16;
  uint dnaModulus = 10 ** dnaDigits;


  struct Cat {
    string nameCat;
    string dnaCat;
  }

  
  Cat[] public cats;

  function getCat( uint _catId ) public view returns(string nameCat, string dnaCat){
    Cat memory _cat = cats[_catId];

    nameCat = _cat.nameCat;
    dnaCat = _cat.dnaCat;
  }

  function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
  }

  function mint(string _nameCat, string _dnaCat) public payable onlyOwner{
        
    Cat memory _cat = Cat({ nameCat: _nameCat, dnaCat: uint2str(_generateRandomDna(_nameCat)) });
    uint _catId = cats.push(_cat) - 1;

    _mint(msg.sender, _catId);
  }

  function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
  }

}
