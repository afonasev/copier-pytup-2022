import pytest

from simple import get_numbers_sum


def test_get_numbers_sum():
    assert get_numbers_sum(1, 2) == 3
