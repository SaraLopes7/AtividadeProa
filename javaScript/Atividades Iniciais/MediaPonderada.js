// Sara Rayane Araujo Lopes

var nota1 = parseFloat(window.prompt('Digite a primeira nota: '));
// isso gera uma caixa para o usuario digitar 
var nota2 = parseFloat(window.prompt('Digite a segunda nota: '));
// converte string para float 
var nota3 = parseFloat(window.prompt('Digite a terceira nota: '));
var nota4 = parseFloat(window.prompt('Digite a quarta nota: '));

var peso1 = 1.5;
var peso2 = 1.5;
var peso3 = 3;
var peso4 = 4;

// var media = (nota1 + nota2)/2;

var pesos = peso1 + peso2 + peso3 + peso4;

var total = ((peso1 * nota1)+(peso2 * nota2)+(peso3 * nota3)+(peso4 * nota4))/ pesos;

/*
A média aritmética ponderada é calculada multiplicando cada valor do conjunto de dados pelo seu peso. Depois, encontra-se a soma desses valores que será dividida pela soma dos pesos.

nota 1 - 1.5
nota 2 - 1.5
nota 3 - 3
nota 4 - 4
*/

//.tofixed(casas decimais) - para limitar as casas decimais 

if (total >= 7 && total <= 10) {
    alert(`O aluno(a) está aprovado(a) com a media ${total}`);
} else if (total < 7 && total >= 5) {
    alert(`O aluno(a) está em recuperação com a media ${total}`);
} else if (total < 5 && total >= 1) {
    alert(`O aluno(a) está reprovado(a) com a media ${total}`);
} else {
    alert(`nota não aceita`);
}