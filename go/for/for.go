package main

import (
	"fmt"
)

func main() {
	var i = 0

	for i < 26 {
		fmt.Printf("i: %c\n", 'a'+i)
		i++
	}

	for i := 0; i < 10; i++ {
		fmt.Println("i:", i)
	}

	numbers := []int{1, 2, 3, 4, 5}

	for i, n := range numbers {
		fmt.Println("the index value of the loop is", i)
		fmt.Println("The value from the array is", n)
	}
}
