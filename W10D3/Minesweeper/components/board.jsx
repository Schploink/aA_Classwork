import React from 'react';
import Tile from './tile';

class Board extends React.Component {

    constructor (props) {
      super(props);    
      this.createRows = this.createRows.bind(this);
      this.createTiles = this.createTiles.bind(this);
      console.log(this.props.board)
    }

    createRows () {
      const board = this.props.board;
      return board.grid.map((row, i) => {
        return (
          <div key={i}>
              {this.createTiles(row, i)}
          </div>
        )
      })
    }

    createTiles(row, i) {
      const board = this.props.board;
      return row.map((tile, j) => {
        return (
          <div key={j}>
            <Tile tile={tile}
            updateGame={this.props.updateGame} />                   
          </div>
        )
      })
    }

    render() {
        return (
            <div>
                <h1>This is the board class</h1>
                {this.createRows()}
            </div>
        )
    }
}

export default Board;