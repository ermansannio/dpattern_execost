contract ZastrinPay {
function buyCourse(uint _courseId, uint _userId) public payable {
    require(coursesOffered[_courseId]);
    customers[msg.sender][_courseId].amount += msg.value;
    customers[msg.sender][_courseId].purchasedAt = now;
    customers[msg.sender][_courseId].userId = _userId;
    NewPayment(_courseId, _userId, msg.sender, msg.value);
  }
}