import React from 'react'

class Game extends React.Component {

  constructor (props) {
    super(props)
    const board = new Minesweeper.Board()
    this.state = {
      board: board
    }

    this.updateGame = this.updateGame.bind(this)
  }

  updateGame() {

  }

  render() {
    return (
      <div>
        Board={this.state.board}
        UpdateGame={this.updateGame}
      </div>
    )
  }
}