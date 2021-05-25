import React from 'react';

class Tile extends React.Component {
    constructor(props) {
        super(props);

    }



    render() {
        const tile = this.props.tile
        let label, text, count;
        if (tile.explored) {
            if (tile.bombed) {
                label = "bombed";
                text = "U+1F4A3";
                //to change or reveal bomb
            } else {
                label = "explored";
                count = tile.adjacentBombCount();
                text = (count > 0 ? `${count}` : "");
                //reveal number or ""
            }
        } else if (tile.flagged) {
            label = "flagged";
            text = "U+1F6A9";
        } else {
            label = "unexplored";
        }
        label = `tile ${label}`;
        return (
            <div className={label} >{text}</div>
        )
    }
}


export default Tile;