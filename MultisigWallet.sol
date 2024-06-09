pragma solidity ^0.7.6;
pragma abicoder v2;


contract MultisigWallet{
    address[] public owners;
    uint limit;


    constructor(address[] memory _owner, uint _limit){
        owners = _owner;
        limit = _limit;
    }

    modifier onlyowner(){
        bool owner = false;

        for (uint i = 0; i<= owners.length; i++){
        if(owners[i] == msg.sender){
            owner = true;
        }
        }

        require(owner == true);
        _;
    }

    function deposit() public payable {

    }

    struct transfer{
        uint amount;
        address payable receiver;
        uint approvals;
        bool hasbeensent;
        uint id;
    }


    event transferforrequestcreated(uint _id ,uint _amount , address _initaitor , address _receiver);
    event Approvalreceived(uint _id ,uint _approvals, address _approver);
    event transferapproved(uint _id);

    transfer[] transferforrequest;

    function createtransfer(uint _amount, address payable _receiver) public  onlyowner{
        emit transferforrequestcreated(transferforrequest.length, _amount, msg.sender , _receiver);
        transferforrequest.push(transfer(_amount,_receiver, 0 ,false, transferforrequest.length));

    }

    mapping (address => mapping (uint => bool)) approvals;

    function approve(uint _id) public onlyowner{
        require(transferforrequest[_id].hasbeensent == false);
        require(approvals[msg.sender][_id] == false,"you already voted");

        approvals[msg.sender][_id] = true;
        transferforrequest[_id].approvals++;

        emit Approvalreceived(_id, transferforrequest[_id].approvals, msg.sender);

        if(transferforrequest[_id].approvals >= limit){
            transferforrequest[_id].hasbeensent = true;
            transferforrequest[_id].receiver.transfer(transferforrequest[_id].amount);
            emit transferapproved(_id);
            
        }
    }

    function gettransferforrequest() public view returns (transfer[] memory){
        return transferforrequest;

    }

    function getbalance() public view returns (uint){
        return address(this).balance;
    }

}

