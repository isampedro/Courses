package main

import (
	"fmt"
	"reflect"
	"strconv"
)

func main() {
	var b bool = true
	fmt.Println(reflect.TypeOf(b))

	var s string = strconv.FormatBool(b)
	fmt.Println(reflect.TypeOf(s))

	var err error
	var nb bool
	nb, err = strconv.ParseBool(s)
	if err == nil {
		fmt.Println(reflect.TypeOf(nb))
	}
}
