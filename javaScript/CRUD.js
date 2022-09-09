// https://developer.mozilla.org/en-US/
// Sara Rayane Araujo Lopes

var num = 0; 

do {
    
    var menu = parseInt(window.prompt(` Escolha a opção desejada:
    1 - Cadastrar novo cliente
    2 - Consultar um cliente pelo id
    3 - Excluir um cliente pelo id
    4 - Listar todos os clientes cadastrados
    5 - Sair do sistema `)); 

    var clientes = [
        {id: 1, nome: "Luna", cpf: "222.222.222-22", endereço: "Rua Mamão", email: "LuninhaLindinha@email.com", telefone: "81977777777"},
        {id: 2, nome: "Harry", cpf: "333.333.333-33", endereço: "Rua Pinha", email: "HarryMagico@email.com", telefone: "81955555555"}
    ]
    
    switch (menu) {
        case 1: {
            // Cadastrar novo cliente
            var novoCliente = {
                id: parseInt(window.prompt("Digite o id do cliente: ")), 
                nome: window.prompt("Digite o nome do cliente: "), 
                cpf: window.prompt("Digite o cpf do cliente: "), 
                endereço: window.prompt("Digite o endereço do cliente: "), 
                email: window.prompt("Digite o email do cliente: "), 
                telefone: parseInt(window.prompt("Digite o telefone do cliente: "))
            }
            clientes.push(novoCliente);
            console.table(clientes);
            // mostra as infos do console em forma de tabela
        } ;break;
        case 2: {
            // Consultar um cliente pelo id
            var busca = parseInt(window.prompt("Digite o id do cliente: "));

            if (clientes.find(i => i.id == busca)) {
                console.table(clientes.find(i => i.id == busca)); 
            } else {
                console.log("Id informado não possui cadastro!")
            }
            /* 
            var index = clientes.findIndex(i => i.id == busca) 
            console.log(clientes[index])
            findIndex = passa a posição do vetor
            find = passa o valor do vetor
            */
        } ;break;
        case 3: {
            // Excluir um cliente pelo id
            var id = parseInt(window.prompt("Digite o id do cliente que você deseja excluir: "));

            if (clientes.find(clientes => clientes.id == id)) {
                var index = clientes.findIndex(clientes => clientes.id == id);
                clientes.splice(index, 1);
                console.table(clientes); 
            } else { console.log("Id informado não possui cadastro!")}

        } ;break;
        case 4: {
            // Listar todos os clientes cadastrados 
            console.table(clientes)
        } ;break;
        case 5: { 
            // Sair do sistema
            num += 1;
        } ;break;
        default: 
        console.log("Opção Inválida!")
    }
} while (num == 0)