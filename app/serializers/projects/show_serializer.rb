class Projects::ShowSerializer < ProjectSerializer
    attributes :id, :name, :count

    has_many :tasks, serializer: Tasks::IndexSerializer

    def count
        :tasks.size
    end
end