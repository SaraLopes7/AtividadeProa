/* Questão 4

Trabalhe novamente com o seu exercício do caixa de mercado (proposto na aula 12 de JavaScript) e adicione ao menu a opção de cadastrar um produto. */

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
     1 - Comprar Produto 
     2 - Finalizar
     3 - Cadastrar Novo produto `);
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

            console.log(`${(produtos[index]).Nome} + ${quantidade} = ${subtotaldoProduto} `);
            console.log(`Subtotal = ${subtotal + subtotaldoProduto}`);
            subtotal = subtotal + subtotaldoProduto;

            document.write(`${(produtos[index]).Nome} + ${quantidade} = ${subtotaldoProduto} <br>`)
        } else if (menu == 2) {
                check = check++;
                console.log(`O total da sua compra é: R$ ${subtotal}`);
                document.write(`O total da sua compra é: R$ ${subtotal}`);
        } else if (menu == 3) {

        } else {
            alert(`Esse número não está entre as opções!`)
        }
        
}
