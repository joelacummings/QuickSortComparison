/**
Ah Quicksort in good ol' C, possibly the QuickSort.
This is a very simple recursive implementation of quicksort.
It is using the Hoare method for partitioning. 
The algorithim is very simple and this implementation will serve as my benchmark
*/

#include<stdio.h>
#include<stdlib.h>

int partition(int items[], int lo, int high);

/**
 The recursive quicksort function. 
 This function calls partition and sorts the returned sub arrays
 */
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
    
	int *nums = (int*)malloc(sizeof(int)*100);
	char buff[15];
	int numCounter = 0, curArrSize = 100;
    
    // Read input from stdin
	while(fgets(buff, 15, stdin)) {
		if (numCounter >= curArrSize) {
			nums = (int *) realloc(nums, ((curArrSize * 3)/2 + 1)*sizeof(int));
			curArrSize = (curArrSize * 3)/2 + 1;
		}
		nums[numCounter] = atoi(buff); 
		numCounter++;
		// Clear out the damn buffer!
		for (int i = 0; i < 15; i++) {
			buff[i] = ' ';
		}
		
	}
    // Sort the numbers
    QuickSort(nums, 0, numCounter-1);

    // output the sorted numbers
    for (int i = 0; i < numCounter; i++) {
        printf("%d, ", nums[i]);
    }
    
    // of course memory must be freed in C.
    free(nums);
    return 0;
}
