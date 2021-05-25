export const RECEIVE_ALL_POKEMON = 'receive_all_pokemon'

export const receiveAllPokemon = (pokemon) => {
  return {
    type: RECEIVE_ALL_POKEMON,
    pokemon
  }
}