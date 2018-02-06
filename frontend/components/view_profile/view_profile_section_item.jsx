import React from 'react';

class viewProfileSectionItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <article className="profile-section-item">
        <div>
          <p className="response-text">
            {
              this.props.profile[this.props.type] ?
              this.props.profile[this.props.type] :
              "I haven't written anything yet!"
            }
          </p>
        </div>
      </article>
    );
  }
}

export default viewProfileSectionItem;
