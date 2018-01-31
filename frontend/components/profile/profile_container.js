import Profile from './profile';
import { connect } from 'react-redux';
import { logout } from '../../actions/session_actions';

const mapStateToProps = (state, ownProps) => {
  return ({
    profile: Object.values(state.entities.profiles)
  });
};

const mapDispatchToProps = (dispatch, ownProps) => {

  return ({
    logout: () => dispatch(logout())
  });
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Profile);
