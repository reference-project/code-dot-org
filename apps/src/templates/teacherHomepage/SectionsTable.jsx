import React, { PropTypes } from 'react';
import color from "@cdo/apps/util/color";
import i18n from '@cdo/locale';

const styles = {
  table: {
    borderWidth: 1,
    borderStyle: 'solid',
    borderColor: color.border_gray,
    borderRadius: 3
  },
  headerRow: {
    backgroundColor: color.table_header,
    fontWeight: 'bold',
    borderBottomColor: color.border_light_gray,
    borderBottomWidth: 1,
    borderBottomStyle: 'solid',
  },
  col1: {
    borderRightWidth: 1,
    borderRightColor: color.border_light_gray,
    borderRightStyle: 'solid',
    lineHeight: '52px',
    color: color.charcoal,
    paddingLeft: 20,
    paddingRight: 20,
    minWidth: 300
  },
  col2: {
    borderRightWidth: 1,
    borderRightColor: color.border_light_gray,
    borderRightStyle: 'solid',
    lineHeight: '52px',
    color: color.charcoal,
    paddingLeft: 20,
    paddingRight: 20,
    minWidth: 300
  },
  col3: {
    borderRightWidth: 1,
    borderRightColor: color.border_light_gray,
    borderRightStyle: 'solid',
    lineHeight: '52px',
    color: color.charcoal,
    paddingLeft: 20,
    paddingRight: 20,
    minWidth: 100
  },
  col4: {
    lineHeight: '52px',
    color: color.charcoal,
    paddingLeft: 20,
    paddingRight: 20,
    minWidth: 200
  },
  colText: {
    color: color.charcoal,
    fontFamily: '"Gotham 5r", sans-serif',
    fontSize: 14,
  },
};

const SectionsTable = React.createClass({
  propTypes: {
    sections: PropTypes.array.isRequired,
  },

  render() {
    const { sections } = this.props;

    return (
      <table style={styles.table}>
        <thead>
          <tr style={styles.headerRow}>
            <td style={styles.col1}>
              <div style={styles.colText}>
                {i18n.section()}
              </div>
            </td>
            <td style={styles.col2}>
              <div style={styles.colText}>
                {i18n.course()}
              </div>
            </td>
            <td style={styles.col3}>
              <div style={styles.colText}>
                {i18n.students()}
              </div>
            </td>
            <td style={styles.col4}>
              <div style={styles.colText}>
                {i18n.sectionCode()}
              </div>
            </td>
          </tr>
        </thead>
        <tbody>
          {sections.map((section, index) =>
            <tr style={styles.row} key={index}>
              <td style={styles.col1}>
                <div style={styles.colText}>
                  {section.name}
                </div>
              </td>
              <td style={styles.col2}>
                <div style={styles.colText}>
                  {section.course}
                </div>
              </td>
              <td style={styles.col3}>
                <div style={styles.colText}>
                  {section.students.length}
                </div>
              </td>
              <td style={styles.col4}>
                <div style={styles.colText}>
                  {section.sectionCode}
                </div>
              </td>
            </tr>
          )}
        </tbody>
      </table>
    );
  }
});

export default SectionsTable;
