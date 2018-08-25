'use strict'

Application.Services.factory 'CalendarConfig', [->
  (options = {}) ->

    slot = new Date(null)
    slot.setMinutes(Fablab.slot_duration)
    # The calendar is divided in slots of 1 hour
    BASE_SLOT = slot.toISOString().substr(11, 8);

    # The calendar will be initialized positioned under 9:00 AM
    DEFAULT_CALENDAR_POSITION = '09:00:00'

    defaultOptions =
      timezone: Fablab.timezone
      lang: Fablab.fullcalendar_locale
      header:
        left: 'month agendaWeek'
        center: 'title'
        right: 'today prev,next'
      firstDay: 1 # Week start on monday (France)
      scrollTime: DEFAULT_CALENDAR_POSITION
      slotDuration: BASE_SLOT
      allDayDefault: false
      minTime: "00:00:00"
      maxTime: "24:00:00"
      height: 'auto'
      buttonIcons:
        prev: 'left-single-arrow'
        next: 'right-single-arrow'
      timeFormat:
        agenda:'H:mm'
        month: 'H(:mm)'
      axisFormat: 'H:mm'

      allDaySlot: false
      defaultView: 'agendaWeek'
      editable: false

    Object.assign({}, defaultOptions, options)
]
