contract MyEtherCityGame {
function Initialize() public onlyCeo {
        // To be able to use the land id in the city struct
        lands.push(Land(ceoAddress, 0, false, false, 5, true, 0)); // Fake Land #0 is created here

        // Save the amount of metal needed to produce the buildings
        BuildingTypeMetalNeeded[0] = 3;
        BuildingTypeMetalNeeded[1] = 4;
        BuildingTypeMetalNeeded[2] = 5;
        BuildingTypeMetalNeeded[3] = 4;

        // Save the squares used by buildings
        BuildingTypeSquaresOccupied[0] = 2;
        BuildingTypeSquaresOccupied[1] = 4;
        BuildingTypeSquaresOccupied[2] = 6;
        BuildingTypeSquaresOccupied[3] = 4;
        BuildingTypeSquaresOccupied[4] = 5; // Businesses
    }
}