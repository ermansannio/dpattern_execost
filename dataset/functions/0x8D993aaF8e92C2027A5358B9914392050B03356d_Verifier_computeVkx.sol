contract Verifier {
function computeVkx(uint start, uint end) public {
/**
@notice © Copyright 2018 EYGS LLP and/or other members of the global Ernst & Young/EY network; pat. pending.
*/
//end needs to be < vector.length
for (uint i = start; i < end; i++)
vk_xs[msg.sender] = Pairing.addition(vk_xs[msg.sender], Pairing.scalar_mul(vks[msg.sender].IC[i + 1], vectors[msg.sender][i]));
}
}