import logo from './logo.svg';
import './App.css';
import Perfis from './Componente01'

var descricao01 = "Alanzoka é o canal de games criado pelo paulista Alan Ferreira, o antigo Eletronic Desire GE (Gamers Entertaiment). O canal é repleto de diferentes tipos de gameplays, com uma variedade bem grande de jogos. A preferência do dono do canal são jogos de terror, como Resident Evil, Midnight Scenes, Lost in Vivo, Location Withheld, Feed me Billy e Night Shift. Outros jogos famosos explorados no canal são Far Cry, God of War, Spiderman e Fortnite.";
var descricao02 = "CAP Joga, é o canal do Youtube comandado pelo criador Luciano Pamplona, mais conhecido apenas como Luciano “CAP” nas redes sociais. Criado em 2017, o canal é do segmento de games, e deriva de outro canal do criador, o Cappuccino Mafioso, criado em 2012 e focado em jogos como GTA e Fifa. Em seus vídeos o criador realiza gameplays, lives e dicas de jogos famosos como Little Nightmares, Battleblock Theather, Castle Crashers, entre outros. Luciano tem 27 anos, é libriano e tem como linguagem desenvolvida para dialogar com seus seguidores, nunca editar seus vídeos.";
var descricao03 = "Paulo Viniccius Santos Ferraz, mais conhecido por seu pseudônimo virtual Viniccius13, é um YouTuber e jogador profissional de Minecraft brasileiro. Nascido em São João do Paraíso, no norte de Minas Gerais, em 21 de setembro de 1993, Viniccius ganhou grande reputação no mundo dos games por sua série de Minecraft Em Busca da Casa Automática. Atualmente, possuí mais de cinco milhões de inscritos em seu canal.";

function App() {
  return (
    <div className="App">
        <header className="App-header">
        <div>
          <Perfis Foto="https://static-cdn.jtvnw.net/jtv_user_pictures/15cec952-c1ba-4ff8-a79c-53c2fa5bd269-profile_image-300x300.png" Nome="Alan Ferreira" CodNome="Alanzoka" Idade="32 anos" Descricao={descricao01} Link="https://www.instagram.com/alanzoka/"/>
          <Perfis Foto="https://i.pinimg.com/736x/b3/fd/6c/b3fd6c7cfbac18160aca44b6aa476958.jpg" Nome="Luciano Pamplona" CodNome="CAP Joga" Idade="27 anos" Descricao={descricao02} Link="https://www.instagram.com/capjoga/"/>
          <Perfis Foto="https://pbs.twimg.com/profile_images/1357790290107650048/PphnhNKy_400x400.jpg" Nome="Paulo Viniccius" CodNome="Viniccius 13" Idade="30 anos" Descricao={descricao03} Link="https://www.instagram.com/viniccius13/"/>
        </div>
      </header>
    </div>
  );
}

export default App;
