
import fileinput
from array import array


def partition(items: array, lo: int, high: int) -> int:
    pivot = items[lo]
    i = lo - 1
    j = high + 1

    while True:

        while True:
            i += 1
            if items[i] >= pivot:
                break

        while True:
            j -= 1
            if items[j] <= pivot:
                break

        if i >= j:
            return j

        temp = items[i]
        items[i] = items[j]
        items[j] = temp


def quicksort(items: array, lo: int, high: int):
    if lo < high:
        p = partition(items, lo, high)
        quicksort(items, lo, p)
        quicksort(items, p+1, high)


if __name__ == "__main__":
    user_nums = array('i')
    for line in fileinput.input():
        user_nums.insert(0, int(line))

    quicksort(user_nums, 0, len(user_nums) - 1)
    print(user_nums)