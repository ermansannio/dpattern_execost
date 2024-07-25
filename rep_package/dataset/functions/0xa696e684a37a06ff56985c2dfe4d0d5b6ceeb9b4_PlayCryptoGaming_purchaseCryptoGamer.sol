contract PlayCryptoGaming {
function purchaseCryptoGamer(uint _cryptoGamerId) public payable {
        require(msg.value == cryptoGamers[_cryptoGamerId].curPrice);
        require(isPaused == false);

        // Calculate the 5% value
        uint256 commission1percent = (msg.value / 100);
        
        // Transfer the 5% commission to the owner of the least expensive and most expensive cryptogame
        address leastExpensiveCryptoGamerOwner = cryptoGamers[getLeastExpensiveCryptoGamer()].ownerAddress;
        address mostExpensiveCryptoGamerOwner = cryptoGamers[getMostExpensiveCryptoGamer()].ownerAddress;
        
        // We check if the contract is still the owner of the most/least expensive cryptogamers 
        if(leastExpensiveCryptoGamerOwner == address(this)) { 
            leastExpensiveCryptoGamerOwner = contractOwnerAddress; 
        }
        if(mostExpensiveCryptoGamerOwner == address(this)) { 
            mostExpensiveCryptoGamerOwner = contractOwnerAddress; 
        }
        
        leastExpensiveCryptoGamerOwner.transfer(commission1percent * 5); // => 5%  
        mostExpensiveCryptoGamerOwner.transfer(commission1percent * 5); // => 5%  

        // Calculate the owner commission on this sale & transfer the commission to the owner.      
        uint256 commissionOwner = msg.value - (commission1percent * 15); // => 85%
        
        // This cryptoGamer is still owned by the contract, we transfer the commission to the ownerAddress
        if(cryptoGamers[_cryptoGamerId].ownerAddress == address(this)) {
            contractOwnerAddress.transfer(commissionOwner);

        } else {
            // This cryptogamer is owned by a user, we transfer the commission to this player
            cryptoGamers[_cryptoGamerId].ownerAddress.transfer(commissionOwner);
        }
        

        // Transfer the 3% commission to the developer
        contractOwnerAddress.transfer(commission1percent * 3); // => 3%
        
        // Transfer the 2% commission to the actual cryptogamer
        if(cryptoGamers[_cryptoGamerId].CryptoGamerAddress != 0x0) {
            cryptoGamers[_cryptoGamerId].CryptoGamerAddress.transfer(commission1percent * 2); // => 2%
        } else {
            // We don't konw the address of the crypto gamer yet, we transfer the commission to the owner
            contractOwnerAddress.transfer(commission1percent * 2); // => 2%
        }
        

        // Update the company owner and set the new price
        cryptoGamers[_cryptoGamerId].ownerAddress = msg.sender;
        cryptoGamers[_cryptoGamerId].curPrice = cryptoGamers[_cryptoGamerId].curPrice + (cryptoGamers[_cryptoGamerId].curPrice / 2);
    }
}