/* Questão 3

Crie um código que peça o mês e o dia do aniversário do usuário, e em seguida diga qual o signo do usuário. */

function calcular () {
    let dia = document.getElementById("dia").value;
    let mes = document.getElementById("mes").value;

    if ((dia >= 21 && mes == 3) || (dia < 20 && mes == 4)) {
        document.write(`<h3>Seu signo é: Áries</h3>`);
    } else if ((dia >= 1 && mes == 4) || (dia <= 20 && mes == 5)) {
        document.write(`<h3>Seu signo é: Touro</h3>`);
    } else if ((dia >= 21 && mes == 5) || (dia <= 20 && mes == 6)) {
        document.write(`<h3>Seu signo é: Gêmeos</h3>`);
    } else if ((dia >= 21 && mes == 6) || (dia <= 22 && mes == 7)) {
        document.write(`<h3>Seu signo é: Câncer</h3>`);
    } else if ((dia >= 23 && mes == 7) || (dia <= 22 && mes == 8)) {
        document.write(`<h3>Seu signo é: Leão</h3>`);
    } else if ((dia >= 23 && mes == 8) || (dia <= 22 && mes == 9)) {
        document.write(`<h3>Seu signo é: Virgem</h3>`);
    } else if ((dia >= 23 && mes == 9) || (dia <= 22 && mes == 10)) {
        document.write(`<h3>Seu signo é: Libra</h3>`);
    } else if ((dia >= 23 && mes == 10) || (dia <= 21 && mes == 11)) {
        document.write(`<h3>Seu signo é: Escorpião</h3>`);
    } else if ((dia >= 22 && mes == 11) || (dia <= 21 && mes == 12)) {
        document.write(`<h3>Seu signo é: Sagitário</h3>`);
    } else if ((dia >= 22 && mes == 12) || (dia <= 20 && mes == 1)) {
        document.write(`<h3>Seu signo é: Capricórnio</h3>`);
    } else if ((dia >= 21 && mes == 1) || (dia <= 18 && mes == 2)) {
        document.write(`<h3>Seu signo é: Aquário</h3>`);
    } else if ((dia >= 19 && mes == 2) || (dia <= 20 && mes == 3)) {
        document.write(`<h3>Seu signo é: Peixes</h3>`);
    }
}