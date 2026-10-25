# Muselib 照片準備清單

## 怎麼交給我

把照片原檔放到專案的 `Assets/PhotoInbox/`。這個資料夾是照片收件區，**不是** Xcode 的 `Muselib/Assets.xcassets`。保留原始尺寸、比例與檔案格式；檔名主體按下表命名，副檔名依原檔保留，例如 `.jpg`、`.jpeg`、`.png`、`.heic` 或 `.webp`。不要只修改副檔名來假裝轉檔。

若你直接拖進 Xcode 的 Assets，也可以：Image Set 名稱按下表的「資產名稱」命名，不含副檔名。例如 `portrait-jooha-choi`。原始圖片請盡量另外保留在收件區，方便之後調整。

先準備 10 張人物照即可，首頁會依曲目顯示對應演奏家，人物頁重用同一張照片。琴與弓共 18 張可後補。找不到時先留空，app 會顯示文字佔位。

## 第一批：10 張人物照

| 人物 | 資產名稱／原檔名主體 |
| --- | --- |
| Jooha Choi | `portrait-jooha-choi` |
| Bohdan Luts | `portrait-bohdan-luts` |
| Clara-Jumi Kang | `portrait-clara-jumi-kang` |
| Christian Ferras | `portrait-christian-ferras` |
| Anne-Sophie Mutter | `portrait-anne-sophie-mutter` |
| Itzhak Perlman | `portrait-itzhak-perlman` |
| Isaac Stern | `portrait-isaac-stern` |
| Jascha Heifetz | `portrait-jascha-heifetz` |
| David Oistrakh | `portrait-david-oistrakh` |
| Eugène Ysaÿe | `portrait-eugene-ysaye` |

人物照盡量選臉部清楚、上半身或演奏中的照片，四周保留裁切空間。長邊約 1600px 以上較方便處理，但手上只有較小圖片也可以先給我。彩色、黑白皆可，先不用套濾鏡；優先找獨照，避免照片已含大段文字。

## 第二批：10 張小提琴照（選配）

以整把琴正面、琴身與琴頭都完整的照片為優先。同一把琴只需一張，Ysaÿe 與 Stern 共用的琴會重用圖片。

| 琴 | 製琴師／年份 | 資產名稱／原檔名主體 |
| --- | --- | --- |
| Ex-Mintz / Mintz | Michael Angelo Bergonzi · 1764 | `violin-ex-mintz` |
| Marquis de Rivière | Antonio Stradivari · 1711 | `violin-marquis-de-riviere` |
| Thunis | Antonio Stradivari · 1702 | `violin-thunis` |
| Dragonetti, Milanollo | Antonio Stradivari · 1728 | `violin-milanollo` |
| Lord Dunn-Raven | Antonio Stradivari · 1710 | `violin-lord-dunn-raven` |
| Soil | Antonio Stradivari · 1714 | `violin-soil` |
| Panette | Guarneri del Gesù · 1737 | `violin-panette` |
| Ysaÿe | Guarneri del Gesù · 1740 | `violin-ysaye` |
| David, Heifetz | Guarneri del Gesù · c. 1740 | `violin-david-heifetz` |
| Marsick（Oistrakh 使用的 1705 年這把） | Antonio Stradivari · 1705 | `violin-marsick` |

## 第三批：8 張琴弓照（選配）

優先保留整支弓；若只能找到弓頭與弓根並列的照片，也可以直接交原圖。我會以完整顯示方式處理，避免裁掉器物。**請找對應的那一支弓，不能拿同製弓師的任意作品代替。** 無法確認就留空。

| 琴弓 | 資產名稱／原檔名主體 |
| --- | --- |
| Jooha Choi 使用的 Sartory | `bow-choi-sartory` |
| Jooha Choi 使用的 Ouchard（完整製作者待確認） | `bow-choi-ouchard` |
| Itzhak Perlman 使用的 Joseph Henry | `bow-perlman-henry` |
| Ex-Ysaÿe, Stern 的 Tourte 小提琴弓 | `bow-ysaye-stern-tourte` |
| Kittel “Auer, Heifetz” | `bow-auer-heifetz` |
| David Oistrakh 的 André Richaume | `bow-oistrakh-richaume` |
| David Oistrakh 的 Albert Nürnberger | `bow-oistrakh-nurnberger` |
| 1928 Sartory “Ysaÿe”（刻有為 Ysaÿe 特製題字） | `bow-ysaye-sartory` |

目前未有足夠資訊確認 Luts、Kang、Ferras、Mutter 的具體用弓，因此沒有要求這些照片。

## 多張照片與來源

同一項有多張候選時，原檔可以加 `-01`、`-02`，例如 `portrait-jooha-choi-01.jpg`。最後匯入 app 的資產名稱仍使用表中的名稱。

可以在同資料夾放 `sources.txt`，每張一行，例如：

```
portrait-jooha-choi.jpg | 照片網頁網址 | 攝影者／來源（知道的話）
violin-ex-mintz.png | 照片網頁網址 | 圖說
```

## 收到照片後的處理

- 人物照：製作適合 4:3 展示的版本，調整每人的取景，保留臉部與重要演奏動作；列表使用同資產的方形縮圖。
- 琴與弓：統一為 3:2 展示區，保持物件完整與原始比例，統一留白。
- 視原圖尺寸產生適合螢幕的版本，處理方向資訊、壓縮與色彩空間，保留照片原檔。
- 寫入正確的 `.imageset/Contents.json`，並檢查亮色、深色與手機畫面的顯示。

琴弓照片的裁切與尺寸統一屬於一般影像整理，不需要 AI 重畫器物。

## 已匯入狀態

