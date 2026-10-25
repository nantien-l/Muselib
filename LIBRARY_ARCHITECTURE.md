# Muselib 曲目與演奏版本

## 資料關係

- `MusicalWork`：作品、作曲家、作品編號、介紹與聆聽提示。
- `PerformanceVersion`：單一演奏版本，連到作品與演奏家，記錄版本名稱、合作音樂家、演出類型、已確認年份與來源。
- `Performer`：人物生平與使用／持有／獲借的琴弓。
- `Equipment`：具體琴或弓、流傳故事與來源。
- `historicalConnections`：作品歷史關聯，例如 Franck 與 Ysaÿe，不參加版本抽選。

## 隨機規則

首頁先在曲目 Array 中抽作品，再在該作品的版本 Array 中抽版本。版本數量不影響作品被抽中的權重。「探索另一首」排除目前作品；「換個人聽這首」保留作品並排除目前演奏家。只有一位演奏家的作品顯示精選提示。

點開「挑選演奏版本」可以手動選取。從人物頁進入作品時，優先選擇該人物的版本；只有歷史關聯的人物則抽選可用版本，不假造其錄音。

## 目前版本數

| 作品 | 版本數 | 演奏家 |
| --- | --- | --- |
| Vox Amoris | 1 | Jooha Choi |
| Wieniawski Op. 22 | 1 | Bohdan Luts |
| Beethoven Op. 61 | 5 | Clara-Jumi Kang、Perlman、Ferras、Oistrakh、Heifetz |
| Ciaccona | 1 | Heifetz |
| L’inverno | 2 | Mutter、Perlman |
| Tchaikovsky Op. 35 | 2 | Perlman、Ferras |
| Capriccio No. 24 | 1 | Perlman |
| Mendelssohn Op. 64 | 3 | Stern、Mutter、Heifetz |
| Sibelius Op. 47 | 2 | Ferras、Perlman |
| Franck Sonata | 3 | Heifetz、Jooha Choi、Mutter；Ysaÿe 另列歷史關聯 |
| Brahms Op. 108 | 3 | Oistrakh、Mutter、Heifetz |

合計 11 首作品、24 個版本。版本來源見 `Muselib/PerformanceVersion.swift`。

## 收錄原則

版本來源可能是唱片產品、官方曲目或發行目錄；詳細合作人員未確認時留空，錄音／演出年份未確認時也留空。唱片再版日期不能當成錄音日期。部分版本目前僅有發行目錄來源，後續可補上更精確的唱片頁與直接聆聽網址。

「查看此版本來源」開啟目前版本的來源頁。「在 Apple Music 搜尋此版本」帶入作品、演奏家與已收錄的合作音樂家，屬搜尋入口，並非精確唱片深連結。

人物的琴弓關聯不能自動視為各份錄音的用琴／用弓。已知的例子是 Ferras 的 Milanollo：1967 年購入，不能標成 1965 年 Sibelius 錄音用琴。

## 增加一個版本

在 `performanceVersions` Array 新增一筆，使用唯一 id、既有 workID 與 performerID，填寫能辨識該演出／發行的 title 與來源。現有照片與人物頁可直接重用；曲目頁、人物曲目列表與版本選單皆由關係自動產生。

## 官方比賽影片（2026-10-24 核對）

| 版本 ID | 官方影片 | 起始時間 | 核對方式 |
| --- | --- | --- | --- |
| choi-vasks-wieniawski-2026 | https://www.youtube.com/watch?v=04orGXsS9fo | 片頭 | YouTube 上傳者 Wieniawski Society；標題 Stage 3；影片說明列出 Vox Amoris、Jooha Choi、Amadeus 與 Anna Duczmal-Mróz |
| choi-franck-wieniawski-2026 | https://www.youtube.com/watch?v=niwjtMOO1zw&t=1105s | 18:25 | 使用者確認作品起點；影片標題、上傳者與說明核對為 Jooha Choi Stage 2、Michał Francuz 與 Franck Sonata |
| luts-wieniawski-final-2026 | https://www.youtube.com/watch?v=DM6RfJsZcF4 | 片頭 | YouTube 上傳者 Wieniawski Society；標題 Final Stage；說明列出 Luts、Wieniawski No. 2、Poznań Philharmonic 與 Łukasz Borowicz |

三支影片查詢時的 YouTube playabilityStatus 皆為 OK；這是連結與中繼資料檢查，不代表逐段試聽。Vox Amoris 與決賽使用個人影片，不另推測音樂開始秒數。

`PerformancePlayback` 把 videoID 與可選起點分開保存，透過 URLComponents 組成連結，不帶播放清單或自動電台參數。已收錄影片的版本顯示「觀看比賽演出」，未收錄影片的版本繼續顯示明確標示的串流搜尋入口。

## 作曲家探索

每筆 `MusicalWork` 透過 `ComposerID` 連到作曲家。名稱由 `ComposerID.name` 統一定義，曲目不再各自保存重複的人名。全部 11 首作品皆已遷移；三份完整人物頁由 `composerProfiles` 提供，其餘作曲家暫時顯示純文字姓名。

`ComposerProfile` 包含生卒年、地點、開場介紹、三段創作故事、4–5 個附來源的時間軸事件、入門作品 ID 與參考來源。`works` 由作品的 composerID 反向查詢，新增同作曲家的作品後會自動出現在人物頁。

