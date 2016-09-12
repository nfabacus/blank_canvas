// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require interact.min.js

interact('#sofa, #room_wall, #room_floor, #carpet, #cushion_one, #cushion_two, #lamp, #coffee_table').dropzone({
  accept: '#canvas_1, #canvas_2, #canvas_3, #canvas_4, #canvas_5, #canvas_6',
  overlap: 0.75,

  ondrop: function (event) {
    event.target.style.fill = event.relatedTarget.style.backgroundColor;
  },

});

interact('#canvas_1, #canvas_2, #canvas_3, #canvas_4, #canvas_5, #canvas_6')
  .draggable({
    inertia: true,
    restrict: {
      endOnly: true,
      elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
    },
    autoScroll: true,


    onmove: dragMoveListener,
    onend: function (event) {
      var target = event.target,
          x = 0,
          y = 0;
      target.style.webkitTransform =
      target.style.transform =
        'translate(' + x + 'px, ' + y + 'px)';
      target.setAttribute('data-x', x);
      target.setAttribute('data-y', y);
    }
  });
  function dragMoveListener (event) {
    var target = event.target,
        x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx,
        y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy;
    target.style.webkitTransform =
    target.style.transform =
      'translate(' + x + 'px, ' + y + 'px)';
    target.setAttribute('data-x', x);
    target.setAttribute('data-y', y);
  }
