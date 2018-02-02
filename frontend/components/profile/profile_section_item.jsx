import React from 'react';

class profileSectionItem extends React.Component {
  constructor(props) {
    super(props);
    this.state=this.props.profile;
  }

  componentWillReceiveProps(newProps) {
    if (this.props.user_id !== newProps.profile.user_id) {
      this.setState({
        id: newProps.profile.id,
        user_id: newProps.profile.user_id,
        [this.props.type]: newProps.profile[this.props.type]
      });
    }
  }

  showEdit() {
    this.setState({edit: true});
  }

  updateResponse(e) {
    this.setState({[this.props.type]: e.target.value});
  }

  handleSubmit(e) {
    this.props.updateProfile({
      id: this.state.id,
      user_id: this.state.user_id,
      [this.props.type]: this.state[this.props.type]
    })
      .then(
        () => this.setState({edit: false})
      );
  }

  cancelEdit(e) {
    this.setState({edit: false});
  }

  render() {
    let itemContents;
    if (this.state.edit) {
      itemContents = (
        <div>
          <div className="add-shadow"></div>
          <div className="foreground-box">
            <form>
              <textarea
                value={this.state[this.props.type]}
                className="update-textarea"
                onChange={this.updateResponse.bind(this)}
                ></textarea>
            </form>
            <button
              onClick={this.handleSubmit.bind(this)}
              className="submit-response-button"
              >Submit</button>
            <button
              onClick={this.cancelEdit.bind(this)}
              className="cancel-response-button"
              >Cancel</button>
          </div>
        </div>

      );
    }

    return (
      <article className="profile-section-item">
        {itemContents}
        <div>
          <p className="response-text">
            {this.state[this.props.type]}
          </p>
          <button
            className="edit-response-button"
            onClick={this.showEdit.bind(this)}>
            <i className="fas fa-pencil-alt"></i> Edit your response
          </button>
        </div>
      </article>
    );
  }
}

export default profileSectionItem;
