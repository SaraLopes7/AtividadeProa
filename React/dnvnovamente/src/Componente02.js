import * as React from 'react';
import { styled } from '@mui/material/styles';
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import CardMedia from '@mui/material/CardMedia';
import CardContent from '@mui/material/CardContent';
import CardActions from '@mui/material/CardActions';
import Collapse from '@mui/material/Collapse';
import Avatar from '@mui/material/Avatar';
import IconButton, { IconButtonProps } from '@mui/material/IconButton';
import Typography from '@mui/material/Typography';
import { red } from '@mui/material/colors';
import FavoriteIcon from '@mui/icons-material/Favorite';
import ShareIcon from '@mui/icons-material/Share';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import MoreVertIcon from '@mui/icons-material/MoreVert';

interface ExpandMoreProps extends IconButtonProps {
  expand: boolean;
}

const ExpandMore = styled((props: ExpandMoreProps) => {
  const { expand, ...other } = props;
  return <IconButton {...other} />;
})(({ theme, expand }) => ({
  transform: !expand ? 'rotate(0deg)' : 'rotate(180deg)',
  marginLeft: 'auto',
  transition: theme.transitions.create('transform', {
    duration: theme.transitions.duration.shortest,
  }),
}));

export default function RecipeReviewCard(props) {
  const [expanded, setExpanded] = React.useState(false);

  const handleExpandClick = () => {
    setExpanded(!expanded);
  };

  return (
<div>
    <h1>{props.titulo}</h1>
    <h2>{props.sub}</h2>
    <h3>Lançado em: {props.ano}</h3>
    <h3>Shigatsu Wa Kimi no Uso tem objetivo de {props.objetivo}</h3>
    <h3>Por isso, indico. {props.indico}</h3>

    <Card sx={{ maxWidth: 345 }}>
      <CardHeader
        avatar={
          <Avatar sx={{ bgcolor: red[500] }} aria-label="recipe">
          </Avatar>
        }
        action={
          <IconButton aria-label="settings">
            <MoreVertIcon />
          </IconButton>
        }
        title="Shigatsu wa Kimi no Uso"
        subheader="Your Lie in April"
      />
      <CardMedia
        component="img"
        height="194"
        image="https://multiversos.com.br/wp-content/uploads/2016/01/imagem-01.jpg"
        alt="Paella dish"
      />
      <CardContent>
        <Typography variant="body2" color="text.secondary">
                Shigatsu wa Kimi no Uso, também conhecido no ocidente como Your Lie in April é uma série de mangá escrita e ilustrada por Naoshi Arakawa. A adaptação do anime foi feita pelo estúdio A-1 Pictures, onde estreou dia 9 de outubro de 2014 no bloco NoitaminA da Fuji Television e encerrou em 19 de março de 2015.
        </Typography>
      </CardContent>
      <CardActions disableSpacing>
        <IconButton aria-label="add to favorites">
          <FavoriteIcon />
        </IconButton>
        <IconButton aria-label="share">
          <ShareIcon />
        </IconButton>
        <ExpandMore
          expand={expanded}
          onClick={handleExpandClick}
          aria-expanded={expanded}
          aria-label="show more"
        >
          <ExpandMoreIcon />
        </ExpandMore>
      </CardActions>
      <Collapse in={expanded} timeout="auto" unmountOnExit>
        <CardContent>
          <Typography paragraph>Enredo:</Typography>
          <Typography paragraph>
                O pianista-prodígio Kousei Arima venceu com grande margem a competição musical e se tornou famoso entre os músicos infantis, mesmo possuindo um estilo musical controverso. Depois da morte de sua mãe, Saki Arima, uma instrutora rigorosa, o rapaz teve um colapso mental ao tocar em um recital de piano quando tinha apenas onze anos. Como resultado, ele não é mais capaz de ouvir o som do instrumento que tocava, mesmo que sua audição esteja perfeita.
          </Typography>
          <Typography paragraph>
                Mesmo dois anos depois do incidente, Kousei parou de tocar piano e alega ver um mundo cinza, completamente sem sabor e alegria. Por isso, ele se resignou a viver com seus melhores amigos, Tsubaki e Watari – até que, um dia, uma menina muda tudo. A Kaori Miyazono, uma violinista excêntrica e extrovertida, possui um estilo com o violino que reflete sua personalidade, o que ajuda Kousei a voltar ao mundo da música e mostrar que ele deve ser livre, quebrando o molde rígido construído por sua mãe, ao qual Kousei estava acostumado.
          </Typography>
          <Typography paragraph>Personagens Principais:</Typography>
          <Typography paragraph>
                Kōsei Arima <br></br>
                Kawori Miyazono <br></br>
                Tsubaki Sawabe <br></br>
                Ryōta Watari <br></br>
          </Typography>
          <Typography paragraph>
            Mesmo dois anos depois do incidente, Kousei parou de tocar piano e alega ver um mundo cinza, completamente sem sabor e alegria. Por isso, ele se resignou a viver com seus melhores amigos, Tsubaki e Watari – até que, um dia, uma menina muda tudo. A Kaori Miyazono, uma violinista excêntrica e extrovertida, possui um estilo com o violino que reflete sua personalidade, o que ajuda Kousei a voltar ao mundo da música e mostrar que ele deve ser livre, quebrando o molde rígido construído por sua mãe, ao qual Kousei estava acostumado.
          </Typography>
        </CardContent>
      </Collapse>
    </Card>
</div>      
  );
}