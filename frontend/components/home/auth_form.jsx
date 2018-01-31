import React from 'react';

class AuthForm extends React.Component {
  constructor(props) {
    super(props);
    this.state={username: "", password: ""};
  }

  update(field) {
    return (e) => {
      this.setState({[field]: e.target.value});
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.action({ user: this.state });
  }

  render() {
    return (
      <div className="auth-form">
        <h1>{this.props.formType}</h1>
        <ul>
          {
            this.props.errors.map( (error, idx) => (
              <li key={idx}>{error}</li>
            ))
          }
        </ul>
        <form onSubmit={this.handleSubmit.bind(this)}>
          <input
            type="text"
            value={this.state.username}
            className="auth-input"
            placeholder="Username"
            onChange={this.update("username").bind(this)}
            />
          <br />
          <input
            type="password"
            value={this.state.password}
            className="auth-input"
            placeholder="Password"
            onChange={this.update("password").bind(this)}
            />
          <br />
          <input className="auth-form-button" type="submit" value={this.props.formType} />
        </form>
      </div>
    );
  }
}

export default AuthForm;
