ActiveAdmin.register Flight do
  permit_params :war_id, :flies_on, :special_instruction,
  flight_details_attributes: [:id, :airline_id, :flight_number, :departs_at,
    :departs_from, :departure_gate, :destination, :arrives_at, :arrival_gate,
    :_destroy]

  index do
    selectable_column
    column :flies_on
    column :war
    actions
  end

  show do
    attributes_table do
      row :war
      row :flies_on
      row :special_instruction
      panel "Flight Details" do
        table_for flight.flight_details do
          column :airline
          column :flight_number
          column :departs_at
          column :departs_from
          column :departure_gate
          column :destination
          column :arrives_at
          column :arrival_gate
          end
        end
      end
    end

  form do |f|
    f.inputs do
      f.input :war
      f.input :flies_on
      f.input :special_instruction
    end

    panel 'Flight Details' do
      f.has_many :flight_details, label: false do |flight_detail|
        flight_detail.input :id, as: :hidden
        flight_detail.input :airline
        flight_detail.input :flight_number
        flight_detail.input :departs_at, as: :datetime_picker
        flight_detail.input :departs_from
        flight_detail.input :departure_gate
        flight_detail.input :destination
        flight_detail.input :arrives_at, as: :datetime_picker
        flight_detail.input :arrival_gate
        flight_detail.input :_destroy, :as => :boolean, :required => false, :label=>'Remove'
      end
    end

    f.actions do
      f.action :submit
    end
  end
end
