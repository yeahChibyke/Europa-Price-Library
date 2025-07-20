from src.mocks import mock_v3_aggregator
from moccasin.boa_tools import VyperContract

STARTING_DECIMALS = 8
EUR_TO_USD_STARTING_PRICE = int(1.16e8)
ETH_TO_USD_STARTING_PRICE = int(3600e8)


def deploy_eur_to_usd() -> VyperContract:
    return mock_v3_aggregator.deploy(STARTING_DECIMALS, EUR_TO_USD_STARTING_PRICE)

def deploy_eth_to_eur() -> VyperContract:
    return mock_v3_aggregator(STARTING_DECIMALS, ETH_TO_USD_STARTING_PRICE)


def moccasin_main():
    return deploy_eur_to_usd()

# 1_00_000_000.00
