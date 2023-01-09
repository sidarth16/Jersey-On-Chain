// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

// import other helper contracts 
import {SVG} from "./SVG.sol";

contract JerseyOnChain is ERC721, ERC721URIStorage, Ownable, SVG {
    using Strings for uint256;
    // using Counters for Counters.Counter;
   
    // Counters.Counter private _tokenIdCounter;
    mapping (uint256 => string) public playerName;

    uint256 constant MINTABLE = 99;
    uint256[MINTABLE] internal availableIndex;
    uint256 public totalMinted;

    address public contractOwner;

    string[10] internal players;


    event Minted(uint256 indexed tokenId, string indexed playerName, address indexed to);

    constructor() ERC721("JerseyOnChain", "JOC") SVG(){
        totalMinted = 0;
        contractOwner = msg.sender;
        players = [
            "Alien", "Rolex", "knight", "Spike", "Kong",
            "Monk", "Prince", "Slayer", "Ronin", "Flash"
        ];
    }

    function _getNewIndex() internal returns(uint256 value) {
		uint256 remaining = MINTABLE - totalMinted;
        uint rand = uint256(keccak256(abi.encodePacked(msg.sender, block.difficulty, block.timestamp, remaining))) % remaining;
		value = 0;
        
		// if array value exists, use, otherwise, use generated random value
		if (availableIndex[rand] != 0)
			value = availableIndex[rand];
		else
			value = rand;
		// store remaining - 1 in used ID to create mapping
		if (availableIndex[remaining - 1] == 0)
			availableIndex[rand] = remaining - 1;
		else
			availableIndex[rand] = availableIndex[remaining - 1];	

        value += 1;
	}
    
    function _getPlayerName() internal returns (uint256 randomNum, string memory){
        uint256 ind = _getNewIndex();
        if (ind > 0  && ind < 11) return (ind, players[0]);
        if (ind > 10 && ind < 21) return (ind, players[1]);
        if (ind > 20 && ind < 31) return (ind, players[2]);
        if (ind > 30 && ind < 41) return (ind, players[3]);
        if (ind > 40 && ind < 51) return (ind, players[4]);
        if (ind > 50 && ind < 61) return (ind, players[5]);
        if (ind > 60 && ind < 71) return (ind, players[6]);
        if (ind > 70 && ind < 81) return (ind, players[7]);
        if (ind > 80 && ind < 91) return (ind, players[8]);
        return (ind, players[9]);
    }

    function mintJersey() external returns (uint){
        // _tokenIdCounter.increment();
        // uint256 tokenId = _tokenIdCounter.current();
        uint256 tokenId;
        string memory player;
        require(totalMinted < MINTABLE, "Jersey's Sold Out !!!" );

        (tokenId, player) = _getPlayerName();

        playerName[tokenId] = player;
        _safeMint(msg.sender, tokenId);
        // _setTokenURI(tokenId, generateFinalMetaJson(player, tokenId, msg.sender) );
        emit Minted(tokenId, playerName[tokenId], msg.sender );

        totalMinted+=1;
        return tokenId;
    }

    // The following functions are overrides required by Solidity.
    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.generateFinalMetaJson(playerName[tokenId], tokenId, ownerOf(tokenId));
    }

    function generateSVG(uint256 tokenId) external virtual view returns (string memory) {
        return super.generateSVG(playerName[tokenId], tokenId, ownerOf(tokenId));
    }
   
}