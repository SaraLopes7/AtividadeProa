/*
Faça um novo projeto React (limpem a parte principal do projeto base/template), crie 3 componentes que ajam como Header, Body e Footer

Após a criação desses componentes, importe eles para o app.js para que ajam como Header, Body e Footer como numa página html. */

import Header from './Header';
import Body from './Body';
import Footer from './Footer';

 function App() {
  return (
      <div>
          <div>
            <Header/>
          </div>
          <div>
            <Body/>
          </div>
          <div>
            <Footer/>
          </div>
      </div> 
  );
}

export default App;

