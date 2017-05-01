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
          <SectionsTable/>
        )
      },
    ]);
};
