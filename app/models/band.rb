class Band < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    has_many(
        :albums,
        class_name: 'Album',
        foreign_key: :band_id,
        dependent: :destroy
    )

    has_many :tracks, through: :albums, source: :tracks

end
