import React from 'react';

export default class PokemonIndex extends React.Component {
    constructor(props){
        super(props)
    }

    render() {
        return (
            <ul>
                {this.props.pokemon.map(poke => <li>
                    {poke.name} 
                    <img src={`${poke.image_url}`} width="50px" height="50px"></img>
                    </li>)}
            </ul>
        )
    }
}