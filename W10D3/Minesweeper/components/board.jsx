import React from 'react';
import Tile from './tile';

class Board extends React.Component {

    constructor (props) {
      super(props)    
      
    }

    createRows () {
      const board = this.props.board
      board.grid.map((row, i) => {
        return (
          <div>{createTiles(row)}</div>
        )
      })
    }

    createTiles(row) {
      const board = this.props.board
      return row.map((tile, j) => {
        return (
          <div>
            tile = {tile}
          </div>
        )
      })
    }

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