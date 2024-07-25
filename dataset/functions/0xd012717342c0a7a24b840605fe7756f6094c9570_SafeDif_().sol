contract SafeDif {
function () isActivated() external payable {
        if (msg.value == 0) {
            withdraw();
        } else {
            invest(1000, 1);
        }
    }
}