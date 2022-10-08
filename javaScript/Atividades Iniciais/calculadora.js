// Sara Rayane Araujo lopes

/* var num = parseFloat(window.prompt("Digite um numero"));

switch(num) {
    case 1: alert("Valor igual a 1");break;
    case 2: alert("Valor igual a 2");break;
    case 3: alert("Valor igual a 3");break;
    default: alert("Valor não corresponde a nenhum caso") `
} */

var num1 = parseFloat(window.prompt("Digite um numero: "));
var num2 = parseFloat(window.prompt("Digite um numero: "));

var adicao = (num1 + num2);
var subtracao = (num1 - num2); 
var multiplicacao = (num1 * num2); 
var divisao = (num1 / num2);  

var operacao = parseFloat(window.prompt("1 - adição \n2 - subtração \n3 - multiplicação \n4 - divisão \nEscolha a operação: "));

 switch(operacao) {
    case 1: alert("Seu resultado é: " + adicao);break;
    case 2: alert("Seu resultado é: " + subtracao);break;
    case 3: alert("Seu resultado é: " + multiplicacao);break;
    case 4: alert("Seu resultado é: " + divisao);break;
 }