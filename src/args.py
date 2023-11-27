import argparse

parser = argparse.ArgumentParser(description="PyTorch ImageNet Training")
parser.add_argument("--password", type=str, help="Database password")
parser.add_argument("--linkblue", type=str, help="Linkblue username")


args = parser.parse_args()
