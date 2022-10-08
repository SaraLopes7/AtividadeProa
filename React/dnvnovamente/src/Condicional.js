/* O Header deve possuir ou 2 Links, ou 2 botões que levem a dois links. Pode ser feito o uso de componentes externos que possuam dois botões. */

function Header () {
    return (
        <div>
            <button> Link 01
                <a href="https://youtu.be/nAIPgTQ3QJ4"></a>
            </button>
            <button> Link 02
                <a href="https://youtu.be/bahdBTYEXLk"></a>
            </button>
            
        </div>
    )
}

export default Header;