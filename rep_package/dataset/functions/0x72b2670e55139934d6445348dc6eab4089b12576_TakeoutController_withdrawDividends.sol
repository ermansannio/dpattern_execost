contract TakeoutController {
function withdrawDividends() external onlyOwner {
        Hourglass.withdraw();
    }
}