from dataclasses import dataclass
from pathlib import Path


@dataclass
class ImageInput:
    input_file: Path
    output_directory: Path


@dataclass
class ImageResult:
    id: str
    failed: bool = False
    area: float = None
    solidity: float = None
    max_width: int = None
    max_height: int = None
    avg_curve: float = None
    n_leaves: int = None
