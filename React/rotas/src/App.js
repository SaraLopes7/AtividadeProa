
import './App.css';
import {BrowserRouter as Router, Routes, Route, Link} from 'react-router-dom'
import Menu from './Menu'
import Home from './Home'
import Historico from './Historico'
import Horario from './Horario'
import Trabalhe from './Trabalhe'
import Informacoes from './Informacoes'
import Footer from './Footer'

function App() {
  return (
    <div>
        <Router>
          <header className="header">
            <Menu/>
          </header>
          <body className="body">
            <Routes>
              <Route path='/Home' element={<Home/>}/>
              <Route path='/Historico' element={<Historico/>}/>
              <Route path='/Horario' element={<Horario/>}/>
              <Route path='/Trabalhe' element={<Trabalhe/>}/>
              <Route path='/Informacoes' element={<Informacoes/>}/>
            </Routes>
          </body>
          <footer className="header">
            <Footer/>
          </footer>
        </Router>
    </div>
  );
}

export default App;
