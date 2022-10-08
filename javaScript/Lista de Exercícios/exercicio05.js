/* Questão 5

Crie um código que insira o residentes de um domicílio, colocando dados básicos de cada um (nome, idade, peso, altura, renda). E adicione funções que calculem os seguintes dados: renda média por residente, IMC médio na residência e idade média dos residentes. */

var residentes = [
]

function adcionaResidente () {

var novoResidente = {
    nome: document.getElementById("nome").value,
    idade: document.getElementById("idade").value,
    peso: document.getElementById("peso").value,
    altura: document.getElementById("altura").value,
    renda: document.getElementById("renda").value  
}

residentes.push(novoResidente)
console.table(novoResidente)

document.getElementById("nome").value = "";
document.getElementById("idade").value = "";
document.getElementById("peso").value = "";
document.getElementById("altura").value = "";
document.getElementById("renda").value = "";

}


/* renda média por residente */ /* É calculado dividindo o peso pela altura ao quadrado. */ 

function rendaMedia () {
    
}

/* IMC médio na residência */

function imcMedio () {
    let peso = document.getElementById("peso").value
    let altura = document.getElementById("altura").value

    let IMC = peso / (altura * altura)

    let resultado = document.getElementById("calculoImc").value
    resultado.innerHTML = (`Sua residência tem o imc médio de ${IMC}`);
}

/* idade média dos residentes */

function idadeMedia () {
    
}

/* var novoCliente = {
                id: parseInt(window.prompt("Digite o id do cliente: ")), 
                nome: window.prompt("Digite o nome do cliente: "), 
                cpf: window.prompt("Digite o cpf do cliente: "), 
                endereço: window.prompt("Digite o endereço do cliente: "), 
                email: window.prompt("Digite o email do cliente: "), 
                telefone: parseInt(window.prompt("Digite o telefone do cliente: ")) */
