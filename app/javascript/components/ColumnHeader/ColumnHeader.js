import React from 'react';
import PropTypes, { func } from 'prop-types';

import IconButton from '@material-ui/core/IconButton';
import SystemUpdateAltIcon from '@material-ui/icons/SystemUpdateAlt';

import useStyles from './useStyles';

const ColumnHeader = ({ column, onLoadMore }) => {
  const styles = useStyles();

  const {
    id,
    title,
    cards,
    meta: { totalCount, currentPage },
  } = column;

  const count = cards.length;

  const handleLoadMore = () => onLoadMore(id, currentPage + 1);

  return (
    <div className={styles.root}>
      <div className={styles.title}>
        <b>{title}</b> ({count}/{totalCount || '…'})
      </div>
      <div className={styles.actions}>
        <IconButton aria-label="Load more" onClick={() => handleLoadMore()}>
          <SystemUpdateAltIcon fontSize="small" />
        </IconButton>
      </div>
    </div>
  );
};

ColumnHeader.propTypes = {
  column: PropTypes.shape({
    id: PropTypes.string,
    title: PropTypes.string,
    // cards: PropTypes.oneOfType([

    // ]),
    cards: PropTypes.arrayOf(
      // PropTypes.object,
      PropTypes.shape({
        id: PropTypes.number,
        name: PropTypes.string,
      }),
    ),

    // cards: PropTypes.arrayOf(
    //   PropTypes.shape({
    //     id: PropTypes.number,
    //     name: PropTypes.string,
    //   }),
    // ),
    meta: PropTypes.shape({
      totalCount: PropTypes.number,
      currentPage: PropTypes.number,
    }),
  }).isRequired,
  onLoadMore: func.isRequired,
};

export default ColumnHeader;
