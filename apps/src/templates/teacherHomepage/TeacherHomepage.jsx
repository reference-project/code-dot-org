import React from 'react';
// import CollapsibleSection from './CollapsibleSection';
// import GradientNavCard from './GradientNavCard';

const TeacherHomepage = React.createClass({
  propTypes: {
    children: React.PropTypes.oneOfType([
      React.PropTypes.node,
      React.PropTypes.arrayOf(React.PropTypes.node)
    ])
  },

  render() {
    const content = this.props.children;

    return (
      <div>
        {content}
      </div>
    );
  }
});

export default TeacherHomepage;
