import React from 'react';
import TeacherHomepage from './TeacherHomepage';
import CollapsibleSection from './CollapsibleSection';
import CourseCard from './CourseCard';
import SetUpMessage from './SetUpMessage';
import Notification from '../Notification';
// import Announcement from './Announcement';
// import Hero from './Hero';

const CourseCardExample = {
  courseName: "CSP Unit 2 - Digital Information",
  description: "Explore how more complex digital information is represented and manipulated through computation and visualization",
  image: "this is where there will be the source for the photo",
  link: "link to wherever you want the button to go...",
  assignedSections: []
};

export default storybook => {
  return storybook
    .storiesOf('TeacherHomepage', module)
    .addStoryTable([
      {
        name: 'Teacher Homepage',
        description: 'Teacher Homepage',
        story: () => (
          <TeacherHomepage>

            <Notification
              type="information"
              notice="The Teacher Homepage has been redesigned!"
              details="Doesn't it look so snazzy?"
              dismissible={true}
            />

            <CollapsibleSection
              header="Recent Courses"
              linkText="View All Courses"
              link= " "
            >
              <CourseCard cardData={CourseCardExample}/>
              <CourseCard cardData={CourseCardExample}/>
            </CollapsibleSection>

            <CollapsibleSection
              header="Manage Sections"
              linkText="Add New Section"
              link= " "
            >
              <SetUpMessage type="sections"/>
            </CollapsibleSection>

            <CollapsibleSection
              header="Announcements and News"
              linkText="View All Announcements"
              link= " "
            >
              <div>This is where the announcements will go.</div>
            </CollapsibleSection>

          </TeacherHomepage>
        )
      }
    ]);
};

//

//
