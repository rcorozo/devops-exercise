package main

import (
    "fmt"
    "log"
    "net/http"

    "github.com/gorilla/mux"
)

func devOps(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "BPICHE - DevOps Technical Assessment")
}

func handleRequests() {
    router := mux.NewRouter().StrictSlash(true)
    router.HandleFunc("/DevOps", devOps)
    log.Fatal(http.ListenAndServe(":8080", router))
}

func main() {
    handleRequests()
}