import HomePage from './home_page';
import { connect } from 'react-redux';
import { login, signup, clearErrors, createDemo } from '../../actions/session_actions';

const mapStateToProps = (state, ownProps) => {
  return ({
    errors: state.errors.session,
    loggedIn: Boolean(state.session.currentUser)
  });
};

const mapDispatchToProps = (dispatch, ownProps) => {

  return ({
    login: (formUser) => dispatch(login(formUser)),
    signup: (formUser) => dispatch(signup(formUser)),
    clearErrors: () => dispatch(clearErrors({})),
    createDemo: () => dispatch(createDemo())
  });
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(HomePage);
