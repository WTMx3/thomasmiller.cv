Add-Type -AssemblyName System.Speech

$ErrorActionPreference = "Stop"
$audioRoot = Join-Path $PSScriptRoot "..\resume\audio-source"
$captionRoot = Join-Path $PSScriptRoot "..\resume\caption-source"
New-Item -ItemType Directory -Force -Path $audioRoot, $captionRoot | Out-Null

# Source narration stays outside public/. Compress it for the web, give both the
# audio and VTT files content-hashed names, and then update narrationTracks.

$narration = [ordered]@{
  profile = "It is great to meet you. My name is Thomas Miller III. I have been a software engineer for the last ten years and I have loved making a difference for various companies and partners that I have worked with. I enjoy solving problems with competitive enthusiasm. Today, I work across the entire development lifecycle, eagerly adapting to any workload asked of me."
  skills = "I have been eager to pick up many different abilities, skillsets, and tooling with my work. In my current position, I talk with clients, translate the tech concepts, plan, engineer, launch, monitor, alert - everything. The specific tools will vary by project, but my focus stays the same: clear solutions that solve real problems."
  experience = "My career began in technical development support and grew through custom product development, cloud engineering, and enterprise reliability. At BAAS Software, I run technology development and oversee products from early planning through launch and ongoing operation. Earlier roles at USAA and software agencies strengthened my experience in automation, monitoring, incident response, accessible design, and practical delivery."
  projects = "My portfolio highlights multiple real-world projects that I claim 100% ownership for, being solely responsible for the planning, development, and production of. Together, these projects illustrate how I approach various architecture requirements like product design, system planning, automation, and dependable delivery. You will find test cases, SDKs, APIs, documentation, and more that an engineer will appreciate."
}

function Format-VttTime([TimeSpan]$time) {
  $hours = [Math]::Floor($time.TotalHours)
  return "{0:00}:{1:00}:{2:00}.{3:000}" -f $hours, $time.Minutes, $time.Seconds, $time.Milliseconds
}

function Write-CaptionFile($path, $progress, $sourceText) {
  $cues = [System.Collections.Generic.List[object]]::new()
  $group = [System.Collections.Generic.List[object]]::new()
  $sourceWords = @([regex]::Matches($sourceText, "\S+") | ForEach-Object { $_.Value })
  $timedWords = [System.Collections.Generic.List[object]]::new()

  for ($wordIndex = 0; $wordIndex -lt $progress.Count; $wordIndex++) {
    $captionWord = if ($wordIndex -lt $sourceWords.Count) { $sourceWords[$wordIndex] } else { $progress[$wordIndex].Text }
    $timedWords.Add([PSCustomObject]@{
      AudioPosition = $progress[$wordIndex].AudioPosition
      Text = $captionWord
    })
  }

  foreach ($word in $timedWords) {
    $group.Add($word)
    $endsPhrase = $word.Text -match '[.!?]$'
    if ($group.Count -ge 8 -or $endsPhrase) {
      $cues.Add(@($group.ToArray()))
      $group.Clear()
    }
  }
  if ($group.Count -gt 0) { $cues.Add(@($group.ToArray())) }

  $lines = [System.Collections.Generic.List[string]]::new()
  $lines.Add("WEBVTT")
  $lines.Add("")

  for ($index = 0; $index -lt $cues.Count; $index++) {
    $cue = $cues[$index]
    $start = $cue[0].AudioPosition
    if ($index -lt $cues.Count - 1) {
      $end = $cues[$index + 1][0].AudioPosition - [TimeSpan]::FromMilliseconds(40)
    } else {
      $end = $cue[-1].AudioPosition + [TimeSpan]::FromMilliseconds(900)
    }
    $caption = ($cue | ForEach-Object { $_.Text }) -join " "
    $lines.Add("$($index + 1)")
    $lines.Add("$(Format-VttTime $start) --> $(Format-VttTime $end)")
    $lines.Add($caption)
    $lines.Add("")
  }

  [System.IO.File]::WriteAllLines($path, $lines, [System.Text.UTF8Encoding]::new($false))
}

foreach ($entry in $narration.GetEnumerator()) {
  $speaker = [System.Speech.Synthesis.SpeechSynthesizer]::new()
  $speaker.SelectVoice("Microsoft David Desktop")
  $speaker.Rate = -1
  $speaker.Volume = 100

  $progress = [System.Collections.Generic.List[object]]::new()
  $handler = [System.EventHandler[System.Speech.Synthesis.SpeakProgressEventArgs]] {
    param($sender, $eventArgs)
    $progress.Add([PSCustomObject]@{
      AudioPosition = $eventArgs.AudioPosition
      Text = $eventArgs.Text
    })
  }
  $speaker.add_SpeakProgress($handler)

  $audioPath = Join-Path $audioRoot "$($entry.Key).wav"
  $captionPath = Join-Path $captionRoot "$($entry.Key).vtt"
  $format = [System.Speech.AudioFormat.SpeechAudioFormatInfo]::new(
    16000,
    [System.Speech.AudioFormat.AudioBitsPerSample]::Sixteen,
    [System.Speech.AudioFormat.AudioChannel]::Mono
  )
  $speaker.SetOutputToWaveFile($audioPath, $format)
  $speaker.Speak($entry.Value)
  $speaker.SetOutputToNull()
  $speaker.remove_SpeakProgress($handler)
  $speaker.Dispose()

  Write-CaptionFile $captionPath $progress $entry.Value
  Write-Output "$($entry.Key): $($progress.Count) caption words"
}
