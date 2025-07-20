from src.mocks import mock_v3_aggregator
from moccasin.boa_tools import VyperContract

STARTING_DECIMALS = 8
EUR_STARTING_PRICE = int(1.16e8)


def deploy_eur() -> VyperContract:
    return mock_v3_aggregator.deploy(STARTING_DECIMALS, EUR_STARTING_PRICE)


def moccasin_main():
    return deploy_eur()

# 1_00_000_000.00
