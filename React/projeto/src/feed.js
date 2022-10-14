import './style.css'
/* import { GrLink } from 'react-icons/gr'
import { MdOutlineFileUpload } from 'react-icons/md' */
import { FiChevronDown } from 'react-icons/fi'
import { GoHeart } from 'react-icons/go'
import { AiFillLike } from 'react-icons/ai'

function Feed (props) {
    return (
        <div className='feed'>
            <div className='imgCentral'>
                <img src={props.imagem} alt=''></img>
            </div>
            <div className='infos'>
                <div className='superior'>
                    <ul className='icones' >
                        <li><img src='https://cdn-icons-png.flaticon.com/512/512/512142.png' alt=''></img></li>
                        <li><img src='https://cdn-icons-png.flaticon.com/512/725/725008.png' alt=''></img></li>
                        <li><img src='https://cdn-icons-png.flaticon.com/512/1011/1011407.png' alt=''></img></li>
                    </ul>
                    <button>Salvar</button>
                </div>
                <a className='link' href={props.link}>{props.textolink}</a>
                <h1 className='titulo'>{props.titulo}</h1>
                <p className='descricao'>{props.descricao} <u><strong>Mais</strong></u></p>
                <div className='perfil'>
                    <img className='fotoredondap' src={props.perfil} alt='' ></img>
                    <p className='publicador'>{props.publicador}</p>
                    <p className='seguidores'>{props.seguidores}</p>
                    <button className='seguir'>Seguir</button>
                </div>
                <p className='comentarios'>{props.qtdcoments} comentários <FiChevronDown/></p>
                <div className='comentario01'>
                    <img className='fotoredonda1' src={props.coment1} alt='' ></img>
                    <p className='usuario1'>{props.usuario1}</p>
                    <p className='comentario1'>{props.comentario1}</p>
                    <p className='tempocoment1'>{props.tempocoment1}</p> 
                    <p className='responder1'> Responder </p>  
                    <img className='favsimg1' src='https://cdn.discordapp.com/attachments/1000252860283506788/1030310720363049030/001-heart.png' alt=''></img><p className='favs1'>{props.favoritos1}</p>    
                    <img className='icone1' src='https://cdn.discordapp.com/attachments/1000252860283506788/1030314500747952178/dots.png' alt=''></img>  
                    <p className='like1'><AiFillLike/> Útil</p>  
                </div>
                <div className='respostas'>
                    <img className='fotoredonda2' src={props.respost1} alt='' ></img>
                    <p>{props.useresposta1}</p>
                    <p>{props.resposta1}</p>
                    <p>{props.tempocomentres}</p>
                    <p> Responder </p>
                    <p><GoHeart/> {props.favoritosres1}</p>
                    <img className='iconeum' src='https://cdn-icons-png.flaticon.com/512/512/512142.png' alt=''></img>
                    <p><AiFillLike/> Útil</p>
                </div>
                <div className='comentario2'>
                    <img className='fotoredonda3' src={props.coment2} alt='' ></img>
                    <p>{props.usuario2}</p>
                    <p>{props.comentario2}</p>
                    <p>{props.tempocoment2}</p>
                    <p> Responder </p>
                    <p><GoHeart/> {props.favoritos2}</p>
                    <img className='iconeum' src='https://cdn-icons-png.flaticon.com/512/512/512142.png' alt=''></img>
                    <p><AiFillLike/> Útil</p>
                </div>
                <button>Ver mais</button>
                <div>
                    <img className='fotoredonda4' src={props.perfil}></img>
                    <input type="text" placeholder="Adcionar comentário&#128515;"></input>
                </div>
            </div>           
        </div>
    )
 }

export default Feed;