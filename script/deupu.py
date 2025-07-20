from moccasin.config import get_active_network
from moccasin.boa_tools import VyperContract
from src import GetUSDperEUR


def deploy_per_eur(price_feed: VyperContract) -> VyperContract:
    per_eur: VyperContract = GetUSDperEUR.deploy(price_feed)

    usd_amount: int = 1
    eur_equivalent: int = per_eur.getUSDperEUR(usd_amount)
    print(f"{usd_amount} USD is worth {eur_equivalent} EUR ")
    return per_eur


def moccasin_main() -> VyperContract:
    active_network = get_active_network()
    price_feed: VyperContract = active_network.manifest_named("price_feed")
    print(
        f"Currently running on {active_network.name} network and using price feed at {price_feed.address}"
    )
    return deploy_per_eur(price_feed)

# .86_206_896.00 --> mocks 
# .86_017_805. 00 --> sepolia
