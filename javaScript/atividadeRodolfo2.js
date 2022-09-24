// Sara Rayane Araujo Lopes 

/* 
Fazer um programa que: 
Tenha uma listagem de produtos com nome e código.
Versão 2: objeto com código, nome, preço 
Fazer a abetura da compra a solicitar o código e quantidade do produto
adcionar ao subtotal e informar ao mesmo tempo no console e de forma visual para cliente.
Ter um critério de parada para finalizar a listagem dos produtos. 
Informar o preço final.
05 produtos no mínimo  
*/ 
/*
var produtos = [
        produto01 = {
            Codigo: 1, 
            Nome: "Chocolate", 
            Preco: 7.89
        },
        produto02 = {
            Codigo: 2, 
            Nome: "Salgado", 
            Preco: 5.00
        },
        produto03 = {
            Codigo: 3, 
            Nome: "Biscoito", 
            Preco: 2.00
        },
        produto04 = {
            Codigo: 4, 
            Nome: "Jujuba", 
            Preco: 0.99
        },
        produto05 = {
            Codigo: 5, 
            Nome: "Maçã Verde", 
            Preco: 3.50
        },
        produto06 = {
            Codigo: 6, 
            Nome: "Pirulito", 
            Preco: 1.00
        },
        produto07 = {
            Codigo: 7, 
            Nome: "Guaraná", 
            Preco: 5.00}
]

var i = 0;

do {
    confirm(`Essa é a lista dos produtos disponíveis: 
    1 - Chocolate R$ 7.89
    2 - Salgado R$ 5.00
    3 - Biscoito R$ 2.00
    4 - Jujuba R$ 0.99
    5 - Maçã Verde R$ 3.50
    6 - Pirulito R$ 1.00
    7 - Guaraná R$ 5.00`)
        
    let id = Number(prompt(`Qual é o código produto que você comprou?`));
    
    let index = produtos.findIndex(produtos => produtos.Codigo == id);

    let valor = Number((produtos[index].Preco))

    let quantidade = Number(prompt(`Quantos desse produto você comprou?`));


    let subtotal = Number(valor * quantidade)

    prompt (`Sua compra está dando R$ ${subtotal}. 
    Deseja continuar comprando?

    1 - Sim
    2 - Não `)

// essa parte ak n ta pegando 
    /*if (i == 1) {
        subtotal += subtotal;
    } else if (i == 2) {
        alert(`Compra finalizada com sucesso! Volte sempre.`);
    } else {
        alert(`Esse valor não está entre as opções.`);
    } *//*
    switch (i) {
        case 1: subtotal += subtotal;
// aí aqui, o subtotal iria se somando as novas compras 
        break;

        case 2: alert(`Compra finalizada com sucesso! Volte sempre.`);
        break;

        default: 
            alert(`Esse valor não está entre as opções.`);
    }*//*
i++; } while ( i <= 2);
*/
// Resolução

var check = 0;

var subtotal = 0;

var produtos = [
    produto01 = {
        Codigo: 1, 
        Nome: "Chocolate", 
        Preco: 7.89
    },
    produto02 = {
        Codigo: 2, 
        Nome: "Salgado", 
        Preco: 5.00
    },
    produto03 = {
        Codigo: 3, 
        Nome: "Biscoito", 
        Preco: 2.00
    },
    produto04 = {
        Codigo: 4, 
        Nome: "Jujuba", 
        Preco: 0.99
    },
    produto05 = {
        Codigo: 5, 
        Nome: "Maçã Verde", 
        Preco: 3.50
    },
    produto06 = {
        Codigo: 6, 
        Nome: "Pirulito", 
        Preco: 1.00
    },
    produto07 = {
        Codigo: 7, 
        Nome: "Guaraná", 
        Preco: 5.00}
]

document.write(`Nota fiscal <br> <br>`)

while (check == 0) {
    let menu = prompt(`Selecione o que você deseja fazer:
     1 - Novo Produto 
     2 - Finalizar `);
        if (menu == 1 ) {
            confirm(`Essa é a lista dos produtos disponíveis: 
                1 - Chocolate R$ 7.89
                2 - Salgado R$ 5.00
                3 - Biscoito R$ 2.00
                4 - Jujuba R$ 0.99
                5 - Maçã Verde R$ 3.50
                6 - Pirulito R$ 1.00
                7 - Guaraná R$ 5.00`);
            let id = prompt(`Digite o código do seu produto: `);
            let index = produtos.findIndex(produtos => produtos.Codigo == id);
// acha a localização do objeto e atribui a variavel 
            var valor = ((produtos[index]).Preco);
// dessa forma, pega a localização dele e acha seu preço 
            let quantidade = Number(prompt(`Digite a quantidade do seu produto: `));

            let subtotaldoProduto = (quantidade * valor);

            console.log(`${(produtos[index]).Nome} + ${qauntidade} = ${subtotaldoProduto} `);
            console.log(`Subtotal = ${subtotal + subtotaldoProduto}`);
            subtotal = subtotal + subtotaldoProduto;

            document.write(`${(produtos[index]).Nome} + ${qauntidade} = ${subtotaldoProduto} <br>`)
        } else if (menu == 2) {
                check = check++;
                console.log(`O total da sua compra é: R$ ${subtotal}`);
                document.write(`O total da sua compra é: R$ ${subtotal}`);
        } else {
            alert(`Esse número não está entre as opções!`)
        }
}
