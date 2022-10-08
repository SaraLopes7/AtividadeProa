/* Desenvolva um código que simule uma eleição com três candidatos:

Candidato A - 753
Candidato B - 675
Candidato C - 075

O programa vai: 

Pedir o número do candidato -> Aparecer o número e o nome caso for válido.
Caso contrário aparecer "Voto Nulo?" -> 
Pedir para confirmar o voto -> Ao confirmar, adcionar voto ao candidato.
Perguntar se outra pessoa vai votar e 
Caso sim -> Reiniciar. 
Caso não -> finalizar a votação.
Anunciar o resultado da votação e se der empate, anunciar que terá segundo turno.
Bônus: Se a quantidade de votos nulos for mais que 50% chamar nova eleição com novos candidatos. */

var candidatos = [
    candidato01 = {
        Nome: "Herminone Granger",
        Numero: 753
    },
    candidato02 = {
        Nome: "Harry Potter",
        Numero: 675
    },
    candidato03 = {
        Nome: "Ronald Wesley",
        Numero: 075
    },
    candidato04 = {
        Nome: "Nulo",
        Numero: " "
    }
]

do {
    var voto = Number(prompt(`Bem vindo! Faça seu voto:
    Candidato A: 753
    Candidato B: 675
    Candidato C: 075`));
    if (voto == 753) {
        var confirmar = Number(prompt(`Você deseja votar no(a) candidato(a)?
            ${candidatos.candidato01.Nome}
            ${candidatos.candidato01.Numero}`));
    } else if (voto == 675) {
        confirmar = Number(prompt(`Você deseja votar no(a) candidato(a):
        ${candidatos.candidato02.Nome}
        ${candidatos.candidato02.Numero}`));
    } else if (voto == 075) {
        confirmar = Number(prompt(`Você deseja votar no(a) candidato(a):
        ${candidatos.candidato03.Nome}
        ${candidatos.candidato03.Numero}`));
    } else {
        confirmar = Number(prompt(`Você deseja votar nulo?`));
    }
voto++ } while (voto == 753 || voto != 675 || voto != 075);
