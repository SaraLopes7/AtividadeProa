/* Sara Rayane Araujo lopes */

/*
 Crie um método que execute as seguintes operações:
    - Peça a quantidade de valores que será digitado pelo usuário
    - Utilize números ímpares
    - Opere em ordem crescente
    - Imprimir na tela
*/ 
var numeros = [];

var quantidadePedida = parseInt(window.prompt("Quantos números você deseja inserir? "));

for (i = 0; i < quantidadePedida; i ++) {
    var inserido = parseInt(window.prompt(`Digite o ${i+1}° número`));
    if (inserido % 2 != 0) {
        numeros.push(inserido);
    }
}

numeros.sort();

// document.getElementById("espaco").innerHTML = numeros;

document.write("<h1>" + "Dos números que você digitou, os ímpares são " + numeros + "</h1>");