// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function(){
  console.log($('#day-id').val());
$.ajaxSetup({
     headers:{
      "accept": "application/json"
           }
  });

 var Photo= Backbone.Model.extend({});
 var Photos= Backbone.Collection.extend({
    model: Photo,
    url: '/api/pictures'
  });
 var PhotoView= Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.collection, 'add', this.render);
  },
  tagName: 'li',
  className: 'photo',
  template: _.template( $('#img-url-list').html() ),
  render: function(){
    this.$el.empty();
    //if this.model.attribute= the ul's datatype
    var  html = this.template(this.model.toJSON());
    var $html = $(html);
    this.$el.append($html);
  }
});

var PhotoListView=Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.collection, 'add', this.render);
  },
  render: function(){
    this.$el.empty();
    var dayUsed=this.day_id
    var photoList = this.collection.models;
    var $view;
    for (var i=0; i<photoList.length; i++){
      debugger;
       $view = new PhotoView({model:photoList[i]});
       $view.render();
       this.$el.append($view.$el)
    }
  }
});

  photos= new Photos({});
  photoPainter= new PhotoListView({
    collection: photos,
    el: $('.photos'),
    day_id: null
  });

  photos.fetch();
});


$('.add-picture').on('submit', function(e){
  e.preventDefault();
  var data= $(this).serializeJSON();
  console.log(data);
  photos.create(data);
});
