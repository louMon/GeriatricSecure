# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

var especialidads = new Array();
<%for espe in @Especialidades -%>
 especialidads.push(new Array (<%= espe.especialidad_id %>, '<%=  espe.nombre%>'));
<% end -%>

function rolSelected(){
  rol_id = $('usuario_rol_id').getValue();
  options = $('usuario_especialidad_id').options;
  console.log(options);

}


 document.observe('dom:loaded',function(){
  $('especialidad_field').hide();
  $('usuario_rol_id').observe('change', rolSelected);
 });