import numpy as np
import pytest

from smart.threshold import simple_threshold, adaptive_threshold_mean, adaptive_threshold_gaussian, otsu_threshold


@pytest.mark.parametrize("threshold", [0, 90, 150, 255])
@pytest.mark.parametrize("invert", [False, True])
def test_simple_threshold(threshold, invert):
    image = np.zeros((10, 10), dtype=np.uint8)
    value = 255
    image[5, 5] = value
    mask = simple_threshold(image, threshold, invert)
    if threshold >= value:
        assert mask[5, 5] == (255 if invert else 0)
    else:
        expected = (255 - image.copy()) if invert else image.copy()
        assert np.array_equal(mask, expected)


@pytest.mark.parametrize("invert", [False, True])
def test_adaptive_threshold_mean(invert):
    image = np.zeros((10, 10), dtype=np.uint8)
    image[5, 5] = 255
    mask = adaptive_threshold_mean(image, invert)
    # TODO


@pytest.mark.parametrize("invert", [False, True])
def test_adaptive_threshold_gaussian(invert):
    image = np.zeros((10, 10), dtype=np.uint8)
    image[5, 5] = 255
    mask = adaptive_threshold_gaussian(image, invert)
    # TODO


@pytest.mark.parametrize("invert", [False, True])
def test_otsu_threshold(invert):
    image = np.zeros((10, 10), dtype=np.uint8)
    image[5, 5] = 255
    mask = otsu_threshold(image, invert)
    # TODO
