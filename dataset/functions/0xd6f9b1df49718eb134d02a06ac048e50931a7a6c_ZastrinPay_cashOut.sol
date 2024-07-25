contract ZastrinPay {
function cashOut(address _customer, uint _courseId) public onlyOwner {
    require(customers[_customer][_courseId].refunded == false);
    require(customers[_customer][_courseId].cashedOut == false);
    require(customers[_customer][_courseId].purchasedAt + (3 hours) < now);
    customers[_customer][_courseId].cashedOut = true;
    owner.transfer(customers[_customer][_courseId].amount);
  }
}