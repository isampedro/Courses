package main

import (
	"fmt"
	"strconv"
)

type Movie struct {
	Name   string
	Rating float64
}

func (m *Movie) Summary() string {
	return m.Name + ", " + strconv.FormatFloat(m.Rating, 'f', 1, 64)
}

func main() {
	m := Movie{
		Name:   "Citizen Kane",
		Rating: 10,
	}

	fmt.Println(m.Summary())

	fmt.Println(m.Name, m.Rating)
	fmt.Printf("%+v\n", m)
}
