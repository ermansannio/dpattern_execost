contract MeshXToken {
function pause() onlyOwner isRunning    public   {
        running = false;
        emit Pause();
    }
}