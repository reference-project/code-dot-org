import React from 'react';
import SectionsTable from './SectionsTable';

export default storybook => {
  return storybook
    .storiesOf('SectionsTable', module)
    .addStoryTable([
      {
        name: 'Section Table - one section',
        description: 'This is an example of a very simple Section Table with the teacher has one section',
        story: () => (
          <SectionsTable
            sections={[
              {
                name: "Algebra Period 1",
                course: "CS in Algebra",
                students: ['Abby', 'Beth'],
                sectionCode: "ABC123"
              },
              {
                name: "Period 3",
                course: "Course 2",
                students: ['Abby', 'Beth', 'Carol'],
                sectionCode: "ABC123"
              },

            ]}
          />
        )
      },
    ]);
};
