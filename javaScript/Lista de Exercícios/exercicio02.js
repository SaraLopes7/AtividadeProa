/* Questão 2

Crie um código que imprima para o usuário a tabuada de certo número. Preferencialmente trabalhe com uma caixa de input e um botão na sua página. */

function tabuada ()  {
    let numero = document.getElementById("tabuada").value;
    document.write(`<h2>Tabuada de ${numero}:</h2>
                    <h3>${numero} * 1 = ${numero * 1}</h3>
                    <h3>${numero} * 2 = ${numero * 2}</h3>
                    <h3>${numero} * 3 = ${numero * 3}</h3>
                    <h3>${numero} * 4 = ${numero * 4}</h3>
                    <h3>${numero} * 5 = ${numero * 5}</h3>
                    <h3>${numero} * 6 = ${numero * 6}</h3>
                    <h3>${numero} * 7 = ${numero * 7}</h3>
                    <h3>${numero} * 8 = ${numero * 8}</h3>
                    <h3>${numero} * 9 = ${numero * 9}</h3>
                    <h3>${numero} * 10 = ${numero * 10}</h3>`)

}