# VOICEROID plugin for Vim on Windows

このプラグインを導入するとVimからVOICEROIDをお手軽に喋らせられます。

## Requirements

*   Vim
*   [VOICEROID][voiceroid]
    *   VOICEROID+, VOICEROID+ EX, VOICEROID2 のいずれか
*   [民安★TALK][tamiyasu]
    * ver.1.15.0 で動作確認済み

## Preparations

1.  VOICEROID を起動する
2.  民安★TALK を起動する
3.  民安★TALK の初期設定を済ます(1回めのみ)
4.  本プラグインをインストールした Vim を起動する
5.  `g:voiceroid_vrx_path` に 民安★TALK の vrx.exe のパスをフルパスで設定する

    設定例:

    ```vim
    let g:voiceroid_vrx_path = 'C:\tamiyasu_talk\vrx.exe'
    ```

## 使い方

### `:VoiceroidTalk` コマンドで喋らせる

*   `:VoiceroidTalk こんにちは世界` - 引数に指定したテキストを喋らせる
*   `:VoiceroidTalk` - カーソルのある行のテキストを喋らせる
*   ビジュアル選択して `:'<,'>VoiceroidTalk` - 選択した範囲のテキストを喋らせる

### 喋るキャラを指定する

`g:voiceroid_vrx_who` にキャラ名を設定すると喋るキャラを指定できます。

設定例: "琴葉 葵" に喋らせる

```vim
let g:voiceroid_vrx_who = '琴葉 葵'
```

## Known Issues

*   事前に 民安★TALK を起動しないと `:VoiceroidTalk` が終了しなくなる
*   長い文章(8000バイトあるいは8000文字以上)をいっぺんに喋らせられない


[voiceroid]:https://www.ah-soft.com/voiceroid/
[tamiyasu]:http://publish-tool.blogspot.com/search/label/%E6%B0%91%E5%AE%89%E2%98%85TALK
