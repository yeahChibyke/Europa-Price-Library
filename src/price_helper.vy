# pragma version >=0.4.0
"""
@license MIT
@title Price Helper
@notice This module provides a helper function to convert USD amounts to EUR using a price feed.
"""

from interfaces import AggregatorV3Interface


@internal
def _get_usd_to_eur(
    price_feed: AggregatorV3Interface, usd_amount: uint256
) -> uint256:
    price: int256 = staticcall price_feed.latestAnswer()
    assert price > 0, "Invalid price!!!"
    dec8: uint8 = staticcall price_feed.decimals()
    dec: uint256 = convert(dec8, uint256)

    eth_price: uint256 = convert(price, uint256) // (10**dec)
    eth_equivalent: uint256 = (usd_amount * (10**dec)) // eth_price
    return eth_equivalent
    # will return results in e8...divide result by e8 to get real-world pricing
