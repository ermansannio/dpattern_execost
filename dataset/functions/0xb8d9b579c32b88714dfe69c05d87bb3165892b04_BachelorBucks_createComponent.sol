contract BachelorBucks {
function createComponent(string componentName) public onlyByOwner() returns (bool success) {
        if (componentCount > 65534) revert();
        var component = components[componentCount];
        component.name = componentName;
        component.index = componentCount;
        component.currentSupport = 0;
        component.supported = 0;
        component.undermined = 0;
        componentCount += 1;
        return true;
    }
}