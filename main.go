package main

import(
	"fmt"
        "log"
	"net/http"
 )	

func InciarSiteEstatico(){
	fileServer := http.FileServer(http.Dir("./site")) //Abre a pasta com os arquivos do site
    http.Handle("/", fileServer) //executa a partir do index
 }

func main(){
	InciarSiteEstatico()
	fmt.Println("Server iniciando em http://localhost:8000")
	if err := http.ListenAndServe(":8000", nil); err != nil {
        log.Fatal(err)
    }
}