alert("Hello Word")
// comentario de uma linha 

/* 
comentario de mais de uma linha 
*/

/* var nome = "Sara";
 variavel do tipo string */

/* var number = 10;
 variavel do tipo numerica */

/* var teste = false;
 variavel do tipo boleana */

// var num1 = 10; numerica
// var num2 = '10'; string

/* alert(num1 == num2);
considera apenas conteudo
alert(num1 === num2);
considera tambem o tipo de dado */

/* var perfeita = "Luna LoveGood";
console.log("A personagem mais perfeita do mundo é "+ perfeita); */
// é igual o sout de java
/* console.log(`O conteudo
 da variavel é ${perfeita}`); */
// aqui é dentro de crase, ele respeita as quebras de linha

/* estrutura de controle de fluxos 
estruturas condicionais (if, else, switch case)*/ 
//simples 
/* var teste = 10;
if (teste > 8) {
    console.log("A expressão é verdadeira")
} */
//composta 
/* var teste = 5;
if (teste > 8) {
    console.log("A expressão é verdadeira")
} else {
    console.log("A expressão é falsa")
} */
//encadeada
/* var teste = 10; // 5, 9, 15.
if (teste <= 8) {
    console.log("A expressão é verdadeira")
} else if (teste > 8 && teste < 10){
    console.log("A segunda expressão é verdadeira")
} else {
    console.log("Nenhuma expressão é verdadeira")
} */
/* estruturas de repetição (for, while, do while) 
*/

//Atividade 
//Cáluclo de IMC

var peso = 57;
var altura = 1.62;
var resultado = (peso / (altura * altura));

console.log("Seu IMC é: " + resultado);
if (resultado <= 18.5){
    console.log("Está abaixo do peso")
} else if (resultado > 18.5 && resultado <= 24.9) {
    console.log("Está com o peso normal")
} else if (resultado > 24.9 && resultado <= 29.9) {
    console.log("Está np sobrepeso")
} else if (resultado > 29.9 && resultado <= 34.9) {
    console.log("Está em obesidade I")
} else if (resultado > 34.9 && resultado <= 39.9) {
    console.log("Está em obesidade II")
} else if (resultado > 39.9 && resultado <= 40) {
    console.log("Está em obesidade III")
} else {
    console.log("Está em obesidade mórbida")
}
//Cálculo de média

var nota1 = 15;
var nota2 = 15;
var nota = ((nota1+nota2)/2);

if (nota < 5) {
    console.log("Aluno Reprovado");
} else if (nota >= 5 && nota <= 7){
    console.log("aluno em Recuperação");
} else if(nota > 7 && nota <10){
    console.log("Aluno Aprovado");
} else {
    console.log("média não aceita");
}
/* var Altura = Number(window.prompt('Altura'))
var Peso = Number(window.prompt('Peso'))
var media = Peso /(Altura * Altura) 



 if(media <= 15)

{alert('MAGREZA')}

else if (media > 15 && media <= 25)

{alert('SAUDÁVEL')}

else if (media > 25 && media <= 35)

{alert('OBESIDADE DE GRAU 1')}

else if (media > 35 && media <= 40)

{alert('OBESIDADE DE GRAU 2')}

else if(media > 40 && media <= 50)

{alert('OBESIDADE DE GRAU 3')}

else 
{alert('OBESIDADE MÓRBIDA')} */