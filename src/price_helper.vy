# pragma version >=0.4.0
"""
@license MIT
@title Price Helper
@notice This module provides a helper function to convert USD amounts to EUR using a price feed.
"""

# -- Imports -- #

from interfaces import AggregatorV3Interface

# -- Variables -- #

PRECISION: constant(uint256) = 1 * (10**18)

# -- Internal Defs -- #

@internal
def _get_usd_to_eur(
    price_feed: AggregatorV3Interface, usd_amount: uint256
) -> uint256:
    price: int256 = staticcall price_feed.latestAnswer()
    assert price > 0, "Invalid price!!!"
    dec8: uint8 = staticcall price_feed.decimals()
    dec: uint256 = convert(dec8, uint256)
    CATCH_UP: uint256 = 1 * (10 ** dec)

    eur_to_usd_price: uint256 = convert(price, uint256) * (10 ** 10)
    eur_eq: uint256 = (usd_amount * PRECISION * CATCH_UP) // eur_to_usd_price
    return eur_eq
    # @dev: divide result by e8 to get real-world price

