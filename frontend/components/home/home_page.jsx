import React from 'react';
import { Link } from 'react-router-dom';
import AuthForm from './auth_form';
import SiteFooter from '../site_footer';

class HomePage extends React.Component {
  constructor(props) {
    super(props);
    this.state={form: ""};
  }

  componentDidMount() {
    if (this.props.loggedIn) {
      this.props.history.push('/home');
    }
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps.loggedIn) {
      this.props.history.push('/home');
    }
  }

  showForm(type) {
    return (e) => {
      e.stopPropagation();
      this.props.clearErrors();
      this.setState({form: type});
    };
  }

  render() {
    let form;
    if (this.state.form === "login") {
      form = <AuthForm
        formType="Log In"
        action={this.props.login}
        errors={this.props.errors}
        />;
    } else if (this.state.form === "signup") {
      form = <AuthForm
        formType="Sign Up"
        action={this.props.signup}
        errors={this.props.errors}
        />;
    }
    return (
      <div onClick={this.showForm("").bind(this)}>
        <header className="standard-header">
          <Link className="header-logo" to="/">
            <img src="https://i.imgur.com/bQgZtp4.png" alt="logo"/>
          </Link>
          <div>
            <button
              onClick={this.showForm("login").bind(this)}
              className="auth-button"
              >Log In</button>
            <button
              onClick={this.showForm("signup").bind(this)}
              className="auth-button"
              >Sign Up</button>
          </div>
        </header>
        {form}
        <main className="page-main">

        </main>
        <SiteFooter />
      </div>
    );
  }
}

export default HomePage;