本批完成 Vasks、Beethoven、Brahms；作品介紹分別對應 Vox Amoris、Op. 61、Op. 108。作品、版本及人物的內容保持分開，切換版本不會改動作品背景。

入口：作品標題上方的作曲家姓名、作品中的「作品背後的人」、曲庫中的「認識作曲家」。作曲家頁的曲目會進入共用 `WorkDetailView`，沿用收藏、版本切換與已核對的影片連結。沒有照片時採文字版面，加入同名資產後顯示肖像。

### 相關檔案

- `Composer.swift`：作曲家 ID 與內容型別。
- `ComposerCatalog.swift`：三份附來源的人物資料。
- `ComposerPage.swift`：人物頁、姓名入口與時間軸。
- `ContentView.swift`：首頁隨機與曲庫入口。
- `WorkPage.swift`：作品介紹、版本與人物關聯。
- `WorkDetailView.swift`：其他頁面進入作品時的收藏狀態。
- `WorkLibrary.swift`：曲庫、收藏篩選與作曲家入口。
- `WorkRow.swift`、`LibraryComponents.swift`、`ArchiveImage.swift`：共用列表、段落、版面與圖片。

本批不新增曲目或演奏版本；仍為 11 首、24 個版本，保留三支官方比賽影片與 Franck 的 18:25 起點。

## 主導覽與作品識別更新

主架構改為 `NavigationSplitView`：Discover（隨機探索）、Repertoire（作品）、Composers（已完成介紹的作曲家）、Violinists（所有演奏家）與 Saved（收藏作品）。窄螢幕由系統收合為導覽流程。收藏沿用原有 `savedWorkIDs`，各分類有獨立導覽並可搜尋。

`ContentView` 僅組裝主導覽；`LibrarySection` 定義分類；`ListeningRoom` 管理隨機探索；`WorkLibrary` 管理分類與搜尋。`WorkCover` 以作品編號與固定配色識別作品，移除 MusicalWork 對第一位演奏家照片的依賴。人物照只出現在演奏版本與人物脈絡。

新增 SooBeen Lee（Bach Ciaccona、Sibelius Op. 47）與 Anna Im（Brahms Op. 77）。目前共 12 首作品、12 位人物、27 個版本。人物與曲目來源為 Wieniawski 官方選手頁；Stage IV 的實際轉播核對 medici.tv 2026-10-20、2026-10-21 節目頁。SooBeen 的 Bach 連官方 Stage I 個人影片頁，另兩份連整場轉播並明示沒有起始秒數；不以 Apple Music 搜尋代替比賽轉播。

新人物照片待補，未新增未查證的琴弓關聯。既有三份精確 YouTube 連結與 Franck 18:25 保留。

## 完整作曲家入口（11 位）

新增 Bach、Vivaldi、Paganini、Mendelssohn、Wieniawski、Tchaikovsky、Franck、Sibelius，現在 12 首現有作品全部連到完整作曲家頁。各頁有三段敘事、4–5 個附來源的時間節點與已收錄作品。作曲家按名稱排序；作品與版本數仍為 12／27，人物仍為 12 位。

資料維持型別化 Swift initializer，依內容分在 `ComposerCatalog.swift`、`ComposerCatalog+Baroque.swift`、`ComposerCatalog+Romantic.swift`，由單一 `composerProfiles` 集合提供 UI。分檔只用於內容維護，不新增使用者必須理解的分類。

歷史資訊核對 Bach-Archiv Leipzig、Wieniawski Society、Mendelssohn-Haus Leipzig、Premio Paganini、Henle、BSO、Atlanta Symphony Orchestra、Barbican 與 Tchaikovsky Research。聆聽提示為編輯建議。Tchaikovsky 的 1881 Wien 演出僅標為重要演出，依新研究保留較早 Hannover 演出的可能；不沿用舊說直接標成世界首演。

SooBeen Lee、Anna Im 的主圖與縮圖已匯入，另八位作曲家肖像仍可補入，檔名見 `PHOTO_ASSETS.md`。

## 作曲家肖像到齊

11 位作曲家均有 4:3 主圖與獨立方形縮圖。新增八張由既有匯入流程處理，Vivaldi、Paganini、Wieniawski 保留完整肖像與器物，加深色留白；詳細原檔名稱與取景策略見 `PHOTO_ASSETS.md`。

## 內文與閱讀層次整理

第一輪編修涵蓋 12 首曲目的引言、介紹與 36 則聆聽線索、11 位作曲家的引言與 33 段敘事，以及 12 位演奏家的標題與簡介。沿用已核對的歷史資訊與來源，音樂描述聚焦編制、聲部、發音與具體段落。

移除重複的 `composerContext` 欄位及曲目頁引言，演奏家姓名直接連到人物頁，刪除重複人物入口。來源集中於可展開區塊；沒有器物資料的段落與大型缺圖區不顯示。`Equipment.date` 改為可選值，避免將「年份待確認」作為日期展示；個別器物仍保留必要的不確定性說明。未更動曲目、人物與版本 ID、收藏儲存鍵、影片 ID 或 Franck 18:25 起始時間。

驗證包含 iOS／macOS 編譯、全部資料關係與版本切換、既有影片連結，以及人物導覽與來源收合操作。
