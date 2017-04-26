import React from 'react';
// import CollapsibleSection from './CollapsibleSection';
import GradientNavCard from './GradientNavCard';

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
        <GradientNavCard
          title= "Teacher Community"
          description="Ask questions about curriculum, share ideas from your lessons, and get help from other teachers"
          image="../../static/navcard-placeholder.png"
          buttonText= "Connect Today"
          link="https://code.org/educate/community"
        />
        <GradientNavCard
          title= "Professional Learning"
          description="Our highly-rated professional learning prepares you for your next Computer Science class."
          image="../../static/navcard-placeholder.png"
          buttonText= "Learn More"
          link="https://code.org/educate/partner"
        />
      </div>
    );
  }
});

export default TeacherHomepage;
