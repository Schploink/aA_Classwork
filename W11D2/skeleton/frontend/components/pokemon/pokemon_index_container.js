import { connect } from 'react-redux';
import { requestAllPokemon } from '../../actions/pokemon_actions';
import { selectAllPokemon } from '../../reducers/selectors';
import PokemonIndex from './pokemon_index';

const mapStateToProps = state => ({
    // piece of state that container subscribes to
    entities: Object.values(state.entities)
});

const mapDispatchToProps = dispatch => ({
    requestAllPokemon: pokemon => dispatch(requestAllPokemon(pokemon)),
});

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(PokemonIndex);