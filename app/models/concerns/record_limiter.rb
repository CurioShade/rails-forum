# Small concern which extends model capabilities to help with pagination
module RecordLimiter
    extend ActiveSupport::Concern

    included do
        scope :limit_records, ->(index, amount) { where("id >= ?", index).limit(amount) }
    end

    class_methods do
        def max_pages(page_limit)
            (count/(page_limit.to_f)).ceil
        end
    end
end