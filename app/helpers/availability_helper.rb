module AvailabilityHelper
  MACHINE_COLOR = '#e4cd78'
  TRAINING_COLOR = '#bd7ae9'
  SPACE_COLOR = '#3fc7ff'
  EVENT_COLOR = '#dd7e6b'
  IS_RESERVED_BY_CURRENT_USER = '#b2e774'
  MACHINE_IS_RESERVED_BY_USER = '#1d98ec'
  IS_COMPLETED = '#eeeeee'
  AVAILABILITY_TEXT_COLOR = '000000'
  AVAILABILITY_BACKGROUND_COLOR = 'ffffff'
  AVAILABILITY_LOCKED_BACKGROUND_COLOR = 'f5f5f5'

  def availability_text_color(availability)
    if availability.instance_of? Slot
      return "##{AVAILABILITY_TEXT_COLOR}"
    end
    return "##{availability.availability_detail&.textColor&.to_s(16) || AVAILABILITY_TEXT_COLOR}"
  end

  def availability_background_color(availability, locked=false)
    if availability.instance_of? Slot
      return locked ? "##{AVAILABILITY_LOCKED_BACKGROUND_COLOR}" : "##{AVAILABILITY_BACKGROUND_COLOR}"
    end
    if locked
      return "##{availability.availability_detail&.lockedBackgroundColor&.to_s(16) || AVAILABILITY_LOCKED_BACKGROUND_COLOR}"
    end
    return "##{availability.availability_detail&.backgroundColor&.to_s(16) || AVAILABILITY_BACKGROUND_COLOR}"
  end

  def availability_border_color(availability)
    case availability.available_type
      when 'machines'
        MACHINE_COLOR
      when 'training'
        TRAINING_COLOR
      when 'space'
        SPACE_COLOR
      else
        EVENT_COLOR
    end
  end

  def machines_slot_border_color(slot)
    if slot.is_reserved
      slot.is_reserved_by_current_user ? IS_RESERVED_BY_CURRENT_USER : IS_COMPLETED
    else
      MACHINE_COLOR
    end
  end

  def space_slot_border_color(slot)
    if slot.is_reserved
      IS_RESERVED_BY_CURRENT_USER
    elsif slot.is_complete?
      IS_COMPLETED
    else
      SPACE_COLOR
    end
  end

  def trainings_events_border_color(availability)
    if availability.is_reserved
      IS_RESERVED_BY_CURRENT_USER
    elsif availability.is_completed
      IS_COMPLETED
    else
      case availability.available_type
        when 'training'
          TRAINING_COLOR
        when 'event'
          EVENT_COLOR
        when 'space'
          SPACE_COLOR
        else
          '#000'
      end
    end
  end
end
