// import logo from './logo.svg';
import './App.css';
/* import Componente02 from './Componente02' */
import RecipeReviewCard from './Componente02'

var titulos = [
  {titulo: "Shigatsu wa Kimi no Uso", 
   sub:"Your Lie in April",
   ano: " 9 de outubro de 2014",
   objetivo:"Causar dor & Sofrimento",
   indico:"Pq é bom p caramba!"}
]

function App() {
  return (
    <div className="App-header">
      {titulos.map(
        (dado) => (<RecipeReviewCard titulo={dado.titulo} sub={dado.sub} ano={dado.ano} objetivo={dado.objetivo} indico={dado.indico}/>))}
    </div>
  );
}

export default App;
