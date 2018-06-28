## Descriptive Goals
	
Artonomous is a self-sustaining, self-improving, autonomous artist. It generates art by itself, sells it and incentivizes humans to improve the art it creates. Owners of the art piece owns the scarce, immutable, collectible. This is implemented on the Ethereum blockchain.
-	Quote from Readme (Simon)

## System Level Requirements
	
The Artonomous economy has 3 roles:
1)	The Artonomous Artist
2)	The Art Collector/Trader
3)	The Patron/Investor

The Artonomous Artist must always have enough funds to cover its operational expenses associated with generating new artwork and issuing tokens, selling and maintaining the state of all art tokens generated. 

An Art Collector/Trader needs to have the opportunity to purchase art from the Artists, to purchase are from other Collector/Traders and to have the ownership state of their artwork maintained. The collector requires that the price setting process for artwork being sold by the artist is transparent (current price is queriable).

The Patron/Investor needs to be able to bond Ethereum in support of the Autonomous Artist and to share in the financial success of the Artist. While the value per soul varies programmatically, the Patron/Investor requires that every soul (including fractions) is redeemable for Ethereum from the Pool. 

##Failure Modes
Failure mode 1: if the artwork is deemed undesirable or overpriced Collector/Traders may not buy new artwork, this will lead to operational losses as operational costs of issuing art deplete the pool. While Patrons/Investors may subsidize this process for a time, it may lead to Failure mode 2.

Failure mode 2: if there is a loss in confidence by Patrons and all souls are returned for Ethereum, the pool may be emptied and the Artonomous Artist my lack the funds to generate and sell new artworks.

##Design Goals
1)	Give each artwork the opportunity to be purchased at a market discovered price by designing an auction mechanism for the “Purchase” action. Thus ensuring the a continued revenue stream for the Artonomous Artist.
2)	Provide the Patron/Investors with a bonding curve that allows them to sustainably support the activities of the Artonomous Artist and share in its profits via a withdraw function without violating goal 1. 
3)	Define the minting and burning mechanisms such that the floating supply of souls is a representation of the Artonomous artists current and future perceived value as measured by the collective actions of agents interacting with the Artonomous Artist, as both collectors and patrons.
