
function Perfis (props) {
    return (
        <div>
            <img src={props.Foto} alt=""/>
            <h1>{props.Nome}</h1>
            <h2>{props.CodNome}</h2>
            <h3>{props.Idade}</h3>
            <p>{props.Descricao}</p>
            <a href={props.Link}>Link do Instagram</a>
        </div>
    )
}

export default Perfis;