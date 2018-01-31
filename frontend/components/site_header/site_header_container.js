import SiteHeader from './site_header';
import { connect } from 'react-redux';
import { logout } from '../../actions/session_actions';

const mapStateToProps = (state, ownProps) => {
  return ({
    currentUser: state.session.currentUser
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
)(SiteHeader);
