package main

import "fmt"

func sumNumbers(numbers ...int) (int, int) {
	total := 0
	sumI := 0
	for i, number := range numbers {
		total += number
		sumI = i
	}
	return total, sumI + 1
}

func main() {
	fmt.Println(sumNumbers(1, 2, 3, 4, 5, 6, 7, 8, 9, 10))
	return
}
