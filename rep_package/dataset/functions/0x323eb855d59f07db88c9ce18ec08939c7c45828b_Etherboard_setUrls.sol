contract Etherboard {
function setUrls(string url, string img_url) {
        var leader = leaders[msg.sender];
        
        require(leader.amount > 0);
        
        // Set leader's url if it is not an empty string
        bytes memory tmp_url = bytes(url);
        if (tmp_url.length != 0) {
            // Set url
            leader.url = url;
        }
        
        // Set leader's img_url if it is not an empty string
        bytes memory tmp_img_url = bytes(img_url);
        if (tmp_img_url.length != 0) {
            // Set image url
            leader.img_url = img_url;
        }
    }
}