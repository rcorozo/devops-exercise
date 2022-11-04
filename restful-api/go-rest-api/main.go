package main

import (
    "encoding/json"
    "fmt"
    "io/ioutil"
    "log"
    "net/http"

    jwt "github.com/dgrijalva/jwt-go"
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

var mySigningKey = []byte("captainjacksparrowsayshi")
var myAPIKey = "2f5ae96c-b558-4c7b-a590-a501ae1c3f6c"

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

func isAuthorized(endpoint func(http.ResponseWriter, *http.Request)) http.HandlerFunc {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {

        if r.Header.Get("X-Parse-REST-API-Key") != "" && r.Header.Get("X-JWT-KWY") != "" {
            if r.Header.Get("X-Parse-REST-API-Key") == myAPIKey {
                token, err := jwt.Parse(r.Header.Get("X-JWT-KWY"), func(token *jwt.Token) (interface{}, error) {
                    if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
                        return nil, fmt.Errorf("There was an error")
                    }
                    return mySigningKey, nil
                })

                if err != nil {
                    fmt.Fprintf(w, err.Error())
                }

                if token.Valid {
                    endpoint(w, r)
                }
            } else {
                w.WriteHeader(500)
                fmt.Fprintf(w, "Provided APIKey is not correct.")
            }
        } else {
            w.WriteHeader(500)
            fmt.Fprintf(w, "You have to set X-Parse-REST-API-Key and X-JWT-KWY to use the API.")
        }
    })
}

func notFound(w http.ResponseWriter, r *http.Request) {
    w.WriteHeader(500)
    fmt.Fprintf(w, "ERROR")
    return
}

func handleRequests() {
    router := mux.NewRouter().StrictSlash(true)
    router.HandleFunc("/DevOps", isAuthorized(devOps)).Methods("POST")
    router.NotFoundHandler = http.HandlerFunc(notFound)
    router.MethodNotAllowedHandler = http.HandlerFunc(notFound)
    log.Fatal(http.ListenAndServe(":8080", router))
}

func main() {
    handleRequests()
}
