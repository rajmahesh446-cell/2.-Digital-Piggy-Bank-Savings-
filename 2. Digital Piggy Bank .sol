contract PiggyBank {
    address public owner;
    uint public unlockTime;

    constructor(uint _days) {
        owner = msg.sender;
        unlockTime = block.timestamp + (_days * 1 days);
    }

    // Accept funds
    receive() external payable {}

    function withdraw() public {
        require(msg.sender == owner, "Not the owner");
        require(block.timestamp >= unlockTime, "Too early!");
        
        payable(owner).transfer(address(this).balance);
    }
}
