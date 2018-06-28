## Descriptive Goals
	
Artonomous is a self-sustaining, self-improving, autonomous artist. It generates art by itself, sells it and incentivizes humans to improve the art it creates. Owners of the art piece owns the scarce, immutable, collectible art. This is implemented on the Ethereum blockchain.
-	Quote from [Readme](https://github.com/simondlr/artonomous/blob/9551c9ad6eb582368bdd9acb4eb1bed50736854c/README.md) (Simon)

## System Level Requirements
1. Every day, Artonomous must create and put for sale a piece of art
1. The art is created by an offline piece of software (the _Generator_) which takes a blockhash from the Ethereum blockchain as its input
1. It must be possible to improve the Generator
1. The art created is immutable
1. The piece of art is represented as an ERC721-token, tradable and transferable on the Ethereum blockchain
1. The system is governed by holders of soul tokens, who determine what Generator will be used by the artist

## System Design (as currently documented throughout the artonomous repo)
1. At any point someone can mint soul tokens by sending ETH to the artist
1. The more soul tokens in circulation, the higher the price of the new soul tokens
1. The ETH used to mint soul tokens is deposited in the Pool
1. A soul token can at any point be destroyed for access to a percentage of the ETH in the Pool
1. After a cycle of 24 hours, a new auction can be started by anyone, after which a new auction can only happen after 24 hours.
1. A portion of the Pool can be used to pay people to start auctions if the previous art piece has been claimed/bought.
1. The Art Auction initiates a linear decaying price function towards zero based on the running average of the past n auctions
1. The time towards zero is 24 hours.
1. If the previous auction ended at zero, anyone can pay anything to claim the artwork.
1. It can be instantly claimed for any price above the previous art auction.
1. A new auction can't be started unless the previous art piece has been claimed/bought. So if no one bought it after 24 hours, it can go on indefinitely until it's bought/claimed.
1. The blockhash used in the art generation is determined at the start of auction.
1. Once claimed, the ERC721 version of the art is created.
1. The ETH paid towards buying/claiming the art goes into the Pool.

## Questions
1. What are the incentives to improve the Generator?
1. How does Artonomous incentivize people to start auctions if the Pool is depleted?


[------Work in Progress---------]


The Artonomous economy has 3 roles:
1)	The Artonomous Artist
2)	The Art Collector/Trader
3)	The Patron/Investor

The Artonomous Artist must always have enough funds to cover its operational expenses associated with generating new artwork and issuing tokens, selling and maintaining the state of all art tokens generated. 

An Art Collector/Trader needs to have the opportunity to purchase art from the Artists, to purchase are from other Collector/Traders and to have the ownership state of their artwork maintained. The collector requires that the price setting process for artwork being sold by the artist is transparent (current price is queriable).

The Patron/Investor needs to be able to bond Ethereum in support of the Autonomous Artist and to share in the financial success of the Artist. While the value per soul varies programmatically, the Patron/Investor requires that every soul (including fractions) is redeemable for Ethereum from the Pool. 

## Failure Modes
Failure mode 1: if the artwork is deemed undesirable or overpriced Collector/Traders may not buy new artwork, this will lead to operational losses as operational costs of issuing art deplete the pool. While Patrons/Investors may subsidize this process for a time, it may lead to Failure mode 2.

Failure mode 2: if there is a loss in confidence by Patrons and all souls are returned for Ethereum, the pool may be emptied and the Artonomous Artist my lack the funds to generate and sell new artworks.

## Design Goals
1)	Give each artwork the opportunity to be purchased at a market discovered price by designing an auction mechanism for the “Purchase” action. Thus ensuring the a continued revenue stream for the Artonomous Artist.
2)	Provide the Patron/Investors with a bonding curve that allows them to sustainably support the activities of the Artonomous Artist and share in its profits via a withdraw function without violating goal 1. 
3)	Define the minting and burning mechanisms such that the floating supply of souls is a representation of the Artonomous artists current and future perceived value as measured by the collective actions of agents interacting with the Artonomous Artist, as both collectors and patrons.
