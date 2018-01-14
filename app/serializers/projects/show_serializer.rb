class Projects::ShowSerializer < ProjectSerializer
    attributes :id, :name, :count

    has_many :tasks, serializer: Tasks::IndexSerializer

    def count
        object.tasks.size
    end
end