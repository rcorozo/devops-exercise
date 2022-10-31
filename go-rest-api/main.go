package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

type userMessage struct {
	Message       string `json:"message"`
	From          string `json:"from"`
	To            string `json:"to"`
	TimeToLifeSec int    `json:"timeToLifeSec"`
}

type serverReplyMessage struct {
	ReplyMessage string `json:"message"`
}

func devOps(w http.ResponseWriter, r *http.Request) {
	var newMessage userMessage
	reqBody, err := ioutil.ReadAll(r.Body)
	if err != nil {
		fmt.Fprintf(w, "Keyboard not found. Press a button to Resume.")
	}

	json.Unmarshal(reqBody, &newMessage)
	//w.Header().Set("Content-Type","application/json")
	w.WriteHeader(http.StatusOK)

	var newReply serverReplyMessage
	newReply.ReplyMessage = "Hello " + newMessage.From + " your message will be send."

	json.NewEncoder(w).Encode(newReply)
}

func notFound(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(500)
	fmt.Fprintf(w, "ERROR")
	return
}

func handleRequests() {
	router := mux.NewRouter().StrictSlash(true)
	router.HandleFunc("/DevOps", devOps).Methods("POST")
	router.NotFoundHandler = http.HandlerFunc(notFound)
	router.MethodNotAllowedHandler = http.HandlerFunc(notFound)
	log.Fatal(http.ListenAndServe(":8080", router))
}

func main() {
	handleRequests()
}
