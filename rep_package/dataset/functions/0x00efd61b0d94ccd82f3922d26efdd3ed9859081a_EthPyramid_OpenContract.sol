contract EthPyramid {
function OpenContract(){
        require(msg.sender==admin);
        open=true;
    }
}