contract StoreValue {
function setValue(string completed) public restricted {
    storedValue = completed;
  }
}