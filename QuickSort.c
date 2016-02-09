/**
Ah Quicksort in good ol' C, possibly the QuickSort.
This is a very simple recursive implementation of quicksort.
It is using the Hoare method for partitioning. 
The algorithim is very simple and this implementation will serve as my benchmark
*/

#include<stdio.h>
#include<stdlib.h>

int partition(int items[], int lo, int high);
void QuickSort(int items[], int lo, int high);

void QuickSort(int items[], int lo, int high) {
    if (lo < high) {
        int p = partition(items, lo, high);
        QuickSort(items, lo, p);
        QuickSort(items, p+1, high);
    }
    
}


int partition(int items[], int lo, int high) {
    
    int pivot = items[lo];
    int i = lo - 1;
    int j = high + 1;
    
    while(1) {
        
        do {
            i += 1;
        } while (items[i] < pivot);
        
        do {
            j -= 1;
        } while(items[j] > pivot);
        
        if (i >= j) {
            return j;
        }
        
        int temp = items[i];
        items[i] = items[j];
        items[j] = temp;
        
    }
    
}

int main() {
    
    int myInts[] = {5,7,1, -1, 45, 817, 19};

    QuickSort(myInts, 0, (int)(sizeof(myInts)/ sizeof(int))-1);

    for (int i = 0; i < (int)(sizeof(myInts) / sizeof(int)); i++) {
        printf("%d, ", myInts[i]);
    }
    
    return 0;
}
