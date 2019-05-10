module ApplicationHelper
  def link_to_add_fields name, f, association, type
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder, type: type)
    end
    link_to(name, "#", class: "add_fields btn btn-primary",
      data: {id: id, contents: fields.gsub("\n", "")})
  end

  def link_to_add_questions name, f, association, method
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, "#", class: "add_questions btn btn-primary",
      data: {id: id, questions: fields.gsub("\n", "")})
  end

  def link_to_add_answers name, f, association, method
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, "#", class: "add_answers btn btn-primary",
      data: {id: id, answers: fields.gsub("\n", "")})
  end
end