class Track < ApplicationRecord
    validates :title, :ord, :album_id, :track_type, presence: true
    validates :ord, uniqueness: {scope: :album_id}
    validates :track_type, inclusion: { in: %w(regular bonus)}

    belongs_to(
        :album,
        class_name: 'Album',
        foreign_key: :album_id
    )

    has_many(
        :notes,
        class_name: 'Note',
        foreign_key: :track_id,
        dependent: :destroy
    )

    has_one :band, through: :album, source: :band
end
