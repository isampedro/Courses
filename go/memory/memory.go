package main

import (
	"fmt"
)

func showMemoryAddress(x int) {
	fmt.Println(&x)
	return
}

func showMemoryAddressCorrectly(x *int) {
	fmt.Println(x)
	return
}

func main() {
	s := "Hello World"
	fmt.Println(&s)
	i := 0
	fmt.Println(&i)
	showMemoryAddress(i)
	showMemoryAddressCorrectly(&i)
}
