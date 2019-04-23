class Album < ApplicationRecord
    validates :title, :year, :band_id, :album_type, presence: true
    validates :title, uniqueness: {scope: :band_id}
    validates :album_type, inclusion: { in: %w(studio live)}


    belongs_to(
        :band,
        class_name: 'Band',
        foreign_key: :band_id
    )

    has_many(
        :tracks,
        class_name: 'Track',
        foreign_key: :album_id,
        dependent: :destroy
    )

end
