import argparse

args = (
    argparse.ArgumentParser(description="PyTorch ImageNet Training")
    .add_argument("--password", type=str, help="Database password")
    .parse_args()
)
