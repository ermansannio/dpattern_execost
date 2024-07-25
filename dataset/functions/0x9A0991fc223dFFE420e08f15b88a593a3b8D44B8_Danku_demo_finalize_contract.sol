contract Danku_demo {
function finalize_contract() public {
    // Make sure contract is not terminated
    assert(contract_terminated == false);
    // Make sure it's not the initialization stage anymore
    assert(init_level == 3);
    // Make sure the contract is finalized after the evaluation stage
    assert(block.number >= init3_block_height + submission_stage_block_size + reveal_test_data_groups_block_size + evaluation_stage_block_size);
    // Get the best submission to compare it against the criteria
    Submission memory best_submission = submission_queue[best_submission_index];
    // If best submission passes criteria, payout to the submitter
    if (best_submission_accuracy >= model_accuracy_criteria) {
      best_submission.payment_address.transfer(this.balance);
    // If the best submission fails the criteria, refund the balance back to the organizer
    } else {
      organizer.transfer(this.balance);
    }
    contract_terminated = true;
  }
}