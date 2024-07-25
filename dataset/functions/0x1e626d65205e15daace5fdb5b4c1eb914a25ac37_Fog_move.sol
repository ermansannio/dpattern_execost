contract Fog {
function move() payable public {
    require(msg.value >= 10000000000000000); // min 0.01 Ether

    playerAddress = msg.sender;
    playerValue = msg.value;

    uint N = 1; // number of random bytes we want the datasource to return
    uint delay = 0; // number of seconds to wait before the execution takes place
    uint callbackGas = 200000; // amount of gas we want Oraclize to set for the callback function

    oraclize_newRandomDSQuery(delay, N, callbackGas); // this function internally generates the correct oraclize_query and returns its queryId
  }
}