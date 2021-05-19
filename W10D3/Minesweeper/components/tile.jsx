import React from 'react';

class Tile extends React.Component {


    bombed () {
        if (this.bombed) {
            return ( <div>💣</div>)
        }
    }

    explored () {
        if (this.explored ) {
            return ( <div></div>)
        }
    }

    render() {
        const tiles = this.props.tile
        return (

            <div>This is the tile class</div>
        )
    }
}


export default Tile;