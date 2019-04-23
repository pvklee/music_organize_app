class Note < ApplicationRecord
    validates :user_id, :track_id, :note_text, presence: true

    belongs_to(
        :user,
        class_name: 'User',
        foreign_key: :user_id
    )

    belongs_to(
        :track,
        class_name: 'Track',
        foreign_key: :track_id
    )

    has_one :album, through: :track, source: :album
    has_one :band, through: :track, source: :band
end
