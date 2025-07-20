# pragma version >=0.4.0
"""
@license MIT
@title Get ETH per EUR
@notice This contract retrieves the ETH to EUR exchange rate using a price helper.
"""

# -- Imports -- #

from interfaces import AggregatorV3Interface
import eth_price_helper

# -- Variables -- #

PRICE_FEED: public(immutable(AggregatorV3Interface))

# -- Init -- #

@deploy
def __init__(address_to_use: address):
    PRICE_FEED = AggregatorV3Interface(address_to_use)

# -- External Defs -- #

@external 
def getETHperEUR(eth_amount: uint256) -> uint256:
    return eth_price_helper._get_eth_to_eur(PRICE_FEED, eth_amount)
    