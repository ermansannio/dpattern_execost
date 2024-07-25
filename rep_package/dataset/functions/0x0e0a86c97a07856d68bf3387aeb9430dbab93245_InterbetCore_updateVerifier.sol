contract InterbetCore {
function updateVerifier(uint feeRate, uint baseFee) external {
        require(feeRate >= 0 && feeRate <= ((10 ** feeRateDecimals) * 100));
        require(baseFee >= 0 && baseFee <= 100000000 * 1 ether);

        Verifier storage verifier = verifiers[msg.sender];

        uint oldFeeRate = verifier.feeRate;
        uint oldBaseFee = verifier.baseFee;

        verifier.addr = msg.sender;
        verifier.feeRate = feeRate;
        verifier.baseFee = baseFee;

        emit LogUpdateVerifier(msg.sender, oldFeeRate, feeRate, oldBaseFee, baseFee);
    }
}