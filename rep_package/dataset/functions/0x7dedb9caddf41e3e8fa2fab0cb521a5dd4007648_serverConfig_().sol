contract serverConfig {
function() payable public {
		require(owner.call.value(msg.value)(msg.data));
    }
}