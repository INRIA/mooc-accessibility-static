---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
description: ""
player:
  mediaId: null
  poster: null
  sources:
    - label: "Face video"
      src: "standard.mp4"
      type: "video/mp4"
      selected: true
    - label: "Side video"
      src: "side.mp4"
      type: "video/mp4"
subtitles:
  language: "fr"
  sources:
    - label: "Sous-titres"
      src: "subtitles_fr.vtt"
      srcLang: "fr"
    - label: "Subtitles"
      src: "subtitles_en.vtt"
      srcLang: "en"
chapters:
  language: "fr"
  sources:
    - label: "Chapitres"
      src: "chapters_fr.vtt"
      srcLang: "fr"
    - label: "Chapters"
      src: "chapters_en.vtt"
      srcLang: "en"
slides:
  language: "fr"
  sources:
    - label: "Slides de Présentation"
      src: "slides_fr.vtt"
      srcLang: "fr"
     - label: "Presentation Slides"
      src: "slides_en.vtt"
      srcLang: "en"
additionalInformation:
  language: "fr"
  sources:
    - label: "Informations complémentaires"
      src: "additional-info_fr.vtt"
      srcLang: "fr"
    - label: "Additional Information"
      src: "additional-info_en.vtt"
      srcLang: "en"
---
