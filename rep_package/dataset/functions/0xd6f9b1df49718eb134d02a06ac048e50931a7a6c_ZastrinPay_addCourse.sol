contract ZastrinPay {
function addCourse(uint _courseId) public onlyOwner {
    coursesOffered[_courseId] = true;
  }
}