# pragma version >=0.4.0
"""
@license MIT
@title Get USD per EUR
@notice This contract retrieves the USD to EUR exchange rate using a price helper.
"""

# -- Imports -- #

from interfaces import AggregatorV3Interface

import price_helper

# -- Variables -- #

PRICE_FEED: public(immutable(AggregatorV3Interface))

# -- Init -- #

@deploy
def __init__(address_to_use: address):
    PRICE_FEED = AggregatorV3Interface(address_to_use)


# -- External Defs -- #

@external
def getUSDperEUR(usdAmount: uint256) -> uint256:
    return price_helper._get_usd_to_eur(PRICE_FEED, usdAmount)
