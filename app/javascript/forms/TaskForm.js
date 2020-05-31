import { pick, propOr } from 'ramda';

export default {
  defaultAttributes(attributes) {
    console.log('TF > f defaultAttributes');
    console.log('attributes');
    console.log(attributes);

    return {
      name: '',
      description: '',
      ...attributes,
    };
  },

  attributesToSubmit(task) {
    const pertmittedKeys = ['id', 'name', 'description'];
    console.log('TF>f attributesToSubmit ------');
    console.log('task');
    console.log(task);
    console.log('pertmittedKeys');
    console.log(pertmittedKeys);
    console.log('task.assignee');
    console.log(task.assignee);
    console.log('task.author');
    console.log(task.author);

    return {
      ...pick(pertmittedKeys, task),
      // assigneeId: propOr(null, 'id', task.assignee),
      // authorId: propOr(null, 'id', task.author),
    };
  },
};
