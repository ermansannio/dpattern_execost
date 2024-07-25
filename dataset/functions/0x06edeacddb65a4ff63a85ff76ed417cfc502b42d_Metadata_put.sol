contract Metadata {
function put(address _namespace, string _key, string _value) public {
        metadata[_namespace][msg.sender][_key] = _value;
    }
}