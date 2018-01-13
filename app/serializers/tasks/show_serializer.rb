class Tasks::ShowSerializer < TaskSerializer
    attributes :id, :text, :count

    has_many :comments, serializer: Comments::IndexSerializer

    def count
        :comments.size
    end
end