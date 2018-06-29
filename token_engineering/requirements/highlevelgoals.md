## Descriptive Goals
	
Artonomous is a self-sustaining, self-improving, autonomous artist. It generates art by itself, sells it and incentivizes humans to improve the art it creates. Owners of the art piece owns the scarce, immutable, collectible art. This is implemented on the Ethereum blockchain.
-	Quote from [Readme](https://github.com/simondlr/artonomous/blob/9551c9ad6eb582368bdd9acb4eb1bed50736854c/README.md) (Simon)

## System Level Requirements
1. Every day (revising to think of as every interval of blocks), Artonomous must create and put for sale a piece of art
1. The art is created by an offline piece of software (the _Generator_) which takes a blockhash from the Ethereum blockchain as its input
1. It must be possible to improve the Generator
1. The art created is immutable
1. The piece of art is represented as an ERC721-token, tradable and transferable on the Ethereum blockchain
1. The system is governed by holders of soul tokens, who determine what Generator will be used by the artist

## System Analysis
The Artonomous economy has 4 roles:
1. The Art Collector/Trader
1. The Art Generator Developer
1. The Patron/Investor
1. The Art Creation Triggerer

An Art Collector/Trader needs to have the opportunity to purchase art from the Artists, to purchase are from other Collector/Traders and to have the ownership state of their artwork maintained. The collector requires that the price setting process for artwork being sold by the artist is transparent (current price is queriable).

The Art Generator Developer is responsible for developing the Generator - an open source software that creates a piece of art based on a seed.

The Patron/Investor needs to be able to bond Ethereum in support of the Autonomous Artist and to share in the financial success of the Artist. While the value per soul varies programmatically, the Patron/Investor requires that every soul (including fractions) is redeemable for Ethereum from the Pool. The Patron/Investor governs the Artonomous with respect to what Generator it should use.

The Art Creation Triggerer calls the method on the Artonomous smart contract that creates a new piece of art.

## Failure Modes
Failure mode 1:  
The Art Creation Triggerer must inccur in costs (gas fees) in order to perform its role. If it is not compensated for that service, the lack of interest in this role will bring the system to a halt. An altruistic Patron could perform the role of the Triggerer, but they would effectively be providing a service to the other Patrons for free.

Failure mode 2: 
If there are no incentives for software developers and artists to create Generators, the Artonomous won't improve its ability to create art.

## Design Goals
1. Give each artwork the opportunity to be purchased at a market discovered price by designing an auction mechanism for the “Purchase” action. Thus ensuring the a continued revenue stream for the Artonomous Artist.
1. Provide the Patron/Investors with a bonding curve that allows them to sustainably support the activities of the Artonomous Artist and share in its profits via a withdraw function without violating goal 1. 
1. Define the minting and burning mechanisms such that the floating supply of souls is a representation of the Artonomous artists current and future perceived value as measured by the collective actions of agents interacting with the Artonomous Artist, as both collectors and patrons.
