pragma solidity ^0.4.17;

import 'zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol';
import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

contract GradientToken is ERC721Token, Ownable {
  string public constant name = "GradientToken";
  string public constant symbol = "GRAD";

  uint dnaDigits = 16;
  uint dnaModulus = 10 ** dnaDigits;


  struct Gradient {
    string outer;
    string inner;
  }

  Gradient[] public gradients;

  function getGradient( uint _gradientId ) public view returns(string outer, string inner){
    Gradient memory _grad = gradients[_gradientId];

    outer = _grad.outer;
    inner = _grad.inner;
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

  function mint(string _outer, string _inner) public payable onlyOwner{
        
    Gradient memory _gradient = Gradient({ outer: _outer, inner: uint2str(_generateRandomDna(_outer)) });
    uint _gradientId = gradients.push(_gradient) - 1;

    _mint(msg.sender, _gradientId);
  }

  function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
  }

}
