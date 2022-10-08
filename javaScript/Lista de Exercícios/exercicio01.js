/* Questão 1

Crie um código que imprima a contagem de 0 até um número colocado pelo usuário, imprimindo apenas números ímpares. */



var numero = prompt(`Insira um número: `)

var contador = 0;

while (contador < numero) {
    contador++ ;
    if (contador % 2 == 1) {
        document.write(`<h3>Contagem do número inseridos: ${contador}</h3>`); 
    }
} 

document.write(`<h2>Cabosse!</h2>`)