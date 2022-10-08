// Sara Rayane Araujo lopes

// estrutura de repetição - for, while e do while 

/* for (var i = 0; i < 10; i++) {
// inicia; condição; incremento
    // comando ou bloco de comandos
    alert(i);
} */
// a variavel n pode ser declarada antes, tem que ser dentro do for msm

/* var i = 0;

while(i < 10) {
    // comando ou bloco de comandos
    alert(i);
    i++
} */

/* var i = 0;

do {
    alert(i)
    i++
    // executa no minimo uma vez e dps vai pro while
    // comando ou bloco de comandos
} while (i < 10) */

/*
Menu principal
- calcular a media e resultado (aprovado e reprovado)
- calculadora simples (4 operaçoes)
usuario escolha encerrar 
*/
var escolha = 0;
do {
    var escolha = parseFloat(window.prompt("1 - Calcular Media \n2 - Usar Calculadora \n3 - Encerrar: "));
    
    switch(escolha) {
        case 1: 
            var nota1 = parseFloat(window.prompt("Digite a primeira nota: "));
            var nota2 = parseFloat(window.prompt("Digite a segunda nota: "));
            var nota = ((nota1+nota2)/2);
                if (nota < 5) {
                    alert(`Aluno Reprovado com media ${nota}`);
                } else if (nota >= 5 && nota <= 7){
                    alert(`aluno em Recuperação com media ${nota}`);
                } else if(nota > 7 && nota <= 10){
                    alert(`Aluno Aprovado com media ${nota}`);
                } else {
                    alert(`Média não Aceita`);
                }
        ;break;

        case 2:
            var num1 = parseFloat(window.prompt("Digite um numero: "));
            var num2 = parseFloat(window.prompt("Digite um numero: "));

            var operacao = parseFloat(window.prompt("1 - adição \n2 - subtração \n3 - multiplicação \n4 - divisão \nEscolha a operação: "));
        
            switch(operacao) {
                case 1: alert(`Seu resultado é: ${num1 + num2}`);break;
                case 2: alert(`Seu resultado é: ${num1 - num2}`);break;
                case 3: alert(`Seu resultado é: ${num1 * num2}`);break;
                case 4: alert(`Seu resultado é: ${num1 / num2}`);break;
            }
        case 3: {alert("Loop encerrado")}
        ;break;
} escolha++; } while (escolha <= 3); 

if (escolha >= 4) {
    alert("Valor não está entre as opções")
}