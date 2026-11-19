package main

import (
	"fmt"
	"strings"

	"github.com/golang-jwt/jwt/v4"
	"github.com/google/uuid"
	"golang.org/x/net/html"
)

func main() {
	token, _ := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{"demo": true}).SignedString([]byte("sample-only"))
	page, _ := html.Parse(strings.NewReader("<p>sample</p>"))
	fmt.Println("sample-go", uuid.NewString(), len(token), page.Data)
}
