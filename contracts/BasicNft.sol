// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    string private constant TOKEN_URI =
        "https://gateway.pinata.cloud/ipfs/QmShB5e7SqdGSCPXmskhjra1nDwtEsc3ptTApKsW7cCAnP";
    uint256 private s_tokenCounter;

    constructor() ERC721("Ethpuntocl", "ETHCL") {
        s_tokenCounter = 0;
    }

    function mintNft() public returns (uint256) {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter = s_tokenCounter + 1;
        return s_tokenCounter;
    }

    function tokenURI(uint256 tokenId) public pure override returns (string memory) {
        return TOKEN_URI;
    }

    function totalSupply() public view returns (uint256) {
        return s_tokenCounter;
    }
}
