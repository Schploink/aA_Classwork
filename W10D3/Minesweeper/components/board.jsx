import React from 'react';
import Tile from './tile';

class Board extends React.Component {

    render() {
        return (
            <div>
                <Tile />
                <h1>This is the board class</h1>
            </div>
        )
    }
}

export default Board;