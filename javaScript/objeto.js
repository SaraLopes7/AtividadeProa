// criando um objeto 
// propriedade: valor 
/*
var regua = {
    comprimento: 30,
    cor: "Prata",
    nitidez: "Opaca",
    marca: {
        pais: "EUA",
        nome: "Faber Castell"
    } 
}

console.log(regua.cor);
console.log(regua.marca);
// puxando uma informação que ta em um objeto dentro de outro objeto 
console.log(regua.marca.nome);

// adcionando um método (função) ao meu objeto 
var regua = {
    comprimento: 30,
    cor: "Prata",
    nitidez: "Opaca",
    marca: {
        pais: "EUA",
        nome: "Faber Castell"
    },
    medir: function (cm){
        console.log("Ela mede" + cm + "centímetros.");
    }
}
regua.medir(15); // a regua agora mede 15 centrimetros. */

// Atividade
/* Crie 03 objetos, cada um com 3 propriedades e 1 método e depois teste os métodos usando propriedades dos objetos deles */

var garrafa = {
    cor: "Azul",
    marca: "PlastiCor",
    preco: 321.99,
    comporta: function (litros) {
        console.log("A garrafa " + garrafa.cor + " comporta " + litros + " litros");
    }
}
garrafa.comporta(2);

var filme = {
    nome: "Harry Potter e o Enigma do Príncipe",
    genero: "Fantasia",
    ondeAssistir: "HbO Max",
    dura: function (minutos) {
        console.log("O filme " + filme.nome + " tem duração de " + minutos + " minutos");
    }
}
filme.dura(153)

var perfume = {
    nome: "Quasar",
    marca: "Oboticário",
    tons: "Amadeirado e Cítrico",
    dura: function (horas) {
        console.log("O perfume " + perfume.nome + " irá durar " + horas + " horas em você");
    }
}
perfume.dura(7);