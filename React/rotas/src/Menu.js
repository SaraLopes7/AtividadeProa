import { Link } from 'react-router-dom'

function Menu () {
    return (
      <div>
          <ul>
            <li><Link to="/Home">Home</Link></li>
            <li><Link to="/Historico">Histórico</Link></li>
            <li><Link to="/Horario">Horario de Atendimento</Link></li>
            <li><Link to="/Trabalhe">Trabalhe Conosco</Link></li>
            <li><Link to="/Informacoes">Informações</Link></li>
            </ul>
      </div>  
    )
}

export default Menu;

