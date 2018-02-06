import FriendSearch from './friend_search';
import { connect } from 'react-redux';
import { fetchSearch, updateSearch } from '../../actions/search_actions';
import { resultsByCompatibility, resultsByDistance } from '../../reducers/selectors';

const mapStateToProps = (state, ownProps) => {

  return ({
    search: state.entities.search,
    errors: state.errors.search,
    resultsByCompatibility: resultsByCompatibility(state),
    resultsByDistance: resultsByDistance(state)
  });
};

const mapDispatchToProps = (dispatch, ownProps) => {
  return ({
    fetchSearch: () => dispatch(fetchSearch()),
    updateSearch: (search) => dispatch(updateSearch(search))
  });
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(FriendSearch);
