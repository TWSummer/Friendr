import LoggedInHome from './logged_in_home';
import { connect } from 'react-redux';
import { logout } from '../../actions/session_actions';

const mapStateToProps = (state, ownProps) => {
  return ({

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
)(LoggedInHome);
