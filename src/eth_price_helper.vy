# pragma version >=0.4.0
"""
@license MIT
@title Price Helper
@notice This module provides a helper function to convert ETH amounts to EUR using a combination of ETH/USD price feed and some chad maths.
"""

# -- Imports -- #

from interfaces import AggregatorV3Interface

import price_helper

# -- Variables -- #

PRECISION: constant(uint256) = 1 * (10**18)

# -- Internal Defs -- #

@internal
def _get_eth_to_usd(
    price_feed: AggregatorV3Interface, eth_amount: uint256
) -> uint256:
    price: int256 = staticcall price_feed.latestAnswer()
    assert price > 0, "Invalid price!!!"
    dec8: uint8 = staticcall price_feed.decimals()
    dec: uint256 = convert(dec8, uint256)
    CATCH_UP: uint256 = 1 * (10**dec)

    eth_to_usd_price: uint256 = convert(price, uint256) * (10**10)
    # usd_eq: uint256 = (eth_to_usd_price * eth_amount * CATCH_UP) // PRECISION
    usd_eq: uint256 = (eth_to_usd_price * eth_amount) // PRECISION
    return usd_eq


@internal
def _get_eth_to_eur(
    price_feed: AggregatorV3Interface, eth_amount: uint256
) -> uint256:
    FACTOR: uint256 = 1
    eth_per_usd: uint256 = self._get_eth_to_usd(price_feed, FACTOR)
    usd_per_eur: uint256 = price_helper._get_usd_to_eur(price_feed, FACTOR)
    eur_eq: uint256 = eth_per_usd * usd_per_eur
    return eur_eq


    # 9999_999_936_000_000.00
    # 99_971_653.00
    # 999977_204_580_000_000.00
