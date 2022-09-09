/* palavra reservada, nome da função, (parametros) {
    comando1
    comando2
    return o valor q  ele vai retornar 
}
*/
// função normal
function soma1(a, b) {   
    return a + b;
}
console.log(soma1(7, 6)) 

// variável função 
var soma2 = function (num1, num2) {
    return num1 + num2;
} 
console.log(soma2(13, 17));

// arrow function (substituir a palavra reservada pela setinha)
var soma3 = (a, b) => {
    return a + b;
}
console.log(soma3(5, 10)); 