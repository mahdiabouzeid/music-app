class Music{
  String title;
  String artist;
  String album;
  String image;
  String audioUrl;
  bool favorite=false;
  Music(this.title,this.artist,this.album,this.image,this.audioUrl);


}
List<Music> songs = [
    Music(
      'Shape of You',
      'Ed Sheeran',
      '÷ (Divide)',
      'https://marketplace.canva.com/EAFy2GgsPAo/2/0/1600w/canva-red-minimalist-creative-man-without-head-album-cover-_bB_o4a7jdE.jpg',
      'https://example.com/shape-of-you.mp3',
    ),
    Music(
      'Believer',
      'Imagine Dragons',
      'Evolve',
      'https://https://tfroyal.ie/wp-content/uploads/2023/08/shape-of-you-1080-scaled.jpg',
      'https://example.com/believer.mp3',
    ),
    Music(
      'Rolling in the Deep',
      'Adele',
      '21',
      'https://https://tfroyal.ie/wp-content/uploads/2023/08/shape-of-you-1080-scaled.jpg',
      'https://example.com/rolling-in-the-deep.mp3',
    ),
    Music(
      'Uptown Funk',
      'Mark Ronson ft. Bruno Mars',
      'Uptown Special',
      'https://marketplace.canva.com/EAFy2GgsPAo/2/0/1600w/canva-red-minimalist-creative-man-without-head-album-cover-_bB_o4a7jdE.jpg',
      'https://example.com/uptown-funk.mp3',
    ),
    Music(
      'Someone Like You',
      'Adele',
      '21',
      'https://marketplace.canva.com/EAFy2GgsPAo/2/0/1600w/canva-red-minimalist-creative-man-without-head-album-cover-_bB_o4a7jdE.jpg',
      'https://example.com/someone-like-you.mp3',
    ),
    Music(
      'Perfect',
      'Ed Sheeran',
      '÷ (Divide)',
      'https://marketplace.canva.com/EAFy2GgsPAo/2/0/1600w/canva-red-minimalist-creative-man-without-head-album-cover-_bB_o4a7jdE.jpg',
      'https://example.com/perfect.mp3',
    ),
    Music(
      'Counting Stars',
      'OneRepublic',
      'Native',
      'https://https://tfroyal.ie/wp-content/uploads/2023/08/shape-of-you-1080-scaled.jpg',
      'https://example.com/counting-stars.mp3',
    ),
    Music(
      'Roar',
      'Katy Perry',
      'PRISM',
      'https://https://tfroyal.ie/wp-content/uploads/2023/08/shape-of-you-1080-scaled.jpg',
      'https://example.com/roar.mp3',
    ),
    Music(
      'Thinking Out Loud',
      'Ed Sheeran',
      'x (Multiply)',
      'https://https://tfroyal.ie/wp-content/uploads/2023/08/shape-of-you-1080-scaled.jpg',
      'https://example.com/thinking-out-loud.mp3',
    ),
    Music(
      'Shake It Off',
      'Taylor Swift',
      '1989',
      'https://https://tfroyal.ie/wp-content/uploads/2023/08/shape-of-you-1080-scaled.jpg',
      'https://example.com/shake-it-off.mp3',
    ),
  ];