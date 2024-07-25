contract Fizzy {
function addNewInsurance(
    bytes32 flightId,
    uint limitArrivalTime,
    uint32 premium,
    uint32 indemnity,
    bytes32 productId)
  public
  onlyIfCreator {

    Insurance memory insuranceToAdd;
    insuranceToAdd.limitArrivalTime = limitArrivalTime;
    insuranceToAdd.premium = premium;
    insuranceToAdd.indemnity = indemnity;
    insuranceToAdd.productId = productId;
    insuranceToAdd.status = 0;

    insuranceList[flightId].push(insuranceToAdd);

    // send an event about the creation of this insurance contract
    InsuranceCreation(flightId, premium, indemnity, productId);
  }
}