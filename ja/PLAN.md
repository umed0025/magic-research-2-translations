# 日本語翻訳 作業計画（再開用ドキュメント）

このファイルは、別セッション・別の人が作業を引き継げるようにするための進捗管理ドキュメント。作業を再開する時はまずこのファイルを読むこと。

## 前提・経緯

- リポジトリ本来の公式窓口は [Localizor](https://www.localizor.com/magic-research-2/) に移行済み（README.md参照）。ここでの作業は**レガシー方式**であり、Localizorには反映されない。この点を承知の上でユーザーがこのリポジトリでの翻訳続行を選択している。
- 全体は約4646キー、1.1MB（[base-translations.json](../base-translations.json)）。ストーリー・UI・アイテム説明などが未分類のまま混在しており、READMEにも「構造や文脈情報は無い」と明記されている。
- ネタバレ注意: base-translations.jsonにはゲーム全編のストーリーが含まれる。

## 作業方針

1. **用語集ファースト**: 訳語のブレを防ぐため、新しい固有名詞・システム用語が出たら先に [ja/glossary.md](glossary.md) に追記してから翻訳に反映する。
2. **迷ったら実例に当たる**: 訳語に確信が持てない場合、辞書的直訳やユーザーへの質問より先に、該当語を含む実際の説明文・使用例を検索して文脈から判断する。それでも複数の妥当な解釈が残る場合のみユーザーに確認する。
3. **バッチ分割で段階的に進める**: 4646件を一度に訳さず、意味のあるまとまり単位で少しずつ翻訳→検証→コミットのサイクルを回す。
4. **特殊記法は保持**（[ja/glossary.md](glossary.md) の「表記ルール」章も参照）:
   - `\n` は改行として保持（変更しない）
   - `{{param}}` はプレースホルダーとして保持（位置は文脈に合わせて調整可）
   - `:token:` はアイコン識別子として保持（変更しない）
   - `^^text^<explanation>` のツールチップ記法は構造ごと保持し、中身のみ翻訳
   - Markdown記法（`**太字**`、`*斜体*`等）は保持

## 進捗状況

| バッチ | 内容 | 件数 | 状態 |
|---|---|---|---|
| 0 | 用語集初期構築 | - | 完了 |
| 1 | ヘルプ・システム説明文（Boosts/Enhance/Exploration/Familiars/Rituals/Synchro/Transmute/Worlds/Home/Inventory/Spellcraft/Study/Wizards画面説明、Welcome文、Item Quality/Pouch Items/Channeling/Retirement用語解説、ゲームモード説明） | 30 | 完了 |
| 2 | 短いUIラベル・ボタン文言（20文字以下）。モンスター名・アイテム名・呪文名・UI操作文言など | 1580 | 完了 |
| 3 | 中程度の説明文・ステータス表記（21〜100文字）。アイテム/呪文フレーバーテキスト、Storyline名一覧、ステータス効果文など | 1765 | 完了 |
| 3.5 | 用語修正: Channel/Channeling → 変換（誤訳修正、関連57キー） | 57 | 完了 |
| 4 | 長文ストーリー・ダイアログ（100文字超）。ネタバレを含む。チャンク単位（100〜120件ずつ）で継続中 | 640 / 約1071 | 進行中 |

**進捗: 4072 / 4646 件（約87.6%）**

バッチ2の内訳: 20文字以下の未翻訳キー1647件のうち、1550件を人力翻訳、30件を`sec`→`秒`等の機械的補完で処理。残り97件はプレースホルダー・アイコン記法・単位・固有名詞（`Magic Research 2`等）のみで構成され、原文保持が正しいため未翻訳のまま据え置き（意図的）。

バッチ3の内訳: 21〜100文字の未翻訳キー1880件のうち、1765件を人力翻訳（うち約120件のStoryline名一覧を含む）、22件を`sec`→`秒`等の機械的補完で処理。残り約93件はプレースホルダー・アイコン記法・固有名詞のみで意図的に据え置き。作業中、改行(`\n`)を含む4件のキーがテキストファイル出力時に破損する事象を発見・修正済み（詳細は本ファイル末尾の注記参照）。

## 確定済み用語（詳細は [ja/glossary.md](glossary.md)）

- Retirement → 転生（要説明文根拠あり、[ja/glossary.md](glossary.md) 参照）
- Furniture → 設備（「家具」ではなく機能装置群のため。ユーザー承認済み）
- Channel / Channeling → 変換（当初「チャネル/チャネリング」としていたが、"Channel Fire" = "Channel some of your Mana into Fire Essence"の略で、実際にはマナをエッセンスに変換する行為を指すと判明。動詞・名詞とも「変換」系に統一し、関連54キーを修正済み）
- その他システム用語・固有名詞多数。翻訳前に必ず [ja/glossary.md](glossary.md) を確認すること。

## 次のバッチ候補（優先度順の叩き台）

1. ~~短いUIラベル・ボタン文言（20文字以下）~~ → 完了（バッチ2）
2. ~~中程度の説明文・ステータス表記（21〜100文字）~~ → 完了（バッチ3、Storyline名一覧も含めて処理済み）
3. **長文ストーリー・ダイアログ**（100文字超、約1071件）: ネタバレを含む。キャラの口調・文体統一が必要。これが最後の主要バッチ。**進行中（640/1071）**。チャンク単位（100〜120件ずつ、短い順）で処理を継続する。

上記はあくまで叩き台。作業再開時にユーザーと相談して優先順位を確定すること。

## バッチ4（長文ストーリー・ダイアログ）の作業メモ

- 対象: `ja.Keys | Where { ja[$_] -eq $_ -and $_.Length -gt 100 } | Sort-Object Length` で短い順に抽出し、100〜120件ずつチャンク化して処理している。
- ワークフロー: (1) チャンクのキー一覧をJSON配列で書き出す（`ConvertTo-Json` → 改行は`\n`エスケープのまま保持されるため、既知の落とし穴を回避できる）→ (2) 未確認の固有名詞・キャラ名を`ja/glossary.md`と既存訳から確認 → (3) `{key: translation}`形式のマッピングJSONを作成 → (4) 汎用適用スクリプト`ja/_apply_batch.ps1 -MappingFile <path>`で反映 → (5) JSON構文・キー数・プレースホルダー整合性を検証 → (6) 一時ファイル（チャンクのキー一覧・マッピングJSON）を削除。
- `ja/_apply_batch.ps1` は汎用スクリプトとして残置。Unicodeデコード処理込みで、以後のチャンクでもそのまま使い回せる。
- キャラクター設定: Satell(サテル、神格、フォーマル)、Headmaster(学院長、老齢男性、フォーマル)、雇われウィザードcompanion(女性、口語的)、Lytha/Doom Sorceress(リタ/破滅の魔女、傲慢)。地の文は「あなた」+だ・である体で統一。ただし「You have selected **属性**！」系のUIメッセージのみ既存訳（Holy/Space/Time）に合わせてですます調を踏襲。
- 既知の誤り: バッチ3で "Tower of {{element}} Training" を「{{element}}修行の塔」と訳したが、既存確定訳は「{{element}}の訓練の塔」だったため修正済み（[translations.json:1755](translations.json:1755)付近）。新規用語を訳す前に必ず`Get-Content ja/translations.json | ConvertFrom-Json`で完全一致・部分一致検索し、既存訳と重複が無いか確認すること。

## 既知の落とし穴: 改行を含むキーのテキストファイル出力

PowerShellで `ConvertFrom-Json` したハッシュテーブルのキーには、JSON内の `\n`（2文字のエスケープ）が実際の改行文字（1文字）としてデコードされる。これを `Out-File`/`Select-Object` 等でテキストファイルに書き出すと、1つのキーが複数行に分割されて見えることがある（例: `"A\nB"` というキーが `A` と `B` の2行として出力される）。

バッチ3では、抽出したキー一覧をテキストファイル経由で読んでいたため、改行を含む4件のキーがこの問題で見えなくなっていた（該当キーは翻訳漏れとして残っていたが、件数が少なかったため個別に検出・修正できた）。

次回以降、キー一覧をテキストファイル化する場合は、対象キーに実際の改行文字（`` `n ``）が含まれていないか事前にチェックすることを推奨する:

```powershell
$targets | Where-Object { $_ -match "`n" }
```

改行を含むキーがヒットしたら、そのキーだけは別途 Grep で行番号を特定し、Read で正確な内容を確認してから個別に処理する。

## 作業再開の具体的手順

### 1. 対象キーの抽出（例: 短いUIラベルを抽出する場合）

PowerShellでの抽出例:

```powershell
$data = Get-Content -Raw "base-translations.json" | ConvertFrom-Json -AsHashtable
$ja   = Get-Content -Raw "ja/translations.json"   | ConvertFrom-Json -AsHashtable
# 未翻訳（key と value が一致 = 英語のまま）のキーのみ抽出
$untranslated = $ja.Keys | Where-Object { $ja[$_] -eq $_ }
Write-Output "未翻訳件数: $($untranslated.Count)"
```

### 2. 翻訳の反映方法

`ja/translations.json` は `base-translations.json` と同一キー構造。**キーは変更せず、値のみ日本語に置き換える。**

Editツールで反映する際、long文字列はkey全体でのold_string一致が失敗しやすい（改行・記号の再現ミスが起きやすいため）。安全な手順:

1. Grepで対象の英語原文の一部（ユニークな短いフレーズ）を検索し、正確な行番号を特定する
2. Readでその行を取得し、ファイル中の**正確な**文字列をコピーする（記憶やコピー元からの再入力に頼らない）
3. Editのold_stringは「keyの末尾 + `": "` + valueの先頭部分」程度の短い接続部分に絞ると誤マッチのリスクが下がる
4. 置換後は必ず以下の検証を行う

### 3. 検証（翻訳後は毎回実施）

```powershell
# JSON構文チェック
try {
  $null = Get-Content -Raw "ja/translations.json" | ConvertFrom-Json -AsHashtable
  Write-Output "JSON OK"
} catch { Write-Output "JSON ERROR: $($_.Exception.Message)" }

# キー数が base-translations.json と一致するか
$base = Get-Content -Raw "base-translations.json" | ConvertFrom-Json -AsHashtable
$ja   = Get-Content -Raw "ja/translations.json"   | ConvertFrom-Json -AsHashtable
Write-Output "base: $($base.Keys.Count) / ja: $($ja.Keys.Count)"
```

翻訳した個別キーについては、key内の `{{param}}` と `:icon:` の集合が value内のそれと一致するかも確認する（一部が消えたり増えたりしていないか）。

### 4. コミット

バッチ単位で区切りが付いたら `ja/translations.json` と `ja/glossary.md`（更新があれば）をコミットする。このPLAN.mdの進捗状況テーブルも都度更新すること。

## 参考: README記載の配布手順

翻訳が完了・ベータテスト可能な状態になったら、リポジトリの [README.md](../README.md) の「Translation Status And Credits」欄に日本語のステータスを追記する（現時点では未着手のため記載していない）。