已收到並匯入全部 10 位人物的主圖與獨立方形縮圖，包含 Eugène Ysaÿe；原檔保留於 `Assets/PhotoInbox/`。

主圖以 4:3 展示；Ferras 與 Perlman 的近距離直幅照片保留完整照片並加深色留白，避免切到臉部。圖片轉為 sRGB JPEG，不放大原始照片內容。

重建圖片：在專案根目錄執行 `swift scripts/import-portraits.swift`。裁切參數已逐張設定在腳本中；新增或替換照片後應重新檢視取景。

## 小提琴照片匯入狀態

已匯入 10 把琴：Ex-Mintz、Marquis de Rivière、Thunis、Lord Dunn-Raven、Soil、Panette、Ysaÿe、David, Heifetz、Marsick、Dragonetti, Milanollo。Ferras 的用琴檔案已改為 1728 Dragonetti, Milanollo，照片也已匯入；目前全部 10 把琴的照片皆到齊。

Lord Dunn-Raven 與 Ysaÿe 的原圖僅含琴身，因此頁面標記「琴身細節」。其他圖片按原有正反面與方向完整保留，不旋轉或裁去物件；所有照片在 3:2 展示區內等比例完整顯示，白色留白，保留原圖水印。

重建琴照：在專案根目錄執行 `swift scripts/import-instruments.swift`。輸出為 sRGB JPEG，長邊最多 1600px，不放大較小原圖；原檔保留。

## 琴弓照片匯入狀態

已匯入 `bow-auer-heifetz`（弓頭與弓根細節）及 `bow-ysaye-stern-tourte`（弓頭細節），原有圖說與邊框保留。其餘 6 支琴弓目前未附圖，繼續顯示文字佔位。

琴與弓現在共用 `swift scripts/import-instruments.swift` 匯入流程。圖片長邊最多 1600px，不裁切器物，保留原檔。

## 作曲家照片：3 張已匯入

Vasks、Beethoven 與 Brahms 的照片已匯入作曲家頁，原檔保留於 `Assets/PhotoInbox/`。每張產生 4:3 主圖與方形縮圖，轉為 sRGB JPEG。

| 作曲家 | 資產名稱／原檔名主體 |
| --- | --- |
| Pēteris Vasks | `composer-vasks` |
| Ludwig van Beethoven | `composer-beethoven` |
| Johannes Brahms | `composer-brahms` |

本批原檔為 `composer-vasks.jpeg`、`composer-beethoven.jpeg`、`composer-brahms.jpg.avif`，匯入工具支援雙重副檔名。Vasks 與 Beethoven 已調整取景；Brahms 保留完整方形肖像並加深色側邊留白，避免裁去頭髮與鬍鬚。圖片內容不放大，保持原有色彩與黑白風格。替換圖片時仍沿用上述資產名稱，來源與作者可記在 `sources.txt`。

## 新增演奏家：2 張已匯入

SooBeen Lee 與 Anna Im 已收到原圖，並產生 4:3 主圖與方形縮圖。Anna Im 原圖上方留白較多，已將取景向下調整，保留臉部、上半身與琴頭；SooBeen Lee 以臉部與上半身為主。照片已接到人物頁、列表與演奏版本，原檔保留。用琴與琴弓尚未查證，不推定比賽用琴。

## 作曲家擴充：原有 8 張肖像已匯入

新增八位作曲家的肖像已全部匯入，目前 11 位作曲家都有主圖與方形縮圖。原圖保留在 `Assets/PhotoInbox/`，檔名如下（副檔名依實際格式保留）：

| 作曲家 | 檔名主體 |
| --- | --- |
| Johann Sebastian Bach | `composer-bach` |
| Antonio Vivaldi | `composer-vivaldi` |
| Niccolò Paganini | `composer-paganini` |
| Felix Mendelssohn | `composer-mendelssohn` |
| Henryk Wieniawski | `composer-wieniawski` |
| Pyotr Ilyich Tchaikovsky | `composer-tchaikovsky` |
| César Franck | `composer-franck` |
| Jean Sibelius | `composer-sibelius` |

已逐張檢查取景：Vivaldi、Paganini、Wieniawski 的主圖保留完整肖像、琴與手部，以深色側邊留白統一為 4:3；其餘依臉部位置裁切。列表採獨立方形縮圖。所有輸出為 sRGB JPEG，保留繪畫與黑白照片的原有色調，不放大原始影像內容。WebP 及 Paganini 的 `.jpg.webp` 雙重副檔名已正確處理。

## 本次新增曲目：8 張作曲家肖像已匯入

新增的 9 位作曲家資料中，Ysaÿe 重用已匯入的 `portrait-eugene-ysaye`。另外 8 位照片已收到，原檔仍保留在 `Assets/PhotoInbox/`，並按下表名稱產生主圖與方形縮圖：

| 作曲家 | 原檔名主體／資產名稱 |
| --- | --- |
| Maurice Ravel | `composer-ravel` |
| Claude Debussy | `composer-debussy` |
| Sergei Prokofiev | `composer-prokofiev` |
| Dmitri Shostakovich | `composer-shostakovich` |
| Béla Bartók | `composer-bartok` |
| Karol Szymanowski | `composer-szymanowski` |
| Ernest Chausson | `composer-chausson` |
| Antonín Dvořák | `composer-dvorak` |

曲目頁維持文字封面，這 12 首不需要另外找作品圖片；肖像用於作曲家索引與作曲家頁。照片已轉為 sRGB JPEG，長邊最多 1600px，不放大原圖內容。替換照片時沿用相同檔名並重新執行 `swift scripts/import-portraits.swift`；來源網址與攝影者可記在 `Assets/PhotoInbox/sources.txt`。
