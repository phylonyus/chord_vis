library(shiny)

shinyUI(fluidPage(
     
     title = "Chords with Sine Waves",
     
     plotOutput("chordgraph"),
     
     hr(),
     
     fluidRow(
          column(3,
                 h4("Chords with Sine Waves"),
                 selectInput("chordtype","Choose a chord",
                             choices=c("major","minor","dom7","major7",
                                       "minor7","159","power",
                                       "oct", "minpower","majpower",
                                       "majorinv1", "majorinv2",
                                       "minorinv1", "minorinv2")),
                 numericInput("root.cycles", "Number of cycles of root note frequency:", 4)
                 ),
          column(9,
                 p("In music, chords are created by playing notes of different frequencies simultaneously.
                   Chords are defined by their root note and the ratio of the other notes to that note's frequency.
                   Different ratios of frequencies sound either consonant or dissonant, which gives chords their quality.
                   Since the ratios would be the same regardless of root note, its frequency only changes the wavelength of a chord's wave.
                   The shape of the wave will remain the same.
                   Furthermore, musical notes are identified by their fundamental frequency, so we only use sine waves here.
                   This gives us an idea of the general waveshape of the chord."),
                 p("With this app you can investigate the wave shape of different chords.
                   You can also play with the number of root note cycles shown.
                   How big should you make this number to see the whole waveform for each chord type?
                   How is this number associated with consonance and dissonance?
                   Keep in mind major chords are considered consonant and minor chords considered dissonant.
                   ")
                 )
     )
))