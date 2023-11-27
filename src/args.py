import argparse

parser = (
    argparse.ArgumentParser(description="PyTorch ImageNet Training")
    .add_argument("--password", type=str, help="Database password")
)

args = parser.parse_args()
